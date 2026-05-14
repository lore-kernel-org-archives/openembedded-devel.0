Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99373CD4F21
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 02:24:36 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1878.1778725468984769546
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 19:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c2Rz5A+D;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65d071aac6eso7520163d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 19:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778725468; cv=none;
        d=google.com; s=arc-20240605;
        b=dSvYdOwoBH4hlKcDjIhMMaYdEMV5WShkvqw/8SjzQvWKsFap+c6PuYH/H7NdT7qg7Q
         bJxl74qZaf6g9/HR4BWpg4zgU7z7k4w3bIXi1LLmF6+rvOy5wBSYfyTWw7nDkarCjHLi
         kMsRjsUmMB+HNH9ZxQfsxfkJX1MUgBYK+QA3hRIQdIGJ9hXuldjsyfvXwxWEc4UMJ8CW
         tCUdv/hemcpnzOd5dKRdObzSFqZabAn1HbFx1g6gxPVzPeALJX8GaTIEPdHh14Scy7qb
         hednJ25xZ6wV7FXzE1sFZUMXHOLQXT6n5/xkgl/kaYXpuNc7yx6Ex1feVlh00IjiuVTB
         cqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y9psxWrKTmr6DYylFDmfUGBH7igdy6oWu6sUqzUWNGw=;
        fh=f4NlxIBSwQoArtotyhyFpk2rGoIL1VGzQMggZP03HHo=;
        b=eDC0X4Fwa+9Kb6C6aZUun7/Fy85UpAxMQOni/OOX504mMrcKTolGpJr6S+fZn/IWko
         HDfcvBgM8wIq326HUFE6NrOPrDiU9VNVzyVWQRGv02jHLbIrJGGz2GvDt73m0qrKB34g
         f9Pki5DwvQeiRxCdtDj4/Bbt2vGXyTfUOPXTv2uDmaAjhUJooxl1A/4LqX9P+GU3/0Vw
         Um3fwVR3bzpshvGJ8y7Qb6XFAFW3ZCCYeLmcsV8dC1Sz2BuCgCJWLO4vtVlCQe2oO97J
         zefgsIYjzSwk/WcpICkcHF5MjIcW2QzgMmfNNcLx7SALp3HqmAgeSnsG6p+DDW4Z7N7q
         MfLA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778725468; x=1779330268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y9psxWrKTmr6DYylFDmfUGBH7igdy6oWu6sUqzUWNGw=;
        b=c2Rz5A+DxA5L9d3kBPHhRAe/wgtHYvVJHqKyXY9ipR1tI1IG5nwBSvC1LesjnqBiI7
         PlvWHcA5w6T4SG3Ul419QnOaHAMWcJfRwRWtl8/HzMnT4Sx4xhjw1I+3kAnbcbahz6NH
         e+6Tk/HBO92H/voH8Qq0t2ONVkK77wu2F+EdcHoiDJf79JeijGDIIlkce+VCuryzymzG
         fDFVbWn7NXB1bXj0NKkLo6wefwrNfOr2r0Z4BEQSl3oD3nHH5fQ8qIYAqCU+ytQS/pio
         8zYB23KeDSr1VWMlbCXrK9ZO8BwnBWX6/swj8SVyF/SDkSf7uGq3xHpmBPDVHaiCqv26
         ZyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778725468; x=1779330268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9psxWrKTmr6DYylFDmfUGBH7igdy6oWu6sUqzUWNGw=;
        b=DIsIx2g97GOLPv6HPxcunZrNEyIJC/LMIcT7sUDw4cqeWopr19PiiWIP5qmgt4JJHQ
         AmM8jcbqiyKU9pRlywvQtcQDFLSXppYguYRSgl5dPjuQssx14jVR+QZF8Xzwia5b41iK
         IqlYUC2qmcOV91cxSvM3y82GN7+PLF8GAf/nB/fETnC82Xcv2f3xKautTcAH3UBrvVOQ
         ZJFPH21cN/XTsNXA7jx5jVCYWvNX8emNdtq6/wjjFJF/xVxSrAo8hsoC+kYnhTrOfSOW
         sMTNC67WeWPR/fjH6jAXU6zbewMCbiXMB+RKtTpB50j6vWSFz8h/5KSzs74oFK76ng+M
         jkUA==
