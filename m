Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E64F94CA4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 18:06:12 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42330.1776794768586078304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 11:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iSex7/pn;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba699316b42so455647866b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 11:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776794767; cv=none;
        d=google.com; s=arc-20240605;
        b=jx6Ixb+UW+AjzGPCYKL+r85MQdU/CCkE1Frz9uJvZMQx4kCq+tqfAZIxoANQaT2EaI
         4lJtIw1qPgIgpA09AGD7OtdIqZTEoCKZL/FEJmlSQ2ambGFbVhdUEJ9rAEIpeQD2Jfmb
         Y7+o3nnBwb8z/vsj8xC09xHGCp5RFgUjWE30GHwIsbyxInGO9JxmD6Ul7AGeudPsXlfr
         F3Yfm/n7kJeKAuGaIjzpT/efUxh/Qw+peob+ve1XtYB8w2V0+S4SFIpozeWJ0X82pejg
         tXpkg1tgYcZGLevujHJt0ldDhAT8vAF1gMghmRxC/s4vU8ra05dUIhUycm8MAFJjXLqs
         W4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JJ0wZpI4veYTJQst9VUcQNPajyxzV3hMsDsml0NLCwk=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=ZSAPyN008zhiP5GmBVRGidTRmQmPOvZ95gUgGKSFFCOuH+gCDhzFcdawl1+IPUWg78
         bvOo1+LkRMF7+YN/8SZBRog2HHN+ZERg9GVg8CvLCAIloc5RjWxMsecWOLbxGF1AqED8
         267208PSDs0HnhSTuqn0Gj7bp8dfiBhP0gSFrL6sJyoqWM/UHsFwLFlj+ME+8QY8chPu
         4t/1eCQEHm6qMvgUARwUv/f9DgSkM8dscCsggtf2h3P8DSbD65MP3nhUjuJpFAKoE1Kp
         6dwUrE0Jbyem952GmR3WbT6TyEV/nIHVnQHjAx/klFNrPK1dTVMRH4FST647nmV9z8+r
         JImA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776794767; x=1777399567; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JJ0wZpI4veYTJQst9VUcQNPajyxzV3hMsDsml0NLCwk=;
        b=iSex7/pn+J5x/NkMLY2XutqxnGAkG6b3WSDTrtPJubWwRnRHCQTOo0QETofDE47bzj
         llZtR7VR47X1QY4hIT3TSy3wFnikJJA1AY+f7FktjBoAJobbyi6+7Jg491tuN87gVAF4
         GFBNyzda7ygszf+n3Atu1qfGl2DWHgnNOqZCAwIcyKe8GRYubBEXqJyJm7rXpRapkCLx
         zUxKI/4ExthxUQrdjnUygQEfCc5dE3ByN1kI4GeYTzRlL9xQkj3YGF2x4MW44tzvYgcx
         66fvBYIvkRK7UncZsJcKxcedUU/hB19Iqb5/8SM+kcgsqkX61Dmn6hmxoHWlDjoxfKaB
         9XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776794767; x=1777399567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJ0wZpI4veYTJQst9VUcQNPajyxzV3hMsDsml0NLCwk=;
        b=PIjyaB5Z8ownc/KQT5b2uANf5pJ2G5Ej3UkGZ8Uy8XZp7C4aQFQi0o44O4LokAcUrt
         PbeuHG+0W/TinOi0tbIzzxrLzvylHlqE17ft6N36/voQ1E9bMJ3LmSUT42sfyG/EL8iF
         NEVmRTeX5EF8tEOnAYF+lxjDWzkCHIpXXzROy5TB/PhCfGVWCcbBZpCfNBegDipuZxeI
         CpHFSSPaYpndFyGD+4QLcKU2IA0/Mswb4s8E7IWvUCC81eNAk63gE9MxjiQRUIfiP/7s
         sbH+gWyaeeCqdtJDK5UfwTt10xSvU+fzA2/GG0LZM5q2/XTp17OBq1nyhFCVBfdbKndX
         oyiA==
