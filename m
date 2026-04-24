Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C68FED3D9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 14:45:59 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24504.1777041950423366680
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TwGXuTgb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358dd7f79so287655166b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 07:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777041949; cv=none;
        d=google.com; s=arc-20240605;
        b=ba0kkTBFWYNg9j1W63g+ItqK4JaFNieom9ikEYk178DBZyUtEySnZFjRFsUIrd9hCJ
         m2spQOQxJgZlmWKCtvxiTV8He/GfLrZ4hIK4zdOk6A+0ZCnvhk8rd2512rcZe8RpyuD0
         HhyQkHmXa93hMYu2Y0apHUbS1lBccPR3aOD1dDRYcdRqPjp+myn03OSwkpYvAyIUH2BT
         L5PEt7/h8jmdRSyf9yCJ/3R+jk1toTQ+afNSUQMsfWo15onKSgsMRi2XVBSoPeFDwi6x
         lXFJ7J2egPmw156BVttiVZVD4dspQFsRE103fGhkIHJUKAaAHIkw1X2FsjRULEC/jKUR
         JvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hT7EEVdqOKucpjyfsg9A2Er7c6Mo/IT6gWLRPeMQvxs=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=ddFGr1wJDI5QBRwvK7U2o1dSe+bAQYpfbcewSaPOtVYSQ5O7YkpbyldcwA3g1dl9fa
         0aid6sYjCKofbwLY4bwUhiLAJsnu9wO7t1WOE0tnNhkq/9d2I9T8FOeX8mv6HJTgsaxr
         mbe7pSDluWPE1rBxJj1L+8XHxiyQd5ivdLqdMnCNhS2oRnwGul4+e+Scssp+Us5q16vm
         DSUvuhG2R7bWZqMf8V6mVEAMCgGuFg2qfXV4t7ickraIqdLU+gaRECvb4OrqMVhfdrTz
         hBB6wSlO/x/fmZyxGOCHIrg68Za/87uUbWFT28VKC3WBX5rppEoFvKE9qQSQ6p40aLty
         TWGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777041949; x=1777646749; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hT7EEVdqOKucpjyfsg9A2Er7c6Mo/IT6gWLRPeMQvxs=;
        b=TwGXuTgbvu63Wh2G2E3eL5Zy1tXkWFnFvv3aPqOSMjL9etSr5fKndcogItPuQj/02A
         mm12fLMcmRGGM1lstuCAtiNQpxwyx936sV+xKyW7KgkFzsUDm00+r0UBJ5jeKDGeh8tu
         0wnB1HYA7s4DfrDa0h2/nGkcn/e5jWCaILv56Vid6y5fy2uFwkaJ6P4oXauDdVTkzM6h
         BSzNaZvqYrScx+qBa2rl9QylHO78EK7Qjr7Ug9hMCmbpxYH/cCRd6DRxCYG3kmtpMm96
         xBvbzds2qO4Vca2xOsfGpj+HaFB4OVYsgASQSZhDKcx2OSIMo5AbnlCusTEBRSSnBhxl
         XExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777041949; x=1777646749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT7EEVdqOKucpjyfsg9A2Er7c6Mo/IT6gWLRPeMQvxs=;
        b=PSDZPvgaaEVMUKKmsFF45gl3Jzv54rcX2ZuBUTYE1COCCOlJIQAAyHPj3ZcldjPxzt
         7UTdSHQbBdiF7j86tGR67s7NcSJzUqVhWvPFSD2znttMqbV3LB4Q6JkhKRsvk5FXPmWj
         hd1qzZe+w2wfYC11sNyt2LbM2k7E/YhWxi9xtkCU1v5zamnyZllmc3EzWjY0GlFNnfx7
         OusOVlnRnjaXE6sH5A6nCferHGN5lrIFYpAWsoX38Y1i9IW/ZMTvjwTw2ElACkdcy9xb
         qBxe7O5YWboG3TjECO9drlSdIh/oQ+WQ0NyAl5Imiii4krczf9Pt9MuDgTtRaAbvSxD0
         UQtw==
X-Gm-Message-State: AOJu0YwCInqOg5rFcuQhLswSK2vK3CEbqNtU2BRYQ9k/a6JYXOh/neWX
	j5k6mTzK/bMGd/P2kiNqSaxW52LKATYwrnQzErgSHjIS3RMzsCeavnqLfHKO7mpeOdLWNh8sHM2
	AOoU5aq9oF2XQSwlkTTtJCocwPIObfeM=
