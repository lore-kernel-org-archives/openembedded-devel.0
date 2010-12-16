Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PTCJL-0007cT-Tv
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 12:47:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A1CC6314AB22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 12:46:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id x5z4Jb3BQOHi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 12:46:08 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 76D20314B882
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 12:46:08 +0100 (CET)
Message-ID: <4D09FC00.1010304@opendreambox.org>
Date: Thu, 16 Dec 2010 12:46:08 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291941859-29257-1-git-send-email-eric@eukrea.com>	<AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>	<4D08B2C8.5010508@opendreambox.org>
	<AANLkTi=rzhtfxbfi8VS_R+W8uZV_qe=Ur1or861LJoPm@mail.gmail.com>
In-Reply-To: <AANLkTi=rzhtfxbfi8VS_R+W8uZV_qe=Ur1or861LJoPm@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Thu, 16 Dec 2010 11:47:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/16/2010 01:48 AM, Khem Raj wrote:
> On Wed, Dec 15, 2010 at 4:21 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> On 12/10/2010 03:54 AM, Khem Raj wrote:
>>> On Thu, Dec 9, 2010 at 4:44 PM, Eric B=C3=A9nard <eric@eukrea.com> wr=
ote:
>>>> - based on gcc-4.5.2-RC-20101208 (svn 167585)
>>>> - without linaro patches (which seem to be the root of
>>>> problems when compiling at least on armv4 and armv5) :
>>>>        - samba 3.2.15 or 3.3.9 : http://tinderbox.openembedded.net/p=
ublic/logs/task/8666826.txt
>>>>        - samba 3.5.6 : http://pastebin.com/yuiYX2CM
>>>>
>>>
>>> as discussed on IRC may be we should try to find the faulty patch in
>>> current gcc 4.5 linaro patches we have.
>>
>> I don't think that we need another svn-based pre-release recipe for gc=
c.
>> But I would still prefer to have a recipe for gcc 4.5.2 once it's
>> released, because I'd like to be able to pin a stable version with onl=
y
>> few required patches and Linaro only cares about ARM while I do not.
>>
>=20
> We should avoid creating recipes for every minor release. As we see
> minor release only contain bug fixes.

What's wrong with bug fixes in minor releases? Btw., I have no problem
moving from one minor release to another, which means that I would be
happy with only one recipe for every major release.

> agreed. If you dont care about linaro thats fine. Would you prefer a
> gcc which is widely used or just used by you
> hence supported only by you.

I'd prefer a gcc which is widely used. We just seem to have different
opinions on what that means. IMO, a released version will surely be used
by many more people globally (i.e. outside OE) than a random svn version
of a linaro gcc. Also, since Eric already sent this patch, I'm sure that
I'm not the only one who'd prefer to have a recipe for a current,
released version in OE.

While gcc*_4.5.bb is widely in use (well, because it's the default
recipe and there is no alternative for 4.5 yet), its revision and linaro
patch level changes every other day. It went from r10 to r25 during the
last 10 weeks. This wastes a lot of time rebuilding the compiler, or -
if you don't want to mix different gcc's output - rebuilding the whole
system. In comparison, gcc-4.4.4 is still at r7.

> My point it more common we use better we
> have the support for it and community as a whole gets benefitted. If
> linaro patches dont
> harm your case negatively would you still be averse to them ? Do you
> have some cases where they created regressions compile time or run
> time or degraded the performance ?
> that will be interesting.

I haven't discovered any regressions by the compiler itself, but I also
haven't discovered any benefits.

My main concern is that a weekly changing compiler can hardly ever
become a good foundation of a stable build environment. Of course I
could pin a random SRCREV, but then again I'm likely to become the only
user of this specific SRCREV globally, some day. Oh, wait, I can not pin
a SRCREV, because the patches keep getting added as local files.

> why do you think gcc-4.5.2 will be more stable then say gcc-4.5.2 +
> patches from upstream 4.5 branch

It depends on the patches. Most of them need testing. Releases (and
their candidates) already would have been tested and/or reviewed by some
people before hitting OE.

As already stated in my previous mail, I'm not against applying patches
from upstream, provided they are _required_ to make it work in some
configuration.

> What advantage do you see of having a vanilla gcc without linaro patche=
s ?

See above.

In the (hopefully unlikely) event that a random svn version of linaro
gcc introduces a regression, say on the MIPS platform, who am I going to
report that to? Would I have to bisect all linaro patches manually?
Surely, the upstream developers wouldn't care about reports about
heavily patched gccs, and linaro developers wouldn't care about MIPS.

Regards,
Andreas