X-Gm-Message-State: AOJu0Yx780cdQJCtjrd6Xe8r8Qm3KvgrGZ+yoa6SfEcvzvsLpipCaGQU
	X+ww9JhHMTp9IONs+T+fGTPHjerNwHDBbWDrn25XsF2fe+MAEgR/z4oVY+wLDzBh2i+lF8eqVGu
	7AOUcXBrZ3ywM5rWFhd46lcI+PPgemUk=
X-Gm-Gg: AeBDievzC3MAfNYXF6FFtNiziYDvE3WvDQIB2rCk/ZxpA5OJILWtv9JVm7dT2qdRXl3
	cafm/KP+YJ672OZC6inT58Xbze56yWAJF0VLV+njLEFr3SXl5TExbrFAsDiudL3QjJpL5OF6Znx
	5sT8zl8ZTFd50tUhJjiCWvHAw8mBGtgdTuf/cNt6y50Inh21ViOdf5L9Ooqx5MBfxpANDAm8CEF
	+BeiLsh4UhCl6q1rkqf8EHVH88yHU6Pkidm2XTnRqN8ONOpBClsJ4MppDzUH5jljLe8l1lzUQTS
	YVhdBMccknUalFTZRNx0jgDdFex0xpMkj2Dmt/sFJ6HM3lFbpoeRbchAwNQvNt2abOf8Ga88eF0
	ywCSF
X-Received: by 2002:a17:907:96a1:b0:ba7:fbfb:4caf with SMTP id
 a640c23a62f3a-ba7fbfb4d91mr480463566b.43.1776794766572; Tue, 21 Apr 2026
 11:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260421155925.1430423-1-quaresma.jose@gmail.com> <CAMKF1sq0mVFjWV5+7PiQpbh2Gsu0JFd-Q6sO2Y_2d1ZDD727=A@mail.gmail.com>
In-Reply-To: <CAMKF1sq0mVFjWV5+7PiQpbh2Gsu0JFd-Q6sO2Y_2d1ZDD727=A@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Apr 2026 19:05:55 +0100
X-Gm-Features: AQROBzCwDk4UMtO1HgOjHHOGX1XaNvN6wfVwPGCNUxqwFXLrXAqaNQcReRIcrbY
Message-ID: <CANPvuRnTDx9ey66UJJzd1LTD-QppAz7CZNKHrSa-eUih01igyg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: re-implement the vala detection
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e683ce064ffc44eb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 18:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126538

--000000000000e683ce064ffc44eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu (ter=C3=A7a, 21/04/2026 =C3=A0(s) 18=
:40):

> This ends in trouble with valac
>

It builds on my side but I haven't tried it with nodistro/poky.
I'll check again tomorrow.

Jose


