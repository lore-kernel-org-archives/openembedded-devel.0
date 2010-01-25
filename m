Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZIhe-0007ms-Vv
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 07:45:42 +0100
Received: by iwn35 with SMTP id 35so1033521iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 22:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QngQpWKPoj8TUNgmLSUVz9wK6chQbom5az84ROkcLdE=;
	b=d8xoR7/p1mFnT+rE5sdc0vew3ygx837i48d0P4xwRM22+SOF5mmNjaYSt/JssNzO9n
	H51XvZD3wHaa50lDEWg2Sygn6AGqXhiePX9wQTS9DetsYNdqhqOrw4pa+iEjq5uz4j+F
	AM7ygKbpG8oQvX4jb2uFNk8lHyyKpWWc12lJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cTw+YQtWwW7I/vvcB+DcKLx5RePbX45oMHZNwMMFJq7lKR4zkkpUMRV8DEjWnMMRa1
	hZQW60CbBbmCiiyOUoJvVs3/FE6A9yggnOapUklrZbhH7y4gcnFhGi8TT2Awvl6Xibnu
	ffSIjmJyC0G97RR6xLnjuBapVVnn8fqiB7JiQ=
MIME-Version: 1.0
Received: by 10.231.148.13 with SMTP id n13mr9832136ibv.67.1264401798444; Sun, 
	24 Jan 2010 22:43:18 -0800 (PST)
In-Reply-To: <op.u60mc6flmn1qzu@guohr-laptop-ubuntu>
References: <op.u6zcpxd7mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001231532y27421c4fk33b7b2d961bc16cc@mail.gmail.com>
	<op.u60mc6flmn1qzu@guohr-laptop-ubuntu>