X-Gm-Message-State: AOJu0Yxhczj6QMRHugLmhpKNJlCFJ0rvfzivGmpenSy71hz7OULH1l7J
	WWTzmkW1yFgaZP+Z4i3tV+o4ixnUbeRXUPvCErv6vhA/HvdU0cL5FG2lAlrt7IoqUyDFeqx7iyo
	6vcJjMcL6IPBzuWbXxHIBVnAT5lX0Nw0=
X-Gm-Gg: Acq92OHe+aHhW/i50v13D56i9lv2R98CpovrnI4QKXIxX+gzaZpvXsVUp5fYmaVU5Gg
	UVI0qrAaBSMv9mSBs4TMaokOAIpZf1Zr3UrIrIc1fm/5CxDqB/LHPB1uItZp+q+WjN4KAVMDVME
	x08JuI1Ek7YlYTilvLOkKj7iEbSSfv4yi+OpCY9csI1IgZpwGtkgYSo8Zj+0LVtDpH1fjstwvHt
	J/BsczDgQfnVKCBhSIsYI7ys+DHzOROMGRJ4cHZu3bvoq9nJZPBjCfE2/A5qrxuzfI9QZ1uJQ6u
	l3EFnuu0zeXRf2fRgt0KN/QQvOC0oUu90PuM8LT7Kr6dc9jPwLH6Gjcx3qHYONOlym02Qd/4ZmX
	IxZt/txNDFMD+/tgPsfAkzYUITi/VpuE0qDngcaDcwe8e9k7dBTKok+wpMlCUNtdvFH2CUPr5KJ
	MlbVNFGx63L6qkxdo=
X-Received: by 2002:a53:ac9a:0:b0:65c:b99:607a with SMTP id
 956f58d0204a3-65df82607f8mr5212132d50.38.1778725467902; Wed, 13 May 2026
 19:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260513092304.1177892-1-skandigraun@gmail.com>
 <CAMKF1sqp9hrU_+PUzo95fTP28_Hd_9g_ECON8Jb78BEqxxxTvg@mail.gmail.com> <a52a266f-a5d0-40bf-a307-10676231d477@gmail.com>
In-Reply-To: <a52a266f-a5d0-40bf-a307-10676231d477@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 19:24:02 -0700
X-Gm-Features: AVHnY4LUu3x1hQYks8bncOXmTo0jFhuW8tlMetRgSM9hPHpnUwgo-NfviQfVWyc
Message-ID: <CAMKF1sqWA=pDdjerOzXmbFhOsUYHzCchKjK7zx_WwmSR+qSR0Q@mail.gmail.com>
Subject: Re: [oe] Kirkstone pull request 13th May
To: skandigraun@gmail.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aad8100651bdcb3c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 02:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126981

--000000000000aad8100651bdcb3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 6:13=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> With this the upstream support for the Kirkstone branch of meta-oe is
> concluded.
>
> You can still send patches to the ML for others to benefit, but there
> are no plans to integrate any new patches into this branch.
>
> Thank you to all who contributed to this branch over its whole lifetime.
>

Thanks Armin and Gyorgy for maintaining this LTS for its lifetime.