X-Gm-Gg: AeBDievNAoohiTbKmbPbcqcEr0e/mfvqVJbzNIS6Rc8MQBuPxL95w1oCdnwVeug+3V5
	OtXm0uJi7xFoEuOUoyM9mAEDHM0WqzLE7fugANXj4B+0XD7bqmj9Y9Tn2VJeVSgurEc0SLje1fR
	64y4y36D7llNM239b4ibAGoFvNPRTNdqn9q/XPrlXzCZ9GoaIAHy8iK/vOceSA6vu0wKDlSIOqc
	2mk8MQhR5c6nVpOI/Rm/vRobKKzMUKhzT6oZx1aiCxnVcPguNVSfUTqqT9HEkLS3f1nX21UXW5/
	Qh/Jyx4vfdPzUMhBFjtWYfUfUyxOQnHBCRrTT22lHo/xNM+V/6YLtTrPXw2Skmu9B5ddI5OSN2z
	FW8tc6g==
X-Received: by 2002:a17:907:9806:b0:b9b:63af:d9cf with SMTP id
 a640c23a62f3a-ba41c1b0de6mr1408774166b.48.1777041948390; Fri, 24 Apr 2026
 07:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260421155925.1430423-1-quaresma.jose@gmail.com> <CAMKF1sq0mVFjWV5+7PiQpbh2Gsu0JFd-Q6sO2Y_2d1ZDD727=A@mail.gmail.com>
In-Reply-To: <CAMKF1sq0mVFjWV5+7PiQpbh2Gsu0JFd-Q6sO2Y_2d1ZDD727=A@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 24 Apr 2026 15:45:36 +0100
X-Gm-Features: AQROBzCmYS3WUD4o-V6XYtsq5EjQizFA6RX4yNnEXo-VRzUlEoz7xZysx60TopU
Message-ID: <CANPvuRm8rPn+hG13n18aKAmBYZ6ETq+JR_bvyQMMwOw0ufCdiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: re-implement the vala detection
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015ba65065035d28d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 14:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126607

--00000000000015ba65065035d28d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu (ter=C3=A7a, 21/04/2026 =C3=A0(s) 18=
:40):

> This ends in trouble with valac
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

Can you give another chance to this patch?

There was a bug in oe-core with DISTRO_FEATURES that has now been resolved.

Jose


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

--00000000000015ba65065035d28d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; escreveu (te=
r=C3=A7a, 21/04/2026 =C3=A0(s) 18:40):<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">This ends in trouble with valac<div=
><br></div><div>| Compiler for C supports link arguments -Wl,--gc-sections:=
 YES<br>| Compiler for C supports arguments -Wcast-align=3Dstrict: NO<br>| =
Compiler for C supports arguments -Wdeclaration-after-statement: YES<br>| C=
ompiler for C supports arguments -Wfloat-equal: YES<br>| Compiler for C sup=
ports arguments -Wformat-nonliteral: YES<br>| Compiler for C supports argum=
ents -Wformat-security: YES<br>| Compiler for C supports arguments -Wimplic=
it-function-declaration: YES<br>| Compiler for C supports arguments -Wimpli=
cit-int: YES<br>| Compiler for C supports arguments -Winit-self: YES<br>| C=
ompiler for C supports arguments -Wint-conversion: YES<br>| Compiler for C =
supports arguments -Wlogical-op: NO<br>| Compiler for C supports arguments =
-Wmissing-declarations: YES<br>| Compiler for C supports arguments -Wmissin=
g-include-dirs: YES<br>| Compiler for C supports arguments -Wmissing-protot=
ypes: YES<br>| Compiler for C supports arguments -Wold-style-definition: YE=
S<br>| Compiler for C supports arguments -Wparentheses-equality: YES<br>| C=
ompiler for C supports arguments -Wpointer-arith: YES<br>| Compiler for C s=
upports arguments -Wshadow: YES<br>| Compiler for C supports arguments -Wsh=
ift-negative-value: YES<br>| Compiler for C supports arguments -Wstrict-pro=
totypes: YES<br>| Compiler for C supports arguments -Wtypedef-redefinition:=
 YES<br>| Compiler for C supports arguments -Wundef: YES<br>| Compiler for =
