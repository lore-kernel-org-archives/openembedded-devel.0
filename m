Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A68B75894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 15:02:58 +0000 (UTC)
Received: by wmff134 with SMTP id f134so13884218wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OBpVEytsKOeZcjoCPSKWVbS/82ClCcSJM6b8X13AiGE=;
	b=MVjRuMaBv1ncMiVOoBgqd1E4LLERPjOfr8eLWhw2guwHUspcMLzF38kqlwrtlfZFxJ
	pCQe+CYLMgF+qGvEEI68BJB+DayU1GpRigYsMT9lgodqpJL24/zwA3cxt+cZFymt8cXq
	gZIJky1Lck2I3Pf0gYo0ccMFDgCiacd9uH4BWOltmFt2JoGe3jgp0c0gHgbvaRkz8c2W
	M+s/wXeB0OzMl1ubFBskPLKBQNOfGjBH8QoCGeKfKll4KoKVm3mwnmgcDiJjcMSR/p40
	Cz5xdTOLXi1oaSvQ5OY3EXHYT5ORCALw5ODc+bUH7XjympkwGHk0nxv3JDjMjiT5XQ9x
	0epw==
X-Received: by 10.28.19.65 with SMTP id 62mr4115956wmt.6.1446217378638;
	Fri, 30 Oct 2015 08:02:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l186sm3279036wmg.19.2015.10.30.08.02.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 08:02:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 30 Oct 2015 16:03:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151030150331.GA2566@jama>
References: <CALbNGRTYMJ_Fwg3nj0Mwk1fGWLKGUjOZawSOfRU+9GZmbXMzaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTYMJ_Fwg3nj0Mwk1fGWLKGUjOZawSOfRU+9GZmbXMzaQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: luajit fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 15:02:59 -0000
X-Groupsio-MsgNum: 58208
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 07:27:00AM +0100, Andreas M=FCller wrote:
> Hi with latest masters luajit fails to build. I did already test - it
> is the same for luajit 2.04. I get
>=20
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (log file is located at
> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstr=
om-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
> ERROR: Logfile of failure stored in:
> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstr=
om-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j8 CROSS=3Darm-angstrom-linux-gnueabi- TARGET_CFLAGS=3D
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> -march=3Darmv7-a -mthumb  -mthumb-interwork -mfloat-abi=3Dhard
> -mfpu=3Dneon-vfpv4 -mtune=3Dcortex-a7 TARGET_LDFLAGS=3D
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> TARGET_SHLDFLAGS=3D
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> TARGET_STRIP=3D/bin/echo HOST_CC=3Dgcc  -m32
> | =3D=3D=3D=3D Building LuaJIT 2.1.0-beta1 =3D=3D=3D=3D
> | make -C src
> | make[1]: Entering directory
> '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/git/src'
> | HOSTCC    host/buildvm_peobj.o
> | HOSTCC    host/minilua.o
> | HOSTCC    host/buildvm_asm.o
> | CC        lj_gc.o
> | HOSTCC    host/buildvm_fold.o
> | HOSTCC    host/buildvm_lib.o
> | CC        lj_char.o
> | CC        lj_obj.o
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_peobj.c:9:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_lib.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_fold.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | compilation terminated.
> | compilation terminated.
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_asm.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/limits.h:25,
> |                  from
> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:168,
> |                  from
> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/syslimits.h:7,
> |                  from
> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:34,
> |                  from host/minilua.c:33:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | Makefile:672: recipe for target 'host/buildvm_fold.o' failed
> | make[1]: *** [host/buildvm_fold.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | Makefile:672: recipe for target 'host/buildvm_lib.o' failed
> | make[1]: *** [host/buildvm_lib.o] Error 1
> | Makefile:672: recipe for target 'host/buildvm_peobj.o' failed
> | make[1]: *** [host/buildvm_peobj.o] Error 1
> | Makefile:672: recipe for target 'host/minilua.o' failed
> | make[1]: *** [host/minilua.o] Error 1
> | Makefile:672: recipe for target 'host/buildvm_asm.o' failed
> | make[1]: *** [host/buildvm_asm.o] Error 1
> | make[1]: Leaving directory
> '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/git/src'
> | Makefile:105: recipe for target 'default' failed
> | make: *** [default] Error 2
> | WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-=
neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/run.do_compile.9725:1
> exit 1 from
> |   exit 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at
> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstr=
om-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
> ERROR: Task 7633
> (/home/superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-d=
evtools/luajit/luajit_2.1.bb,
> do_compile) failed with exit code '1'
>=20
> Seems it tries to use my host headers. Anybody with an idea why it does t=
hat?

Here it still fails with:
| -- Detecting CXX compile features - done
| -- Could NOT find Lua51 (missing:  LUA_LIBRARIES)
| CMake Error at CMakeLists.txt:128 (message):
|   Couldn't find system LuaJIT or Lua

Even after Khem's update, he also sent separate lua5.1 recipe, but
without adding dependency on it from sysdig. I'm trying if it fails
after replacing luajit with lua5.1 in depends.

>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYzhnsACgkQN1Ujt2V2gBzetgCgk5X/DUWkmazxre/N6o7olM4M
4n0AoIRbvoG9bo5IcQD+2hFpqxE1+JJn
=QVq2
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
