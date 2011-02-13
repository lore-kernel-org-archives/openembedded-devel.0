Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PoPox-0004J4-6T
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 01:28:11 +0100
Received: by gxk20 with SMTP id 20so1572331gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=PPJ1PtFR4Gb55g9QG9Jwd2F/ZeBGheMZvrjbDbzvegQ=;
	b=rzrhRd2IP360Agni2ywtAijUHn6DbHl6Bb6mb8X8Byp2fYTADSb/G/TsNrO5oSD1s/
	HcDrgqZtZVlGxlfQNuGglSOz9ChFugCe3078l5q6lhtiYT5CWSUGW/PMp6Ly6XRuIHUy
	dB+Cxth7R+y9nGa79/lZ/iSo8+HZ8hwKyDHO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=t6t4y2+5AW0ElEznyDULGTPDnDA0S8fZFZIwhUzReTg8bnFe6JnUJAbQYgXs/xiXo+
	XQRFmsOkrVpVucqn6Ki3bwIlMISgBH9ezivSGmpusZvavk08bFY2RZRqw2G9kiMoGtQc
	wQ5ldBQwRpII7dv/ffWH6tJWCzrkqlSNfOhBE=
Received: by 10.90.90.18 with SMTP id n18mr2586084agb.101.1297556822343;
	Sat, 12 Feb 2011 16:27:02 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 35sm1329204ano.31.2011.02.12.16.27.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 16:27:01 -0800 (PST)
Date: Sat, 12 Feb 2011 16:26:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110213002648.GA6178@gmail.com>
References: <1292667009.12094.13.camel@mattotaupa>
	<4D0C8BCC.9050800@eukrea.com>
	<AANLkTik2cV=NMv1=Xj1gd6pBaL-kVVo7=tUH9gmqTxCE@mail.gmail.com>
	<1292859750.1713.3.camel@mattotaupa>
	<AANLkTinTz=s4K7zbkFKh22HJWRjMDDW0iP5CKxV0HrOX@mail.gmail.com>
	<1297437306.3785.39.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1297437306.3785.39.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: minimal{, -uclibc}: linux-omap-psp_2.6.32: task `do_compileconfigs` fails
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
X-List-Received-Date: Sun, 13 Feb 2011 00:28:11 -0000
X-Groupsio-MsgNum: 29128
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/02/11 16:15), Paul Menzel wrote:
> Am Montag, den 20.12.2010, 10:39 -0800 schrieb Khem Raj:
> > On Mon, Dec 20, 2010 at 7:42 AM, Paul Menzel wrote:
> > > Am Samstag, den 18.12.2010, 22:46 -0800 schrieb Khem Raj:
> > >> On Sat, Dec 18, 2010 at 2:24 AM, Eric Bénard <eric@eukrea.com> wrote:
> > >
> > >> > On 18/12/2010 11:10, Paul Menzel wrote:
> > >> >>
> > >> >> Error: selected processor does not support ARM mode `smc #0'
> > >> >
> > >> > this seems to be a known problem with gcc 4.5 :
> > >> > https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/669912
> > >>
> > >> Its not a gcc problem to clarify. Its just that older compilers did
> > >> not differentiate security extentions presence.
> > >> http://kernel.ubuntu.com/git?p=ubuntu/ubuntu-natty.git;a=commitdiff;h=1ebe13dea156358f1044a7a755f02945ad3890e4;hp=f31ff7673ef77d04e74e1a1e45bb2940781f35f0
> > >>
> > >> http://kernel.ubuntu.com/git?p=ubuntu/ubuntu-natty.git;a=commitdiff;h=99340d7b23f3df75d9b752fb25088a10064cd0a6;hp=9523bd6810e0229a8147e8c3d6498e2f40b38974
> > >>
> > >> are the fixes you should apply to kernel.
> > >
> > > I just wanted to add that `linux-omap-psp_2.6.32` builds fine with
> > > `angstrom-2010.x` (without the above mentioned patches) which uses the
> > > following toolchain.
> > >
> > >        conf/distro/angstrom-2010.x.conf:ANGSTROM_GCC_VERSION                     ?= "4.5"
> > >        conf/distro/angstrom-2010.x.conf:ANGSTROM_BINUTILS_VERSION                ?= "2.20.1"
> > 
> > yes it will work with binutils < 2.21 the patch I previously implied
> > is in assembler.
> 
> Víctor committed these patches in 4f24435f [1] for
> `linux-omap4_2.6.35.3.bb`. I tried to backport these patches to
> `linux-omap-psp_2.6.32.bb` but I am not successful. A lot seems to have
> changed between Linux 2.6.32 and 2.6.35.
> 
> After the adaptations to `arch/arm/mach-omap2/Makefile` I am now getting
> the next error message.
> 
>         |   LDS     arch/arm/kernel/vmlinux.lds
>         | /tmp/ccpCEAjJ.s: Assembler messages:
>         | /tmp/ccpCEAjJ.s:306: Error: selected processor does not support ARM mode `smc #0'
>         | /tmp/ccpCEAjJ.s:346: Error: selected processor does not support ARM mode `smc #0'
> 
> But I do not know how to adapt that. Is there an easier way to configure
> these security extensions?

yes there are cases where its used in inline assembly and compiler does not
have knob for security extentions. Here is one patch that will work with
binutils >= 2.21 but be away that it will NOT work with older binutils and
infact will render kernel uncompilable if you are not using binutils
atleast at version 2.21

Enjoy

-Khem



--OXfL5xGRrasGEqWY
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="ARM-add-sec-attribute-to-inline-asm.patch"

Compiling with binutils 2.21 needs to have this sec arch_extention
gcc does not know march=armv7-a+sec and if we use -Wa,-march=armv7-a+sec
then assembler does not honor it because march=armv7-a when specfied to
gcc driver adds march=armv7-a *before*  -Wa,-march=armv7-a+sec when calling
assembler. There is no way getting around that :(

So what do we do ? We take the fight to the beast
 We add the .arch_extention where its added in inline
assembly.

This file is added by one of local OE patches these patches are not
(upstream _yet_ or discarded) dont know

-Khem


Index: git/arch/arm/kernel/sysfs_v7.c
===================================================================
--- git.orig/arch/arm/kernel/sysfs_v7.c
+++ git/arch/arm/kernel/sysfs_v7.c
@@ -76,7 +76,8 @@ static ssize_t aux_ctl_store(struct sys_
 	asm ("mrc p15, 0, %0, c1, c0, 1" : "=r"(val));
 	SETBITS(val, 0xff8, new);
 	val &= ~2;
-	asm ("mov r0,  %0	\n\t"
+	asm (".arch_extension sec\n\t"
+	     "mov r0,  %0	\n\t"
 	     "mov r12, #3	\n\t"
 	     "smc #0		\n\t"
 	     :: "r"(val) : "r0", "r12");
@@ -107,7 +108,8 @@ static ssize_t l2_aux_ctl_store(struct s
 
 	asm ("mrc p15, 1, %0, c9, c0, 2" : "=r"(val));
 	SETBITS(val, 0xbc00000, new);
-	asm ("mov r0,  %0	\n\t"
+	asm (".arch_extension sec\n\t"
+	     "mov r0,  %0	\n\t"
 	     "mov r12, #2	\n\t"
 	     "smc #0		\n\t"
 	     :: "r"(val) : "r0", "r12");

--OXfL5xGRrasGEqWY--
