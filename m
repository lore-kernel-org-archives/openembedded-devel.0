Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B08A6B073
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 12:35:54 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n26so18922729ioj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 05:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bb2fOvMdD/jKSW6PqdAsghzOzdagafyM0Q0DAwVR5I8=;
	b=ot1w8u694xOc0H77ReQrCEcHgR6qurbMfPyudjnzphR9KDlYKBOKYanWmzvkCLFtN8
	fBPZJ4e3MDs87dsY3IUnMDOzraSJBOGslG9XNnV/NGthV+77Z9vxEruZkFBW/afLv4fU
	KBFngipke/41KJNSZGqo5Ytr62B+r6EPJ+LqqDFl0fCZeZD8/gLajNddEal6zY0Yo81A
	dqH1ODhrI/xzq/I/LWPn7SLizJQ1l505XLqt7nBU7SRcP8eC8HuPhRi4htCsMcQqaRTy
	1Nl83/C6bf49hr3GlJM4bWHScd3Y2HnPAw259QRuiuGIZZuc2cbXEnCmMgU2Rm4kUAHs
	yNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bb2fOvMdD/jKSW6PqdAsghzOzdagafyM0Q0DAwVR5I8=;
	b=bXdhYa3vWCH+QCkIzZEcCciL/SksikjBTjyDW25TwoJPDwsZxSHQaCwyccHKkTrTc1
	+ksruNV+zdKChpl3eYkqj4r+wJifapE9BfhIA9GSD32PsLAr8aZFisW0ukwYkLAjz5bf
	oKV1snd/BN9/I+x3fYuINwvKllq4UFAaEJTDjvOobQSY+Cp5gsgAXZ0glKKMefM/36/B
	ZJwnbJilkGiNlZNPSzawliVRek5PXAC8WxzpQ0WTPssgBDE9t4CcRPAWOcHLLeHKV/JZ
	fMuAVkmfdDFY7o78HnJTFKqPLdwg+ULbE7mQuKshRueASMeNefUqI5tTgqee0u3fMSfG
	FbWg==
X-Gm-Message-State: APjAAAW6qrskevWAvE14tDvwojTwsYkSQSsJ+cm/ntPi2Lm64ehzI6ut
	OcVa3JUY6LC4S7ROM/cTS9bJhWFhzvvVrlw2Cbs=
X-Google-Smtp-Source: APXvYqyBneJeMwvjVmJ1CZe2t2VWkRjcrYbtcq/aBJ0xKMASgnbUMa7pCswHVGjWcCYgAnT+8oAEHX/JyFuRTicVhLg=
X-Received: by 2002:a92:4915:: with SMTP id w21mr25792973ila.121.1569933354910;
	Tue, 01 Oct 2019 05:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190625115327.9314-1-richard.leitner@skidata.com>
	<20190625115327.9314-4-richard.leitner@skidata.com>
In-Reply-To: <20190625115327.9314-4-richard.leitner@skidata.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 1 Oct 2019 14:35:42 +0200
Message-ID: <CAB2nKc8Y5x8gKnTaq2gyxo8ZnPtm6KG_Hz_y0rsJ4oZb+SQ-pQ@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 3/4] icedtea7-native: disable new compiler warnings
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
X-List-Received-Date: Tue, 01 Oct 2019 12:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I have following error while compiling icedtea7-native with gcc 8.3.0:

| g++  -std=3Dgnu++98 -DLINUX -D_GNU_SOURCE -DAMD64
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/prims
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/cpu/x86/vm
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/os_cpu/linux_x86/vm
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/os/linux/vm
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/os/posix/vm
-I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc
-I../generated -DASSERT
-isystem/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysr=
oot-native/usr/include
-O2 -pipe -DHEADLESS=3Dtrue -fno-tree-dse -Wno-error=3Dstringop-overflow
-Wno-error=3Dreturn-type -Wno-error=3Ddeprecated-declarations
-DTARGET_OS_FAMILY_linux -DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64
-DTARGET_OS_ARCH_linux_x86 -DTARGET_OS_ARCH_MODEL_linux_x86_64
-DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1  -fno-rtti -fno-exceptions
-D_REENTRANT -fcheck-new -fvisibility=3Dhidden -m64 -pipe -g
-DTARGET_OS_FAMILY_linux -DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64
-DTARGET_OS_ARCH_linux_x86 -DTARGET_OS_ARCH_MODEL_linux_x86_64
-DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1  -fno-rtti -fno-exceptions
-D_REENTRANT -fcheck-new -fvisibility=3Dhidden -m64 -pipe -g -Werror -g -c =
-o
../generated/adfiles/output_h.o
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_h.cpp
|
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:
In member function =E2=80=98void ArchDesc::definePeephole(FILE*, InstructFo=
rm*)=E2=80=99:
|
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1239:34:
error: =E2=80=98_idx=E2=80=99 directive writing 4 bytes into a region of si=
ze between 2 and
12 [-Werror=3Dformat-overflow=3D]
|            sprintf(left_reg_index,",inst%d_idx%d", left_index,
left_op_index);
|                                   ^~~~~~~~~~~~~~~
|
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1239:34:
note: directive argument in the range [-2147483648, 9999]
| In file included from /usr/include/stdio.h:862,
|                  from
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/adlc.hpp:33,
|                  from
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:27:
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:33:34: note:
=E2=80=98__builtin___sprintf_chk=E2=80=99 output between 12 and 32 bytes in=
to a destination
of size 18
|    return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|        __bos (__s), __fmt, __va_arg_pack ());
|        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1252:37:
error: =E2=80=98_idx=E2=80=99 directive writing 4 bytes into a region of si=
ze between 2 and
12 [-Werror=3Dformat-overflow=3D]
|              sprintf(right_reg_index,",inst%d_idx%d", right_index,
right_op_index);
|                                      ^~~~~~~~~~~~~~~
|
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1252:37:
note: directive argument in the range [-2147483648, 9999]
| In file included from /usr/include/stdio.h:862,
|                  from
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/adlc.hpp:33,
|                  from
/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build=
/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:27:
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:33:34: note:
=E2=80=98__builtin___sprintf_chk=E2=80=99 output between 12 and 32 bytes in=
to a destination
of size 18
|    return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|        __bos (__s), __fmt, __va_arg_pack ());
|        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Shall we add -Wno-error=3D format-overflow to CFLAGS as well?

Best regards,
Vincent

Le mar. 25 juin 2019 =C3=A0 13:54, Richard Leitner <richard.leitner@skidata=
.com>
a =C3=A9crit :

> As new compilers throw new errors/warnings disable them for
> icedtea7-native as a quick workaround until we updated it to the latest
> version.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc
> b/recipes-core/icedtea/icedtea7-native.inc
> index 69f5d25..70b935a 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -24,6 +24,9 @@ CFLAGS_append =3D " -fno-tree-dse"
>  CXXFLAGS_append =3D " -fno-tree-dse"
>  CXX_append =3D " -std=3Dgnu++98"
>
> +# WORKAROUND: ignore errors from new compilers
> +CFLAGS_append =3D " -Wno-error=3Dstringop-overflow -Wno-error=3Dreturn-t=
ype"
> +
>  inherit native java autotools pkgconfig
>  inherit openjdk-build-helper
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

