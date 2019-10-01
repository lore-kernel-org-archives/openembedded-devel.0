Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 836E17D6A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 16:51:49 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id b136so49730317iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=37U3c4a/+tw02alA8ZbITnhcNe1KL9kViDsp1poiGyM=;
	b=bxriWR94imOt26FA/xSiVS5CZ/3kjRFS7OKtiFaogmKbLId9R7ris6ZBU2a38CsLXw
	jYDd2kfbvPqPwL4OGJdJDavjX56S9HBG8n6G34lFVubbJ+5bE1k4qHudPDk43mvz3pcp
	FArr8erdb1U+NZLEkZsYKL6kpLCMo06MOKPo0jCfRFs/+Tsh5+HIcCOXyZm8GPKkkWXU
	wXAgXNvPjJOJ+kkVxHuXgTpy80UxB+Y/IM+DBUdCHn0p//MjvLAjKA55RXSRD7YLekLs
	2guQDnuGx+OdWjN0/4JM3QyfcS206jjyXGxHLvPg+2U2q+uTHEmzyLkyu3jWhVa1kcP9
	wT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=37U3c4a/+tw02alA8ZbITnhcNe1KL9kViDsp1poiGyM=;
	b=GgThrrOIw5VAGSAwm8oYeOzyPDgw3GffBRpCcpchv602pF5lEmJQFbTFJLvw0GrU37
	1YDU5EoD8zXN1Yk44ZAhnfbFXlVEnIPegSiNvbmazdAH8OamfTM9qAEMg99QgmxtuEnT
	Nk/QyygceN9LrPM55g1DLEFwPwqIKsd9avQrJBNCd8DFeq6OjschG5pVtgcHuS/xDScp
	zTSPa/IZxGy+L+c9j4b4ySOzbpRU5Kyrt2cY6PWXAAQbBJ3RvhbTwYMPppjiLeT+8c/U
	+rz+QpgUrnVvEy8yZih0W80kud6J1ddo8pPPjvJ3eq1Gdi5GVx38YB4Zl933ybC/OZ3O
	hLuQ==
X-Gm-Message-State: APjAAAXrWRdHksjK7cb/rk3T4bHBpY2MybyoIz0pizMn4+cL7bdY0YGk
	3URTiQqV6LvBkYG0POwNsPRLaTYKunBNn3RTGXg=
X-Google-Smtp-Source: APXvYqzBKjBshREPP2vAmOAlXbm+GoHP6+YbrBoEe9QEYf0OT3oBnE/BolUTI7SWdjF49PK/tb3+VGCHXSivCCuezrU=
X-Received: by 2002:a02:3e91:: with SMTP id s139mr25282172jas.22.1569948710246;
	Tue, 01 Oct 2019 09:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190625115327.9314-1-richard.leitner@skidata.com>
	<20190625115327.9314-4-richard.leitner@skidata.com>
	<CAB2nKc8Y5x8gKnTaq2gyxo8ZnPtm6KG_Hz_y0rsJ4oZb+SQ-pQ@mail.gmail.com>
In-Reply-To: <CAB2nKc8Y5x8gKnTaq2gyxo8ZnPtm6KG_Hz_y0rsJ4oZb+SQ-pQ@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 1 Oct 2019 18:51:39 +0200
Message-ID: <CAB2nKc-hgtju5_gWEya_oGNbOQ_E=J_78Rg260t7Zogh=M0kxA@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Oct 2019 16:51:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 As openjdk8-fix-adlc-flags.patch adds:
+CXXFLAGS +=3D $(BUILD_CXXFLAGS)
+CFLAGS +=3D $(BUILD_CFLAGS)

I fixed my compilation problem with
BUILD_CFLAGS_append =3D " -Wno-error=3Dformat-overflow"

Le mar. 1 oct. 2019 =C3=A0 14:35, Vincent Prince <vincent.prince.fr@gmail.c=
om> a
=C3=A9crit :

