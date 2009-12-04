Received: from smtpauth20.prod.mesa1.secureserver.net ([64.202.165.36])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NGZ9b-00037D-9B
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:29:06 +0100
Received: (qmail 8867 invoked from network); 4 Dec 2009 14:20:45 -0000
Received: from unknown (209.242.7.187)
	by smtpauth20.prod.mesa1.secureserver.net (64.202.165.36) with ESMTP;
	04 Dec 2009 14:20:45 -0000
Message-ID: <4B191AC0.80807@mwester.net>
Date: Fri, 04 Dec 2009 08:20:48 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B18811D.8020206@mwester.net>
	<6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
In-Reply-To: <6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.36
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 breaks opkg
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
X-List-Received-Date: Fri, 04 Dec 2009 14:29:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> 2009/12/4 Mike Westerhof <mike@mwester.net>:
>> Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 (Koen) breaks
>> opkg-nogpg-nocurl.  I have no idea what else might be broken, but the
>> fact that it removes all the critical patches that make it work on
>> small-memory machines is the most obvious cause of the breakage.
>>
>> So what do you all want me to do about this?  We can revert the commit.
>> Or someone can try to sort out a way to let opkg change without
>> impacting the tiny-memory version of opkg (which will get more and more
>> difficult as the two diverge).  Or I can just create
>> opkg-nogpg-nocurl-slugos.bb in hopes that it won't get stomped on.
>>
>> Thanks,
>> Mike (mwester)
> 
> Since slugos is at r160, perhaps adding those patches back in, with
> maxrev= lines is best for now?

That would fall into the category of (b) - trying to sort out how to let
the opkg-nogpg-nocurl recipe change while keeping it building for
systems with very very small memory.

As a reminder, the need is that opkg must run in 32MB of physical RAM -
it cannot be assumed that swap space is available - and an absolute
minimum of dependencies on external libraries is required because the
total rootfs image must fit in about 5 MB or so.

I don't have much flexibility with opkg.

So back to the issue.  Someone with enough smarts on how that recipe was
just changed (and opkg_svn.bb, opkg.inc are included because they too
changed) can put back the patches and anything else that would ensure
that no extraneous dependencies have been added.  I realize that someone
will point the finger at me, but honestly I have no time to do that.

Hence I suggested the other two options.  Revert the change, so that
SlugOS builds again, and then whomever decided that a wholesale cleanup
of opkg recipes was necessary can go back in and try again.

Or if OE in general decides they want the nice new tidy opkg for some
unknown benefits it provides, well, I suggested that I simply create yet
another recipe for opkg, one that will duplicate the working opkg for
SlugOS, at least until I find time to invest to try to figure out why
versions >160 have never worked.  (Please understand that testing opkg
is a laborious process, requiring many different test scenarios that
involve lots of reflashing of images... it's time I just do not have
right now to invest, particularly since there is no net benefit as far
as I can see to this recent change to all the opkg stuff.)

So I'm leaning toward the latter solution right now - I don't want to
anger those who found the opkg recipe rewrites beneficial.  So I'll
rephrase it now:  If you have valid objections to my creating a custom
SlugOS opkg recipe, voice those concerns now. :)

Thanks,
Mike (mwester)


