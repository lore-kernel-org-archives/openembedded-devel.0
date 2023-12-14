Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1764C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 18:00:50 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.29793.1702576844575733674
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 10:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2i2nA9f;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59082c4aadaso4576028eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 10:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702576844; x=1703181644; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GneXT4cH3+nknV3go7tp2d3i3wpdIxBGvAJfWgiuaA4=;
        b=I2i2nA9f3RpOSZ2gERZawxY4KFJYZLAOMIHFipFyuwMwmi3WclkxP3kWwKl6DuTfxf
         5+1PfIIhqaJT1itoMLGiI2yS8TmkdbGhBXEdBcXQaaln7P4NAbIut4olyAnuOYquqE/0
         Phme5GtVMLl85+nlZZg4k9xz8nGth1nNN7YbxiBmaFwEeBorW1NMYg+zrEZioAxsrBal
         FUu5Ky046vJmpqoeG+YZgPOtGKQta7PbZWnlcvlCmVYrw74cpUpeLLKkZhytfwbc4NFp
         8CMAI8uekLmfzSjwxPSXZMwbonKcIaBEHH5nQjk64EMc5+bJsSB41DZ1tn3CTOvZa+lv
         48PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576844; x=1703181644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GneXT4cH3+nknV3go7tp2d3i3wpdIxBGvAJfWgiuaA4=;
        b=fZbGtHHAGBFtPGjdWOs2LgMu5POCRIS0I/v5UPPZ2xUpcQ70c3CmF6+DpK7z3aBg/P
         r1DX3GfeazBnqxHQb3+H31ThrEmeKstjEiSbzPzo92jih+IbalNT6d4W2ZhsMFsDwgDF
         mOtQCQXDxnhyDx77C/60EqE8pBMQtn9TcBV4quXn6tJGhg2Aa6ij6Vi2zrH2OcAmXPe0
         A1mXSEH/8xQjgUWhrvLH4QdK51UVDh4SeOqw8BpnJ5Obbn1olTxitNnPh6tfCFL0Kxnd
         nnmsZy2lH76FcrBOwEAljPn3hk+sorYK5u1t8Jyvu7xA6tZaeOuQjfCm+0pP6LKeTCWm
         sHdg==
X-Gm-Message-State: AOJu0Yzmd/QQSxI276GAbbhmSTF2mxexy62MhJ8UlCZocROpveAAqcKr
	vGGAuI3r4EaKjYSi3VQn0/ViAAszpsoKa0Qi093/pHSY
X-Google-Smtp-Source: AGHT+IFG/uyp0ccGRnLimGW66uFUs9jBA732dvtYgttOm3rmXDejut6NudpXTXLCJUfNtlsv7k/eEHaZeO57uIt1o2I=
X-Received: by 2002:a05:6871:710:b0:203:2bc2:24c1 with SMTP id
 f16-20020a056871071000b002032bc224c1mr3419045oap.70.1702576843712; Thu, 14
 Dec 2023 10:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20231214162338.1753262-1-derek@asterius.io>
In-Reply-To: <20231214162338.1753262-1-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 10:00:17 -0800
Message-ID: <CAMKF1soQR+Z1JEaTeUEnz9rfAmCyRniL-Ps+mJZ3iXPAd4fBYg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] nginx: update versions for both the
 stable branch and mainline
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107465

Derek

Please rebase it on master-next and resend please. Portion of patch is
not needed as it has been covered by another pull.

On Thu, Dec 14, 2023 at 8:23=E2=80=AFAM Derek Straka <derek@asterius.io> wr=
ote:
>
> Mainline version 1.25.2 -> 1.25.3
> Stable: None -> 1.24.0
> Legacy Mainline 1.21.1 -> Removed
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 10 ----------
>  meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |  6 ++++++
>  meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb |  6 ------
>  meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb |  9 +++++++++
>  4 files changed, 15 insertions(+), 16 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.21.1.bb
> deleted file mode 100644
> index b69fd7dab..000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require nginx.inc
> -
> -# 1.20.x branch is the current stable branch, the recommended default
> -# 1.21.x is the current mainline branches containing all new features
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D206629dc7c7b3e87acb31162363ae=
505"
> -
> -SRC_URI[md5sum] =3D "7dce9e2136ec32dfd823736e871815b1"
> -SRC_URI[sha256sum] =3D "68ba0311342115163a0354cad34f90c05a7e8bf689dc498a=
bf07899eda155560"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.24.0.bb
> new file mode 100644
> index 000000000..2e865e400
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D175abb631c799f54573dc481454c8=
632"
> +
> +SRC_URI[sha256sum] =3D "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a=
940283e30ff2f55d"
> +
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.25.2.bb
> deleted file mode 100644
> index 66eef2389..000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require nginx.inc
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79ad2eb837299421c4435dedc8897=
b3d"
> -
> -SRC_URI[sha256sum] =3D "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7=
a801ba158d6c0711"
> -
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.25.3.bb
> new file mode 100644
> index 000000000..e893fc3a0
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
> @@ -0,0 +1,9 @@
> +require nginx.inc
> +
> +# 1.24.x branch is the current stable branch, the recommended default
> +# 1.25.x is the current mainline branches containing all new features
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79ad2eb837299421c4435dedc8897=
b3d"
> +
> +SRC_URI[sha256sum] =3D "64c5b975ca287939e828303fa857d22f142b251f17808dfe=
41733512d9cded86"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107452): https://lists.openembedded.org/g/openembedde=
d-devel/message/107452
> Mute This Topic: https://lists.openembedded.org/mt/103172966/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