>
> | Compiler for C supports link arguments -Wl,--gc-sections: YES
> | Compiler for C supports arguments -Wcast-align=3Dstrict: NO
> | Compiler for C supports arguments -Wdeclaration-after-statement: YES
> | Compiler for C supports arguments -Wfloat-equal: YES
> | Compiler for C supports arguments -Wformat-nonliteral: YES
> | Compiler for C supports arguments -Wformat-security: YES
> | Compiler for C supports arguments -Wimplicit-function-declaration: YES
> | Compiler for C supports arguments -Wimplicit-int: YES
> | Compiler for C supports arguments -Winit-self: YES
> | Compiler for C supports arguments -Wint-conversion: YES
> | Compiler for C supports arguments -Wlogical-op: NO
> | Compiler for C supports arguments -Wmissing-declarations: YES
> | Compiler for C supports arguments -Wmissing-include-dirs: YES
> | Compiler for C supports arguments -Wmissing-prototypes: YES
> | Compiler for C supports arguments -Wold-style-definition: YES
> | Compiler for C supports arguments -Wparentheses-equality: YES
> | Compiler for C supports arguments -Wpointer-arith: YES
> | Compiler for C supports arguments -Wshadow: YES
> | Compiler for C supports arguments -Wshift-negative-value: YES
> | Compiler for C supports arguments -Wstrict-prototypes: YES
> | Compiler for C supports arguments -Wtypedef-redefinition: YES
> | Compiler for C supports arguments -Wundef: YES
> | Compiler for C supports arguments -Wunknown-attributes: YES
> | Compiler for C supports arguments -Wvla: YES
> | Compiler for C supports arguments -Wno-duplicate-decl-specifier: YES
> | Compiler for C supports arguments -Wno-format-truncation: YES
> | Compiler for C supports arguments -Wno-format-y2k: YES
> | Compiler for C supports arguments
> -Wno-gnu-variable-sized-type-not-at-end: YES
> | Compiler for C supports arguments -Wno-missing-field-initializers: YES
> | Compiler for C supports arguments -Wno-pragmas: YES
> | Compiler for C supports arguments -Wno-sign-compare: YES
> | Compiler for C supports arguments
> -Wno-tautological-constant-out-of-range-compare: YES
> | Compiler for C supports arguments -Wno-unknown-pragmas: YES
> | Compiler for C supports arguments -Wno-unused-parameter: YES
> | Compiler for C supports arguments -fno-strict-aliasing: YES
> | Compiler for C supports arguments -Wimplicit-fallthrough: YES
> | Checking if "-Werror=3Dimplicit-fallthrough" compiles: NO
> | Found pkg-config: YES
> (/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/=
recipe-sysroot-native/usr/bin/pkg-config)
> 2.5.1
> | Run-time dependency uuid found: YES 2.41.3
> | Found CMake: NO
> | Run-time dependency libelogind found: NO (tried pkgconfig and cmake)
> | Run-time dependency libudev found: YES 259
> | Run-time dependency dbus-1 found: YES 1.16.2
> | Run-time dependency libndp found: YES 1.9
> | Run-time dependency jansson found: NO (tried pkgconfig and cmake)
> | Run-time dependency libsystemd found: YES 259
> | Run-time dependency libsystemd-login found: NO (tried pkgconfig and
> cmake)
> | Run-time dependency systemd found: YES 259
> | Run-time dependency gio-unix-2.0 found: YES 2.88.0
> | Run-time dependency gmodule-2.0 found: YES 2.88.0
> | Library dl found: YES
> | Run-time dependency gobject-introspection-1.0 found: YES 1.86.0
> | Run-time dependency nss found: YES 3.122
> | Run-time dependency gnutls found: NO (tried pkgconfig and cmake)
> | Run-time dependency bluez found: YES 5.86
> | Program netconfig /usr/netconfig /usr/sbin/netconfig
> /usr/local/sbin/netconfig found: NO
> | Program /sbin/ip6tables found: YES (/sbin/ip6tables)
> | Program modprobe /sbin/modprobe /usr/sbin/modprobe found: NO
> | Run-time dependency libcurl found: YES 8.19.0
> | Run-time dependency libedit found: YES 3.1
> | ../sources/networkmanager-1.56.0/meson.build:883: WARNING: add_language=
s
> is missing native:, assuming languages are wanted for both host and build=
.
> | Compiler for language vala for the host machine not found.
> | Compiler for language vala for the build machine not found.
> |
> | ../sources/networkmanager-1.56.0/meson.build:884:4: ERROR: Assert
> failed: vala is required to build. Use -Dvapi=3Dfalse to disable it
> |
> | A full log can be found at
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/b=
uild/meson-logs/meson-log.txt
> |
> | Last 10 lines of meson-log.txt:
> | Command line: `aarch64-yoe-linux-clang -mcpu=3Dcortex-a72+crc+nocrypto
> --dyld-prefix=3D/usr -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2
> -Wformat -Wformat-security -Werror=3Dformat-security
> --sysroot=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmana=
ger/1.56.0/recipe-sysroot
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/b=
uild/meson-private/tmphbe49qc1/testfile.c
> -o
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/b=
uild/meson-private/tmphbe49qc1/output.obj
> -c -O2 -g
> -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/net=
workmanager/1.56.0/sources/networkmanager-1.56.0=3D/usr/src/debug/networkma=
nager/1.56.0
> -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/net=
workmanager/1.56.0/build=3D/usr/src/debug/networkmanager/1.56.0
> -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/net=
workmanager/1.56.0/recipe-sysroot=3D
> -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/net=
workmanager/1.56.0/recipe-sysroot-native=3D
> -pipe -D_FILE_OFFSET_BITS=3D64 -O0 -Werror=3Dimplicit-function-declaratio=
n
> -Werror=3Dunknown-warning-option -Werror=3Dunused-command-line-argument
> -Werror=3Dignored-optimization-argument -std=3Dgnu11` -> 0
> | ../sources/networkmanager-1.56.0/meson.build:883: WARNING: add_language=
s
> is missing native:, assuming languages are wanted for both host and build=
.
> | -----------
> | Detecting compiler via: `valac --version` -> [Errno 2] No such file or
> directory: 'valac'
> | Compiler for language vala for the host machine not found.
> | -----------
> | Detecting compiler via: `valac --version` -> [Errno 2] No such file or
> directory: 'valac'
> | Compiler for language vala for the build machine not found.
> |
> | ../sources/networkmanager-1.56.0/meson.build:884:4: ERROR: Assert
> failed: vala is required to build. Use -Dvapi=3Dfalse to disable it
> |
> | ERROR: meson setup failed
> | WARNING:
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/t=
emp/run.do_configure.1181:174
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |       #1: bbfatal_log,
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/t=
emp/run.do_configure.1181,
> line 174
> |       #2: meson_do_configure,
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/t=
emp/run.do_configure.1181,
> line 163
> |       #3: do_configure,
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/t=
emp/run.do_configure.1181,
> line 150
> |       #4: main,
> /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/t=
emp/run.do_configure.1181,
> line 187
> NOTE: recipe networkmanager-1.56.0-r0: task do_configure: Failed
> ERROR: Task
> (/mnt/b/yoe/mut/sources/meta-openembedded/meta-networking/recipes-connect=
ivity/networkmanager/networkmanager_1.56.0.bb:do_configure)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 6551 tasks of which 6548 didn't need to be
> rerun and 1 failed.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 7 seconds
> NOTE: Build completion summary:
> NOTE:   do_create_recipe_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
>
> Summary: 1 task failed:
>
> /mnt/b/yoe/mut/sources/meta-openembedded/meta-networking/recipes-connecti=
vity/networkmanager/networkmanager_1.56.0.bb:
> do_configure
>
> On Tue, Apr 21, 2026 at 8:59=E2=80=AFAM Jose Quaresma via lists.openembed=
ded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
>> The introduction of DISTRO_FEATURES_OPTED_OUT allows rewriting the
>> DISTRO_FEATURES by removing whatever is in DISTRO_FEATURES_OPTED_OUT
>> from DISTRO_FEATURES.
>>
>> Thus, the logic of vala can be negated, and it can changed be to
>> see if gobject-introspection-data is available in DISTRO_FEATURES.
>>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>  .../networkmanager/networkmanager_1.56.0.bb                     | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/networkmanager/
>> networkmanager_1.56.0.bb
>> b/meta-networking/recipes-connectivity/networkmanager/
>> networkmanager_1.56.0.bb
>> index 2cc0b76676..138d7118eb 100644
>> --- a/meta-networking/recipes-connectivity/networkmanager/
>> networkmanager_1.56.0.bb
>> +++ b/meta-networking/recipes-connectivity/networkmanager/
>> networkmanager_1.56.0.bb
>> @@ -76,7 +76,7 @@ PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmc=
li \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '',
>> d)} \
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit',
>> '', d)} \
>> -    ${@bb.utils.contains('DISTRO_FEATURES_OPTED_OUT',
>> 'gobject-introspection-data', '', 'vala', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES',
>> 'gobject-introspection-data', 'vala', '', d)} \
>>  "
>>
>>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
>> --
>> 2.53.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126536):
>> https://lists.openembedded.org/g/openembedded-devel/message/126536
>> Mute This Topic: https://lists.openembedded.org/mt/118939974/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e683ce064ffc44eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; escreveu (te=
r=C3=A7a, 21/04/2026 =C3=A0(s) 18:40):<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">This ends in trouble with valac</di=
v></blockquote><div><br></div><div>It builds on my side=C2=A0but I haven&#3=
9;t tried it with nodistro/poky.<br>I&#39;ll check again tomorrow.<br><br>J=
ose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div><br></div><div>| Compiler for C supports link argume=
nts -Wl,--gc-sections: YES<br>| Compiler for C supports arguments -Wcast-al=
ign=3Dstrict: NO<br>| Compiler for C supports arguments -Wdeclaration-after=
-statement: YES<br>| Compiler for C supports arguments -Wfloat-equal: YES<b=
r>| Compiler for C supports arguments -Wformat-nonliteral: YES<br>| Compile=
r for C supports arguments -Wformat-security: YES<br>| Compiler for C suppo=
rts arguments -Wimplicit-function-declaration: YES<br>| Compiler for C supp=
orts arguments -Wimplicit-int: YES<br>| Compiler for C supports arguments -=
Winit-self: YES<br>| Compiler for C supports arguments -Wint-conversion: YE=
S<br>| Compiler for C supports arguments -Wlogical-op: NO<br>| Compiler for=
 C supports arguments -Wmissing-declarations: YES<br>| Compiler for C suppo=
