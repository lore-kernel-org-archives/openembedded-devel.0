Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A11CD4F21
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 00:51:06 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.562.1778719864048555046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 17:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cDDJy8s7;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso5107878d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 17:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778719863; cv=none;
        d=google.com; s=arc-20240605;
        b=fEV8Zq7425BMr+kfbnkDu4+2HGhpiG1awDOJIBkZzI3x+R/NT2+zH3/W866dON/cfF
         QqDYS9+UXi7pG5ucZup7wWpT8IfwZm1u7D1uHumqkOaKvLewMAiVaVRZ2aPSpvUUfZrO
         V6dtyqCK5OsRXbYJTpb/lXAZD1OdWZZW3bs39QG9q1qe4BlBGpUUuV2CDSUYbiOYUFj9
         5Pnc8S06Bu2RfrNYta8RHi2RVlAWic9wSJrh38ZMxLwaevTg2mCdGYOxEv/oFmp0H/a9
         duwSS6sxncuABFT6IHu7pmdxLUiTPYA9bgZWo1rzstffr+dWtSRrfW5+zjGXptHukPzU
         iRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lbyrS+CPSoHrL/Kl3nitTQpnJc6I6uK57lKevG6yy8Y=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=MI3oET0QbaBS2lom3i5IxenuTLLDugvEeQGu7on/WrMbQs69yqdjB0i2z2QE/nNCFD
         8wQt1le9bsBX2PPRIdGDvkZwESlBNxamkhBQLI6v6dV9J9/PH915kyjt8Jf3SVjdzt61
         kZJdsaLyj8rknSBJO2o3h9Dsf899wZ85rbWbbIxqCfeJu2Kng4frjaopxNGHkjLqRWDN
         4eK7YlEs5cNnELGG1nvPbmi23dZyqQDD96FsRf1TpGOOXKEp8oDtDX8LtF6C69AR8kBW
         dsfS08GzkjS31vG6NaPu4oVxOkrEQ35rJlvKHjLzK1gYnjUv8oWvrHKW7K71TVL/5BPD
         GbhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778719863; x=1779324663; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbyrS+CPSoHrL/Kl3nitTQpnJc6I6uK57lKevG6yy8Y=;
        b=cDDJy8s7L1uI4CX9M0bjpkhenLpKlYmIpLhN73gG5zk8rBuRRarQ012d2lZzgtP85s
         74qJK5zXRUjTICbwQl4NeHqiR+kG2Hb8BsxwVD6oal/dn6kHiLBpY2BaUYfP6MGJIDFB
         eM5tXQ8sXlRXgpmagRQqW8rvjlA/WNqDuUSqOCawD2o6UTRLF1ffzvENORtcCMkXGsoy
         YFiRg+CEj4ZKIT1QH8qoo7kNRgh3tc5Fr96G4a1B2zZznfutaaswEzJ5pFo8w54914w3
         4GkD6hJUsAJ2OdQKW7vuCmedgK61CVRIVsup7ZKcxNGumBThoc9I9NrNep0K/vo747xH
         WQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778719863; x=1779324663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbyrS+CPSoHrL/Kl3nitTQpnJc6I6uK57lKevG6yy8Y=;
        b=LRGQvKjkobWqaqh/CR5LWpmrzPjcV5lhEGdthdwQiMe9Dnw7u3f9hzAUkfX/OVljzF
         WbnhIyad9H3x/YFZyYTvwezkIVUmiL1CY6vbveWejk7kc0Edqb1NomUt/qugYpQkfkOw
         TcrDGKZAhYsJWasgoZGtUYcafUO1do2w9eGGy9bHcebZEH36MOend+zksp+U5J+Uy7su
         Hbd/dspW4HPpXZkM0lfKMO1SowMpGKrUrgtHC5Bc+LDGl0yy8Mlxz2RX42szhcnLSYzd
         HLB98oAxVbaI7UFug+25wEQnPU+GARkcuod6afLf/WAvqAsI1k3C72cwCF3VhUEc720T
         jkhw==
X-Gm-Message-State: AOJu0YwMNzSqxe/qZgRseIH1zKNikiVqAGSoT398kHefx4ojIGc+a/GX
	Rp6kZueHT/FKODLP+o2qSG7qLz/gr07WcNHlp8H2vHix/zAZFdHZdycVWoLtu3z7Gr9Lo4C3apu
	QupU59BlTL176a88ukLzkhus3Ql0agEI=
