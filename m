Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DB5CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 21:23:03 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.346.1758662582224279482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 14:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KnDGiepL;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ea5d0e0022cso5037005276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 14:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758662581; x=1759267381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikvyaXbDVhI8LDhIGN5LvMB7mca4DbCl73uNcUQnTlU=;
        b=KnDGiepL+LUEEyZQWXGtBb6XVlDl7rLo4N+WvaDXNdRQetb5KU/OZJfkdJLX5ND8oR
         9JbyGr3UM01YD3qG2SYDHie/3kRWRKLqWRzoWpRPlHokAv2+6lZlyH+00HKDzIT7MFAz
         CQuhoPoX0f7WpWKX+c7hcKMTc7z8stsaTxADIUxUEumpeSWPc4BSWrgE7YqYCziCfj9U
         5fBGESKEEQl3qyFRcE8hBCS05Mkrxcg+0JFVXtBku50vTQwulU5NeGtBM6XO3nfHOCF6
         stUWmO+ktvRPzlvIa8th4kJBwdA48+oeyLS8UKRSNsdXOJ0xoWt0e60D+TzCh850hfKp
         44Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758662581; x=1759267381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikvyaXbDVhI8LDhIGN5LvMB7mca4DbCl73uNcUQnTlU=;
        b=i1TBcdJqmXJ0UVObus/a5X+/DEYXON83WFwXaaPaZzuojTS0XQo7Y0bap0I3knuYjI
         o2wm1OpSRDFWr8rMhQxajO8nAKd5Vfi8CuOIDb1ZHLc1T5al91Z9WhMnOT+wtUwSdTKb
         SVlY4/GtBw376e1jQsb/Mj83KU6orSn0hzDxJ2DkNRPHuaEW8kVLXvc5Y2NO4znSpvoQ
         MAVe+dzczP4ztzMtJVdxnVTifc//SHyU4wUsjpBZ7VJ79+3xUsCvix4B94VEwegV3WEW
         mJnHcH/NY4QI7M6yavkupj0kMKFJsJ5qpK7na6gbhTjD3YuuGFUOpcQuz1RRHNYHqUVc
         gHZA==
X-Gm-Message-State: AOJu0Yx8eqDOrZtBVtDuTbDRt8NkKIEfQ3UvII03pxtvlStLsLwPbb25
	Bokwnq7PIEKGrfYtMDgygCMh7BJA50rrd59eBAftHov1ljbnCJQALpPTDXZkVhL1Gs25Db2Q5gp
	c5m3Lsxfq7HM0QXoobj7BhRXeEEqRCzUynv31E+E=
X-Gm-Gg: ASbGncuQcy5lnY6pkqKhBGTnGvLlO4rhGzjPQx8R8NaTLsoSh4L8C3MwYFZVzA3GBJY
	qJCl0x0KDxi4iTUP2boYtKEoQOiVmmBq5nwTsHsQ8EIz4V7HxkCyXBOMlVR25zI4gsoFQoxJFTt
	C6UCh0rha4a6Yy3OTiXEiL09PHUelC+C6oFcZ+uOqAiF3vTqrCKJp82lyAnnR2uAPctjPz5pSB+
	6YeezsImCmNaecLmUA4n0zayVehCGL+QDdKCwbCP6CsACkuoRUumj/3llbkoKdwwicLILLpo4Rq
	oGqtaI/0OGgOmqt1q4ru4gEjhxXwSnjpQA==
X-Google-Smtp-Source: AGHT+IEk7SkSuLkjGroS8Thks8A5YYHLibFSgTimcHpCcuAN5xfwfrJHxLtVtgwcvPElP3JRAMQMFBzRbDmJEgf2JMA=
X-Received: by 2002:a05:6902:4208:b0:ead:b1cd:826d with SMTP id
 3f1490d57ef6-eb32e25037cmr3483150276.20.1758662581166; Tue, 23 Sep 2025
 14:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250923171012.2274702-1-skandigraun@gmail.com>
