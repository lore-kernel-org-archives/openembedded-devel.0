Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.35370.1611181501883815721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 14:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H0EhYobq;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id e17so233232qto.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 14:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J+j3YX65g65/iWWXEYdzVRTPBQ65NXoOJCqI0uOn0Bs=;
        b=H0EhYobqEV5RzodSa+8J9wCOCm34A1c86cah8OIUHLEVTd4EXa5BAmxE4jDrqgH1NR
         jqGgfbi/Nx++ZJ2E2n2r5AVW4G15HfELDeQ819vxDmr794gnCbxq9cLHdaHxDaP7oNgl
         aopdQx/Ql7v0lW14B8DGFjhqUzwcTPnxdAK8OWgBxHPtX1EWx+0cPelQzNXStVSH/lS8
         QwSSeBr5kVZX1RO/TNqayCzbOmcEnBWYHjSz8vSGnFBd9LKpcXOJpWnbGr79n6j8/fwu
         sdPClpKlFE1H4q/Yn2caXEsOoBQit9Kb0UGl8gKN5uJwbeUG0VEpEOwHSiX/gppS/0jv
         5mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J+j3YX65g65/iWWXEYdzVRTPBQ65NXoOJCqI0uOn0Bs=;
        b=Ujw8MGZ9//hErgIIeIRYHgt+0KJn41oUQKNPhHka4AWCt79bADO4P6CnAWd3XfgoQE
         VxyFXzMvY6fPYWyFDlXhkPFZ3cs6tIr7rX3TSR5D6G7lQBlCqTKmG3YFFfEvQHf4bh9q
         O+w4ggzucxwPIPMy65aB4L1Cn4ry0L//0PvcRlTSB64w9LapL6WwDUzTER0PLCxzsdOz
         597TObVGrsT4lVYQ8eblRQOPf1yB91C4nWiCBxRor9wjBX1eKHXrMtdoEO+UoHX0pIdJ
         bvqBwK8uU8hzbt5vYiOKKj6H3AkwG+APoVB0ogogT0ukVCFIhMs5OBSLAkpF53U34oJY
         Av4g==
X-Gm-Message-State: AOAM5329eFmCGYnYUMwFeLKzvO0bOsoUpxMjxd+mh+7GbRnNyDd4a0gQ
	dSWsQnjM/PQ6bSiYJSiKoU9L6MB204ZScUB8DrM=
X-Google-Smtp-Source: ABdhPJx/vNTmBwUYFgJEQu4PZUhdb2fQt6Jxx2RcSU+N1lnhPQx0SnxsOIvi1oVZfTGjqGFHXuFncAgIyTqhaz0DUIQ=
X-Received: by 2002:ac8:6714:: with SMTP id e20mr11034846qtp.378.1611181500947;
 Wed, 20 Jan 2021 14:25:00 -0800 (PST)
MIME-Version: 1.0
References: <qCdQ.1611177128438633625.2UtR@lists.openembedded.org>
In-Reply-To: <qCdQ.1611177128438633625.2UtR@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 20 Jan 2021 14:24:34 -0800
Message-ID: <CAMKF1spyP0g5vCywDz+c1NvO7D7jue+rv0RK1w-6uqkj9Kp24g@mail.gmail.com>
Subject: Re: [oe] [meta-python][Question] python3-dlib recipe?
To: open.prac@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is the error of interest.


| build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/recipe=
-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux=
/gcc/aarch64-poky-linux/8.3.0/ld:
build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/recipe-s=
ysroot-native/usr/lib/libsqlite3.so:
error adding symbols: file in wrong format

you might want to add sqlite3 dependency or look at the component's
build files to see if it can be stopped from looking into native
sysroot or native files on build system

