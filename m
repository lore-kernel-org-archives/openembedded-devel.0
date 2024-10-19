Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C4AD3C91A
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 15:25:43 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.8039.1729351543265757581
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 08:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TairJgqK;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e6089a1d39so326737b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729351542; x=1729956342; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/Sl6E1cjgxZd9C1p22p2Dx12U1Ms/i+9XQbrXrC2PM=;
        b=TairJgqKfNLGb5k42yXvyXDvpDLsOTQACOxFSsYA/L0Xv9Elvs2eVOdMmreyiCRml+
         MQ/+pwFrC3NHuFKPd+4RLRc8lGVu3VpjP+n1OHouAUC5tQHYyBhVyVNIZ+kALMRQPAKY
         4y6RKqEDFeJskHEjrlDcfyvhtem78IV2DrKM2DnLNlNJ95JnPQKFEQlGyj5cL6nwgrsV
         86p4rTo3eYwrW0ceGmvYuC4bQyhXiel8ABdyO1gtjFhlBvB7vqj5Trpsh8sxR8uiVROu
         qaXhKQiPydiGvZc1iTMPMU40dzS8rMKXlR/xVR4Eqh5h0EmsnevTn8iA8F5aoA3rFulZ
         JWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729351542; x=1729956342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/Sl6E1cjgxZd9C1p22p2Dx12U1Ms/i+9XQbrXrC2PM=;
        b=iX/EuV5hmTsNYbm/gZ7VQP+3ONtj5+0TFPAyH2h7nh1dGraTcsyxysxt6xNAY5oZ21
         YL+oB0sn7HRKHhJg3635oFkWaaGOfHlOGYrbZMYcTBoKf2jLMAek50p/BbzC79K16tcW
         cXtMfg9TEIuYBTpNvk8Sk52fqAVjWGWY6QqHMbzvg3N8tNBavzI7kfHWS997xSuaF6FM
         3X+7tv392nMlTiheAFFzIvssq+Zxee5KC9yWvPja7Z5Qxi37kUmXwEpPbPoPYLRMCyKt
         2WNiQ2UAOccGSks6cAva6QE2yzsRl1F1acIF7v+MrUTX+s3sO1pCaAlZiLr3ldqyzLAP
         tfMg==
X-Gm-Message-State: AOJu0Yy0P6HS7oXr+KWVgZzAUZxZ+EK36K1IpDWsglhNASpxpNAb603P
	35SJczYjC7Z8Xism5c79PAl0Sf7Bs5DkDLYqqJoIUvsBCKjiC+aV/Vtm5hGYOEry9a/Arm0He7u
	wOqdiBDvSlFk2YRNNheiQWjHlai0=
X-Google-Smtp-Source: AGHT+IEleaU7pTG7yRjakfApCpyQh/PGvFd9ch49qThR6TJ5jRt/K1Bn8hPq8LsC16a9UhupRoFwvzJnANXzuguCmg8=
X-Received: by 2002:a05:6808:1496:b0:3e5:de6d:71e0 with SMTP id
 5614622812f47-3e602dabf90mr4694443b6e.45.1729351542387; Sat, 19 Oct 2024
 08:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241019061945.146707-1-sanakazi720@gmail.com>
In-Reply-To: <20241019061945.146707-1-sanakazi720@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Oct 2024 08:25:15 -0700
Message-ID: <CAMKF1soE=3Vz=T7vNNv_Xjk_z+cFFA7z1wNpV-5Y+5DW4R0zJg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x
 releases the same
To: sanakazi720@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 15:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113059

On Sat, Oct 19, 2024 at 5:48=E2=80=AFAM Sana Kazi via lists.openembedded.or=
g
<sanakazi720=3Dgmail.com@lists.openembedded.org> wrote:
>
> OpenSSL's soversion will not change for any 3.x minor release.
>
> https://www.openssl.org/policies/general/versioning-policy.html
>
> Signed-off-by: Sana <sanakazi720@gmail.com>
> ---
>  .../0002-detect-correct-openssl-3.x.patch     | 28 +++++++++++++++++++
>  .../recipes-support/libp11/libp11_0.4.12.bb   |  4 ++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/libp11/files/0002-detect-corr=
ect-openssl-3.x.patch
>
> diff --git a/meta-oe/recipes-support/libp11/files/0002-detect-correct-ope=
nssl-3.x.patch b/meta-oe/recipes-support/libp11/files/0002-detect-correct-o=
penssl-3.x.patch
> new file mode 100644
> index 000000000..b56e2602d
> --- /dev/null
> +++ b/meta-oe/recipes-support/libp11/files/0002-detect-correct-openssl-3.=
x.patch
> @@ -0,0 +1,28 @@
> +From 74497e0fa5b69b15790d6697e1ebce13af842d4c Mon Sep 17 00:00:00 2001
> +From: Mike Gilbert <floppym@gentoo.org>
> +Date: Thu, 13 Jul 2023 13:52:54 -0400
> +Subject: [PATCH] configure: treat all openssl-3.x releases the same
> +
> +OpenSSL's soversion will not change for any 3.x minor release.
> +
> +https://www.openssl.org/policies/general/versioning-policy.html
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/74497=
e0fa5b69b15790d6697e1ebce13af842d4c.patch]
> +Signed-off-by: Sana Kazi sana.kazi@kpit.com
> +
> +diff --git a/configure.ac b/configure.ac
> +index b96979d9..c344e84a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -33,7 +33,7 @@ AC_C_BIGENDIAN
> + # issues with applications linking to new openssl, old libp11, and vice=
 versa
> + case "`$PKG_CONFIG --modversion --silence-errors libcrypto || \
> +        $PKG_CONFIG --modversion openssl`" in
> +-       3.0.*) # Predicted engines directory prefix for OpenSSL 3.x
> ++       3.*) # Predicted engines directory prefix for OpenSSL 3.x
> +            LIBP11_LT_OLDEST=3D"3"
> +            debian_ssl_prefix=3D"openssl-3.0.0";;
> +        1.1.*) # Predicted engines directory prefix for OpenSSL 1.1.x
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb b/meta-oe/re=
cipes-support/libp11/libp11_0.4.12.bb
> index 223778200..afab932a6 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
> @@ -9,7 +9,9 @@ LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfad9b3332be894bab9bc501572864=
b29"
>  DEPENDS =3D "libtool openssl"
>
> -SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;protocol=
=3Dhttps"
> +SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;protocol=
=3Dhttps \
> +    file://files/0002-detect-correct-openssl-3.x.patch \

Here the path won't be found and bitbake should complain about it
during parsing. How did you test this ?

> +"
>  SRCREV =3D "53d65dc48cf436694f7edcfc805414e608e8a2bf"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.\d+)+)"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113058): https://lists.openembedded.org/g/openembedde=
d-devel/message/113058
> Mute This Topic: https://lists.openembedded.org/mt/109099694/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

