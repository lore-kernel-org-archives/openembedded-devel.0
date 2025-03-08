Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F164C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 23:04:56 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.6103.1741475093485724548
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 15:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cM74KyJ1;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5fea43da18aso711860eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 15:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741475092; x=1742079892; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsqVKUeCX1SwDqamF4x5xu2d4SB2QOJ4NBb57Z8ZUvs=;
        b=cM74KyJ1rCZMLpCpgAcKGKOzv+c1RkIggr/rIMMkeU4j1QFgVYFLuQlxvc9IMDUZCe
         Vc1ORXJlXINkwAn95ImSIl810KbiG28ZRuo/tznixv1jm7dn69J2if3IUAIOmdfHaJEa
         hA2ZwTcdlyTEKkUGQjgGti2Vif8ORBIIOBW6npOgibd+cRTf8y2CCLL0R+PorCbUo+jK
         p/OEWmt884fLialPaaYHBEwmbMI4SBorvjfR8m5QzxdUGIw2srC93rnejH01ko1QQNWp
         yVBHcM/VS7i+stQW3MCuCIFzSP+5TbOSJKdQELs2HXidMlWQ4AAMUPG+hK3EeitE/oEM
         NsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741475092; x=1742079892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsqVKUeCX1SwDqamF4x5xu2d4SB2QOJ4NBb57Z8ZUvs=;
        b=bjxNZUW2UqgN3axGvj21bgLtg7tPEhrOF3qD74xyECpAEqBwcavJjj3sa5zRDQfrzl
         rX15UjQCQ/vsiWLj1Auz+pQ1lxLOmCTV4rnQ1POe4q/WwpR6Z9MaLYxKgLbP41TMrZYh
         j1xQVn1nQ0IawrkaF/KeJyTq3l2dqpppQhWqxYU5wfSzWg2STG+2FZ5kztsXvvFwqZ9c
         quq1bg8ZFcqe2p8H5p0ffUXX0/t2Ri8KgpAeFMDecHz5f9V/8MKb61UDZrDeQ22VoQP0
         6fdpJFA1NjJrdPKYycDLfWlJyM5jAOgjN38Edzgj7pvNjQw4+Shk779Sv2IPXIpB3J9B
         shgg==
X-Gm-Message-State: AOJu0Yz/Ct/60cUEey3hXJgve9trZXNQ9Eq17x/Va3hxPquQUJ7gPKDc
	AAk7btyjfgxSFicfczUL6zFewTVOxLnYKUH9qUxm5/oKrr8bs9omVRVEtd0M64IxJaoNROtN609
	CBIEj8RitUEzl8qEsbDdVXI6aPiE=
X-Gm-Gg: ASbGncv807CL857y7yZjHKvz6COZ8WQxOgWT+FqH7fa+TrikUfMVp5tcTAY1i8A84Zo
	MsosaTn7g/1ZQOJcMJBtaOJ3f9XASSXGwiEOOs7dcLvp4egAAv4zNJGhirYc14CKK4TtDFwWrXC
	YrClgLVvGMnsaJGYU6kgz9+Ac8Nw==
X-Google-Smtp-Source: AGHT+IEZ96kokrcr/VxbWpx0KwWjNMRgSfH6jC5kwQ1K8Q+L69KWlf8rtQsvJTFID/HUk/op8D6jMRW8Z+6Q+MqpVJI=
X-Received: by 2002:a05:6808:f0b:b0:3f7:4b65:582f with SMTP id
 5614622812f47-3f74b655ae4mr759917b6e.17.1741475092511; Sat, 08 Mar 2025
 15:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com> <20250307093255.1110778-2-awais.belal@gmail.com>
In-Reply-To: <20250307093255.1110778-2-awais.belal@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Mar 2025 15:04:25 -0800
X-Gm-Features: AQ5f1JrEhxN5qbBm5UfQBlF1eRimaXqP3-geir2tH5fLDMx7nb-w9fXIEGYrZvs
Message-ID: <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: awais.belal@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 23:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115810

