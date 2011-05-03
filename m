Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilby985@gmail.com>) id 1QHIE4-0008Vv-NS
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 18:13:37 +0200
Received: by iwn10 with SMTP id 10so215251iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=QPnnWqcJsdNTVLdvRXnr+/qG6FyFHl4RV0Ol+DZvYRs=;
	b=bOdaH0ejG5bB7T90dGup8xdqdZq9BV/y2w1w+TyS5K/sj38BlCTkBSft0WqWV1UK2C
	YW3NNKmGfqbVwxWoFx8Dp1CR0k68MKcsN0JtjwNJvRGB3hM2cfSW8InLo/A+d/I1MMNe
	1EpEektPM25DxgAFmCRcOPmIvAr2fGvBC2q+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GD9be1wC9oclAI9KbPdQsrZYGG+gAkEXnd4ACqImoIaKhpUHvsYRNPwBEw/cYm2Vfj
	J7IIskdFCHh3n0VCVWXldIiv18S6q5cwmd/Lz0nhaisTgWIVNDVi8wyI8CQc1xu5qpW2
	FwxiM9o2rXNjywuHodoh8kXFosjU089Bkz5ug=
MIME-Version: 1.0
Received: by 10.42.171.9 with SMTP id h9mr61613icz.37.1304439046863; Tue, 03
	May 2011 09:10:46 -0700 (PDT)
Received: by 10.42.240.6 with HTTP; Tue, 3 May 2011 09:10:46 -0700 (PDT)
In-Reply-To: <BANLkTin=ptRRhu_WB=gDooxUEJLh64DNaA@mail.gmail.com>
References: <BANLkTin=ptRRhu_WB=gDooxUEJLh64DNaA@mail.gmail.com>
Date: Tue, 3 May 2011 18:10:46 +0200
Message-ID: <BANLkTi=56SnS27dbaKjcaebSOU3GX0aEyw@mail.gmail.com>
From: Alberto Carrozzo <gilby985@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Installing MAD-FCL using bitbake
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
X-List-Received-Date: Tue, 03 May 2011 16:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

You are right thank you thousand Robert! i was wrong but now i've
fixed this problem... but I have any others! Flute compiling give some
problems: first of all i had to modify the file "include/netinet/in.h"
(as the developer seggest me) and, after this and after some
dependencies resolution, it finally compile on ubuntu but it still not
work on OE... the error it gives me is

/usr/bin/ld: cannot find -lflutelib
collect2: ld returned 1 exit status

but, lflutelib is a library it creates in the same job... In fact the
makefile is divided into different parts:

alclib ::
sdplib ::
flutelib ::
flute ::
multis_flute ::
flute_unittest::

... trying to delete, on Ubuntu, flutelib:: it gives me the same
error, so i suppose that lflutelib is created by this rule... but i
don't know why under OE it doesn't recognize this... Someone can help
me? Thank you all!!!

2011/4/17 Alberto Carrozzo <gilby985@gmail.com>:
> Hello, I'm trying to install MAD-FCL (http://mad.cs.tut.fi/) in order
> to use the Flute protocol on Angstrom... to do it, I modified the
> "wscan_20091230.bb" recipe that you can find in
> "oe/openembedded/recipes/dvbtools/" folder...
>
> _________________________________________________
> ESCRIPTION =3D "Wscan is a dvb channel scanner that doesn't require an
> initial frequency table"
> LICENSE =3D "GPLv2"
>
> SRC_URI =3D "http://wirbel.htpc-forum.de/w_scan/w_scan-${PV}.tar.bz2"
>
> S =3D "${WORKDIR}/w_scan-${PV}"
>
> inherit autotools
>
> FILES_${PN} +=3D "${datadir}"
>
> SRC_URI[md5sum] =3D "97cd83d5c174e386d01a364b2d280f2a"
> SRC_URI[sha256sum] =3D
> "1a5864559b6a0acb76b9fa66b4e1351acd7d06c4e4a9a2ba323e7eafa4d4788b"
> __________________________________________________
>
> It works perfectly and bitbaking it I can find the executable w_scan
> in the ~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/wscan-20091230-r0/w_sc=
an-20091230
> folder... So I modifed it in this way:
>
> ___________________________________________________
> SRC_URI =3D "http://mad.cs.tut.fi/download/mad_fcl_v1.7_src.tar.gz"
>
> S =3D "${WORKDIR}/flute"
>
> inherit autotools
>
> FILES_${PN} +=3D "${bindir}/flute"
>
> SRC_URI[md5sum] =3D "71a0c9d856a9b949b2c7c25bfd91029e"
> SRC_URI[sha256sum] =3D
> "97c0abc3807e48b102fee85bf14aaaeabe39ce3f98bb4423daed9651978e62f0"
> ____________________________________________________
>
> ...but it doesn't work and it gives me the following error on the
> log.do_install file:
> ____________________________________________________
> NOTE: make DESTDIR=3D/home/gilby/oe/tmp/work/armv7a-angstrom-linux-gnueab=
i/flute-1.0-r0/image
> install
> make: *** No rule to make target `install'. =A0Stop.
> FATAL: oe_runmake failed
> ERROR: Function do_install failed
> ____________________________________________________
>
> Note: the log.do_compile file tells me "NOTE: nothing to compile"
>
> ... OK, so i added this on the recipe above:
> ____________________________________________________
> do_install(){
> =A0 =A0 =A0 =A0install -m 0755 -d ${D}${bindir} ${D}${docdir}/flute
> }
> ____________________________________________________
>
> and it work without errors... but the log.do_compile file tells me
> again "NOTE: nothing to compile" and i can't find the executable in
> the ~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/flute-1.0-r0/
> folder... and the same thing happen if I delete the "inherit
> autotools" row...
>
> SO:
>
> 1) Why for some recipes it execute the makefile automatically and not
> for other ones?
> 2) How can I fix my prolems?
>
> somebody can help me? thank you so much
>



--=20
He walks among us, but he is not one of us - JS