On Wed, Jan 20, 2021 at 1:12 PM <open.prac@gmail.com> wrote:
>
> Hi everyone, first time in the mailing list...
>
> I was wondering if anybody is already working in a recipe for the packag=
e dlib pyhon3 module, so far this is the recipe I've been working on
>
> # python3-dlib_19.21.1.bb
> SUMMARY =3D "A toolkit for making real world machine learning and data a=
nalysis applications"
> HOMEPAGE =3D "https://pypi.python.org/pypi/dlib"
> PYPI_PACKAGE =3D "dlib"
> LICENSE =3D "Boost-Software"
> SRC_URI[md5sum] =3D "1e7e357d7d54e86267ef60f606cb40e1"
> LIC_FILES_CHKSUM =3D "file://dlib/LICENSE.txt;md5=3D2c7a3fa82e66676005cd=
4ee2608fd7d2 \
>                     file://dlib/external/libpng/LICENSE;md5=3D243135dded=
f702158f9170807cbcfb66 \
>                     file://dlib/external/pybind11/LICENSE;md5=3Dbeb87117=
af69fd10fbf9fb14c22a2e62 \
>                     file://python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.=
txt;md5=3D064f53ab40ea2b6a4bba1324149e4fde \
> "
> DEPENDS =3D "cmake-native"
>
> inherit  pypi setuptools3
> BBCLASSEXTEND =3D "native nativesdk"
>
> I'm not a bitbake or cmake expert, during do_compile() task i get the fo=
llowing error message
>
> | [ 95%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/shape_pre=
dictor.cpp.o
> | [ 96%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/correlati=
on_tracker.cpp.o
> | [ 96%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/face_reco=
gnition.cpp.o
> | [ 97%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/cnn_face_=
detector.cpp.o
> | [ 98%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/global_op=
timization.cpp.o
> | [ 98%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/image_dat=
aset_metadata.cpp.o
> | [ 99%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/numpy_ret=
urns.cpp.o
> | [100%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/line.cpp.=
o
> | [100%] Linking CXX shared module build_dunfell/tmp/work/aarch64-poky-l=
inux/python3-dlib/19.21.1-r0/build/lib.linux-x86_64-3.8/_dlib_pybind11.cpyt=
hon-38-aarch64-linux-gnu.so
> | build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/reci=
pe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-lin=
ux/gcc/aarch64-poky-linux/8.3.0/ld: build_dunfell/tmp/work/aarch64-poky-lin=
ux/python3-dlib/19.21.1-r0/recipe-sysroot-native/usr/lib/libsqlite3.so: err=
or adding symbols: file in wrong format
> | collect2: error: ld returned 1 exit status
> | CMakeFiles/_dlib_pybind11.dir/build.make:445: recipe for target 'build=
_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/build/lib.linu=
x-x86_64-3.8/_dlib_pybind11.cpython-38-aarch64-linux-gnu.so' failed
> | make[2]: *** [build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/1=
9.21.1-r0/build/lib.linux-x86_64-3.8/_dlib_pybind11.cpython-38-aarch64-linu=
x-gnu.so] Error 1
> | CMakeFiles/Makefile2:116: recipe for target 'CMakeFiles/_dlib_pybind11=
.dir/all' failed
> | make[1]: *** [CMakeFiles/_dlib_pybind11.dir/all] Error 2
> | Makefile:83: recipe for target 'all' failed
> | make: *** [all] Error 2
> | Traceback (most recent call last):
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/dlib-19.21.1/setup.py", line 223, in <module>
> |     setup(
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/site-packages/setuptools/__init=
__.py", line 144, in setup
> |     return distutils.core.setup(**attrs)
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/core.py", line 148, i=
n setup
> |     dist.run_commands()
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py", line 966, i=
n run_commands
> |     self.run_command(cmd)
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py", line 985, i=
n run_command
> |     cmd_obj.run()
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/command/build.py", li=
ne 135, in run
> |     self.run_command(cmd_name)
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/cmd.py", line 313, in=
 run_command
> |     self.distribution.run_command(command)
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py", line 985, i=
n run_command
> |     cmd_obj.run()
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/dlib-19.21.1/setup.py", line 135, in run
> |     self.build_extension(ext)
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/dlib-19.21.1/setup.py", line 175, in build_extension
> |     subprocess.check_call(cmake_build, cwd=3Dbuild_folder)
> |   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1=
-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py", line 364, in ch=
eck_call
> |     raise CalledProcessError(retcode, cmd)
> | subprocess.CalledProcessError: Command '['cmake', '--build', '.', '--c=
onfig', 'Release', '--', '-j8']' returned non-zero exit status 2.
> | WARNING: exit code 1 from a shell command.
> |
>
> Not sure why the linker gcc/aarch64-poky-linux/8.3.0/ld is showing the e=
rror
>
>  error adding symbols: file in wrong format
>
> Perhaps i'm messing things up with cmake-native environment but not sure=
 how i can enable cmake to be used by setup.py if it is not with DEPENDS=3D=
cmake-native.
>
> Any clue to solve this issue will be highly appreciated, or if you know =
who is already working on this it will be great to have its contact :)
>
> Also i use dunfell branch for meta-oe
>
> BR,
>
>
>=20
>
