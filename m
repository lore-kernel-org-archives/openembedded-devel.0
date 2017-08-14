Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 63CFA78374
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:14:49 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id g189so31725550vke.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DKePMaNXUEQJxnVTd0fh2qwDl1YqRDqSY36rBtBNDuQ=;
	b=YnjusxDSEyrdTwgv3FKtfjDoc87c31nryre63wMaedcDJQG9bJOZ800i1fJPtS9Dxo
	EAyakBm2l3TKXd9GZnM7XB23JTcdWKhDAPLWnBj7OzDpJKSpPW0h2r5q2nlSHpz1/X61
	DWy/S3y+TNe3B0HN1X010uyqGA1abbZjfBXtHmDRg7ytjSUQo1QoplXj/jG0hjD8nkxD
	nUFH8Xrf18AFKB+v5BO563Kzoxq6RteL3ywWfOQbo0LHsT1hXcUNkZPLSfGbPQQ2Lt4W
	pc/lquVTfMlJFe5cimaPEej4+cPi+f3o6MikL7N67vTcPAeeXAYhJo9pFxz53ZF0fjjC
	+qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DKePMaNXUEQJxnVTd0fh2qwDl1YqRDqSY36rBtBNDuQ=;
	b=a+kyaUDaaUL3PQNBp2qU/5uSvS2fXOEdwVaYD9GN/PkBZYatKnRwsFmIIiakYyhbhl
	gp88spDqYT1CLJ1hC2B+nME9qqGhIoiEBoFjIlyb2t1b4xYPjw/DqNLB73wHe9Eu1kId
	a2bnRKAqNw5GYxi/hrCD4jsi/UU955qAxJ3cxi+5poytZZQCtNV3UXml3Th4SV/ztcoU
	O89060BsDITUZB9TqCAGdyoXfd066P/L2ZrdC7RWAzlBt19zgQGw29iIhVJoonUTwGSM
	hYZoeDhPWW4ymAIhx06gOd8rnqFNSYl9gXS+1NvOzgLw0/gT5BN5gzwHCh3ZaQDput9J
	LMYA==
X-Gm-Message-State: AHYfb5ib+xqK0VcEx5Za60JrWn+WWCRfjnj+TzbrvMfvyMPA+FXTPLTs
	3d0Sm5KHNSjjeCZrN3+yJZxHDyAIkQ==
X-Received: by 10.31.63.151 with SMTP id m145mr14993375vka.59.1502720091157;
	Mon, 14 Aug 2017 07:14:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 14 Aug 2017 07:14:50 -0700 (PDT)
In-Reply-To: <b53934ef-2480-8d0e-27ce-fe2fc1eb4d39@laposte.net>
References: <b53934ef-2480-8d0e-27ce-fe2fc1eb4d39@laposte.net>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2017 16:14:50 +0200
Message-ID: <CA+chaQdv1yxXbfJpd7mucwn0xHiW2XXZJPUA8s=Q_sqeeDAatw@mail.gmail.com>
To: idealsim <idealsim@laposte.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [qtwebengine] build failed in pyro branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 14:14:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> //| collect2: fatal error: ld terminated with signal 9 [Killed]//

You've probably run out of memory and OOMK killed the linker.

Try with bigger swap or switch from bfd to gold.

On Mon, Aug 14, 2017 at 3:26 PM, idealsim <idealsim@laposte.net> wrote:

