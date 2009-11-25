Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NDM2b-0000Ua-MK
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 18:52:37 +0100
Received: by iwn32 with SMTP id 32so1297231iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7JkZ9lQdVHj+BRPiLjTRdIKpGFMESxjPBVYPRAEypBo=;
	b=vgMO2gmSto7eq7KTir2XpGGTGrHQve+ahGrPoJHZEWeWKEEVvvkoQ+4AgHSdEvo1gK
	+06CZr5Z9IErdg/akA/m9BwTV8ajtA3+27vKlLV5mPfhRmXjX+ZJAEdBgXAs+qwJBBNy
	MzhAQMRTOgLGSiSBcZWDm8eUSJ+LYB+4qFecU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tjlQ9LYiQLBIfUqb6feH4yRdg3c54WeyeB4uN5gQbnOm3DVhrlekhAKu6uSK4DNu2c
	bMTa60T1HBLahYuOLg43RDTgf2XEEnnFl/2mdiT4nXicuKAUQVyhyBVwnI4JKnQGfM3Y
	+5czGvFJhJ+xGqeAllg4acskf77LP3Pq8LvJE=
MIME-Version: 1.0
Received: by 10.231.25.199 with SMTP id a7mr363561ibc.51.1259171463181; Wed, 
	25 Nov 2009 09:51:03 -0800 (PST)
In-Reply-To: <200911241045.20901.sgh@sgh.dk>
References: <200911241045.20901.sgh@sgh.dk>
Date: Wed, 25 Nov 2009 09:51:03 -0800
Message-ID: <19c1b8a90911250951v40fd87cas91f027e748a4a8c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gcc-cross build failure
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
X-List-Received-Date: Wed, 25 Nov 2009 17:52:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2009 at 1:45 AM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:
> hi Apparently gcc-cross fail building without any particullar reason. Doe=
s
> anyone have an idea of what is happening.
>
> if (cd ../${dir}/${lib}; make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc "
> "CC_FOR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-
> linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
> linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstro=
m-
> linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
> linux/./gcc/ -march=3Dpentiumpro -
> isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-
> linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-
> angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i68=
6-
> angstrom-linux/lib/ -isystem
> /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/inclu=
de -
> isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-
> linux/sys-include" "CFLAGS=3D-g -Os --
> sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linu=
x "
> "CXXFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagi=
ng/i686-
> angstrom-linux " "CFLAGS_FOR_BUILD=3D-
> isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/includ=
e -O2
> -g" "CFLAGS_FOR_TARGET=3D-g -Os" "INSTALL=3D/usr/bin/install -c"
> "INSTALL_DATA=3D/usr/bin/install -c -m 644" "INSTALL_PROGRAM=3D/usr/bin/i=
nstall -
> c" "INSTALL_SCRIPT=3D/usr/bin/install -c" "LDFLAGS=3D-
> L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpa=
th-
> link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,=
-
> rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl=
,-O1"
> "LIBCFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stag=
ing/i686-
> angstrom-linux " "LIBCFLAGS_FOR_TARGET=3D-g -Os" "MAKE=3Dmake" "MAKEINFO=
=3Dmakeinfo
> --split-size=3D5000000 --split-size=3D5000000 =C2=A0 =C2=A0" "PICFLAG=3D"
> "PICFLAG_FOR_TARGET=3D" "SHELL=3D/bin/sh" "RUNTESTFLAGS=3D"
> "exec_prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686"
> "infodir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/share/info"
> "libdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib"
> "includedir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/include"
> "prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686"
> "tooldir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-=
linux"
> "gxx_include_dir=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angs=
trom-
> linux//usr/include/c++"
> "AR=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-
> linux/bin/ar" "AS=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstr=
om-
> linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
> linux/./gcc/as" "LD=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angs=
trom-
> linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
> linux/./gcc/collect-ld"
> "RANLIB=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-
> linux/bin/ranlib" "NM=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-an=
gstrom-
> linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
> linux/./gcc/nm" "NM_FOR_BUILD=3D"
> "NM_FOR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-ang=
strom-
> linux/bin/nm" "DESTDIR=3D" "WERROR=3D" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D"-g -Os --
> sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linu=
x
> ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CCASFLAGS=3D" ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FCFLAGS=3D" ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FFLAGS=3D" ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ADAFLAGS=3D" ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix=3D"/home/sgh/svn/OpenEmbedded/=
build/tmp/cross/i686"
> \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_prefix=3D"/home/sgh/svn/OpenEmbe=
dded/build/tmp/cross/i686"
> \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCJFLAGS=3D" ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXXFLAGS=3D"-g -Os --
> sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linu=
x
> ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBCFLAGS=3D"-g -Os --
> sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linu=
x
> ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBCXXFLAGS=3D"-g -Os -fno-implicit-t=
emplates --
> sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linu=
x
> ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D"-
> L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpa=
th-
> link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,=
-
> rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl=
,-O1
> ${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MULTIFLAGS=3D"${flags}" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D"" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL=3D"/usr/bin/install -c" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_DATA=3D"/usr/bin/install -c -=
m 644" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_PROGRAM=3D"/usr/bin/install -=
c" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_SCRIPT=3D"/usr/bin/install -c=
" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all); then \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else true; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> make[5]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-
> angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-
> linux/i686-angstrom-linux/libstdc++-v3'
> make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-
> angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-
> linux/i686-angstrom-linux/libstdc++-v3'
> make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-
> angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-
> linux/i686-angstrom-linux/libstdc++-v3'
> make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-
> angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-
> linux/i686-angstrom-linux/libstdc++-v3'
> make[1]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-
> angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-
> linux'
> make: *** [all] Error 2
> + die 'oe_runmake failed'
> + oefatal 'oe_runmake failed'
> + echo FATAL: 'oe_runmake failed'
> FATAL: oe_runmake failed
> + exit 1
> ERROR: function do_compile failed
> ERROR: see log in /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-
> linux/gcc-cross-4.3.3-r8.1/temp/log.do_compile.21917
> NOTE: Task failed: /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstro=
m-
> linux/gcc-cross-4.3.3-r8.1/temp/log.do_compile.21917
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/sgh/svn/OpenEmbedded/openembedded/recipes/gcc/gcc-
> cross_4.3.3.bb do_compile failed
> ERROR: Task 116 (/home/sgh/svn/OpenEmbedded/openembedded/recipes/gcc/gcc-
> cross_4.3.3.bb, do_compile) failed
> NOTE: Tasks Summary: Attempted 648 tasks of which 648 didn't need to be r=
erun
> and 1 failed.
> ERROR: '/home/sgh/svn/OpenEmbedded/openembedded/recipes/gcc/gcc-
> cross_4.3.3.bb' failed
>

you need to post full log.
-Khem