Date: Sun, 24 Jan 2010 22:43:18 -0800
Message-ID: <19c1b8a91001242243y65a3033bg23f1e3f4584e2838@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: undefined reference to `_restfpr_14_x' in gcc-4.4.2/libgcc/../gcc/unwind.inc:307 when building ppc603e
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
X-List-Received-Date: Mon, 25 Jan 2010 06:45:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2010 at 6:25 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> By the way, the similar error occurs when LIBC=3Dglibc, DISTRO=3Dmicro an=
d
> MACHINE=3Dstorcenter
>
> =E5=9C=A8 Sun, 24 Jan 2010 07:32:25 +0800=EF=BC=8CKhem Raj <raj.khem@gmai=
l.com> =E5=86=99=E9=81=93:
>
>>> Is it caused by the incorrect toolchain set?
>>
>> probably some gcc misconfiguration. What options are passed to gcc
>> configure and eglibc configure can you post them plz.
>
> eglibc-2.10 configuration options:
> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egli=
bc/ppc603e-oe-linux/eglibc-2.10-r8.6/eglibc-2_10/libc/configure
> --build=3Di686-linux --host=3Dpowerpc-oe-linux --target=3Dpowerpc-oe-linu=
x
> --prefix=3D --exec_prefix=3D --bindir=3D/bin --sbindir=3D/sbin --libexecd=
ir=3D/libexec
> --datadir=3D/share --sysconfdir=3D/etc --sharedstatedir=3D/com
> --localstatedir=3D/var --libdir=3D/lib --includedir=3D/include
> --oldincludedir=3D/include --infodir=3D/share/info --mandir=3D/share/man
> --enable-kernel=3D2.4.0 --without-cvs --disable-profile --disable-debug
> --without-gd --enable-clocale=3Dgnu --enable-add-ons=3Dports,nptl,libidn,=
ports
> --with-headers=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/staging/eglibc/ppc603e-oe-linux/include
> --without-selinux
>
> gcc-cross-initial-4.4.2 configuration options:
> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egli=
bc/ppc603e-oe-linux/gcc-cross-initial-4.4.2-r2.1/gcc-4.4.2/configure
> --build=3Di686-linux --host=3Di686-linux --target=3Dpowerpc-oe-linux
> --prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tm=
p/cross/eglibc/ppc603e
>
> --exec_prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e
>
> =C2=A0--bindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/cross/eglibc/ppc603e/bin
>
> --sbindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/bin
>
> =C2=A0--libexecdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinon=
e/build/tmp/cross/eglibc/ppc603e/libexec
>
> --datadir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/share
>
> =C2=A0--sysconfdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinon=
e/build/tmp/cross/eglibc/ppc603e/etc
>
> --sharedstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/=
build/tmp/cross/eglibc/ppc603e/com
>
> --localstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/cross/eglibc/ppc603e/var
>
> =C2=A0--libdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/cross/eglibc/ppc603e/lib
>
> --includedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/buil=
d/tmp/cross/eglibc/ppc603e/include
>
> --oldincludedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/cross/eglibc/ppc603e/include
>
> =C2=A0--infodir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/cross/eglibc/ppc603e/share/info
>
> --mandir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tm=
p/cross/eglibc/ppc603e/share/man
>
> --with-local-prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allino=
ne/build/tmp/staging/eglibc/ppc603e-oe-linux
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-newlib =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 --without-headers
> --disable-shared =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
-disable-threads
> --disable-multilib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disa=
ble-__cxa_atexit
> =C2=A0--enable-languages=3Dc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--e=
nable-target-optspace
> =C2=A0--program-prefix=3Dpowerpc-oe-linux-
> =C2=A0--with-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change_allin=
one/build/tmp/staging/eglibc/ppc603e-oe-linux
>
> =C2=A0--with-build-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change=
_allinone/build/tmp/staging/eglibc/ppc603e-oe-linux
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-libmudflap
> =C2=A0--disable-libgomp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--enable-decimal-float=3Dno
> --disable-libssp --enable-__cxa_atexit
>
> gcc-cross-intermediate-4.4.2 configuration options:
> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egli=
bc/ppc603e-oe-linux/gcc-cross-intermediate-4.4.2-r2.1/gcc-4.4.2/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--bu=
ild=3Di686-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--host=3Di=
686-linux
> =C2=A0 =C2=A0 =C2=A0 --target=3Dpowerpc-oe-linux
> --prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tm=
p/cross/eglibc/ppc603e
>
> --exec_prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e
>
> =C2=A0--bindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/cross/eglibc/ppc603e/bin
>
> --sbindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/bin
>
> =C2=A0--libexecdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinon=
e/build/tmp/cross/eglibc/ppc603e/libexec
>
> --datadir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/share
>
> =C2=A0--sysconfdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinon=
e/build/tmp/cross/eglibc/ppc603e/etc
>
> --sharedstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/=
build/tmp/cross/eglibc/ppc603e/com
>
> --localstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/cross/eglibc/ppc603e/var
>
> =C2=A0--libdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/cross/eglibc/ppc603e/lib
>
> --includedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/buil=
d/tmp/cross/eglibc/ppc603e/include
>
> --oldincludedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/cross/eglibc/ppc603e/include
>
> =C2=A0--infodir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/cross/eglibc/ppc603e/share/info
>
> --mandir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tm=
p/cross/eglibc/ppc603e/share/man
>
> --with-local-prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allino=
ne/build/tmp/staging/eglibc/ppc603e-oe-linux
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-shared =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-multilib
> =C2=A0--disable-threads =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--enable-languages=3Dc
> =C2=A0--enable-target-optspace =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--program-prefix=3Dpowerpc-oe-linux-
>
> =C2=A0--with-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change_allin=
one/build/tmp/staging/eglibc/ppc603e-oe-linux
>
> =C2=A0--with-build-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change=
_allinone/build/tmp/staging/eglibc/ppc603e-oe-linux
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-libmudflap
> =C2=A0--disable-libgomp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--disable-libssp
> --enable-__cxa_atexit
>

And check whats passed in CFLAGS to eglibc build. My guess is that somewher=
e
floating point notions during configure and compiler options passed
during compile dont match.

For experiment can you try to remove -mhard-float from TARGET_CC_ARCH in
conf/machine/include/tune-ppc603e.inc

> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