>
>
> On 5/14/26 02:50, Khem Raj wrote:
> > Thanks Gyorgy, this is installed.
> >
> > On Wed, May 13, 2026 at 2:23=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <http://lists.openembedded.org>
> > <skandigraun=3Dgmail.com@lists.openembedded.org
> > <mailto:gmail.com@lists.openembedded.org>> wrote:
> >
> >     Some last minute fixes - thanks to all contributors.
> >
> >     Test artifacts:
> >     World build qemuarm: https://github.com/OldManYellsAtCloud/meta-oe-
> >     test/actions/runs/25286703147 <https://github.com/
> >     OldManYellsAtCloud/meta-oe-test/actions/runs/25286703147>
> >     World build qemuarm64: https://github.com/OldManYellsAtCloud/meta-
> >     oe-test/actions/runs/25289100851 <https://github.com/
> >     OldManYellsAtCloud/meta-oe-test/actions/runs/25289100851>
> >     World build qemux86: https://github.com/OldManYellsAtCloud/meta-oe-
> >     test/actions/runs/25290018061 <https://github.com/
> >     OldManYellsAtCloud/meta-oe-test/actions/runs/25290018061>
> >     World build qemux86-64: https://github.com/OldManYellsAtCloud/meta-
> >     oe-test/actions/runs/25290023412 <https://github.com/
> >     OldManYellsAtCloud/meta-oe-test/actions/runs/25290023412>
> >     YP layer compatibility: https://github.com/OldManYellsAtCloud/meta-
> >     oe-test/actions/runs/25261771118 <https://github.com/
> >     OldManYellsAtCloud/meta-oe-test/actions/runs/25261771118>
> >     Ptest execution (logs available at the link): https://github.com/
> >     OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207 <https://
> >     github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207=
>
> >
> >     The following changes since commit
> >     9d8ef26a9693e2c70ae34abe1a753873d42ec588:
> >
> >       libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)
> >
> >     are available in the Git repository at:
> >
> >       git://git.openembedded.org/meta-openembedded-contrib <http://
> >     git.openembedded.org/meta-openembedded-contrib> stable/kirkstone-nu=
t
> >
> >     for you to fetch changes up to
> ce8539c941f6fcbecaca4d16640ac105c0595589:
> >
> >       python3-soupsieve: fix tests with Python 3.10.20 (2026-05-04
> >     15:59:37 +0200)
> >
> >     ----------------------------------------------------------------
> >     Bhabu Bindu (1):
> >           neon: Backport redirect test debug improvements
> >
> >     Gyorgy Sarvari (16):
> >           python3-cbor2: return correct error code from run-ptest
> >           python3-cbor2: more patch indent and test fixes
> >           nginx: set CVE_PRODUCT
> >           tomoyo-tools: fix SRC_URI
> >           logwatch: fix SRC_URI
> >           dnfdragora: fix SRC_URI
> >           ipc-run: fix SRC_URI
> >           linux-atm: fix SRC_URI
> >           driverctl: fix SRC_URI
> >           libsodium: fix SRC_URI
> >           sblim-sfcc: fix SRC_URI
> >           ttf-sazanami: fix SRC_URI
> >           libubox: fix SRC_URI
> >           unicode-ucd: fix license hash (again)
> >           ttf-vlgothic: fix SRC_URI
> >           python3-soupsieve: fix tests with Python 3.10.20
> >
> >     Hitendra Prajapati (3):
> >           nginx: fix CVE-2026-27784, CVE-2026-28755
> >           nginx: fix multiple CVEs
> >           nginx: fix CVE-2026-32647
> >
> >     Jon Mason (1):
> >           python3-cbor2: Fix CVE-2025-68131 CVE patch error
> >
> >     Naman Jain (2):
> >           python3-protobuf: ignore CVE-2024-7254
> >           imagemagick: Fix CVE-2025-68950
> >
> >     Shaik Moin (1):
> >           imagemagick: Fix CVE-2025-62594
> >
> >     Tyler Park (1):
> >           fmt: Updated master->main in SRC_URI.
> >
> >     Vijay Anusuri (1):
> >           strongswan: Fix CVE-2026-25075
> >
> >     Zahir Hussain (1):
> >           rocksdb: fix typo in PACKAGECONFIG
> >
> >      .../recipes-support/linux-atm/linux-atm_2.5.2.bb <http://linux-
> >     atm_2.5.2.bb>   |   2 +-
> >      .../strongswan/files/CVE-2026-25075.patch          |  50 ++++++
> >      .../strongswan/strongswan_5.9.13.bb <http://strongswan_5.9.13.bb>
> >                   |   1 +
> >      .../recipes-crypto/libsodium/libsodium_1.0.18.bb <http://
> >     libsodium_1.0.18.bb>   |   2 +-
> >      meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb <http://
> >     rocksdb_6.20.3.bb>      |   2 +-
> >      meta-oe/recipes-devtools/libubox/libubox_git.bb <http://
> >     libubox_git.bb>    |   2 +-
> >      .../recipes-devtools/perl/ipc-run_20200505.0.bb <http://ipc-
> >     run_20200505.0.bb>    |   2 +-
> >      meta-oe/recipes-extended/logwatch/logwatch_7.6.bb <http://
> >     logwatch_7.6.bb>  |   2 +-
> >      .../sblim-sfcc/sblim-sfcc_2.2.8.bb <http://sblim-sfcc_2.2.8.bb>
> >                  |   2 +-
> >      .../dnfdragora/dnfdragora_2.1.2.bb <http://dnfdragora_2.1.2.bb>
> >                  |   2 +-
> >      .../ttf-fonts/ttf-sazanami_20040629.bb <http://ttf-
> >     sazanami_20040629.bb>             |   2 +-
> >      .../ttf-fonts/ttf-vlgothic_20200720.bb <http://ttf-
> >     vlgothic_20200720.bb>             |   2 +-
> >      .../tomoyo-tools/tomoyo-tools_2.5.0.bb <http://tomoyo-
> >     tools_2.5.0.bb>             |   2 +-
> >      .../recipes-support/driverctl/driverctl_0.111.bb <http://
> >     driverctl_0.111.bb>   |   2 +-
> >      meta-oe/recipes-support/fmt/fmt_8.1.1.bb <http://fmt_8.1.1.bb>
> >          |   2 +-
> >      .../imagemagick/files/CVE-2025-62594.patch         | 197 +++++++++=
+
> >     +++++++++++
> >      .../imagemagick/files/CVE-2025-68950.patch         |  24 +++
> >      .../imagemagick/imagemagick_7.0.10.bb <http://
> >     imagemagick_7.0.10.bb>              |   2 +
> >      .../0001-Temporarily-disable-no_redirect.patch     |  45 +++++
> >      ...-enabling-no_redirect-with-more-debugging.patch |  50 ++++++
> >      ...rect-Switch-to-using-double_serve_sstring.patch |  48 +++++
> >      .../neon/neon/0004-test-redirect.c-Cleanup.patch   |  49 +++++
> >      meta-oe/recipes-support/neon/neon_0.30.2.bb <http://
> >     neon_0.30.2.bb>        |   4 +
> >      .../unicode-ucd/unicode-ucd_14.0.0.bb <http://unicode-
> >     ucd_14.0.0.bb>              |   6 +-
> >      .../0001-fix-test-parameterization.patch           |  48 +++++
> >      .../python/python3-cbor2/CVE-2025-68131.patch      |  51 ++++--
> >      .../python/python3-cbor2/run-ptest                 |   3 +-
> >      .../recipes-devtools/python/python3-cbor2_5.4.2.bb <http://python3=
-
> >     cbor2_5.4.2.bb> |   1 +
> >      .../python/python3-protobuf_3.20.3.bb <http://python3-
> >     protobuf_3.20.3.bb>              |   3 +
> >      ...djustments-for-changes-in-HTML-parser-285.patch | 190 +++++++++=
+
> >     ++++++++++
> >      .../python/python3-soupsieve_2.3.1.bb <http://python3-
> >     soupsieve_2.3.1.bb>              |   8 +-
> >      .../nginx/nginx-1.24.0/CVE-2026-27651.patch        |  34 ++++
> >      .../nginx/nginx-1.24.0/CVE-2026-27654.patch        |  81 +++++++++
> >      .../nginx/nginx-1.24.0/CVE-2026-27784.patch        |  88 +++++++++
> >      .../nginx/nginx-1.24.0/CVE-2026-28753.patch        |  93 +++++++++=
+
> >      .../nginx/nginx-1.24.0/CVE-2026-28755.patch        |  48 +++++
> >      .../nginx/nginx-1.24.0/CVE-2026-32647.patch        |  78 ++++++++
> >      meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +
> >      meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb <http://
> >     nginx_1.24.0.bb> |   9 +
> >      39 files changed, 1199 insertions(+), 40 deletions(-)
> >      create mode 100644 meta-networking/recipes-support/strongswan/
> >     files/CVE-2026-25075.patch
> >      create mode 100644 meta-oe/recipes-support/imagemagick/files/
> >     CVE-2025-62594.patch
> >      create mode 100644 meta-oe/recipes-support/imagemagick/files/
> >     CVE-2025-68950.patch
> >      create mode 100644 meta-oe/recipes-support/neon/neon/0001-
> >     Temporarily-disable-no_redirect.patch
> >      create mode 100644 meta-oe/recipes-support/neon/neon/0002-Re-
> >     enabling-no_redirect-with-more-debugging.patch
> >      create mode 100644 meta-oe/recipes-support/neon/neon/0003-
> >     no_redirect-Switch-to-using-double_serve_sstring.patch
> >      create mode 100644 meta-oe/recipes-support/neon/neon/0004-test-
> >     redirect.c-Cleanup.patch
> >      create mode 100644 meta-python/recipes-devtools/python/python3-
> >     cbor2/0001-fix-test-parameterization.patch
> >      create mode 100644 meta-python/recipes-devtools/python/python3-
> >     soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch
> >      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0=
/
> >     CVE-2026-27651.patch
> >      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0=
/
> >     CVE-2026-27654.patch
> >      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0=
/
> >     CVE-2026-27784.patch
> >      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0=
/
> >     CVE-2026-28753.patch
> >      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0=
/
> >     CVE-2026-28755.patch
> >      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0=
/
> >     CVE-2026-32647.patch
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126980):
> https://lists.openembedded.org/g/openembedded-devel/message/126980
> Mute This Topic: https://lists.openembedded.org/mt/119294323/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aad8100651bdcb3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 13,=
 2026 at 6:13=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">With this =