rts arguments -Wmissing-include-dirs: YES<br>| Compiler for C supports argu=
ments -Wmissing-prototypes: YES<br>| Compiler for C supports arguments -Wol=
d-style-definition: YES<br>| Compiler for C supports arguments -Wparenthese=
s-equality: YES<br>| Compiler for C supports arguments -Wpointer-arith: YES=
<br>| Compiler for C supports arguments -Wshadow: YES<br>| Compiler for C s=
upports arguments -Wshift-negative-value: YES<br>| Compiler for C supports =
arguments -Wstrict-prototypes: YES<br>| Compiler for C supports arguments -=
Wtypedef-redefinition: YES<br>| Compiler for C supports arguments -Wundef: =
YES<br>| Compiler for C supports arguments -Wunknown-attributes: YES<br>| C=
ompiler for C supports arguments -Wvla: YES<br>| Compiler for C supports ar=
guments -Wno-duplicate-decl-specifier: YES<br>| Compiler for C supports arg=
uments -Wno-format-truncation: YES<br>| Compiler for C supports arguments -=
Wno-format-y2k: YES<br>| Compiler for C supports arguments -Wno-gnu-variabl=
e-sized-type-not-at-end: YES<br>| Compiler for C supports arguments -Wno-mi=
ssing-field-initializers: YES<br>| Compiler for C supports arguments -Wno-p=
ragmas: YES<br>| Compiler for C supports arguments -Wno-sign-compare: YES<b=
r>| Compiler for C supports arguments -Wno-tautological-constant-out-of-ran=
ge-compare: YES<br>| Compiler for C supports arguments -Wno-unknown-pragmas=
: YES<br>| Compiler for C supports arguments -Wno-unused-parameter: YES<br>=
| Compiler for C supports arguments -fno-strict-aliasing: YES<br>| Compiler=
 for C supports arguments -Wimplicit-fallthrough: YES<br>| Checking if &quo=