I am seeing this  build failure on master

| File "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-p=
oky-linux/mongodb/4.4.29/git/src/mongo/base/generate_error_codes.py",
line 31, in <module>
| from Cheetah.Template import Template
| File "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-p=
oky-linux/mongodb/4.4.29/recipe-sysroot-native/usr/lib/python3.13/site-pack=
ages/Cheetah/Template.py",
line 24, in <module>
| import cgi # Used by .webInput() if the template is a CGI script.
| ^^^^^^^^^^
| ModuleNotFoundError: No module named 'cgi'
| Generating build/59f4f0dd/mongo/db/repl/repl_settings_gen.cpp
| scons: *** [build/59f4f0dd/mongo/base/error_codes.h] Error 1
| scons: building terminated because of errors.
| build/59f4f0dd/mongo/base/error_codes.h failed: Error 1

For details see

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/441/step=
s/15/logs/stdio

On Fri, Mar 7, 2025 at 1:33=E2=80=AFAM Awais Belal via lists.openembedded.o=
rg
<awais.belal=3Dgmail.com@lists.openembedded.org> wrote:
>
> Move on to 4.4.29 and drop a patch that is not applicable anymore.
>
> Signed-off-by: Awais Belal <awais.belal@gmail.com>
> ---
>  ...001-free_mon-Include-missing-cstdint.patch | 28 -------------------
>  .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++---
>  2 files changed, 3 insertions(+), 32 deletions(-)
>  delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongod=
b/mongodb/0001-free_mon-Include-missing-cstdint.patch
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/met=
a-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.=
patch
> deleted file mode 100644
> index 8cee14889f..0000000000
> --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001=
-free_mon-Include-missing-cstdint.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 5d8218b8a1b5bc71e2a0cf543a000e194daba599 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 29 Jan 2023 17:15:30 -0800
> -Subject: [PATCH] free_mon: Include missing <cstdint>
> -
> -gcc 13 moved some includes around and as a result <cstdint> is no
> -longer transitively included [1]. Explicitly include it
> -for uintXX_t.
> -
> -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - src/mongo/db/free_mon/free_mon_options.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> ---- a/src/mongo/db/free_mon/free_mon_options.h
> -+++ b/src/mongo/db/free_mon/free_mon_options.h
> -@@ -29,6 +29,7 @@
> -
> - #pragma once
> -
> -+#include <cstdint>
> - #include <string>
> - #include <vector>
> -
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_=
git.bb
> index f7fd881713..5d904dd4f9 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
> @@ -11,9 +11,9 @@ DEPENDS =3D "openssl libpcap zlib boost curl python3 \
>
>  inherit scons dos2unix siteinfo python3native systemd useradd
>
> -PV =3D "4.4.24"
> -#v4.4.24
> -SRCREV =3D "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
> +PV =3D "4.4.29"
> +#v4.4.29
> +SRCREV =3D "89d6ffe6fc67b36fd47aff6425087003966588e3"
>  SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.4;protocol=
=3Dhttps \
>             file://0001-Tell-scons-to-use-build-settings-from-environment=
-va.patch \
>             file://0001-Use-long-long-instead-of-int64_t.patch \
> @@ -32,7 +32,6 @@ SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=
=3Dv4.4;protocol=3Dhttps \
>             file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageB=
yte.patch \
>             file://0001-server-Adjust-the-cache-alignment-assumptions.pat=
ch \
>             file://0001-The-std-lib-unary-binary_function-base-classes-ar=
e-d.patch \
> -           file://0001-free_mon-Include-missing-cstdint.patch \
>             file://0001-apply-msvc-workaround-for-clang-16.patch \
>             file://0001-Fix-type-mismatch-on-32bit-arches.patch \
>             file://0001-Fix-build-on-32bit.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115781): https://lists.openembedded.org/g/openembedde=
d-devel/message/115781
> Mute This Topic: https://lists.openembedded.org/mt/111564957/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

