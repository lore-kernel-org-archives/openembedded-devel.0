Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD967FF20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 09:41:45 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id k5so14634701iol.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Y85axUF615rGgI3hEfD+DzHq9K6nKMCCy5fdTzR/3ak=;
	b=OsLbnzbIdgYlu59P1sDg0/q52GlqYNHo/3nOn825RfYwi2nzpXy6Rb+Sh31RIvaQOs
	VOzJLfVfJ7ybT3uHC2yQbh5q+b0FCfvgTN1QQ/Dfp6nqMlNQofVwREqbP3OjP4eZB+a9
	8MapMNlU9A5O757r3ZjD6VdJmbq7w857nIF48X4zVusPdIZNVG3RGshbx4xFxxX33GOF
	SKbmSyOY0lpKizg90lKLP2IrRRWHg7Z9NfwlQiipXxH+TOiCShsW4E0FooYvgEhlA+oD
	9F+CnOJwdCtz3w31qM7bRreNkNBYZM52ekmO21EOzWzwJ0m4njPK4GmKivUTecjQhvZa
	03Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Y85axUF615rGgI3hEfD+DzHq9K6nKMCCy5fdTzR/3ak=;
	b=QcSHo95yFR1uoLx+Hup6KMkeECqyk4dRU77Im1NV0MLRLNrB2FXsmdsKsVTAGC2slz
	Xaz9Vhg+Wb5vg2w+h+GpriOpaCiA0xW1VvNHxw4n/q3W703iCC4iKw31ofeXTt7kp982
	Ux2f0ikNOYou2sWGE6FwiUcV5SQG+2fpU2HnCKrWKRzF/qHolKst4p7eeaje4Ks5PjX8
	Xv0NkNQw1MSzClYT7jCJzVR50+ZKDqc+p4B8pbgi84fDAumbZKLDDO1MwrifsuFS+cM1
	s6E9EZYRYD8aRR0PtYJX/3meYWt1sgml9caB81wfyNqsZQzKE21BdNldTDbiRpT1gMIA
	lfug==
X-Gm-Message-State: APjAAAUifNwab39URr9UOI+MWUGnAx1eN2VIdrF2p1ZgHPvNDcEklnN1
	KsGOqdGzms4bjZKRUIStqfJygcDk/MWLrq2dY9k=
X-Google-Smtp-Source: APXvYqx8G3y1/0rJ3bTrv/9/kuggd+eCDkJ0kyKa08aBy3EdwwRZDhBS83wnmJ0sGVeqS5ea4TiWeMPrvgQVmM7uZ0c=
X-Received: by 2002:a6b:ee12:: with SMTP id i18mr4460688ioh.102.1568799706311; 
	Wed, 18 Sep 2019 02:41:46 -0700 (PDT)
MIME-Version: 1.0
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 18 Sep 2019 11:41:35 +0200
Message-ID: <CAB2nKc9YYhnO0YVn2Err6BtSQdP3fT_uz7xSS-W6VxEHX3dsiA@mail.gmail.com>
To: richard.leitner@skidata.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] openjre-8 fmacro-prefix-map problem
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
X-List-Received-Date: Wed, 18 Sep 2019 09:41:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to build my image on Yocto master branch, and it fails to
compile openjre-8 (It works fine on Warrior).

Here's the error message:

openjre-8-172b11-r0 do_compile: oe_runmake failed:

g++ -DLINUX -D_GNU_SOURCE -DAMD64
-I/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/jdk8u-33d=
274a7dda0/hotspot/src/share/vm/prims
-I[skip...] -DASSERT -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/=
172b11-r0=3D/usr/src/debug/openjre-8/172b11-r0

-fdebug-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/=
172b11-r0=3D/usr/src/debug/openjre-8/172b11-r0

-fdebug-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/=
172b11-r0/recipe-sysroot=3D

-fdebug-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/=
172b11-r0/recipe-sysroot-native=3D

-Wno-error=3Ddeprecated-declarations -DTARGET_OS_FAMILY_linux
-DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64 -DTARGET_OS_ARCH_linux_x86
-DTARGET_OS_ARCH_MODEL_linux_x86_64
-DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1 -DDONT_USE_PRECOMPILED_HEADER
-fno-rtti -fno-exceptions -D_REENTRANT -fcheck-new -fvisibility=3Dhidden
-pipe -fno-strict-aliasing -g -fno-omit-frame-pointer
-DTARGET_OS_FAMILY_linux -DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64
-DTARGET_OS_ARCH_linux_x86 -DTARGET_OS_ARCH_MODEL_linux_x86_64
-DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1 -DDONT_USE_PRECOMPILED_HEADER
-fno-rtti -fno-exceptions -D_REENTRANT
-fcheck-new -fvisibility=3Dhidden -pipe -fno-strict-aliasing -g
-fno-omit-frame-pointer
-isystem/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/rec=
ipe-sysroot-native/usr/include
-O2 -pipe -Wno-error=3Ddeprecated-declarations -Werror
-c -o ../generated/adfiles/adlparse.o
/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/jdk8u-33d27=
4a7dda0/hotspot/src/share/vm/adlc/adlparse.cpp

g++: error: unrecognized command line option
=E2=80=98-fmacro-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/o=
penjre-8/172b11-r0=3D/usr/src/debug/openjre-8/172b11-r0=E2=80=99

/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/jdk8u-33d27=
4a7dda0/hotspot/make/linux/makefiles/adlc.make:222:
recipe for target '../generated/adfiles/adlparse.o' failed

It seems Yocto master introduces new -fmacro-prefix-map compile flag that
g++ does not recognize?
Does it means I need to upgrade my gcc (5.4.0) version on build machine?
(Ubuntu 16.04).
If so, why it does not use -native package?

Best regards,
Vincent

