Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB924E69172
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:19:44 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.53863.1732389575086814094
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fyQwVmwA;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71817c40110so1711027a34.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732389574; x=1732994374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qevJNzYbb1mZv7DDrE7AVa6AqI8JlSXhGnxRF2mPf8k=;
        b=fyQwVmwAgMEmrborYt0u5aStNjV7V1FXxAtpO9qKoU0iYFIbkIh01sUQnG6Ae158HE
         czCFUmGZPn4IFX2LRZOAVYaRdqYt6DsG2m/G3NsNeozG8vFtUg3TgO9adUD6KkcJpceh
         Wbqo+Qzp0Y+RppZzNZooofdZslL0h5Fi7BCGhdFlXHk6Kjch16/oN/EQ9/Y3K+L6y0rZ
         oSqhd7xVxpQgPbq+0fFgE3opW7Eo9RYYmYfmNQHNfIJyxZbxsFuqlnxxKZ83oq9snXpG
         sUGxD8oKW1RAwIOSQ0jdfXUyJJoWRTNdF0sSuTLq5JW/k3Lv5xrzafqdlV4MSUjvU2Vf
         1MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732389574; x=1732994374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qevJNzYbb1mZv7DDrE7AVa6AqI8JlSXhGnxRF2mPf8k=;
        b=AZMDbOvsb+pyI4jdFMcs+xdEqAB4sX7zKv4nayuyFQxADcNV5o3ebz0O1Os0Y40vbh
         Y5wXyM6kLvaw31ClFb9HAFACy/p+Gtx4lzf+tQJr/xWSTWqPfa0tN9n0ZmtfE0b0uF0Z
         yS2FK/uHI+Q9L6x/oZO4GgqWSFLkE64USXMkqxoG4oJgTmeXT2YOpMwgxXJjSdRVH2ze
         1ElNRpPZoyUy+tijGkySimx19pa7eGzwvSifQ42SF1jxll9ve65RMgkIhTLEWyCqEVEh
         kT/SK6X8qJZTuQCsPUTCwrFv7b+7pWQLLXxbSim+LCgPu0B0/09yiDusaQUVHbb8PE/k
         ipTg==
X-Gm-Message-State: AOJu0Yxb+oWe3Wz8iD+0z0Appd2vZAerxNjeJ1hwcZ+7Zo0OW94Ru8ZX
	+HPMj936FZcd8YdRQp1KBjt6NtT6KqrgHVjFJWMuDSTihDFG0ZgIt4efEzbCpn9iIkvDpmZJn2G
	f4zMf+Ouc5Kh0HNyV6gPvzJi6gOE=
X-Gm-Gg: ASbGncs4TnsgNHAvGLDtcKTL2E0KxEoau7hvasrhBeQMD4Ouh0yHL7VAVhtWwxFhYYb
	E1ck6VpO/4dBDIIjX2DTUzNRCyhuSjQ==
X-Google-Smtp-Source: AGHT+IF45Xkr6FJ4bITg49CWr6Bz89BYlWFucIvxTZ8KlayhdKrh1+y4rq5G2FRCnpXLuYFvHbH6dnbARydZY5ZiSe0=
X-Received: by 2002:a05:6830:390a:b0:710:f375:a6c9 with SMTP id
 46e09a7af769-71c04b72129mr8007183a34.7.1732389574310; Sat, 23 Nov 2024
 11:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20241123185854.2332152-1-martin.jansa@gmail.com>
In-Reply-To: <20241123185854.2332152-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Nov 2024 11:19:08 -0800
Message-ID: <CAMKF1sq8GhEDZHbN4a8GyQXHyPTpWvku8RJNux=OkNefjUgqug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: backport a patch to fix build with icu-76
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 19:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114021

I had a local patch for this already, check master-next.

