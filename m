Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF8DC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 16:35:26 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.2875.1721234120355833747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 09:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsOgEB7w;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ce74defe42so700351eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721234119; x=1721838919; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fky5QOgVuekOHrPgemk93pER5g9VCyQdhbwNrhwJ1I=;
        b=nsOgEB7w3i0x5mI3rZjCcD4prWSSfxexfwyY1r2Ev77AYzRYWn1zdBLzUu9dW+tAWL
         +yooTSmi3EWq42F8R0PMfPz8McrYKm7N8PFEn7Ol+VE9oUlMhHyQQ9ew0LnjaVRhuls9
         TY81p8GxD3cSj1ZpH0x5uuyRPIvpcfrGQMxCjHvrihi2CgoE/niG8akf7+eCjQZTZtOF
         Z9PV/6nFiTfH0G/hQjns94w0MFD5CMFS3onG0RvpR8mEU7DoftKvM5WAYZ0bVs93bwCl
         QantovMreCMezqLrW0a3uxu/6G9HNdW/jP94iObf2gt2IgxJ7Pr2JWF3BF8sP5384mi8
         zk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721234119; x=1721838919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Fky5QOgVuekOHrPgemk93pER5g9VCyQdhbwNrhwJ1I=;
        b=VHCPoMRsaHY/KOs1j+RTjgFQPfbBoj2V7XbhfT4BQz88Ut28WXt/bQx+O8btuLzBk3
         Rxjuf5EbMDWadNDSQtE80TveqLVItmxwIPhnapSSGbzavkSUrOhgr63eEkOP9Dft23kX
         CT0UgOEyCl5MIISUWG1lmXIOjVxoSElUbL3RO6jErqKfpbCOTVrDiUMXHI7VIE4zuCl2
         lCe+KpVxExEkCwa4X9/NJzqWujPbrq5CnVvvXpWK3nDCcvasi2tovmSDIx5rFR0MEh6V
         pchjfQUhV+o2bsd0mFBPsXFpEeK4Tnby5Oi43wwygairQrDGrZvD9GEiR0JyO+c7zX10
         GRNg==
X-Gm-Message-State: AOJu0YyE3DD67i8WD0BUAMMUba/aQvitBRAxUIuriE7RBGo5Zsk8nkk6
	MyITD5z4btBHuVpHUF8rfC9g9WhKpB+x40U1t0ZVldmcs3C1K1J3oDjG4wU1LNMa3cgEk1AiSBQ
	mfBu07h7MpO4LB0Lq5v5YRWVwss8=
X-Google-Smtp-Source: AGHT+IHOlie+r2Z7wPKBMvLJs5GcgpZaxpM9rjqoFvut3UJFrssIDlqeOgzdclwGal9S65EHdKEnjtoyOl/glUX2h/Y=
X-Received: by 2002:a05:6870:e3d4:b0:260:df77:2484 with SMTP id
 586e51a60fabf-260df776830mr1421998fac.13.1721234119457; Wed, 17 Jul 2024
 09:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <44e317f2-4858-4031-b95c-052d67ce3969@gmail.com>
In-Reply-To: <44e317f2-4858-4031-b95c-052d67ce3969@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jul 2024 09:34:52 -0700
Message-ID: <CAMKF1sp=q+YD8yJR1K6vKf7Nwm8sCZQuFcjN=R0JtGbGZMffPw@mail.gmail.com>
Subject: Re: scathgap merge request: July 17th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 16:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111382

merged, thanks Armin.

On Wed, Jul 17, 2024 at 6:00=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 78a14731cf0cf38a19ff8bd0e9255b319afaf3=
a7:
>
>    php: Upgrade to 8.2.20 (2024-06-26 07:33:55 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 18f939a5fb37528a5415b05077ece383c346a119:
>
>    libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage
> (2024-07-09 08:18:46 -0400)
>
> ----------------------------------------------------------------
> BINDU (1):
>        flatbuffers: adapt for cross-compilation environments
>
> Chen Qi (1):
>        libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage
>
> Libo Chen (1):
>        thin-provisioning-tools: install missed thin_shrink and era_repair
>
> Randy MacLeod (1):
>        python3-pyyaml-include: support native and nativesdk build
>
> Siddharth Doshi (1):
>        apache2: Upgrade 2.4.59 -> 2.4.60
>
> Vijay Anusuri (1):
>        krb5: upgrade 1.21.2 -> 1.21.3
>
> Wentao Zhang (1):
>        meta-oe/conf/layer.conf: remove libbpf from NON_MULTILIB_RECIPES
> for x86 and x86-64
>
>   meta-oe/conf/layer.conf                                         | 3 +++
>   .../krb5/{krb5_1.21.2.bb =3D> krb5_1.21.3.bb} |  4 +--
>   meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb             | 5 +++=
+
>   ...0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch | 40
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb        | 4 ++-
>   .../thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb   | 8 +++=
---
>   .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +-
>   .../apache2/{apache2_2.4.59.bb =3D> apache2_2.4.60.bb} |  2 +-
>   8 files changed, 60 insertions(+), 8 deletions(-)
>   rename meta-oe/recipes-connectivity/krb5/{krb5_1.21.2.bb =3D>
> krb5_1.21.3.bb} (97%)
>   create mode 100644
> meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-ru=
nning-assert_lib-at-configure.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb =3D>
> apache2_2.4.60.bb} (99%)