t;-Werror=3Dimplicit-fallthrough&quot; compiles: NO<br>| Found pkg-config: =
YES (/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.=
0/recipe-sysroot-native/usr/bin/pkg-config) 2.5.1<br>| Run-time dependency =
uuid found: YES 2.41.3<br>| Found CMake: NO<br>| Run-time dependency libelo=
gind found: NO (tried pkgconfig and cmake)<br>| Run-time dependency libudev=
 found: YES 259<br>| Run-time dependency dbus-1 found: YES 1.16.2<br>| Run-=
time dependency libndp found: YES 1.9<br>| Run-time dependency jansson foun=
d: NO (tried pkgconfig and cmake)<br>| Run-time dependency libsystemd found=
: YES 259<br>| Run-time dependency libsystemd-login found: NO (tried pkgcon=
fig and cmake)<br>| Run-time dependency systemd found: YES 259<br>| Run-tim=
e dependency gio-unix-2.0 found: YES 2.88.0<br>| Run-time dependency gmodul=
e-2.0 found: YES 2.88.0<br>| Library dl found: YES<br>| Run-time dependency=
 gobject-introspection-1.0 found: YES 1.86.0<br>| Run-time dependency nss f=
ound: YES 3.122<br>| Run-time dependency gnutls found: NO (tried pkgconfig =
and cmake)<br>| Run-time dependency bluez found: YES 5.86<br>| Program netc=
onfig /usr/netconfig /usr/sbin/netconfig /usr/local/sbin/netconfig found: N=
O<br>| Program /sbin/ip6tables found: YES (/sbin/ip6tables)<br>| Program mo=
dprobe /sbin/modprobe /usr/sbin/modprobe found: NO<br>| Run-time dependency=
 libcurl found: YES 8.19.0<br>| Run-time dependency libedit found: YES 3.1<=