C supports arguments -Wunknown-attributes: YES<br>| Compiler for C supports=
 arguments -Wvla: YES<br>| Compiler for C supports arguments -Wno-duplicate=
-decl-specifier: YES<br>| Compiler for C supports arguments -Wno-format-tru=
ncation: YES<br>| Compiler for C supports arguments -Wno-format-y2k: YES<br=
>| Compiler for C supports arguments -Wno-gnu-variable-sized-type-not-at-en=
d: YES<br>| Compiler for C supports arguments -Wno-missing-field-initialize=
rs: YES<br>| Compiler for C supports arguments -Wno-pragmas: YES<br>| Compi=
ler for C supports arguments -Wno-sign-compare: YES<br>| Compiler for C sup=
ports arguments -Wno-tautological-constant-out-of-range-compare: YES<br>| C=
ompiler for C supports arguments -Wno-unknown-pragmas: YES<br>| Compiler fo=
r C supports arguments -Wno-unused-parameter: YES<br>| Compiler for C suppo=
rts arguments -fno-strict-aliasing: YES<br>| Compiler for C supports argume=
nts -Wimplicit-fallthrough: YES<br>| Checking if &quot;-Werror=3Dimplicit-f=
allthrough&quot; compiles: NO<br>| Found pkg-config: YES (/mnt/b/yoe/mut/bu=
ild/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/recipe-sysroot-nativ=
e/usr/bin/pkg-config) 2.5.1<br>| Run-time dependency uuid found: YES 2.41.3=
<br>| Found CMake: NO<br>| Run-time dependency libelogind found: NO (tried =
pkgconfig and cmake)<br>| Run-time dependency libudev found: YES 259<br>| R=
un-time dependency dbus-1 found: YES 1.16.2<br>| Run-time dependency libndp=
 found: YES 1.9<br>| Run-time dependency jansson found: NO (tried pkgconfig=
 and cmake)<br>| Run-time dependency libsystemd found: YES 259<br>| Run-tim=
e dependency libsystemd-login found: NO (tried pkgconfig and cmake)<br>| Ru=
n-time dependency systemd found: YES 259<br>| Run-time dependency gio-unix-=
2.0 found: YES 2.88.0<br>| Run-time dependency gmodule-2.0 found: YES 2.88.=
0<br>| Library dl found: YES<br>| Run-time dependency gobject-introspection=
-1.0 found: YES 1.86.0<br>| Run-time dependency nss found: YES 3.122<br>| R=
un-time dependency gnutls found: NO (tried pkgconfig and cmake)<br>| Run-ti=
me dependency bluez found: YES 5.86<br>| Program netconfig /usr/netconfig /=
usr/sbin/netconfig /usr/local/sbin/netconfig found: NO<br>| Program /sbin/i=
p6tables found: YES (/sbin/ip6tables)<br>| Program modprobe /sbin/modprobe =
/usr/sbin/modprobe found: NO<br>| Run-time dependency libcurl found: YES 8.=
19.0<br>| Run-time dependency libedit found: YES 3.1<br>| ../sources/networ=
kmanager-1.56.0/meson.build:883: WARNING: add_languages is missing native:,=
 assuming languages are wanted for both host and build.<br>| Compiler for l=
anguage vala for the host machine not found.<br>| Compiler for language val=
a for the build machine not found.<br>|<br>| ../sources/networkmanager-1.56=
.0/meson.build:884:4: ERROR: Assert failed: vala is required to build. Use =
-Dvapi=3Dfalse to disable it<br>|<br>| A full log can be found at /mnt/b/yo=
e/mut/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/build/meson-=
logs/meson-log.txt<br>|<br>| Last 10 lines of meson-log.txt:<br>| Command l=
ine: `aarch64-yoe-linux-clang -mcpu=3Dcortex-a72+crc+nocrypto --dyld-prefix=
=3D/usr -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security --sysroot=3D/mnt/b/yoe/mut/build/tmp/w=
ork/cortexa72-yoe-linux/networkmanager/1.56.0/recipe-sysroot /mnt/b/yoe/mut=
/build/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/build/meson-priva=
te/tmphbe49qc1/testfile.c -o /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-li=
nux/networkmanager/1.56.0/build/meson-private/tmphbe49qc1/output.obj -c -O2=
 -g -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/n=
etworkmanager/1.56.0/sources/networkmanager-1.56.0=3D/usr/src/debug/network=
manager/1.56.0 -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-=
yoe-linux/networkmanager/1.56.0/build=3D/usr/src/debug/networkmanager/1.56.=
0 -ffile-prefix-map=3D/mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe-linux/net=
workmanager/1.56.0/recipe-sysroot=3D -ffile-prefix-map=3D/mnt/b/yoe/mut/bui=
ld/tmp/work/cortexa72-yoe-linux/networkmanager/1.56.0/recipe-sysroot-native=
=3D -pipe -D_FILE_OFFSET_BITS=3D64 -O0 -Werror=3Dimplicit-function-declarat=
ion -Werror=3Dunknown-warning-option -Werror=3Dunused-command-line-argument=
 -Werror=3Dignored-optimization-argument -std=3Dgnu11` -&gt; 0<br>| ../sour=