> Hi all, i'm trying to build webengine in pyro branch but i have this erro=
r
> during the build :
>
> /| ERROR: oe_runmake failed//
> //| make[3]: Entering directory '/media/modjo/data1TO/yocto/py
> ro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd
> 92-r0/build/src/core/api'//
> //| compiling /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9=
h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/
> qtwebenginecoreglobal.cpp//
> //| compiling /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9=
h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/
> qwebenginecookiestore.cpp//
> //| compiling /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9=
h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/
> qwebengineurlrequestinfo.cpp//
> //| compiling /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9=
h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/
> qwebengineurlrequestjob.cpp//
> //| compiling /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9=
h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebeng
> ineurlschemehandler.cpp//
> //| generating .moc/moc_predefs.h//
> //| moc /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/
> qwebenginecookiestore.h//
> //| moc /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebeng
> ineurlrequestinterceptor.h//
> //| moc /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/
> qwebengineurlrequestjob.h//
> //| moc /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebeng
> ineurlschemehandler.h//
> //| compiling .moc/moc_qwebenginecookiestore.cpp//
> //| compiling .moc/moc_qwebengineurlrequestinterceptor.cpp//
> //| compiling .moc/moc_qwebengineurlrequestjob.cpp//
> //| compiling .moc/moc_qwebengineurlschemehandler.cpp//
> //| rm -f Release/libqtwebenginecoreapi.a//
> //| arm-poky-linux-gnueabi-ar cqs Release/libqtwebenginecoreapi.a
> .obj/qtwebenginecoreglobal.o .obj/qwebenginecookiestore.o
> .obj/qwebengineurlrequestinfo.o .obj/qwebengineurlrequestjob.o
> .obj/qwebengineurlschemehandler.o .obj/moc_qwebenginecookiestore.o
> .obj/moc_qwebengineurlrequestinterceptor.o .obj/moc_qwebengineurlrequestj=
ob.o
> .obj/moc_qwebengineurlschemehandler.o//
> //| make[3]: Leaving directory '/media/modjo/data1TO/yocto/py
> ro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd
> 92-r0/build/src/core/api'//
> //| ( test -e Makefile.core_module || /media/modjo/data1TO/yocto/pyr
> o/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd
> 92-r0/recipe-sysroot-native/usr/bin/qt5/qmake -o Makefile.core_module
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/core_module.pro
> GYP_CONFIG+=3Duse_system_yasm GYP_CONFIG+=3Dgenerate_character_data=3D0
> WEBENGINE_CONFIG+=3Duse_system_flac WEBENGINE_CONFIG+=3Duse_system_libeve=
nt
> WEBENGINE_CONFIG+=3Duse_system_libwebp WEBENGINE_CONFIG+=3Duse_system_lib=
xslt
> WEBENGINE_CONFIG+=3Duse_system_speex 'QMAKE_CXX=3Darm-poky-linux-gnueabi-=
g++
> -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9
> --sysroot=3D/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/
> work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine
> /5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot'
> 'QMAKE_CC=3Darm-poky-linux-gnueabi-gcc  -march=3Darmv7-a -marm -mfpu=3Dne=
on
> -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 --sysroot=3D/media/modjo/data1TO
> /yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-
> poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/=
recipe-sysroot'
> 'QMAKE_LINK=3Darm-poky-linux-gnueabi-g++  -march=3Darmv7-a -marm -mfpu=3D=
neon
> -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 --sysroot=3D/media/modjo/data1TO
> /yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-
> poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/=
recipe-sysroot'
> 'QMAKE_CFLAGS=3D -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=3D/media/modjo/data1TO/yocto/pyro/quadBuild
> /tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/
> qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0=3D/usr/
> src/debug/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0
> -fdebug-prefix-map=3D/media/modjo/data1TO/yocto/pyro/quadBuild
> /tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/
> qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-nati=
ve=3D
> -fdebug-prefix-map=3D/media/modjo/data1TO/yocto/pyro/quadBuild
> /tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/
> qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot=3D '
> 'QMAKE_CXXFLAGS=3D -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=3D/media/modjo/data1TO/yocto/pyro/quadBuild
> /tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/
> qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0=3D/usr/
> src/debug/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0
> -fdebug-prefix-map=3D/media/modjo/data1TO/yocto/pyro/quadBuild
> /tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/
> qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-nati=
ve=3D
> -fdebug-prefix-map=3D/media/modjo/data1TO/yocto/pyro/quadBuild
> /tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/
> qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot=3D
> -fvisibility-inlines-hidden' 'QMAKE_AR=3Darm-poky-linux-gnueabi-ar cqs'
> -after ) && make -f Makefile.core_module//
> //| make[3]: Entering directory '/media/modjo/data1TO/yocto/py
> ro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd
> 92-r0/build/src/core'//
> //| creating linker version script QtWebEngineCore.version//
> //| rm -f libQt5WebEngineCore.so.5.8.0 libQt5WebEngineCore.so
> libQt5WebEngineCore.so.5 libQt5WebEngineCore.so.5.8//
> //| linking ../../lib/libQt5WebEngineCore.so.5.8.0//
> //| collect2: fatal error: ld terminated with signal 9 [Killed]//
> //| compilation terminated.//
> //| Makefile.core_module:157: recipe for target
> '../../lib/libQt5WebEngineCore.so.5.8.0' failed//
> //| make[3]: *** [../../lib/libQt5WebEngineCore.so.5.8.0] Error 1//
> //| make[3]: Leaving directory '/media/modjo/data1TO/yocto/py
> ro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd
> 92-r0/build/src/core'//
> //| Makefile:158: recipe for target 'sub-core_module-pro-make_first'
> failed//
> //| make[2]: *** [sub-core_module-pro-make_first] Error 2//
> //| make[2]: Leaving directory '/media/modjo/data1TO/yocto/py
> ro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd
> 92-r0/build/src/core'//
> //| Makefile:49: recipe for target 'sub-core-make_first' failed//
> //| make[1]: *** [sub-core-make_first] Error 2//
> //| make[1]: Leaving directory '/media/modjo/data1TO/yocto/py
> ro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-
> gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src'/=
/
> //| Makefile:44: recipe for target 'sub-src-make_first' failed//
> //| make: *** [sub-src-make_first] Error 2//
> //| ERROR: Function failed: do_compile (log file is located at
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9h
> f-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+
> gitAUTOINC+d740d6a7db_15d257fd92-r0/temp/log.do_compile.30193)//
> //ERROR: Task (/media/modjo/data1TO/yocto/pyro/sources/meta-qt5/recipes-q=
t
> /qt5/qtwebengine_git.bb:do_compile) failed with exit code '1'//
> //NOTE: Tasks Summary: Attempted 6306 tasks of which 6175 didn't need to
> be rerun and 1 failed.//
> //
> //Summary: 1 task failed://
> ///media/modjo/data1TO/yocto/pyro/sources/meta-qt5/recipes-q
> t/qt5/qtwebengine_git.bb:do_compile//
> //Summary: There was 1 WARNING message shown.//
> //Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code./
>
> an idea where is the issue ?
>
> regards
>
> Micka=C3=ABl
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

