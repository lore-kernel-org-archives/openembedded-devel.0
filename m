Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NuQf5-0007Z6-IH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 14:30:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2ODRAB0023951;
	Wed, 24 Mar 2010 13:27:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23877-02; Wed, 24 Mar 2010 13:27:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2ODR5aU023945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 24 Mar 2010 13:27:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev@lists.berlios.de
Date: Wed, 24 Mar 2010 13:27:04 +0000
Message-ID: <1269437224.1681.134.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Checksums in Bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Mar 2010 13:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've written down some of my brainstorming on checksums in bitbake
below. Thoughts are welcome...

For a variety of reasons I dislike our current stamp files and believe
they limit what we can do in the future with bitbake. We only use them
on a per recipe basis and actively block interaction between recipes.
Trying to use them in any kind of staging packages turns into a world of
pain. They're also not portable between different systems when you start
to consider timezones. Having looked at what other build systems do,
particularly e2factory, I love the idea of checksums and think these are
the future.

The idea is simple. A given set of metadata is condensed down into a
checksum. If the metadata changes, the checksum changes. If the checksum
matches, the input into a task matches and hence the output should be
the same.

The implications are far reaching. If you change the metadata, it
automatically rebuilds what you changed. If you change it back to
exactly what it was, the original staging package would become valid
again and be reused. PR bumps for recipe changes could be a thing of the
past, at least to trigger rebuilds of packages. From a package manager
standpoint they're still needed of course but it opens up the idea of
automation.

In theory these would also make it much easier to tell whether a given
staging package is valid or not rather than all the current messing
around with stamp files and dates.

So the theory is nice, the practicalities of implementing it are less
so.

First, the easy bit. The STAMP variable and directory is still perfectly
fine, we'd just append the checksum onto the STAMP name and the stamp
files would lose the meaning of their time/date. This means most of our
existing hacking on the stamp directory would actually still work.

Bitbake would need to generate these stamps as part of its parsing
process. I'd suggest this is controlled by some metadata variable like
BBCHECKSUMS = "1" turning on this functionality. If enabled, at the end
of the finalise function, the data dictionary would be turned into a
huge text string and a checksum generated of this.

Do we just add everything to this string? That can't work since we have
some paths such as WORKDIR which we don't want to affect the checksum.
We also have variables like DATETIME which change and these probably
shouldn't be reflected in the stamp. So do we blacklist or whitelist?

I'm in favour of blacklisting "bad" variables since its simpler to
maintain and hopefully less error prone. Blacklisting in practical terms
means taking a copy of the data store and setting these variables to
some known value before string expansion. For DATETIME a different type
of blacklisting may be better where the variable is just excluded from
the checksum unless some other variable pulls it in. This could then be
used to our advantage to make the "nostamp" tasks like image generation
always run?

Checksums should really be per task. In a perfect world the checksums
would only include variables in their scope so if PACKAGES changes, only
the packaging task itself would rerun. If you change the do_install
function, only the do_install task would rerun. Is it possible to
achieve this level of functionality? I've spent a while wondering about
this.

For shell tasks I think that it is. The expanded shell function is
exactly what runs and if that script changes, the checksum can change.
The main problem is that we don't currently track which shell functions
depend on which other shell functions. Bitbake can know the list of
possible shell function calls that can be made. Using simple searching
it should be possible to work out who calls which functions relatively
easily. We can provide a mechanism to inject missing dependencies caused
by obfuscated calls we can't detect although I can't think of many of
these offhand. We can easily test this by making exec_task only export
dependent functions instead of currently exporting all shell functions.
That would be a nice improvement in itself anyway.

For python tasks this is harder. I suspect we can find out about
function call dependencies by inspecting the AST. What we can't easily
know is which variables in the data store a given function accesses and
depends upon. We could assume it depends on all datastore variables
unless the function explicitly declares its dependencies (useful for
do_patch which really only depends on SRC_URI)?

So, that is where I'm up to in thinking about this. I'd welcome other
input from people and whether people think this idea is worth pursuing.
I think even a simplistic implementation covering the whole data store
would be better than what we currently have though. As always its worth
exploring how far we can push the model now though and I'm quite
optimistic about what we can achieve!

Cheers,

Richard