> Hi Richard,
>
> I have following error while compiling icedtea7-native with gcc 8.3.0:
>
> | g++  -std=3Dgnu++98 -DLINUX -D_GNU_SOURCE -DAMD64
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/share/vm/prims
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/share/vm
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/cpu/x86/vm
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/os_cpu/linux_x86/vm
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/os/linux/vm
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/os/posix/vm
> -I/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/b=
uild/openjdk-boot/hotspot/src/share/vm/adlc
> -I../generated -DASSERT
> -isystem/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sy=
sroot-native/usr/include
> -O2 -pipe -DHEADLESS=3Dtrue -fno-tree-dse -Wno-error=3Dstringop-overflow
> -Wno-error=3Dreturn-type -Wno-error=3Ddeprecated-declarations
> -DTARGET_OS_FAMILY_linux -DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64
> -DTARGET_OS_ARCH_linux_x86 -DTARGET_OS_ARCH_MODEL_linux_x86_64
> -DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1  -fno-rtti -fno-exceptions
> -D_REENTRANT -fcheck-new -fvisibility=3Dhidden -m64 -pipe -g
> -DTARGET_OS_FAMILY_linux -DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64
> -DTARGET_OS_ARCH_linux_x86 -DTARGET_OS_ARCH_MODEL_linux_x86_64
> -DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1  -fno-rtti -fno-exceptions
> -D_REENTRANT -fcheck-new -fvisibility=3Dhidden -m64 -pipe -g -Werror -g -=
c -o
> ../generated/adfiles/output_h.o
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_h.cpp
> |
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:
> In member function =E2=80=98void ArchDesc::definePeephole(FILE*, Instruct=
Form*)=E2=80=99:
> |
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1239:34:
> error: =E2=80=98_idx=E2=80=99 directive writing 4 bytes into a region of =
size between 2 and
> 12 [-Werror=3Dformat-overflow=3D]
> |            sprintf(left_reg_index,",inst%d_idx%d", left_index,
> left_op_index);
> |                                   ^~~~~~~~~~~~~~~
> |
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1239:34:
> note: directive argument in the range [-2147483648, 9999]
> | In file included from /usr/include/stdio.h:862,
> |                  from
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/adlc.hpp:33,
> |                  from
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:27:
> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:33:34: note:
> =E2=80=98__builtin___sprintf_chk=E2=80=99 output between 12 and 32 bytes =
into a destination
> of size 18
> |    return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
> |           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |        __bos (__s), __fmt, __va_arg_pack ());
> |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1252:37:
> error: =E2=80=98_idx=E2=80=99 directive writing 4 bytes into a region of =
size between 2 and
> 12 [-Werror=3Dformat-overflow=3D]
> |              sprintf(right_reg_index,",inst%d_idx%d", right_index,
> right_op_index);
> |                                      ^~~~~~~~~~~~~~~
> |
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1252:37:
> note: directive argument in the range [-2147483648, 9999]
> | In file included from /usr/include/stdio.h:862,
> |                  from
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/adlc.hpp:33,
> |                  from
> /build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:27:
> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:33:34: note:
> =E2=80=98__builtin___sprintf_chk=E2=80=99 output between 12 and 32 bytes =
into a destination
> of size 18
> |    return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
> |           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |        __bos (__s), __fmt, __va_arg_pack ());
> |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Shall we add -Wno-error=3D format-overflow to CFLAGS as well?
>
> Best regards,
> Vincent
>
> Le mar. 25 juin 2019 =C3=A0 13:54, Richard Leitner <richard.leitner@skida=
ta.com>
> a =C3=A9crit :
>
>> As new compilers throw new errors/warnings disable them for
>> icedtea7-native as a quick workaround until we updated it to the latest
>> version.
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
>>  recipes-core/icedtea/icedtea7-native.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/recipes-core/icedtea/icedtea7-native.inc
>> b/recipes-core/icedtea/icedtea7-native.inc
>> index 69f5d25..70b935a 100644
>> --- a/recipes-core/icedtea/icedtea7-native.inc
>> +++ b/recipes-core/icedtea/icedtea7-native.inc
>> @@ -24,6 +24,9 @@ CFLAGS_append =3D " -fno-tree-dse"
>>  CXXFLAGS_append =3D " -fno-tree-dse"
>>  CXX_append =3D " -std=3Dgnu++98"
>>
>> +# WORKAROUND: ignore errors from new compilers
>> +CFLAGS_append =3D " -Wno-error=3Dstringop-overflow -Wno-error=3Dreturn-=
type"
>> +
>>  inherit native java autotools pkgconfig
>>  inherit openjdk-build-helper
>>
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