br>| ../sources/networkmanager-1.56.0/meson.build:883: WARNING: add_languag=
es is missing native:, assuming languages are wanted for both host and buil=
d.<br>| Compiler for language vala for the host machine not found.<br>| Com=
piler for language vala for the build machine not found.<br>|<br>| ../sourc=
es/networkmanager-1.56.0/meson.build:884:4: ERROR: Assert failed: vala is r=
equired to build. Use -Dvapi=3Dfalse to disable it<br>|<br>| A full log can=
 be found at /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanag=
er/1.56.0/build/meson-logs/meson-log.txt<br>|<br>| Last 10 lines of meson-l=
og.txt:<br>| Command line: `aarch64-yoe-linux-clang -mcpu=3Dcortex-a72+crc+=
nocrypto --dyld-prefix=3D/usr -fstack-protector-strong -O2 -D_FORTIFY_SOURC=
E=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/mnt=
/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/recipe-=
sysroot /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.=
56.0/build/meson-private/tmphbe49qc1/testfile.c -o /mnt/b/yoe/mut/build/tmp=
/work/cortexa72-yoe-linux/networkmanager/1.56.0/build/meson-private/tmphbe4=
9qc1/output.obj -c -O2 -g -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work=
/cortexa72-yoe-linux/networkmanager/1.56.0/sources/networkmanager-1.56.0=3D=
/usr/src/debug/networkmanager/1.56.0 -ffile-prefix-map=3D/mnt/b/yoe/mut/bui=
ld/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/build=3D/usr/src/debu=
g/networkmanager/1.56.0 -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/c=
ortexa72-yoe-linux/networkmanager/1.56.0/recipe-sysroot=3D -ffile-prefix-ma=
p=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0=
/recipe-sysroot-native=3D -pipe -D_FILE_OFFSET_BITS=3D64 -O0 -Werror=3Dimpl=
icit-function-declaration -Werror=3Dunknown-warning-option -Werror=3Dunused=
-command-line-argument -Werror=3Dignored-optimization-argument -std=3Dgnu11=
` -&gt; 0<br>| ../sources/networkmanager-1.56.0/meson.build:883: WARNING: a=
dd_languages is missing native:, assuming languages are wanted for both hos=
t and build.<br>| -----------<br>| Detecting compiler via: `valac --version=
` -&gt; [Errno 2] No such file or directory: &#39;valac&#39;<br>| Compiler =
for language vala for the host machine not found.<br>| -----------<br>| Det=
ecting compiler via: `valac --version` -&gt; [Errno 2] No such file or dire=
ctory: &#39;valac&#39;<br>| Compiler for language vala for the build machin=
e not found.<br>|<br>| ../sources/networkmanager-1.56.0/meson.build:884:4: =
ERROR: Assert failed: vala is required to build. Use -Dvapi=3Dfalse to disa=
ble it<br>|<br>| ERROR: meson setup failed<br>| WARNING: /mnt/b/yoe/mut/bui=
ld/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/temp/run.do_configure=
.1181:174 exit 1 from &#39;exit 1&#39;<br>| WARNING: Backtrace (BB generate=
d script):<br>| =C2=A0 =C2=A0 =C2=A0 #1: bbfatal_log, /mnt/b/yoe/mut/build/=
tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/temp/run.do_configure.11=
81, line 174<br>| =C2=A0 =C2=A0 =C2=A0 #2: meson_do_configure, /mnt/b/yoe/m=
ut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/temp/run.do_con=
figure.1181, line 163<br>| =C2=A0 =C2=A0 =C2=A0 #3: do_configure, /mnt/b/yo=
e/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/temp/run.do_=
configure.1181, line 150<br>| =C2=A0 =C2=A0 =C2=A0 #4: main, /mnt/b/yoe/mut=
/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/temp/run.do_confi=
gure.1181, line 187<br>NOTE: recipe networkmanager-1.56.0-r0: task do_confi=
gure: Failed<br>ERROR: Task (/mnt/b/yoe/mut/sources/meta-openembedded/meta-=
networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb:do_=
configure) failed with exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attemp=
ted 6551 tasks of which 6548 didn&#39;t need to be rerun and 1 failed.<br>N=
OTE: Writing buildhistory<br>NOTE: Writing buildhistory took: 7 seconds<br>=
NOTE: Build completion summary:<br>NOTE: =C2=A0 do_create_recipe_spdx: 0.0%=
 sstate reuse(0 setscene, 1 scratch)<br><br>Summary: 1 task failed:<br>=C2=
