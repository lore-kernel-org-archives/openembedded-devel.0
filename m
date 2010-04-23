Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O5PZG-0007Zx-LS for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 22:33:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O5PVl-0007LC-Rs for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 22:30:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 22:30:05 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 22:30:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Apr 2010 22:29:54 +0200
Message-ID: <hqt003$fvd$1@dough.gmane.org>
References: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>	<hqrv2b$a7u$1@dough.gmane.org>
	<1272046053.3865.425.camel@trini-m4400>	<20100423182217.GB27322@denix.org>
	<hqsprc$no6$1@dough.gmane.org>
	<1272048959.3865.478.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272048959.3865.478.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of TARGET_SYS
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
X-List-Received-Date: Fri, 23 Apr 2010 20:33:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-04-10 20:55, Tom Rini wrote:
> On Fri, 2010-04-23 at 20:45 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 23-04-10 20:22, Denys Dmytriyenko wrote:
>>> On Fri, Apr 23, 2010 at 11:07:33AM -0700, Tom Rini wrote:
>>>> On Fri, 2010-04-23 at 13:07 +0200, Koen Kooi wrote:
>>> Ping
>>>>>
>>>>> It's better than what we have today, true.  And SDKPATH already contains
>>>>> DISTRO, which is the likely changer of TOOLCHAIN_*_TASK.  So...
>>>>>
>>>>> Acked-by: Tom Rini <tom_rini@mentor.com>
>>>
>>>> In general:
>>>
>>>> Acked-by: Denys Dmytriyenko <denis@denix.org>
>>>
>>>> But, should we then create an arch-specific environment-setup scripts (e.g. 
>>>> one for armv4 and another for armv7a, as per your example below)?
>>
>> Yes, that needs to be done, as well as seperating the cross tools in
>> case different archs need different versions (as is the case with
>> angstrom, v5te and v7a need different binutils). This change largely to
>> to cosmetically highlight that the toolchain is not really "universal"
>> (yet).
> 
> And we can talk about if "universal" is really a good goal either.

I don't think we can make it "universal" without sacrificing key benefits.

> Taking a bit of a guess in the dark, an SDK with support for all the fun
> stuff found on Beagleboard might not be done easily with also having
> support for all the fun stuff found on some other ref board too.

The immediate problem I'm trying to address now is that having both an
armv5te and armv7a toolchain installed is breaking horribly. Ideally
they would coexist peacefully, but I don't know if we can manage that,
without impacting the ease of use.

> I tend to think of these exports as being very board specific, but that
> doesn't quite flow with how others think of this stuff, today.

The current output is highly machine specific, since it will include
MACHINE_ARCH in the opkg configuration. For gcc/libc/binutils that is
usually OK (except when using an ep93xx sdk to target e.g. om-gta01),
but for things like clutter or mesa where the machine directly impacts
the shared lib it gets ugly real fast.
Luckily at work I currently have a fairly nice situation: all arm9
targets are arm926 without any form of VFP/FPA and no 3d accell and all
cortex-a8 targets have the same VFP and NEON blocks and the 3D accel is
the same. Of course with my angstrom hat on, the situation is different...

I'm eagerly awaiting Richards branch to get merged so I can work on the
nicer areas of meta-toolchain-qte :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL0gNCMkyGM64RGpERAiVuAJ4jIidQWTLhphBZl1sK5gxdZ6gM1gCguxNG
kEfwpxZtU3TJg6cC/XCSSeI=
=HXKJ
-----END PGP SIGNATURE-----



