Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52152C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 04:25:15 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.4843.1738729512415004492
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 20:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3Yc5mz8;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71e2bb84fe3so3255313a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 20:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738729511; x=1739334311; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntAQUAIDKLLc2ZbzPkpfSQYdFAxQ1eSZpDYbjuRqAVI=;
        b=K3Yc5mz81lTN8BLAG5JDb2eItcTrIEd+tdBfW0TYta8Q0Cq7Yio5rewKMipjPAlTf3
         pJrO7c98+5OViw+rKQsHBVcYn5WO4laT6luRoSFQ/y5n6cn1tDfzSjiCZsITRl1ZZhNk
         uPKqdhnaqYZq3zdAm8R4rDdYdCymdVV5NCLF+TcFmR4HaqVa4vjmsPbyZnZi7/koyZ6Y
         2Gewwv/SAlNt2E0dOGIridCxuRxnYLonzfsVUXiAGlZEvTiaoKEY+IJMwuFck5Hlg+3Q
         0XPAovJ3jFYqWmlTVSE8nkvTQJqwCYqS1Juqb7m4Dz3B69ipiAbZ3cEirg9v8c1Bx9Rj
         AiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738729511; x=1739334311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntAQUAIDKLLc2ZbzPkpfSQYdFAxQ1eSZpDYbjuRqAVI=;
        b=rJUzIviY2tHmoPGiSHATWLRr2G7OX2bTwn79pqEieynYgwZKPzYSgiIoJQYqoCvh7x
         zVM9yf9W/dDq6KLj1d3SH4RqebjjILdIrEg+Nklw4I35wrTTyyZ7n0g7VwMoSdDjWuQB
         fkpXW0etkOFovZSGffj0ohDeLP+EAnO/L+BiWOU3PFwRceH3RtRnAyB7Mmo+boYn8ktX
         rmQaVcWqyEX2IJ9x9jd6HVL9OXTe9Cf+9x7UXeS5jcjquP2yw+TtARTE6lrKimXSzJuF
         nRWSgCYbvPTkTk5oNiSFXPBQ/dBZGJ5HglN9GV4CQXxSs3HutqW+8kprPqXYjlJ1e9gM
         yzWA==
X-Gm-Message-State: AOJu0YyM+LbIkRwn+qkCdYyk0LRD0Eox4PHr/aA0tQ68mRBgGwtch4Yr
	dZ8XcePWyeg6LXt+XnRuV8dTulFzfyPYsAVS8p+8uWtQk4kYpZY0O50bD012CmtuGkJs6FBikKX
	RX05Ndnrn1rxfJYScoNtNPIE4FpI=
X-Gm-Gg: ASbGncveJM3us45t/JvuRPs02bOaa9eAAUR15X/3qvZCbRu2P9jk52/tOOp1M4VEGiN
	x7Z65jXnUgGOhVfHhRzvIYPyPTWuVOTmdEryLN2RcPPnktxrJHEoA1jW001cF0zmyPrmAIedP+O
	fhMBP3gm16Xjk=
X-Google-Smtp-Source: AGHT+IGqmIwBAA977BIP2hNDz4JtZ5z/FOiu47l7hTSeGW7Rt3JMJ38KmXgAGCE4fVnHvgZpT/qMODDqAwyqNZTN8mA=
X-Received: by 2002:a05:6870:b148:b0:29f:b1d4:7710 with SMTP id
 586e51a60fabf-2b8051461e6mr932463fac.24.1738729511418; Tue, 04 Feb 2025
 20:25:11 -0800 (PST)
MIME-Version: 1.0
References: <11f7608b-0790-4b0f-96c4-398e92f761f7@gmail.com>
In-Reply-To: <11f7608b-0790-4b0f-96c4-398e92f761f7@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2025 20:24:43 -0800
X-Gm-Features: AWEUYZlFlrsod480yjQ6x2-7IDsgk5YxKAmzTRLcSyODMeBWSImP02sSbf5hctg
Message-ID: <CAMKF1sqTORJ_b-97c+qf=c5UNUfJvpKMgbbKNKRzOEYDKa5YcA@mail.gmail.com>
Subject: Re: Styhead merge request: Feb 4th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 04:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115280

