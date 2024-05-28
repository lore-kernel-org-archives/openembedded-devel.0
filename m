Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B6AC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 15:46:23 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.25660.1716911181018018384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 08:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgzDJYwI;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d1bf6d156cso551036b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716911180; x=1717515980; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15TppIGy3vPB13y/i9UFLDvbismydBBQjlXCGX/hNpI=;
        b=bgzDJYwILSgQd5uV/9c7pJXIjms9V6MOrkYIeSJ/qVTPyir7TGc2/pUQDGer/SypMY
         NcHes6Tb694O6n+84KyD4cu0E5vkLF3RAKo/OyWCS/KFWwKpYzZYEcTdhwqHborq5HlE
         AQNjpoLb008ALr7ZfY0G6BrMxscUvctCw68lQJ1loGzGgBl9MKDcQWpuP/l46VpB6oi2
         HxXWq6kYXtxhG6jTfxpyTpEzH9sRQrCN9LFDkpzbDpbyV6ZI0710DPyojWEgltCmnGfV
         dEwLFANJEwmXPZu98f9NPG9469PnJMsxgs+8XF54GI4bl0fVR3EOWs7Y8U3JNiFw1Lz8
         oIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716911180; x=1717515980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15TppIGy3vPB13y/i9UFLDvbismydBBQjlXCGX/hNpI=;
        b=ZoZUQSYJeNzdMjyBsm4iSEcjLZLfrMH4GgtrOBrVFVdiYy4ivpwsEsIKAjzPJV+/Ty
         ZQhVsbe9vbe0ZNVJg2amwN/GcdESAI5ddPNyRLjz1zyq0cc/u621f7/nOnTt0kZC73Hy
         veiuxZwObwE+jfctIvbBkSyPhGmfHRrI+0144v+xZAdsKzJdd3Qx2d+oux0wveKgpLE2
         Ls9ax0BjVwsRtu9b8bdBBDhPmvUbfjlhpDpQcO//IRgK5k+4Mf3pzfZj1LoEPvAnS8Rh
         VcgWLTkvlV5bB82gS2pyWVpUq/vQJQTrLTw0j56v4g8K+pc57QAYKmYarRpPvA8VhdHw
         R+HQ==
X-Gm-Message-State: AOJu0YxmLCDh+LcKxm5KG/FcGIEi6xSjj9zJS0qvJqq27VEy1D72Z/yw
	4MMzA885ssIruZWEFlPegrjcB/b3IIYoT3p8GS+x0Tm+5JwSSHbpCauNAH03eOo1CtKL7eebCMj
	/e/Kh/DUkXorGk84aP/iGUyi9a2M6BWeDPjo=
X-Google-Smtp-Source: AGHT+IGh+FUPxapXtrNMx+vPqqx7ZnzfHQFvDghXQR1cV3teI4DlYrbRvjg1gDn1gaR8jhSrZXKbozQiwFHHYXpJ1Wk=
X-Received: by 2002:a05:6808:1585:b0:3d1:bc35:10b8 with SMTP id
 5614622812f47-3d1bc3510ccmr10810233b6e.52.1716911179921; Tue, 28 May 2024
 08:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <b1a6597a-0aa1-43cb-99a2-9894ac502123@gmail.com>
In-Reply-To: <b1a6597a-0aa1-43cb-99a2-9894ac502123@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 May 2024 08:45:54 -0700
Message-ID: <CAMKF1sqX7tp6=XmX=ntBgxx79REaS8_vJuyNLP5wka9-ZCsOBA@mail.gmail.com>
Subject: Re: kirkstone merge request May 28th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110592

merged thanks Armin

On Tue, May 28, 2024 at 3:20=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 70b217ecc812296d98e1aa027a7d182a8019dd=
ed:
>
>    python3-pyyaml-include: Drop pytest --automake (2024-05-22 12:50:26
> -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 0560b848996a0feb410a8cd8ca07c60fe2f3b5bc:
>
>    ITS#10094 libldap/OpenSSL: fix setting ciphersuites (2024-05-28
> 06:17:26 -0400)
>
> ----------------------------------------------------------------
> Meenali Gupta (1):
>        nginx: fix CVE-2023-44487
>
> Peter Marko (3):
>        nss: patch CVE-2023-5388
>        nss: patch CVE-2024-0743
>        uriparser: upgrade 0.9.6 -> 0.9.8
>
> Priyal Doshi (1):
>        ITS#10094 libldap/OpenSSL: fix setting ciphersuites
>
> Soumya Sambu (1):
>        php: upgrade 8.1.22 -> 8.1.28
>
> Vivek Kumbhar (1):
>        nss: Backport fix CVE-2023-0767
>
> Yogita Urade (1):
>        mbedtls: upgrade 2.28.7->2.28.8
>
> akash hadke (1):
>        libeigen: Update GPL-3.0-only to GPL-2.0-only
>
> nikhil (1):
>        libssh: Fix CVE CVE-2023-6004
>
>   .../mbedtls/{mbedtls_2.28.7.bb =3D> mbedtls_2.28.8.bb} |   4 +-
>   meta-oe/recipes-devtools/php/{php_8.1.22.bb =3D> php_8.1.28.bb} |   2 +=
-
>   meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb              | 2 +-
>   ...1-config-Move-common-parser-functions-to-config_parser.patch | 464
> +++++++++++++++++++
>   meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch   | 30 ++
>   meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch   | 83 ++=
++
>   meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch   | 117
> +++++
>   meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch   | 57 ++=
+
>   meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch   | 142
> ++++++
>   meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch   | 117
> +++++
>   meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 7 +
>   ...1-Bug-1780432-CVE-2023-5388-Timing-attack-against-RSA-.patch | 681
> ++++++++++++++++++++++++++++
>   ...1-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch | 40 ++
>   meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch             | 102
> +++++
>   meta-oe/recipes-support/nss/nss_3.74.bb                         | 3 +
>   ...001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch | 69 ++=
+
>   meta-oe/recipes-support/openldap/openldap_2.5.16.bb             | 1 +
>   .../uriparser/{uriparser_0.9.6.bb =3D> uriparser_0.9.8.bb} |   2 +-
>   meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch   | 79 ++=
++
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 1 +
>   20 files changed, 1998 insertions(+), 5 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.7.bb
> =3D> mbedtls_2.28.8.bb} (93%)
>   rename meta-oe/recipes-devtools/php/{php_8.1.22.bb =3D> php_8.1.28.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-func=
tions-to-config_parser.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
>   create mode 100644
> meta-oe/recipes-support/nss/nss/0001-Bug-1780432-CVE-2023-5388-Timing-att=
ack-against-RSA-.patch
>   create mode 100644
> meta-oe/recipes-support/nss/nss/0001-Bug-1867408-add-a-defensive-check-fo=
r-large-ssl_DefS.patch
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
>   create mode 100644
> meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-=
fix-setting-ciphersuites.patch
>   rename meta-oe/recipes-support/uriparser/{uriparser_0.9.6.bb =3D>
> uriparser_0.9.8.bb} (84%)
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
>