In-Reply-To: <20250923171012.2274702-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Sep 2025 14:22:35 -0700
X-Gm-Features: AS18NWAgNxonROYdXf8wg8nHMdjWgr8RvLzgrfChSVZ5-Ga9SYUezvAFXc2ZVuA
Message-ID: <CAMKF1spTmueYWtARTyKXdEgjPoM1vjo8kEWSnu89NJFtRx8T1Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] zlog: upgrade 1.2.16 -> 1.2.18
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 21:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119736

fails to pass build QA

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/947

On Tue, Sep 23, 2025 at 10:10=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Switched to cmake. Added a backported patch to be able to use
> the latest version of cmake.
>
> License-Update: License changed to Apache2:
> https://github.com/HardySimpson/zlog/commit/1a7b1a6fb956b92a4079ccc91f30d=
a21f34ca063
>
> Changelog:
> 1.2.18:
> - patched severe vulnerability CVE-2024-22857
> - restructured build system
>
> 1.2.17:
> - Change Lience to Apache 2.0, for more people
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../files/upgrade_cmake_minimum_version.patch | 25 +++++++++++++++++++
>  meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  | 16 ------------
>  meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  | 11 ++++++++
>  3 files changed, 36 insertions(+), 16 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_min=
imum_version.patch
>  delete mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
>  create mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
>
> diff --git a/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_ve=
rsion.patch b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_ver=
sion.patch
> new file mode 100644
> index 0000000000..9d02066d57
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.p=
atch
> @@ -0,0 +1,25 @@
> +From 3715879775f725260aeda14f94887bbc7a007e29 Mon Sep 17 00:00:00 2001
> +From: haydenZhou <mfkhao2009@outlook.com>
> +Date: Sun, 8 Jun 2025 10:45:05 +0800
> +Subject: [PATCH] upgrade cmake minimum version
> +
> +Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/3=
715879775f725260aeda14f94887bbc7a007e29]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5ddaf8d..31a1553 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -14,7 +14,7 @@
> + # limitations under the License.
> + #/
> +
> +-cmake_minimum_required(VERSION 2.8.5)
> ++cmake_minimum_required(VERSION 3.12)
> +
> + message(STATUS "path : ${CMAKE_FIND_ROOT_PATH}")
> + project(zlog)
> diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recip=
es-extended/zlog/zlog_1.2.16.bb
> deleted file mode 100644
> index f450c2cf01..0000000000
> --- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION =3D "Zlog is a pure C logging library"
> -HOMEPAGE =3D "https://github.com/HardySimpson/zlog"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> -
> -SRCREV =3D "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
> -SRC_URI =3D "git://github.com/HardySimpson/zlog;branch=3Dmaster;protocol=
=3Dhttps"
> -
> -
> -inherit pkgconfig
> -
> -EXTRA_OEMAKE =3D "CC=3D'${CC}' LD=3D'${LD}' LIBRARY_PATH=3D${baselib}"
> -
> -do_install() {
> -    oe_runmake install PREFIX=3D${D}${exec_prefix} INSTALL=3Dinstall
> -}
> diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb b/meta-oe/recip=
es-extended/zlog/zlog_1.2.18.bb
> new file mode 100644
> index 0000000000..48628ca733
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Zlog is a pure C logging library"
> +HOMEPAGE =3D "https://github.com/HardySimpson/zlog"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
> +
> +SRC_URI =3D "git://github.com/HardySimpson/zlog;branch=3Dmaster;protocol=
=3Dhttps;tag=3D${PV} \
> +           file://upgrade_cmake_minimum_version.patch"
> +SRCREV =3D "7fe61ca6265516e9327a51fc394b2adb126c2ef3"
> +
> +inherit cmake
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119719): https://lists.openembedded.org/g/openembedde=
d-devel/message/119719
> Mute This Topic: https://lists.openembedded.org/mt/115397698/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

