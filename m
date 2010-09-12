Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oul3W-00074W-Uo for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 13:49:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oul2l-00056T-L4 for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 13:48:23 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 13:48:23 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 13:48:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 12 Sep 2010 13:48:14 +0200
Message-ID: <i6ielv$sld$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>	<i6629i$d5c$1@dough.gmane.org>
	<201009081609.32135.pieterg@gmx.com>	<4C879EC5.10402@balister.org>
	<4C8ADB7A.4000303@techsol.ca>	<i6f9uu$39o$1@dough.gmane.org>
	<i6fc40$90f$1@dough.gmane.org>	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>	<i6i5g8$ums$1@dough.gmane.org>
	<AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 11:49:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-09-10 13:27, Frans Meulenbroeks wrote:
> 2010/9/12 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 12-09-10 10:34, Frans Meulenbroeks wrote:
> 
>>> Haven't had time to test this yet, but I feel at least a PR bump is
>>> missing (or perhaps a set of PR bumps)
>>
>> Since it would require a PR bump for everything that is built with gcc,
>> I'm going to say:
>>
>> That's what DISTRO_PR is for, which is up to distro maintainers to bump.
> 
> Still I feel PR or INC_PR bumps of the affected gcc recipes is
> appropriate, if only to fix it for distro's that do not immediately
> bump DISTRO_PR.
> We have quite some distro's and not all are maintained equally well,
> so I can imagine it'll take some time for them to bump
> Actually some distro's seem orphaned, so for those it might never
> happen and bumping the GCC PR's at least will give them the fix too.

It won't, since you need to rebuild everything that uses gcc. Bumping PR
for gcc-cross would just give people a false sense of security. I'm not
against bumping PR for gcc-cross, I'm just saying that it doesn't come
close to fixing the problem at hand, which is packages with missing
dependencies (libgcc for normal ones, libstdc++ for c++ ones,
libgfortran for fortran ones, etc).

> Thinking of it let's see how many distro's actually use DISTRO_PR:
> ../../conf/distro/angstrom-2008.1.conf:DISTRO_PR = ".6"
> ../../conf/distro/kaeilos-2010.conf:DISTRO_PR = ".1"
> ../../conf/distro/kaeilos.conf:DISTRO_PR = ".5"
> ../../conf/distro/angstrom-2010.x.conf:DISTRO_PR = ".7"
> ../../conf/distro/shr.conf:DISTRO_PR = ".5"
> 
> So that is 5 out of the 32 recipes.
> Even one of your own (angstrom-2008.1-legacy.conf) does ot use DISTRO_PR

Do you know how requires work in OE?

conf/distro$ grep require angstrom-2008.1-legacy.conf
require conf/distro/angstrom-2008.1.conf

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMjL3+MkyGM64RGpERAsRvAJ43TZNi07Md1wcPxdz5T6KaYYl8AwCgvNLY
X+Hd1AJVQULZ0BDAiiU6X5A=
=hIhF
-----END PGP SIGNATURE-----