Merged now thanks Armin

On Tue, Feb 4, 2025 at 2:36=E2=80=AFPM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 74b08dcbb1d0f4600527602804544c9d63697e=
bc:
>
>    libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
> (2025-01-16 09:17:32 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded styhead-next
>
> for you to fetch changes up to 6851cbf026088a13b2b45f684838d3dc4d7ccfdd:
>
>    lapack: fix buildpaths in ptest also when CBLAS is enabled
> (2025-02-04 14:29:37 -0800)
>
> ----------------------------------------------------------------
> Hieu Van Nguyen (1):
>        gphoto2: Fix /usr/bin/gphoto2 runtime error
>
> J=C3=B6rg Sommer (2):
>        libtinyxml: set CVE product to tinyxml
>        libtinyxml2: set CVE product to tinyxml2
>
> Khem Raj (1):
>        mpd: Upgrade mpd to 0.23.16
>
> Martin Jansa (2):
>        lapack: add PACKAGECONFIG for cblas
>        lapack: fix buildpaths in ptest also when CBLAS is enabled
>
> Peter Marko (11):
>        libtinyxml: patch CVE-2021-42260
>        libtinyxml: patch CVE-2023-34194
>        procmail: patch CVE-2014-3618
>        procmail: patch CVE-2017-16844.
>        audiofile: fix multiple CVEs
>        audiofile: patch CVE-2017-6829
>        audiofile: fix multiple CVEs
>        audiofile: patch CVE-2017-6831
>        audiofile: patch CVE-2017-6839
>        vorbis-tools: patch CVE-2023-43361
>        audiofile: mark CVE-2020-18781 as patched
>
> Zhang Peng (1):
>        lapack: fix TMPDIR reference in do_package_qa
>
>   .../mpd/0001-meson.build-support-building-with-ICU-76.patch     | 52
> ------------
>   .../musicpd/{mpd_0.23.15.bb =3D> mpd_0.23.16.bb} |   3 +-
>   .../vorbis-tools/vorbis-tools/CVE-2023-43361.patch              | 38
> +++++++++
>   .../recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb       | 1 +
>   meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb                | 43
> ++++++++++
>   meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb              | 6 +-
>   meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb         | 5 ++
>   .../files/0004-Always-check-the-number-of-coefficients.patch    | 46
> ++++++++++
>   ...05-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch | 43
> ++++++++++
>   .../0006-Check-for-multiplication-overflow-in-sfconvert.patch   | 79
> +++++++++++++++++
>   .../0007-Actually-fail-when-error-occurs-in-parseFormat.patch   | 46
> ++++++++++
>   ...8-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch | 126
> ++++++++++++++++++++++++++++
>   .../recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch  | 27
> ++++++
>   .../recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch  | 31
> +++++++
>   meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb          | 6 +-
>   meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb       | 1 +
>   meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch   | 29
> +++++++
>   meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch  | 20 ++=
+++
>   meta-oe/recipes-support/procmail/procmail_3.22.bb               | 5 +-
>   19 files changed, 547 insertions(+), 60 deletions(-)
>   delete mode 100644
> meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-b=
uilding-with-ICU-76.patch
>   rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.15.bb =3D>
> mpd_0.23.16.bb} (97%)
>   create mode 100644
> meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-433=
61.patch
>   create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-o=
f-coefficients.patch
>   create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix=
-index-overflow-in-IMA.cpp.patch
>   create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-=
overflow-in-sfconvert.patch
>   create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-=
occurs-in-parseFormat.patch
>   create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-=
overflow-in-MSADPCM-decodeS.patch
>   create mode 100644
> meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
>   create mode 100644
> meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
>   create mode 100644
> meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
>   create mode 100644
> meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
>