ces/networkmanager-1.56.0/meson.build:883: WARNING: add_languages is missin=
g native:, assuming languages are wanted for both host and build.<br>| ----=
-------<br>| Detecting compiler via: `valac --version` -&gt; [Errno 2] No s=
uch file or directory: &#39;valac&#39;<br>| Compiler for language vala for =
the host machine not found.<br>| -----------<br>| Detecting compiler via: `=
valac --version` -&gt; [Errno 2] No such file or directory: &#39;valac&#39;=
<br>| Compiler for language vala for the build machine not found.<br>|<br>|=
 ../sources/networkmanager-1.56.0/meson.build:884:4: ERROR: Assert failed: =
vala is required to build. Use -Dvapi=3Dfalse to disable it<br>|<br>| ERROR=
: meson setup failed<br>| WARNING: /mnt/b/yoe/mut/build/tmp/work/cortexa72-=
yoe-linux/networkmanager/1.56.0/temp/run.do_configure.1181:174 exit 1 from =
&#39;exit 1&#39;<br>| WARNING: Backtrace (BB generated script):<br>| =C2=A0=
 =C2=A0 =C2=A0 #1: bbfatal_log, /mnt/b/yoe/mut/build/tmp/work/cortexa72-yoe=
-linux/networkmanager/1.56.0/temp/run.do_configure.1181, line 174<br>| =C2=
=A0 =C2=A0 =C2=A0 #2: meson_do_configure, /mnt/b/yoe/mut/build/tmp/work/cor=
texa72-yoe-linux/networkmanager/1.56.0/temp/run.do_configure.1181, line 163=
<br>| =C2=A0 =C2=A0 =C2=A0 #3: do_configure, /mnt/b/yoe/mut/build/tmp/work/=
cortexa72-yoe-linux/networkmanager/1.56.0/temp/run.do_configure.1181, line =
150<br>| =C2=A0 =C2=A0 =C2=A0 #4: main, /mnt/b/yoe/mut/build/tmp/work/corte=
xa72-yoe-linux/networkmanager/1.56.0/temp/run.do_configure.1181, line 187<b=
r>NOTE: recipe networkmanager-1.56.0-r0: task do_configure: Failed<br>ERROR=
: Task (/mnt/b/yoe/mut/sources/meta-openembedded/meta-networking/recipes-co=
nnectivity/networkmanager/networkmanager_1.56.0.bb:do_configure) failed wit=
h exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 6551 tasks of whi=
ch 6548 didn&#39;t need to be rerun and 1 failed.<br>NOTE: Writing buildhis=
tory<br>NOTE: Writing buildhistory took: 7 seconds<br>NOTE: Build completio=
n summary:<br>NOTE: =C2=A0 do_create_recipe_spdx: 0.0% sstate reuse(0 setsc=
ene, 1 scratch)<br><br>Summary: 1 task failed:<br>=C2=A0 /mnt/b/yoe/mut/sou=
rces/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/=
networkmanager_1.56.0.bb:do_configure</div></div></blockquote><div><br></di=
v><div>Can you give another chance to this patch?</div><div><br></div><div>=
There was a bug in oe-core with=C2=A0<span style=3D"color:rgb(0,0,0)">DISTR=
O_FEATURES</span>=C2=A0that has now been resolved.</div><div><br></div><div=
>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Apr 21, 2026 at 8:59=E2=80=AFAM Jose Quaresma via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;quar=
esma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_=
blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">The introduction of DISTRO_FEATURES_=
OPTED_OUT allows rewriting the<br>
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

--00000000000015ba65065035d28d--

