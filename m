Received: from smtpauth22.prod.mesa1.secureserver.net ([64.202.165.44])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NziFH-0003gB-Q8
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 05:17:40 +0200
Received: (qmail 26323 invoked from network); 8 Apr 2010 03:07:27 -0000
Received: from unknown (209.242.7.187)
	by smtpauth22.prod.mesa1.secureserver.net (64.202.165.44) with ESMTP;
	08 Apr 2010 03:07:26 -0000
Message-ID: <4BBD4860.8070306@mwester.net>
Date: Wed, 07 Apr 2010 22:07:12 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BBB3C39.5070002@mwester.net>
	<q2mb6ebd0a51004060826wb048ffa2ge1fbcfb1892a9bac@mail.gmail.com>
In-Reply-To: <q2mb6ebd0a51004060826wb048ffa2ge1fbcfb1892a9bac@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.44
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRCREV defined too late -how to fix?
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
X-List-Received-Date: Thu, 08 Apr 2010 03:17:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> On Tue, Apr 6, 2010 at 6:50 AM, Mike Westerhof <mike@mwester.net> wrote:
> 
>> After a recent commit that rearranged where (and how) SRCREVs are defined,
>> building results in:
>>
>> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
>> item kernel)
>> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
>> item kernel-module-ext2)
>> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
>> item kernel-module-jbd)
>> (etc.)
>>
>> Note the bogus "svnr1" on the end -- I think this has happened because
>> someone changed OE to define SRCREVs in each package.  So now, deep in
>> recipes/linux/linux-ixp4xx.inc, we find:
>>
>> SRCREV = "1089"
>>
>> I think that's wrong.
>>
>> It *does* (sort of) work -- it actually results in that SRCREV (1089) being
>> built, despite the messages (above) telling you that it can't find the
>> PREFERRED_VERSION with SRCREV == 1.
>>
>> But what that line does is not really what we (the ixp4xx kernel
>> maintainers) had in mind.
>>
>> The idea is that the SRCREV, along with the kernel version, would be
>> defined as a preferred version, like this line which is in
>> machine/include/ixp4xx.inc:
>>
>> PREFERRED_VERSION_linux-ixp4xx ?= "2.6.24.7+svnr${SRCREV}"
>>
>> Of course, SlugOS overrides that because that distro prefers a more recent
>> kerrnel:
>>
>> PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV}"
>>
>> That's not really a "recent" kernel, of course -- my local.conf file has a
>> more recent one that I've not yet committed.  The point is that the way it
>> *USED* to work, one could use the normal means to set both PREFERRED_VERSION
>> and SRCREV.  With the recent commit, we can't do that anymore.
>>
>> Apparently SRCREV isn't defined soon enough with this new structure, so we
>> get the messages about svnr1 not being available.  And, of course, one
>> cannot override the preferred version anymore due to the use of "=" instead
>> of "=?" for the assignment.  (At the very least, when all the SRCREVs were
>> moved into the recipes, shouldn't the weak assignments have been preserved?)
>>
>> At any rate, I wish to remove the bogus messages about svnr1, and I want to
>> restore the behavior that would allow me to provide the SRCREV in my
>> local.conf.  What is the correct way to do this with the new "world order"
>> as it relates to SRCREVs?   To what config file do I move that
>> SRCREV="1089"?  Who would I anger if I just put it back to the way it was?
> 
> 
>>From what RP was saying on IRC the other day, you can utilize "%" in version
> preferences for versions that include srcrev, as a marker.  2.6.27.8+svnr%.
>  I haven't looked at that code, though, so I may be completely out in left
> field here :)

NOTE: preferred version 2.6.27.8+svnr% of linux-ixp4xx not available
(for item kernel)
NOTE: preferred version 2.6.27.8+svnr% of linux-ixp4xx not available
(for item kernel-module-ext2)
NOTE: preferred version 2.6.27.8+svnr% of linux-ixp4xx not available
(for item kernel-module-jbd)

:(  Does this %-sign feature perhaps require a new bitbake version?

-Mike