X-Gm-Gg: Acq92OEtsvNJyBfJrVMRZZ1lTyk031bbxVgfIt6fj7fSLRUp0JpfxOoOe/TDtjkPMD2
	vWk5mJ6+k+x6Kd+HqIMOFBUK3Jll8XPzRnvMk+0rltw4dED0NgzY4EIh120mGf8Y/1CZppQ76+/
	2PWOJql3bh6AOXxffPhQkwI0YhypVn23lqoNAkkGL4mDO/XJuLfOAbbgWH5v22ksK0luIWO35w4
	bfc2Lyakfy2B4HSUxtuJg+4OOBloH2i4fsICKZV99XvFQrHJeHAwfDyh80xgOEZ+EGx5rS9HDuk
	9XFwOhQeVcSFiFo2tVy4DUFhtm4Cpphgl/OUYZK9AIWioE68X8PXZHwCgI+UK4rmVBlIb+0ZBMM
	GXKTby7v3iFZFs3g/YVJuKYwq9VlhQa5OvHv0ebmYG8lGlRLvjBqAXFbAZ3kP4QKAsOPM5g5qB/
	DGfQR1gPJzGVdFrFbiEw==
X-Received: by 2002:a05:690e:400b:b0:65c:3188:4453 with SMTP id
 956f58d0204a3-65df61fb829mr5590829d50.6.1778719862962; Wed, 13 May 2026
 17:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260513092304.1177892-1-skandigraun@gmail.com>
In-Reply-To: <20260513092304.1177892-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 17:50:36 -0700
X-Gm-Features: AVHnY4LFdbZ5oxMpr1uzef5IEmbD1Cn7URFS_yzPQEahfkS4zTp7B8SpPfa0-fc
Message-ID: <CAMKF1sqp9hrU_+PUzo95fTP28_Hd_9g_ECON8Jb78BEqxxxTvg@mail.gmail.com>
Subject: Re: [oe] Kirkstone pull request 13th May
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000963f6b0651bc7dd8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 00:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126979

--000000000000963f6b0651bc7dd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Gyorgy, this is installed.

