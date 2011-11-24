Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTPZL-0004R3-Kq
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 04:01:50 +0100
Received: by faat2 with SMTP id t2so2495994faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 18:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1uvJ9QqB9uS+BUbJKf3zQoX9BcE+H9v3FCDw+WjjZ+s=;
	b=wcwIfNk98ViWZ/lw3sDWb1fZcuBOUWCj+OhZvU7kfKBRrbqG9IwmOllrgvOeF1aUcq
	mOYMh47ihnEudvKeMb2a9xohZiaY+bXOry4GypHdlEdsN+CFfsptrPzIdyAMOeAvUal9
	1ARjeEbsbBfE/0AKqr43E+HtymJzrtJ0N0ElE=
Received: by 10.152.132.39 with SMTP id or7mr16126457lab.14.1322103315104;
	Wed, 23 Nov 2011 18:55:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 18:54:44 -0800 (PST)
In-Reply-To: <4EC81A85.8050704@googlemail.com>
References: <4EC81A85.8050704@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 18:54:44 -0800
Message-ID: <CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Thu, 24 Nov 2011 03:01:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 1:07 PM, Mr Dash Four
<mr.dash.four@googlemail.com> wrote:
> I am trying to build my kernel image with "bitbake virtual/kernel" using =
the following (rather short) local.conf:
>
> DL_DIR =3D "${HOME}/oe/sources"
> BBFILES =3D "${HOME}/oe/openembedded/recipes/*/*.bb"
> MACHINE =3D "htcdream"
> DISTRO =3D "shr"
> BBMASK =3D "/(nonworking|obsolete|cacao)/"
>
> As a side note - the reason I excluded "cacao" above as well is because t=
here are some errors in the .bb recipe files. Unfortunately, my build fails=
 with the following error:
>
> | gcc =C2=A0 -isystem/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/in=
clude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE =C2=A0-W -Wall -Wwrite-st=
rings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format=
-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-st=
rings -Wold-style-definition -Wc++-compat =C2=A0 -DHAVE_CONFIG_H -L/home/mr=
-4/oe/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/mr-4/oe=
/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/mr-4/oe/build/tmp=
/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o cc1-dummy c-lang.o stub-objc.o at=
tribs.o c-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux=
-info.o c-common.o c-opts.o c-format.o c-semantics.o c-ppoutput.o c-cppbuil=
tin.o c-objc-common.o c-dump.o c-pch.o c-parser.o arm-c.o c-gimplify.o tree=
-mudflap.o c-pretty-print.o c-omp.o \
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy-checksum.o main.o =C2=A0libbackend.a =
../libcpp/libcpp.a ../libdecnumber/libdecnumber.a ../libcpp/libcpp.a =C2=A0=
 ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a =C2=A0-lcloog =C2=
=A0-Wl,-Bstatic =C2=A0-lppl_c -lppl -lgmpxx -Wl,-Bdynamic -Wl,-Bstatic -lmp=
c -lmpfr -lgmp -Wl,-Bdynamic -rdynamic -ldl =C2=A0-L../zlib -lz -Wl,-Bstati=
c -lelf -Wl,-Bdynamic
> | /usr/bin/ld: cannot find -lppl_c
> | collect2: ld returned 1 exit status
> | make[2]: *** [cc1-dummy] Error 1
> | make[2]: Leaving directory `/home/mr-4/oe/build/tmp/work/armv6-novfp-oe=
-linux-gnueabi/gcc-cross-initial-4.5-r38.1+svnr170880/gcc-4_5-branch/build.=
x86_64-linux.arm-oe-linux-gnueabi/gcc'
> | make[1]: *** [all-gcc] Error 2
> | make[1]: Leaving directory `/home/mr-4/oe/build/tmp/work/armv6-novfp-oe=
-linux-gnueabi/gcc-cross-initial-4.5-r38.1+svnr170880/gcc-4_5-branch/build.=
x86_64-linux.arm-oe-linux-gnueabi'
> | make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package gcc-cross-initial-4.5-r38.1+svnr170880: task do_compile: Fa=
iled
> ERROR: Function 'do_compile' failed (see /home/mr-4/oe/build/tmp/work/arm=
v6-novfp-oe-linux-gnueabi/gcc-cross-initial-4.5-r38.1+svnr170880/temp/log.d=
o_compile.1190 for further information)
> ERROR: Task 748 (/home/mr-4/oe/openembedded/recipes/gcc/gcc-cross-initial=
_4.5.bb, do_compile) failed with exit code '1'
> ERROR: '/home/mr-4/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb' =
failed
>
>
> It looks as though ld cannot find "ppl_c" (not ppl!). What is ppl_c? The =
build environment I use is x86_64 (quad core CPU), running heavily upgraded=
 and updated FC13 (most of the components are based on FC14 & FC15). The ta=
rget device is htcdream (ARMv6).
>
> Any idea what is causing this?

somehow gcc build is detecting that you have enabled PPL support, I
dont think we either enable or disable it by default. So I think your
build system has the header file ppl_c.h installed but library itself
is not installed. If you remove ppl installation from your build host
it would work and if you install the ppl packages propertly it should
work too.


>
> I've followed the installation guide (http://www.openembedded.org/wiki/Ge=
tting_started) and the only difference is that I deployed bitbake 1.12.0 in=
stead of 1.10.2. I keep the full logs so I can post them here if there is a=
ny interest. Many thanks in advance!
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


