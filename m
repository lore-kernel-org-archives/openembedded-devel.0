Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1GGh-0002Er-5S
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 12:21:40 +0200
Received: by iwn2 with SMTP id 2so2293436iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w2aNpfRGaXm3AnVeAOoZolLlqItM4+42GxJkCHKt7IU=;
	b=gZe55Ol9SKRvupyS8zwdEEi3aoGDexuRYLER0AVAShN+2f5XMdJEVm6Dmtz1/8L/sM
	yn02mSOJGlfbJFkBeK0QGTW/Gr7yDhOxdKE2U5Fbb1HP8KRYgyRZKSTTYMPeoMb5CFqz
	MQy73IJ3By3XhoPum0rn6QD1zZbE/1x9O6XEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LNzjxIct3djPsy/XcFqEpZFmGfhLnmntSHRZ7J4PAJp1DQSSQ8/apRT/9umUTVf5CB
	jERdw0YNHFVHGWLUUJCYrNxi9C1Z95XO9Kb8t1gH/QXIj5tnhchGEWHq0tJyDIUsHBt2
	nqRkvLppgO4OUJ9VF88GjAwoS+tHR68x9wFDk=
MIME-Version: 1.0
Received: by 10.231.157.212 with SMTP id c20mr3412980ibx.186.1285842084727;
	Thu, 30 Sep 2010 03:21:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 03:21:24 -0700 (PDT)
In-Reply-To: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
Date: Thu, 30 Sep 2010 12:21:24 +0200
Message-ID: <AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Thu, 30 Sep 2010 10:21:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Thilo Fromm <t.fromm@dresearch.de>:
> libunwind causes cross gcc build to fail if libunwind is built first:
>
> ...
> | arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mt=
humb-interwork -mno-thumb -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-inte=
rwork -mno-thumb -isystem/SCRATCH/maniac/oe-merge-test/OE/tmp.6/sysroots/ar=
mv5te-angstrom-linux-gnueabi/usr/include -g -Os -O2 -g -Os -DIN_GCC -W -Wal=
l -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-defi=
nition -isystem ./include =A0-fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__=
GCC_FLOAT_NOT_NEEDED =A0 -I. -I. -I../.././gcc -I/SCRATCH/maniac/oe-merge-t=
est/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/=
libgcc -I/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux=
-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/. -I/SCRATCH/maniac/oe-merge-test=
/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/lib=
gcc/../gcc -I/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../include =A0-DHAVE_CC_TLS -=
o _ucmpdi2_s.o -MT _ucmpdi2_s.o
> =A0\
> =A0-MD -MP -MF _ucmpdi2_s.dep -DSHARED -DL_ucmpdi2 -c /SCRATCH/maniac/oe-=
merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc=
-4.3.3/libgcc/../gcc/libgcc2.c
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:40: err=
or: expected ')' before '*' token
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:41: err=
or: expected ')' before '*' token
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:42: err=
or: expected ')' before '*' token
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:47: war=
ning: data definition has no type or storage class
> ...
>
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/pr-support.c:396: er=
ror: expected '=3D', ',', ';', 'asm' or '__attribute__' before '_Unwind_Get=
DataRelBase'
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/pr-support.c:402: er=
ror: expected '=3D', ',', ';', 'asm' or '__attribute__' before '_Unwind_Get=
TextRelBase'
> | make[2]: *** [unwind-arm.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: *** [pr-support.o] Error 1
> ...
>
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:212: error: 'lsda_he=
ader_info' has no member named 'LPStart'
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:214: error: 'lsda_he=
ader_info' has no member named 'action_table'
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:234: error: expected=
 ')' before 'ue_header'
> | /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:123: warning: unused=
 parameter 'ue_header'
> | make[2]: *** [unwind-c.o] Error 1
> | make[2]: Leaving directory `/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work=
/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/build.arm-angstro=
m-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgc=
c'
> | make[1]: *** [all-target-libgcc] Error 2
> | make[1]: Leaving directory `/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work=
/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/build.arm-angstro=
m-linux-gnueabi.arm-angstrom-linux-gnueabi'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package gcc-4.3.3-r17.1: task do_compile: Failed
>
> It looks like libunwind provides header files that are named
> identically to gcc header files. gcc then confuses these headers when it
> is built, causing a break of the build.
>
> This patch makes libunwind depend on gcc which resolves the build issue. =
Both
> build nicely when gcc is built first.

Hm. Ideally this should be patched in gcc. Now I feel that if someone
does a bitbake libunwind; bitbake -cclean gcc; bitbake gcc things
still fail.
Btw what include files are we talking about?

Frans.
>
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
> ---
> =A0recipes/libunwind/libunwind.inc | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libunwind/libunwind.inc b/recipes/libunwind/libunwin=
d.inc
> index 6994095..4340192 100644
> --- a/recipes/libunwind/libunwind.inc
> +++ b/recipes/libunwind/libunwind.inc
> @@ -1,7 +1,8 @@
> =A0DESCRIPTION =3D "a portable and efficient C programming interface (API=
) to determine the call-chain of a program"
> =A0HOMEPAGE =3D "http://www.nongnu.org/libunwind"
> =A0LICENSE =3D "MIT"
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
> +DEPENDS =3D "gcc"
>
> =A0SRC_URI =3D "http://download.savannah.nongnu.org/releases/${BPN}/${BPN=
}-${PV}.tar.gz;name=3Darchive"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


