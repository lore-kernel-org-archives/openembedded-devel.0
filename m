Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09B2C36014
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 00:02:08 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.326.1743724918605459273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 17:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwOM/U5h;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso690610eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 17:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743724918; x=1744329718; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aJQ4uhSS/ifvtIZLzVC2pyry7klQVzfQhyVP3WXNTc=;
        b=UwOM/U5hSOnwe3JjThDCRQBfWw4tI6C2A1Ic6N4mluvBhsSd+7a3TmhR09+4XRz8c5
         s9K322fRmAQgir4+wqut+dj4NEXrMnkG3x496VoDyWRfWk0qXBUD2lAciakj9rnqP+66
         hX0HoIZQM4+7Hp3lrfwxn7TEFDE1UqpoBS6KzW+BjX3evmb6bUpMaKhNlGUhOpujRZ0e
         gmaeMFoTSHdofWqXemG28AoViygv+TB+0nq9m67k03LKIn72g7ihk5k1al5AuLpQxDRT
         6HYNbS2t0PsBVC/AXp3Lh43wdNX6grdGbzeyPCzzgc8VzRqTEwt8Y7d3RCPx9o5Uu1A3
         l1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743724918; x=1744329718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aJQ4uhSS/ifvtIZLzVC2pyry7klQVzfQhyVP3WXNTc=;
        b=UBqKkVoygogck7eIUTm4nmcarv/4KTe+ldrH+BHVNs5ZqYHV0MjCbTcD/NjZbwnFK1
         2wCs7EUzz/uuJkQQwdPS9PdXzRqKm4dqLE1FE8P781PQjG0Pp6/t0Ni3nbU+7UqlySZt
         LCjgzQd61NCaMEzfHlfcEilNoqYWdOGdjlZKWvB6rqmiRjBXXEcUXcKlmNXOzl1aKa+/
         3ABYIN9+qVMI9x/iydKyyBU1z3FWp2K6J7N4ix8fhxuFr4/VpPsx8K7m/S1HZ43IMkwL
         /dSK7E6XuMl3FulfYiq5WJtpEik4O8YRdVu9+/pxKh8xlNNzrX4DvPwdOv7054DXDOd0
         PZnw==
X-Gm-Message-State: AOJu0YxxdNRmH3XsmoFl8FJQ4z1hdmLLxrnMLUjWImDSNjly6aAbec1h
	XHI80SramaRGFfSK9M80u+idAQIIiMQFrs0OejSN0+d2ogAra/V7/OydeiSnlUFoEZZV3u8Dph3
	tBQ4KC4iGbBw+PJgmbpnFIp1yhEU=
X-Gm-Gg: ASbGncsUubEivnHj/fUHrNDQIf5GUAnGzxmYXJMcxdXvSvIp5KFBzZPdiW5QjU3crEs
	pjnrKNs8Gqkqiv3FUDY7Cj6rNgfM2pvW7fvVyu33n6kW/kTEfQpTeno36puB2O74MiOdDTr5R6f
	o+YFxgDnDosu8fBiRuFL6hOmng
X-Google-Smtp-Source: AGHT+IHfkvew2H48uFAYSAwVWN7DUgsomHFkRUhiBeKbyfiw0ymSZRd2QiY7jbuWvC0ihlgiM5GQGOzuw5VcsirBKrY=
X-Received: by 2002:a05:6820:202:b0:603:f1b5:ca02 with SMTP id
 006d021491bc7-6041583b0femr664270eaf.6.1743724917626; Thu, 03 Apr 2025
 17:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250403082208.440900-1-thond2009@gmail.com>
In-Reply-To: <20250403082208.440900-1-thond2009@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Apr 2025 17:01:31 -0700
X-Gm-Features: AQ5f1JrzX91YWaYR9ym5Llsud7nIaaT9jlCM_XH4th7vqz2MKzBccTiqocpIO4A
Message-ID: <CAMKF1so6xnhHJBGUuRtEV+ObL8q7QBbvVvUbNJ09mb3DwLXmrA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] f2fs-tools: Fix build with gcc-15
To: thond2009@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Nguyen Dat Tho <tho3.nguyen@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 00:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116551

while it might fix gcc-15, it is regressing gcc-14 build see -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/539/step=
s/14/logs/stdio

On Thu, Apr 3, 2025 at 1:22=E2=80=AFAM Nguyen Dat Tho via
lists.openembedded.org <thond2009=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Nguyen Dat Tho <tho3.nguyen@lge.com>
>
> To fix error: https://errors.yoctoproject.org/Errors/Details/850170/
>
> Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
> ---
>  ...-f2fs_fs.h-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
>  .../f2fs-tools/f2fs-tools_1.16.0.bb           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/=
0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch
>
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-in=
clude-f2fs_fs.h-fix-std-c23-build-failure.patch b/meta-filesystems/recipes-=
utils/f2fs-tools/f2fs-tools/0001-include-f2fs_fs.h-fix-std-c23-build-failur=
e.patch
> new file mode 100644
> index 0000000000..7b81b93715
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-include-f=
2fs_fs.h-fix-std-c23-build-failure.patch
> @@ -0,0 +1,42 @@
> +From 4a66e47406a9c651ddba035e5f6e8b1f2cc90a40 Mon Sep 17 00:00:00 2001
> +From: Nguyen Dat Tho <tho3.nguyen@lge.com>
> +Date: Thu, 3 Apr 2025 12:37:26 +0900
> +Subject: [PATCH] include/f2fs_fs.h: fix -std=3Dc23 build failure
> +
> +gcc-15 switched to -std=3Dc23 by default:
> +
> +    https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D55e3bd376b22=
14e200fa76d12b67ff259b06c212
> +
> +As a result `f2fs-tools` fails as below, so only typedef u8 bool
> +for __STDC_VERSION__ <=3D 201710L (C17)
> +
> +In file included from ../../git/lib/libf2fs_zoned.c:11:
> +../../git/include/f2fs_fs.h:107:25: error: two or more data types in dec=
laration specifiers
> +  107 | typedef u8              bool;
> +      |                         ^~~~
> +../../git/include/f2fs_fs.h:107:1: warning: useless type name in empty d=
eclaration
> +  107 | typedef u8              bool;
> +
> +Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/202=
50403040220.305573-1-thond2009@gmail.com/T/#u]
> +---
> + include/f2fs_fs.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> +index f890634..1be77f1 100644
> +--- a/include/f2fs_fs.h
> ++++ b/include/f2fs_fs.h
> +@@ -103,7 +103,7 @@ typedef uint16_t   u16;
> + typedef uint8_t               u8;
> + typedef u32           block_t;
> + typedef u32           nid_t;
> +-#ifndef bool
> ++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <=
=3D 201710L
> + typedef u8            bool;
> + #endif
> + typedef unsigned long pgoff_t;
> +--
> +2.34.1
> +
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.=
bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> index 997fa1240a..48f20b7220 100644
> --- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> @@ -9,6 +9,7 @@ DEPENDS =3D "util-linux"
>
>  SRCREV =3D "06c027abc6153c4a97cba5317844e8dcaaee3cf7"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-=
tools.git;branch=3Dmaster \
> +           file://0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch=
 \
>             file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116535): https://lists.openembedded.org/g/openembedde=
d-devel/message/116535
> Mute This Topic: https://lists.openembedded.org/mt/112061986/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

