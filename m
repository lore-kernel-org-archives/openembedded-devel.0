Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 797A67F65E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 11:08:38 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id b136so22169174iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1WqimjsdzOYcVj3Wp9pOA0ioPWrx8AOHXXq2XaAikdU=;
	b=YKnQ1Z2LS16HnihBAwBKcgGUoh4LRIpNRfm8FM8YrjtE9DWl9Ykwv5eAfVATNBiRuI
	t6YZlozu0MeUIVEQUsiQlwJwTBCu0/5lprtVPpXLjgYA1A3buTP+LhkJz07oSX/mvb+S
	3xj38dSGhLARLY8oy/t28F2BVB0mzFTuoJHsH194iLG3MH4rOt6c3tKfbMTjq6dG5sIi
	SvkubXuBSOzXA/IWFonKZj+edlJhrkCS9dhWns/gCZaXXFRWs/JS2VO/OVO6ry6ZLc7W
	mg9lYWgHJxrhiLEf4DzXSRg8qqctfiAi1tz/0vOMPdYl0ffeU/NgxTUYGkppIRpJkIsz
	YmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1WqimjsdzOYcVj3Wp9pOA0ioPWrx8AOHXXq2XaAikdU=;
	b=H8VKHE7ERAyBA5kr+ljvLG3+I/E9PQuZ0tUn0EisxZ+izxc6qCP5eLpvopZZImvuYN
	8o5GtGikIUVkWDyZugodXsq0r2Y7RzLzgNLtxlVHFkjKOkrE8yUeBdIftve+oQaol+vZ
	5qq1/F5y4lR26JsxF08zomTUI9vfm9S2QTLdm03U5g6ZrtXoew+AFwbkm+rsrb8xE3Qb
	qmNGm2PoesmmgKCJt/GougyYd2R9RPd+URgpEz9ColT0sMjmT3OaxgvAO9AM03UZm0Ok
	Xp8qjV5VP436at/22ipwjudkZCjy/msL8Wav6UNCKDfyWsnvPfwS5PYh0mPAiNFGTYHf
	JyeA==
X-Gm-Message-State: APjAAAXKMRypm/9WzvfHrX6LRQ4AZH/6e3xdcLVJTM3kEcKvSy9PSi6N
	tLv5Ny6gwH2IxMrOERHKk8ZYiZ8h44BoX8Mkl2Y=
X-Google-Smtp-Source: APXvYqxJlEcgjP2Zd45V4nol5Omfa7UNcbVujwR+l4qWWwRUu6vKz9nMPQ89m1jXPbbhD7E6wYvy++teydZNSt7zp2A=
X-Received: by 2002:a6b:4a19:: with SMTP id w25mr16500291iob.115.1569064119291;
	Sat, 21 Sep 2019 04:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190919181618.102575-1-alex.kiernan@gmail.com>
	<CAO5Uq5RMEv4OzV_dXGo4frqm==mBobLvsCo4G9rfbv+_Fm77TA@mail.gmail.com>
	<CAMKF1somsr7R6oghQq01+P18Pmmwt=pUZyNuF=aKUqNQRQ4nPQ@mail.gmail.com>
In-Reply-To: <CAMKF1somsr7R6oghQq01+P18Pmmwt=pUZyNuF=aKUqNQRQ4nPQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 21 Sep 2019 12:08:28 +0100
Message-ID: <CAO5Uq5Rq2XwPxbo9ge7Zsdz1nb4vAkh=hG7K311NVGhRfOqGiA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ostree: Add recipe
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
X-List-Received-Date: Sat, 21 Sep 2019 11:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 8:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Also fails on all builders
>
> https://errors.yoctoproject.org/Errors/Details/271527/
>

Huh... I could've sworn I tested all PACAKGECONFIGs, clearly I didn't
do gobject-introspection.

| x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2=
019.3-r0/recipe-sysroot
-std=3Dgnu99 -fno-strict-aliasing -pipe -Wall -Werror=3Dempty-body
-Werror=3Dstrict-prototypes -Werror=3Dmissing-prototypes
-Werror=3Dimplicit-function-declaration -Werror=3Dformat=3D2
-Werror=3Dformat-security -Werror=3Dformat-nonliteral
-Werror=3Dpointer-arith -Werror=3Dinit-self -Werror=3Dmissing-declarations
-Werror=3Dreturn-type -Werror=3Dswitch -Werror=3Doverflow
-Werror=3Dint-conversion -Werror=3Dparentheses -Werror=3Dundef
-Werror=3Dincompatible-pointer-types -Werror=3Dmisleading-indentation
-Werror=3Dmissing-include-dirs -Werror=3Daggregate-return
-Wstrict-aliasing=3D2 -Werror=3Dunused-result -I../git/src/libotutil
-I../git/src/libostree -I./src/libostree -I../git/src/ostree
-I../git/libglnx -pthread
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/gio-unix-2.0
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/libmount
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/blkid
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/glib-2.0
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/lib/glib-2.0/include
-DPKGLIBEXECDIR=3D\"/usr/libexec/libostree\" -pthread
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/gio-unix-2.0
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/libmount
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/blkid
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/include/glib-2.0
-I/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/r=
ecipe-sysroot/usr/lib/glib-2.0/include
-I../git/libglnx -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/akiernan/poky/build/tmp/work/core2-64-poky-linux=
/ostree/2019.3-r0=3D/usr/src/debug/ostree/2019.3-r0
-fdebug-prefix-map=3D/home/akiernan/poky/build/tmp/work/core2-64-poky-linux=
/ostree/2019.3-r0=3D/usr/src/debug/ostree/2019.3-r0
-fdebug-prefix-map=3D/home/akiernan/poky/build/tmp/work/core2-64-poky-linux=
/ostree/2019.3-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/akiernan/poky/build/tmp/work/core2-64-poky-linux=
/ostree/2019.3-r0/recipe-sysroot-native=3D
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong
-Wl,-z -Wl,relro -Wl,-z -Wl,now -o tests/.libs/test-rollsum-cli
src/libostree/tests_test_rollsum_cli-ostree-rollsum.o
tests/test_rollsum_cli-test-rollsum-cli.o  ./.libs/libbupsplit.a
./.libs/libglnx.a ./.libs/libotutil.a ./.libs/libostree-1.so
./.libs/libostreetest.a
/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/ostree/2019.3-r0/bui=
ld/.libs/libostree-1.so
-lgpgme -lpthread -lassuan -lgpg-error -llzma -lsoup-2.4 -lgio-2.0
-lgobject-2.0 -lglib-2.0 -lz -pthread
...
| gcc: error: unrecognized command line option
=E2=80=98-fmacro-prefix-map=3D/home/akiernan/poky/build/tmp/work/core2-64-p=
oky-linux/ostree/2019.3-r0=3D/usr/src/debug/ostree/2019.3-r0=E2=80=99

That feels like a really strange failure, any insight gratefully accepted!

--=20
Alex Kiernan