=A0 /mnt/b/yoe/mut/sources/meta-openembedded/meta-networking/recipes-connec=
tivity/networkmanager/networkmanager_1.56.0.bb:do_configure</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ap=
r 21, 2026 at 8:59=E2=80=AFAM Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jo=
se=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">=
gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The introduction of DISTRO_FEATURES_OPTED_=
OUT allows rewriting the<br>
DISTRO_FEATURES by removing whatever is in DISTRO_FEATURES_OPTED_OUT<br>
from DISTRO_FEATURES.<br>
<br>
Thus, the logic of vala can be negated, and it can changed be to<br>
see if gobject-introspection-data is available in DISTRO_FEATURES.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../networkmanager/<a href=3D"http://networkmanager_1.56.0.bb" rel=3D=
"noreferrer" target=3D"_blank">networkmanager_1.56.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/networkmanager/<a href=3D=
"http://networkmanager_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">netw=
orkmanager_1.56.0.bb</a> b/meta-networking/recipes-connectivity/networkmana=
ger/<a href=3D"http://networkmanager_1.56.0.bb" rel=3D"noreferrer" target=
=3D"_blank">networkmanager_1.56.0.bb</a><br>
index 2cc0b76676..138d7118eb 100644<br>
--- a/meta-networking/recipes-connectivity/networkmanager/<a href=3D"http:/=
/networkmanager_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">networkmana=
ger_1.56.0.bb</a><br>
+++ b/meta-networking/recipes-connectivity/networkmanager/<a href=3D"http:/=
/networkmanager_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">networkmana=
ger_1.56.0.bb</a><br>
@@ -76,7 +76,7 @@ PACKAGECONFIG ??=3D &quot;readline nss ifupdown dnsmasq n=
mcli \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bl=
uetooth&#39;, &#39;bluez5&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;wifi=
 polkit ppp&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;se=
linux&#39;, &#39;selinux audit&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES_OPTED_OUT&#39;, &#=
39;gobject-introspection-data&#39;, &#39;&#39;, &#39;vala&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;gobject=
-introspection-data&#39;, &#39;vala&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;vala&#39;,=
 &#39;vala&#39;, &#39;&#39;, d)}<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126536): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126536" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126536</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118939974/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118939974/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000e683ce064ffc44eb--