the upstream support for the Kirkstone branch of meta-oe is<br>
concluded.<br>
<br>
You can still send patches to the ML for others to benefit, but there<br>
are no plans to integrate any new patches into this branch.<br>
<br>
Thank you to all who contributed to this branch over its whole lifetime.<br=
></blockquote><div><br></div><div>Thanks Armin and Gyorgy for maintaining t=
his LTS for its lifetime.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
<br>
On 5/14/26 02:50, Khem Raj wrote:<br>
&gt; Thanks Gyorgy, this is installed.<br>
&gt; <br>
&gt; On Wed, May 13, 2026 at 2:23=E2=80=AFAM Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;<a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</=
a>&gt;<br>
&gt; &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Some last minute fixes - thanks to all contributors=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Test artifacts:<br>
&gt;=C2=A0 =C2=A0 =C2=A0World build qemuarm: <a href=3D"https://github.com/=
OldManYellsAtCloud/meta-oe-" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/OldManYellsAtCloud/meta-oe-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0test/actions/runs/25286703147 &lt;<a href=3D"https:=
//github.com/" rel=3D"noreferrer" target=3D"_blank">https://github.com/</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0OldManYellsAtCloud/meta-oe-test/actions/runs/252867=
03147&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0World build qemuarm64: <a href=3D"https://github.co=
m/OldManYellsAtCloud/meta-" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/OldManYellsAtCloud/meta-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0oe-test/actions/runs/25289100851 &lt;<a href=3D"htt=
ps://github.com/" rel=3D"noreferrer" target=3D"_blank">https://github.com/<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0OldManYellsAtCloud/meta-oe-test/actions/runs/252891=
00851&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0World build qemux86: <a href=3D"https://github.com/=
OldManYellsAtCloud/meta-oe-" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/OldManYellsAtCloud/meta-oe-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0test/actions/runs/25290018061 &lt;<a href=3D"https:=
//github.com/" rel=3D"noreferrer" target=3D"_blank">https://github.com/</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0OldManYellsAtCloud/meta-oe-test/actions/runs/252900=
18061&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0World build qemux86-64: <a href=3D"https://github.c=
om/OldManYellsAtCloud/meta-" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/OldManYellsAtCloud/meta-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0oe-test/actions/runs/25290023412 &lt;<a href=3D"htt=
ps://github.com/" rel=3D"noreferrer" target=3D"_blank">https://github.com/<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0OldManYellsAtCloud/meta-oe-test/actions/runs/252900=
23412&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0YP layer compatibility: <a href=3D"https://github.c=
om/OldManYellsAtCloud/meta-" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/OldManYellsAtCloud/meta-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0oe-test/actions/runs/25261771118 &lt;<a href=3D"htt=
ps://github.com/" rel=3D"noreferrer" target=3D"_blank">https://github.com/<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0OldManYellsAtCloud/meta-oe-test/actions/runs/252617=
71118&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Ptest execution (logs available at the link): <a hr=
ef=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0OldManYellsAtCloud/meta-oe-test/actions/runs/253843=
96207 &lt;https://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/OldManYellsAtCloud/met=
a-oe-test/actions/runs/25384396207" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207</a>&gt;<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The following changes since commit<br>
&gt;=C2=A0 =C2=A0 =C2=A09d8ef26a9693e2c70ae34abe1a753873d42ec588:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 libssh: Fix CVE-2026-0964 (2026-03-29 11:11:=
33 +0200)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 git://<a href=3D"http://git.openembedded.org=
/meta-openembedded-contrib" rel=3D"noreferrer" target=3D"_blank">git.openem=
bedded.org/meta-openembedded-contrib</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/meta-openemb=
edded-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/me=
ta-openembedded-contrib</a>&gt; stable/kirkstone-nut<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0for you to fetch changes up to ce8539c941f6fcbecaca=
4d16640ac105c0595589:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 python3-soupsieve: fix tests with Python 3.1=
0.20 (2026-05-04<br>
&gt;=C2=A0 =C2=A0 =C2=A015:59:37 +0200)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---------------------------------------------------=
-------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bhabu Bindu (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 neon: Backport redirect test d=
ebug improvements<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Gyorgy Sarvari (16):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 python3-cbor2: return correct =
error code from run-ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 python3-cbor2: more patch inde=
nt and test fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 nginx: set CVE_PRODUCT<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 tomoyo-tools: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 logwatch: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 dnfdragora: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 ipc-run: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 linux-atm: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 driverctl: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 libsodium: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 sblim-sfcc: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 ttf-sazanami: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 libubox: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 unicode-ucd: fix license hash =
(again)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 ttf-vlgothic: fix SRC_URI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 python3-soupsieve: fix tests w=
ith Python 3.10.20<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hitendra Prajapati (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 nginx: fix CVE-2026-27784, CVE=
-2026-28755<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 nginx: fix multiple CVEs<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 nginx: fix CVE-2026-32647<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jon Mason (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 python3-cbor2: Fix CVE-2025-68=
131 CVE patch error<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Naman Jain (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 python3-protobuf: ignore CVE-2=
024-7254<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-6895=
0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Shaik Moin (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-6259=
4<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Tyler Park (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 fmt: Updated master-&gt;main i=
n SRC_URI.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Vijay Anusuri (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 strongswan: Fix CVE-2026-25075=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Zahir Hussain (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 rocksdb: fix typo in PACKAGECO=
NFIG<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/linux-atm/<a href=3D"http=
://linux-atm_2.5.2.bb" rel=3D"noreferrer" target=3D"_blank">linux-atm_2.5.2=
.bb</a> &lt;<a href=3D"http://linux-" rel=3D"noreferrer" target=3D"_blank">=
http://linux-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://atm_2.5.2.bb" rel=3D"noreferrer" =
target=3D"_blank">atm_2.5.2.bb</a>&gt;=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../strongswan/files/CVE-2026-25075.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../strongswan/<a href=3D"http://strongswan_5=
.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.13.bb</a> &lt=
;<a href=3D"http://strongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blan=
k">http://strongswan_5.9.13.bb</a>&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-crypto/libsodium/<a href=3D"http:=
//libsodium_1.0.18.bb" rel=3D"noreferrer" target=3D"_blank">libsodium_1.0.1=
8.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libsodium_1.0.18.bb" rel=3D"noref=
errer" target=3D"_blank">libsodium_1.0.18.bb</a>&gt;=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-dbs/rocksdb/<a href=3D"http:/=
/rocksdb_6.20.3.bb" rel=3D"noreferrer" target=3D"_blank">rocksdb_6.20.3.bb<=
/a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://rocksdb_6.20.3.bb" rel=3D"norefer=
rer" target=3D"_blank">rocksdb_6.20.3.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-devtools/libubox/<a href=3D"h=
ttp://libubox_git.bb" rel=3D"noreferrer" target=3D"_blank">libubox_git.bb</=
a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libubox_git.bb" rel=3D"noreferrer=
" target=3D"_blank">libubox_git.bb</a>&gt;=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-devtools/perl/<a href=3D"http://i=
pc-run_20200505.0.bb" rel=3D"noreferrer" target=3D"_blank">ipc-run_20200505=
.0.bb</a> &lt;<a href=3D"http://ipc-" rel=3D"noreferrer" target=3D"_blank">=
http://ipc-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://run_20200505.0.bb" rel=3D"norefer=
rer" target=3D"_blank">run_20200505.0.bb</a>&gt;=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-extended/logwatch/<a href=3D"=
http://logwatch_7.6.bb" rel=3D"noreferrer" target=3D"_blank">logwatch_7.6.b=
b</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://logwatch_7.6.bb" rel=3D"noreferre=
r" target=3D"_blank">logwatch_7.6.bb</a>&gt;=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../sblim-sfcc/<a href=3D"http://sblim-sfcc_2=
.2.8.bb" rel=3D"noreferrer" target=3D"_blank">sblim-sfcc_2.2.8.bb</a> &lt;<=
a href=3D"http://sblim-sfcc_2.2.8.bb" rel=3D"noreferrer" target=3D"_blank">=
http://sblim-sfcc_2.2.8.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dnfdragora/<a href=3D"http://dnfdragora_2=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_2.1.2.bb</a> &lt;<=
a href=3D"http://dnfdragora_2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">=
http://dnfdragora_2.1.2.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../ttf-fonts/<a href=3D"http://ttf-sazanami_=
20040629.bb" rel=3D"noreferrer" target=3D"_blank">ttf-sazanami_20040629.bb<=
/a> &lt;<a href=3D"http://ttf-" rel=3D"noreferrer" target=3D"_blank">http:/=
/ttf-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://sazanami_20040629.bb" rel=3D"nore=
ferrer" target=3D"_blank">sazanami_20040629.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../ttf-fonts/<a href=3D"http://ttf-vlgothic_=
20200720.bb" rel=3D"noreferrer" target=3D"_blank">ttf-vlgothic_20200720.bb<=
/a> &lt;<a href=3D"http://ttf-" rel=3D"noreferrer" target=3D"_blank">http:/=
/ttf-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://vlgothic_20200720.bb" rel=3D"nore=
ferrer" target=3D"_blank">vlgothic_20200720.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../tomoyo-tools/<a href=3D"http://tomoyo-too=
ls_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">tomoyo-tools_2.5.0.bb</a>=
 &lt;<a href=3D"http://tomoyo-" rel=3D"noreferrer" target=3D"_blank">http:/=
/tomoyo-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://tools_2.5.0.bb" rel=3D"noreferrer=
" target=3D"_blank">tools_2.5.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/driverctl/<a href=3D"http=
://driverctl_0.111.bb" rel=3D"noreferrer" target=3D"_blank">driverctl_0.111=
.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://driverctl_0.111.bb" rel=3D"norefe=
rrer" target=3D"_blank">driverctl_0.111.bb</a>&gt;=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-support/fmt/<a href=3D"http:/=
/fmt_8.1.1.bb" rel=3D"noreferrer" target=3D"_blank">fmt_8.1.1.bb</a> &lt;<a=
 href=3D"http://fmt_8.1.1.bb" rel=3D"noreferrer" target=3D"_blank">http://f=
mt_8.1.1.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../imagemagick/files/CVE-2025-62594.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 197 ++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../imagemagick/files/CVE-2025-68950.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../imagemagick/<a href=3D"http://imagemagick=
_7.0.10.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.0.10.bb</a> =
&lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"nor=
eferrer" target=3D"_blank">imagemagick_7.0.10.bb</a>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../0001-Temporarily-disable-no_redirect.patc=
h=C2=A0 =C2=A0 =C2=A0|=C2=A0 45 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...-enabling-no_redirect-with-more-debugging.=
patch |=C2=A0 50 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...rect-Switch-to-using-double_serve_sstring.=
patch |=C2=A0 48 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../neon/neon/0004-test-redirect.c-Cleanup.pa=
tch=C2=A0 =C2=A0|=C2=A0 49 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-support/neon/<a href=3D"http:=
//neon_0.30.2.bb" rel=3D"noreferrer" target=3D"_blank">neon_0.30.2.bb</a> &=
lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://neon_0.30.2.bb" rel=3D"noreferrer=
" target=3D"_blank">neon_0.30.2.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../unicode-ucd/<a href=3D"http://unicode-ucd=
_14.0.0.bb" rel=3D"noreferrer" target=3D"_blank">unicode-ucd_14.0.0.bb</a> =
&lt;<a href=3D"http://unicode-" rel=3D"noreferrer" target=3D"_blank">http:/=
/unicode-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://ucd_14.0.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">ucd_14.0.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../0001-fix-test-parameterization.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 48 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../python/python3-cbor2/CVE-2025-68131.patch=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 51 ++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../python/python3-cbor2/run-ptest=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-devtools/python/<a href=3D"http:/=
/python3-cbor2_5.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cbor2=
_5.4.2.bb</a> &lt;<a href=3D"http://python3-" rel=3D"noreferrer" target=3D"=
_blank">http://python3-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://cbor2_5.4.2.bb" rel=3D"noreferrer=
" target=3D"_blank">cbor2_5.4.2.bb</a>&gt; |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../python/<a href=3D"http://python3-protobuf=
_3.20.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_3.20.3.bb=
</a> &lt;<a href=3D"http://python3-" rel=3D"noreferrer" target=3D"_blank">h=
ttp://python3-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://protobuf_3.20.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">protobuf_3.20.3.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...djustments-for-changes-in-HTML-parser-285.=
patch | 190 ++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../python/<a href=3D"http://python3-soupsiev=
e_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve_2.3.1.bb=
</a> &lt;<a href=3D"http://python3-" rel=3D"noreferrer" target=3D"_blank">h=
ttp://python3-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://soupsieve_2.3.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">soupsieve_2.3.1.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27651.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27654.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 81 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27784.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 88 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../nginx/nginx-1.24.0/CVE-2026-28753.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 93 ++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../nginx/nginx-1.24.0/CVE-2026-28755.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 48 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../nginx/nginx-1.24.0/CVE-2026-32647.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 ++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-webserver/recipes-httpd/nginx/<a href=3D=
"http://nginx_1.24.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.24.0.=
bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://nginx_1.24.0.bb" rel=3D"noreferre=
r" target=3D"_blank">nginx_1.24.0.bb</a>&gt; |=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A039 files changed, 1199 insertions(+), 40 dele=
tions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-networking/recipes-su=
pport/strongswan/<br>
&gt;=C2=A0 =C2=A0 =C2=A0files/CVE-2026-25075.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/im=
agemagick/files/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2025-62594.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/im=
agemagick/files/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2025-68950.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/ne=
on/neon/0001-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Temporarily-disable-no_redirect.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/ne=
on/neon/0002-Re-<br>
&gt;=C2=A0 =C2=A0 =C2=A0enabling-no_redirect-with-more-debugging.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/ne=
on/neon/0003-<br>
&gt;=C2=A0 =C2=A0 =C2=A0no_redirect-Switch-to-using-double_serve_sstring.pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/ne=
on/neon/0004-test-<br>
&gt;=C2=A0 =C2=A0 =C2=A0redirect.c-Cleanup.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-python/recipes-devtoo=
ls/python/python3-<br>
&gt;=C2=A0 =C2=A0 =C2=A0cbor2/0001-fix-test-parameterization.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-python/recipes-devtoo=
ls/python/python3-<br>
&gt;=C2=A0 =C2=A0 =C2=A0soupsieve/0001-Adjustments-for-changes-in-HTML-pars=
er-285.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-webserver/recipes-htt=
pd/nginx/nginx-1.24.0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-27651.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-webserver/recipes-htt=
pd/nginx/nginx-1.24.0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-27654.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-webserver/recipes-htt=
pd/nginx/nginx-1.24.0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-27784.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-webserver/recipes-htt=
pd/nginx/nginx-1.24.0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-28753.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-webserver/recipes-htt=
pd/nginx/nginx-1.24.0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-28755.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-webserver/recipes-htt=
pd/nginx/nginx-1.24.0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-32647.patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126980): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126980" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126980</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119294323/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119294323/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000aad8100651bdcb3c--