On Sat, Nov 23, 2024 at 10:59=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * icu was upgraded in oe-core in:
>   https://git.openembedded.org/openembedded-core/commit/?id=3Def2bd18dd1d=
b7e5f01db76889933bfdbb5415aaf
>   nodejs is now failing to link:
>
> TOPDIR/BUILD/hosttools/ld: nodejs/22.11.0/node-v22.11.0/out/Release/obj.h=
ost/gen-regexp-special-case/deps/v8/src/regexp/gen-regexp-special-case.o: i=
n function `v8::internal::PrintSet(std::basic_ofstream<char, std::char_trai=
ts<char> >&, char const*, icu_76::UnicodeSet const&)':
> gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofs=
treamIcSt11char_traitsIcEEPKcRKN6icu_7610UnicodeSetE+0x8b): undefined refer=
ence to `icu_76::UnicodeSet::getRangeStart(int) const'
> TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88inter=
nal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610Unicode=
SetE+0xb6): undefined reference to `icu_76::UnicodeSet::getRangeEnd(int) co=
nst'
> TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88inter=
nal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610Unicode=
SetE+0xdf): undefined reference to `icu_76::UnicodeSet::getRangeCount() con=
st'
> TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88inter=
nal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610Unicode=
SetE+0xed): undefined reference to `icu_76::UnicodeSet::getRangeStart(int) =
const'
> TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88inter=
nal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610Unicode=
SetE+0xfa): undefined reference to `icu_76::UnicodeSet::getRangeEnd(int) co=
nst'
> TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88inter=
nal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7610Unicode=
SetE+0x121): undefined reference to `icu_76::UnicodeSet::getRangeStart(int)=
 const'
> TOPDIR/BUILD/hosttools/ld: nodejs/22.11.0/node-v22.11.0/out/Release/obj.h=
ost/gen-regexp-special-case/deps/v8/src/regexp/gen-regexp-special-case.o: i=
n function `v8::internal::PrintSpecial(std::basic_ofstream<char, std::char_=
traits<char> >&)':
> gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basi=
c_ofstreamIcSt11char_traitsIcEE+0x43): undefined reference to `icu_76::Unic=
odeSet::UnicodeSet()'
> TOPDIR/BUILD/hosttools/ld: gen-regexp-special-case.cc:(.text._ZN2v88inter=
nal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x59): undefined=
 reference to `icu_76::UnicodeSet::UnicodeSet()'
> ...
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_22.11.0.bb |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with=
-icu-76.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76=
.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
> new file mode 100644
> index 0000000000..e8501bcdbe
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
> @@ -0,0 +1,29 @@
> +From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 2001
> +From: Michael Cho <michael@michaelcho.dev>
> +Date: Sun, 27 Oct 2024 10:08:07 -0400
> +Subject: [PATCH] build: fix building with system icu 76
> +
> +ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
> +add `icu-uc` when linking to shared libraries. This results in undefined
> +symbols/references when trying to build with system ICU 76.
> +
> +[^1]: unicode-org/icu@199bc82
> +
> +Upstream-Status: Backport [https://github.com/nodejs/node/commit/81517fa=
ceac86497b3c8717837f491aa29a5e0f9]
> +---
> + configure.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.py b/configure.py
> +index a5f47af1748903..a4e210261e2e76 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -1879,7 +1879,7 @@ def icu_download(path):
> +   elif with_intl =3D=3D 'system-icu':
> +     # ICU from pkg-config.
> +     o['variables']['v8_enable_i18n_support'] =3D 1
> +-    pkgicu =3D pkg_config('icu-i18n')
> ++    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
> +     if not pkgicu[0]:
> +       error('''Could not load pkg-config data for "icu-i18n".
> +        See above errors or the README.md.''')
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.11.0.bb
> index 49a5f350d9..8cbf539789 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> @@ -28,6 +28,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>             file://0001-deps-disable-io_uring-support-in-libuv.patch \
>             file://0001-positional-args.patch \
>             file://0001-custom-env.patch \
> +           file://fix-build-with-icu-76.patch \
>             file://run-ptest \
>             "
>  SRC_URI:append:class-target =3D " \
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114018): https://lists.openembedded.org/g/openembedde=
d-devel/message/114018
> Mute This Topic: https://lists.openembedded.org/mt/109744371/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