On Wed, May 13, 2026 at 2:23=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Some last minute fixes - thanks to all contributors.
>
> Test artifacts:
> World build qemuarm:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/252867031=
47
> World build qemuarm64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/252891008=
51
> World build qemux86:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/252900180=
61
> World build qemux86-64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/252900234=
12
> YP layer compatibility:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/252617711=
18
> Ptest execution (logs available at the link):
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/253843962=
07
>
> The following changes since commit
> 9d8ef26a9693e2c70ae34abe1a753873d42ec588:
>
>   libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/kirkstone-nut
>
> for you to fetch changes up to ce8539c941f6fcbecaca4d16640ac105c0595589:
>
>   python3-soupsieve: fix tests with Python 3.10.20 (2026-05-04 15:59:37
> +0200)
>
> ----------------------------------------------------------------
> Bhabu Bindu (1):
>       neon: Backport redirect test debug improvements
>
> Gyorgy Sarvari (16):
>       python3-cbor2: return correct error code from run-ptest
>       python3-cbor2: more patch indent and test fixes
>       nginx: set CVE_PRODUCT
>       tomoyo-tools: fix SRC_URI
>       logwatch: fix SRC_URI
>       dnfdragora: fix SRC_URI
>       ipc-run: fix SRC_URI
>       linux-atm: fix SRC_URI
>       driverctl: fix SRC_URI
>       libsodium: fix SRC_URI
>       sblim-sfcc: fix SRC_URI
>       ttf-sazanami: fix SRC_URI
>       libubox: fix SRC_URI
>       unicode-ucd: fix license hash (again)
>       ttf-vlgothic: fix SRC_URI
>       python3-soupsieve: fix tests with Python 3.10.20
>
> Hitendra Prajapati (3):
>       nginx: fix CVE-2026-27784, CVE-2026-28755
>       nginx: fix multiple CVEs
>       nginx: fix CVE-2026-32647
>
> Jon Mason (1):
>       python3-cbor2: Fix CVE-2025-68131 CVE patch error
>
> Naman Jain (2):
>       python3-protobuf: ignore CVE-2024-7254
>       imagemagick: Fix CVE-2025-68950
>
> Shaik Moin (1):
>       imagemagick: Fix CVE-2025-62594
>
> Tyler Park (1):
>       fmt: Updated master->main in SRC_URI.
>
> Vijay Anusuri (1):
>       strongswan: Fix CVE-2026-25075
>
> Zahir Hussain (1):
>       rocksdb: fix typo in PACKAGECONFIG
>
>  .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |   2 +-
>  .../strongswan/files/CVE-2026-25075.patch          |  50 ++++++
>  .../strongswan/strongswan_5.9.13.bb                |   1 +
>  .../recipes-crypto/libsodium/libsodium_1.0.18.bb   |   2 +-
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb      |   2 +-
>  meta-oe/recipes-devtools/libubox/libubox_git.bb    |   2 +-
>  .../recipes-devtools/perl/ipc-run_20200505.0.bb    |   2 +-
>  meta-oe/recipes-extended/logwatch/logwatch_7.6.bb  |   2 +-
>  .../sblim-sfcc/sblim-sfcc_2.2.8.bb                 |   2 +-
>  .../dnfdragora/dnfdragora_2.1.2.bb                 |   2 +-
>  .../ttf-fonts/ttf-sazanami_20040629.bb             |   2 +-
>  .../ttf-fonts/ttf-vlgothic_20200720.bb             |   2 +-
>  .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |   2 +-
>  .../recipes-support/driverctl/driverctl_0.111.bb   |   2 +-
>  meta-oe/recipes-support/fmt/fmt_8.1.1.bb           |   2 +-
>  .../imagemagick/files/CVE-2025-62594.patch         | 197
> +++++++++++++++++++++
>  .../imagemagick/files/CVE-2025-68950.patch         |  24 +++
>  .../imagemagick/imagemagick_7.0.10.bb              |   2 +
>  .../0001-Temporarily-disable-no_redirect.patch     |  45 +++++
>  ...-enabling-no_redirect-with-more-debugging.patch |  50 ++++++
>  ...rect-Switch-to-using-double_serve_sstring.patch |  48 +++++
>  .../neon/neon/0004-test-redirect.c-Cleanup.patch   |  49 +++++
>  meta-oe/recipes-support/neon/neon_0.30.2.bb        |   4 +
>  .../unicode-ucd/unicode-ucd_14.0.0.bb              |   6 +-
>  .../0001-fix-test-parameterization.patch           |  48 +++++
>  .../python/python3-cbor2/CVE-2025-68131.patch      |  51 ++++--
>  .../python/python3-cbor2/run-ptest                 |   3 +-
>  .../recipes-devtools/python/python3-cbor2_5.4.2.bb |   1 +
>  .../python/python3-protobuf_3.20.3.bb              |   3 +
>  ...djustments-for-changes-in-HTML-parser-285.patch | 190
> ++++++++++++++++++++
>  .../python/python3-soupsieve_2.3.1.bb              |   8 +-
>  .../nginx/nginx-1.24.0/CVE-2026-27651.patch        |  34 ++++
>  .../nginx/nginx-1.24.0/CVE-2026-27654.patch        |  81 +++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-27784.patch        |  88 +++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-28753.patch        |  93 ++++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-28755.patch        |  48 +++++
>  .../nginx/nginx-1.24.0/CVE-2026-32647.patch        |  78 ++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +
>  meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |   9 +
>  39 files changed, 1199 insertions(+), 40 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
>  create mode 100644
> meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.pa=
tch
>  create mode 100644
> meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-=
debugging.patch
>  create mode 100644
> meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double=
_serve_sstring.patch
>  create mode 100644
> meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/0001-fix-test-parameter=
ization.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-soupsieve/0001-Adjustments-fo=
r-changes-in-HTML-parser-285.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27784.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126960):
> https://lists.openembedded.org/g/openembedded-devel/message/126960
> Mute This Topic: https://lists.openembedded.org/mt/119294323/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000963f6b0651bc7dd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Gyorgy, this is installed.</div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, May 13, 2026 at 2:23=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Some last minute fixes - thanks to all contributors.<br>
<br>
Test artifacts:<br>
World build qemuarm: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/25286703147" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25286703147</a>=
<br>
World build qemuarm64: <a href=3D"https://github.com/OldManYellsAtCloud/met=
a-oe-test/actions/runs/25289100851" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25289100851</=
a><br>
World build qemux86: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/25290018061" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25290018061</a>=
<br>
World build qemux86-64: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/25290023412" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25290023412<=
/a><br>
YP layer compatibility: <a href=3D"https://github.com/OldManYellsAtCloud/me=
ta-oe-test/actions/runs/25261771118" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25261771118<=
/a><br>
Ptest execution (logs available at the link): <a href=3D"https://github.com=
/OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/act=
ions/runs/25384396207</a><br>
<br>
The following changes since commit 9d8ef26a9693e2c70ae34abe1a753873d42ec588=
:<br>
<br>
=C2=A0 libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembe=
dded-contrib</a> stable/kirkstone-nut<br>
<br>
for you to fetch changes up to ce8539c941f6fcbecaca4d16640ac105c0595589:<br=
>
<br>
=C2=A0 python3-soupsieve: fix tests with Python 3.10.20 (2026-05-04 15:59:3=
7 +0200)<br>
<br>
----------------------------------------------------------------<br>
Bhabu Bindu (1):<br>
=C2=A0 =C2=A0 =C2=A0 neon: Backport redirect test debug improvements<br>
<br>
Gyorgy Sarvari (16):<br>
=C2=A0 =C2=A0 =C2=A0 python3-cbor2: return correct error code from run-ptes=
t<br>
=C2=A0 =C2=A0 =C2=A0 python3-cbor2: more patch indent and test fixes<br>
=C2=A0 =C2=A0 =C2=A0 nginx: set CVE_PRODUCT<br>
=C2=A0 =C2=A0 =C2=A0 tomoyo-tools: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 logwatch: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 dnfdragora: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 ipc-run: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 linux-atm: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 driverctl: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 libsodium: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 sblim-sfcc: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 ttf-sazanami: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 libubox: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 unicode-ucd: fix license hash (again)<br>
=C2=A0 =C2=A0 =C2=A0 ttf-vlgothic: fix SRC_URI<br>
=C2=A0 =C2=A0 =C2=A0 python3-soupsieve: fix tests with Python 3.10.20<br>
<br>
Hitendra Prajapati (3):<br>
=C2=A0 =C2=A0 =C2=A0 nginx: fix CVE-2026-27784, CVE-2026-28755<br>
=C2=A0 =C2=A0 =C2=A0 nginx: fix multiple CVEs<br>
=C2=A0 =C2=A0 =C2=A0 nginx: fix CVE-2026-32647<br>
<br>
Jon Mason (1):<br>
=C2=A0 =C2=A0 =C2=A0 python3-cbor2: Fix CVE-2025-68131 CVE patch error<br>
<br>
Naman Jain (2):<br>
=C2=A0 =C2=A0 =C2=A0 python3-protobuf: ignore CVE-2024-7254<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-68950<br>
<br>
Shaik Moin (1):<br>
=C2=A0 =C2=A0 =C2=A0 imagemagick: Fix CVE-2025-62594<br>
<br>
Tyler Park (1):<br>
=C2=A0 =C2=A0 =C2=A0 fmt: Updated master-&gt;main in SRC_URI.<br>
<br>
Vijay Anusuri (1):<br>
=C2=A0 =C2=A0 =C2=A0 strongswan: Fix CVE-2026-25075<br>
<br>
Zahir Hussain (1):<br>
=C2=A0 =C2=A0 =C2=A0 rocksdb: fix typo in PACKAGECONFIG<br>
<br>
=C2=A0.../recipes-support/linux-atm/<a href=3D"http://linux-atm_2.5.2.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-atm_2.5.2.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../strongswan/files/CVE-2026-25075.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 50 ++++++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_5.9.13.bb" rel=3D"norefer=
rer" target=3D"_blank">strongswan_5.9.13.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-crypto/libsodium/<a href=3D"http://libsodium_1.0.18.bb" r=
el=3D"noreferrer" target=3D"_blank">libsodium_1.0.18.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-dbs/rocksdb/<a href=3D"http://rocksdb_6.20.3.bb" rel=
=3D"noreferrer" target=3D"_blank">rocksdb_6.20.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-devtools/libubox/<a href=3D"http://libubox_git.bb" re=
l=3D"noreferrer" target=3D"_blank">libubox_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../recipes-devtools/perl/<a href=3D"http://ipc-run_20200505.0.bb" re=
l=3D"noreferrer" target=3D"_blank">ipc-run_20200505.0.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-extended/logwatch/<a href=3D"http://logwatch_7.6.bb" =
rel=3D"noreferrer" target=3D"_blank">logwatch_7.6.bb</a>=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../sblim-sfcc/<a href=3D"http://sblim-sfcc_2.2.8.bb" rel=3D"noreferr=
er" target=3D"_blank">sblim-sfcc_2.2.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../dnfdragora/<a href=3D"http://dnfdragora_2.1.2.bb" rel=3D"noreferr=
er" target=3D"_blank">dnfdragora_2.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-sazanami_20040629.bb" rel=3D"nore=
ferrer" target=3D"_blank">ttf-sazanami_20040629.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-vlgothic_20200720.bb" rel=3D"nore=
ferrer" target=3D"_blank">ttf-vlgothic_20200720.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../tomoyo-tools/<a href=3D"http://tomoyo-tools_2.5.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tomoyo-tools_2.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-support/driverctl/<a href=3D"http://driverctl_0.111.bb" r=
el=3D"noreferrer" target=3D"_blank">driverctl_0.111.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-support/fmt/<a href=3D"http://fmt_8.1.1.bb" rel=3D"no=
referrer" target=3D"_blank">fmt_8.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../imagemagick/files/CVE-2025-62594.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 197 +++++++++++++++++++++<br>
=C2=A0.../imagemagick/files/CVE-2025-68950.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 +++<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"noref=
errer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../0001-Temporarily-disable-no_redirect.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 45 +++++<br>
=C2=A0...-enabling-no_redirect-with-more-debugging.patch |=C2=A0 50 ++++++<=
br>
=C2=A0...rect-Switch-to-using-double_serve_sstring.patch |=C2=A0 48 +++++<b=
r>
=C2=A0.../neon/neon/0004-test-redirect.c-Cleanup.patch=C2=A0 =C2=A0|=C2=A0 =
49 +++++<br>
=C2=A0meta-oe/recipes-support/neon/<a href=3D"http://neon_0.30.2.bb" rel=3D=
"noreferrer" target=3D"_blank">neon_0.30.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0.../unicode-ucd/<a href=3D"http://unicode-ucd_14.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">unicode-ucd_14.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../0001-fix-test-parameterization.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 48 +++++<br>
=C2=A0.../python/python3-cbor2/CVE-2025-68131.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 51 ++++--<br>
=C2=A0.../python/python3-cbor2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-cbor2_5.4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-cbor2_5.4.2.bb</a> |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../python/<a href=3D"http://python3-protobuf_3.20.3.bb" rel=3D"noref=
errer" target=3D"_blank">python3-protobuf_3.20.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0...djustments-for-changes-in-HTML-parser-285.patch | 190 ++++++++++++=
++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-soupsieve_2.3.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-soupsieve_2.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27651.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 34 ++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27654.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 81 +++++++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27784.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 88 +++++++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-28753.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 93 ++++++++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-28755.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 48 +++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-32647.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 78 ++++++++<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">nginx_1.24.0.bb</a> |=C2=A0 =C2=A09 +=
<br>
=C2=A039 files changed, 1199 insertions(+), 40 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/files/C=
VE-2026-25075.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025=
-62594.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025=
-68950.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/neon/neon/0001-Temporarily=
-disable-no_redirect.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/neon/neon/0002-Re-enabling=
-no_redirect-with-more-debugging.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/neon/neon/0003-no_redirect=
-Switch-to-using-double_serve_sstring.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/neon/neon/0004-test-redire=
ct.c-Cleanup.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
0001-fix-test-parameterization.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-soupsi=
eve/0001-Adjustments-for-changes-in-HTML-parser-285.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-27651.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-27654.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-27784.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-28753.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-28755.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-32647.patch<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126960): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126960" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126960</a><br>
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
</blockquote></div>

--000000000000963f6b0651bc7dd8--

