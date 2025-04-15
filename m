Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE00CC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 16:17:19 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.24417.1744733831801283505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 09:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0Ja9YYp;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fa0eb29cebso3793370b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744733831; x=1745338631; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmOdqiGHT8tfZT4MDVvpfJrlaNTvwSfqOKe0Lpt/W2c=;
        b=N0Ja9YYpg6X9EmdljFU42B7wmSQufom40vTTBbviPT314mCWA8xMUJgIRMemhqvCAl
         bHjzfryOY9TgqL5K9lA5lPko7ToaGcdbkjex/AqXYIcJPDdoI6BGw5hkU+yWorm5jz0P
         fXtRwca2Gq77E88zVFBdJpGgbEnuSSXeakzUpT4C08tHBfB4PlihJMd4lOw4cM7DNDPL
         kK9tBbN0HOT2DTdlNBsfffD9paueeuX3HKQz9VQjS9XBUaJrlDAwuuTqdzzYSy7598Vb
         zoS2alOSy84eR3JHeQ350niDOQKtSTejcdbWB00Xu7mIL+tFxF9bMyGixOIxv1afWgoI
         ez+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744733831; x=1745338631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmOdqiGHT8tfZT4MDVvpfJrlaNTvwSfqOKe0Lpt/W2c=;
        b=sqazJtFz9+Ak5sQjy2IrFAL2I87K2SCzS4jOaXhmCOD2g3/jd6PCksdseFfGUIf1uk
         +etFJc/CYZWAXYxNQdaDWrl6z2R6AAyVD1JXst4wmDSP9WVsGrtqWKYaLU2aoo2LyE4w
         rzbas7BoS7Gvs66DJSX7QakXfctf3LXtHfCOiHssvvAFxdiFMX6q3zzUg3hNeqxBenoI
         kNKB2SETCQY5PBS1+/vKEBUYCZ8KqXn3MFT5f5t2H4xnGh2VggvNjHLpzQoiQcmtkz2/
         hEm5BVbXv4rdeeTJpIY5Cr6cgZdnlUcDfqsA056s3SptjnND71qsqaH8AQDHI6DyMNVC
         Hl3w==
X-Gm-Message-State: AOJu0YwRV0LGZS+Ui7JPNoqmqsV3Kw6edNNFuTeUFId20WTTL5lkBI79
	PyFUTgsTtuZNsh7MCIbcdPYPmfgRrk1GpyHps6iQzbn5vzb1l+DrEut80/Ri/eL+2RSFpdf/GxE
	p121cEhhngcflkeeQFSaCOiEbhb0=
X-Gm-Gg: ASbGncvVLpAGQSZxD5wvL7D6RuDZfPz8t/NsebnuOI6W8PzGLzWG4Z2vNICo5KgYN5S
	fD2LCo5r18PnO0J5xFZvwjTi4t/2K1tmuKcpWnZaZDjYcxq35UTmKRMrQ2YPloy+ehl/3GOh2kL
	mZSOEzioKOkH/0G/wo7WRDig==
X-Google-Smtp-Source: AGHT+IFc0ExbBxklhO6sBW/97fl155Wuuf6NcpIjPlPwrGUrKLjCpNW0axs3jych+zcCFALHt0UdHwlBr7pFYKL2O6M=
X-Received: by 2002:a05:6808:1386:b0:3f9:aeb6:6e92 with SMTP id
 5614622812f47-400a42631damr2495603b6e.9.1744733830994; Tue, 15 Apr 2025
 09:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250415030838.9058-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250415030838.9058-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Apr 2025 09:16:43 -0700
X-Gm-Features: ATxdqUEYSGmuFxL9sAoOyoidpw6Nj_LMKzOnx2AZjnzaJwccNoJtei4nkbZx2uw
Message-ID: <CAMKF1so=N9j+zfGsx_FcomYYdeHXudP+xomMP4gw1yE0N4x6Lg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: A new logging library for C89-C++20
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 16:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116864

On Tue, Apr 15, 2025 at 3:08=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> - "simplelog-topic": A simple, stable, powerful of logging library.
> - Desc: https://github.com/thuanalg/simplelog-topic
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_git.bb          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelo=
g_git.bb
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> new file mode 100644
> index 000000000..0415bf485
> --- /dev/null
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -0,0 +1,21 @@
> +
> +SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful of logging librar=
y in ANSI C/C++. Ready for billion records."
> +DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o external dependencies."
> +HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517=
952ac7c"
> +
> +SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
> +
> +# Modify these as desired
> +PV =3D "1.0+git"

latest release seems to be
https://github.com/thuanalg/simplelog-topic/releases/tag/v1.0.3
so either bring that via the SRCREV below or using 1..0.3+git is
perhaps better for PV

> +SRCREV =3D "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116860): https://lists.openembedded.org/g/openembedde=
d-devel/message/116860
> Mute This Topic: https://lists.openembedded.org/mt/112273596/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

