Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A869CD8C8C
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 21:10:32 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40921.1780866626088259803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 14:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qPUxPg6D;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7e8833c99fcso41714897b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 14:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780866625; cv=none;
        d=google.com; s=arc-20240605;
        b=a58TEIFFfEicLcozk+BC/ankqtUMO8NHf/KHhqKFNqyYaD/65RjK5i9JyWyvO9NSVK
         jnfnKWLtnyxaFuGn1dU6Tf8lS5vUrsHVIncihe7gKGkCtMzwNUuL88XEKdPoQGr7nXxl
         6ZnXwjk+oVuq/icixEDE1Sgv8eJ88qzyyAcgIHViln0kiHrSVj+vWVHLH3hAPT4mJFAH
         e8UtvNy67CRt3fLqIJK0NqSw+RxYv+Pxgk8xQkU8WsJ/OWVfkFToWHhbWDlcxJPHQWkM
         ofO3jGMSpgUF8Q6tnYStCP7vVAsB2zxMJ35fUtVDHctT1zLFAG3UU+YCN8cPoRK/nERT
         SIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/nXCHHjuKawokd5YrJcGIMZ64RnQEGVB4i9Dn/wcoWE=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=d00rTrOlypxolnx2TC86X6laedtnhrJ/KbOUwtGV2MyzmBouT8O6CLysAC0nlluzLf
         w1e0yt5P1dUz8vQS1bvOYsRJoIiRU0rI03VJ6uUYPujECIs6A6Ooxei2bcIK95334t63
         0ERk721WhIvDvsMQnOVLvaVAXCnwBnc50Z2nJoxW0eQXH2cRmrBa/s6PrnZ3xDYmpyMG
         yIc8wUcvLFl5ZIl5s4EaXbW6kvDnh/6zrIKNoXsv5O6AV8AG6N7Xze3T3Dkvuq1RlfQJ
         7FUePUzpsRMdWlzR1UBTvLVs+TzmqiUrk1vzP5rwgduk2P+7lgh+fCcfC0+bXeYO2Ajb
         jlig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780866625; x=1781471425; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/nXCHHjuKawokd5YrJcGIMZ64RnQEGVB4i9Dn/wcoWE=;
        b=qPUxPg6DY+itPGkzaKG0ovWtjgwUg5gh/gCyULUp8frvb8YkiBb7/pLhJx0uBTqc5m
         sLRxEG685zwsYmKu7T7fICZZgiV0cY1/4AGO115tdEritFzI1tuNmORppDjmb8RamrZt
         ka6PszMdBxtrOric2Mtk6QOux741XTFxws61KhSYehYPl4xrmQUIOU8+cLF41NKB3/mR
         oytSQMGP1KHtv8wOPOUaVuES7N0N3co+hp4xe7zGpfpMXllud9tdsLQlu+GQaViOp2pE
         NRu/4ehdr1dZN+ecX4M/BTmB1jhWMNnwdyYNDXBQrmG7zc1xNX6NJxk22dwBx0fxNmn3
         tMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866625; x=1781471425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nXCHHjuKawokd5YrJcGIMZ64RnQEGVB4i9Dn/wcoWE=;
        b=Jyp3ERob5crER+3RN2Srnrv7VUWmTLGdVWaLLqhnkVTsKlwm56h9vtnUBt+S6AARYe
         zqxZnALyBCpN0iePtEclElQPWcWtnbjSwnKD6FilxWCgKJEXlvK1Z3yQ8omqbLLP3f35
         TuJtEQiHrJAnFkTBOGr3t4q4ywDReun8AylBKXS4Cd0eXN1vmMI0bZZOGfEFAqpDpoH7
         lyKoD/4P5s6/Y4LViS8ziG10Q8pPuBSQik5cdLeGna/tpLM2Rg695Wrr68254giJV1rL
         FbR8u1diDSO9HJwrYO5fQMSv5MRHTzVJVFhaTzYnCUwJD46oV9Ys0DvMxYddVv3FogLP
         vxAw==
X-Gm-Message-State: AOJu0YzGmOmXKTqUGx4lx8bkEW5lukuT+BCznC1fxckpXny7TN7ill+Q
	uAAJfMfxf3VaFuyCLFyb+JC5+1EAJd3LkJTkyF3KuaPlWPXsfESUU3dK83WGlD5CdkngBtqm8mu
	tOe7N/rltf/s/rnMz7tSnAAqYfWgP5yw=
X-Gm-Gg: Acq92OHTw9OKLlh8O/lgsINZ61zEZXB7VPrV5OmlT6uG7x9ejxjVKnV3FkkRqYaKIa7
	WEE//0oIeADqbvT87UisBm8gSrELn6gw8C4nKfFc5vLV046OtMhv0nO0o/aFXQgIFEwubIDqHB4
	+MMCGTdUeqllZFVMhgNTQpUMnuJNW5/JJXXci1R82o/hlDpqsaJgmSa/l7aZCtLGBWkqUrw1Dff
	vseTC/+n8QnSz667sZ3E5Va8/urOlJO35X92caVl3iHUw3mnLxy7t9mAuP5y/M5PqVVZDuFTSxB
	S7BRvd1OZbbyBLOrXHzVB2VQ2t65LxTeCiAaVdvzthMTuiRD17lPTXKNI3Q0JZ85xyzN6Q/Msb5
	NdYAdKsCJ9jdUrNuAYen+BuHQTRBHGHU58oQpX1C5NUxhhCxlFiMc4+g38BgdTorHbeEitDLVHd
	Ct8UsC4c8z5mg1YMw=
X-Received: by 2002:a05:690e:207:b0:65d:bf4b:f16b with SMTP id
 956f58d0204a3-66106e036damr8972394d50.3.1780866625016; Sun, 07 Jun 2026
 14:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780628170.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1780628170.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 14:09:58 -0700
X-Gm-Features: AVVi8Cd6HXS4oNOTtlZ6yJtRXdM4fZCM1SS1EXPTPUQ6AMTAsScvNwI51FVqblY
Message-ID: <CAMKF1soT7rMA3hHN4PEP=LTHHHC+FvZ78B-mFgLxXxwRDRs27w@mail.gmail.com>
Subject: Re: [PATCH 00/27] Wrynose pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009399360653b052d5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 21:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127414

--0000000000009399360653b052d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now, thanks Anuj

On Thu, Jun 4, 2026 at 8:01=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com>
wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1540
>
> The following changes since commit
> 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71:
>
>   libtsm: upgrade 4.4.3 -> 4.5.0 (2026-05-17 11:52:30 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to a43f0d532c399458cae44ce66f3799a220fbb497:
>
>   README: update listed maintainer (2026-05-29 09:29:32 +0530)
>
> ----------------------------------------------------------------
>
> Abhishek Bachiphale (4):
>   dnsmasq: fix CVE-2026-4891
>   dnsmasq: fix CVE-2026-4892
>   dnsmasq: fix CVE-2026-4893
>   dnsmasq: fix CVE-2026-5172
>
> Adam Duskett (1):
>   kmscon: fix zlib cross-compiling errors
>
> Ankur Tyagi (3):
>   python3-django: upgrade 5.2.13 -> 5.2.14
>   python3-django: upgrade 6.0.4 -> 6.0.5
>   imagemagick: upgrade 7.1.2-22 -> 7.1.2-23
>
> Anuj Mittal (1):
>   README: update listed maintainer
>
> Guocai He (1):
>   postgresql: upgrade 17.8 -> 17.10
>
> Jason Schonberg (2):
>   Update README.md example with new branch name.
>   nodejs: upgrade 22.22.2 -> 22.22.3
>
> Jiaying Song (1):
>   layer.conf: remove dead BBFILES_DYNAMIC entry for clang-layer
>
> Markus Volk (1):
>   pipewire: update 1.6.3 -> 1.6.5
>
> Wang Mingyu (13):
>   localsearch: upgrade 3.11.0 -> 3.11.1
>   neatvnc: upgrade 0.9.5 -> 0.9.6
>   python3-inline-snapshot: upgrade 0.32.6 -> 0.32.7
>   python3-tzdata: upgrade 2026.1 -> 2026.2
>   python3-typeguard: upgrade 4.5.1 -> 4.5.2
>   python3-huey: upgrade 3.0.0 -> 3.0.1
>   swagger-ui: upgrade 5.32.2 -> 5.32.5
>   swagger-ui: upgrade 5.32.5 -> 5.32.6
>   imagemagick: upgrade 7.1.2-21 -> 7.1.2-22
>   bit7z: upgrade 4.0.11 -> 4.0.12
>   uriparser: upgrade 1.0.0 -> 1.0.1
>   uriparser: upgrade 1.0.1 -> 1.0.2
>   lldpd: upgrade 1.0.21 -> 1.0.22
>
>  README.md                                     |  2 +-
>  meta-filesystems/README.md                    |  4 +-
>  meta-gnome/README.md                          |  4 +-
>  ...search_3.11.0.bb =3D> localsearch_3.11.1.bb} |  2 +-
>  meta-initramfs/README.md                      |  5 +-
>  meta-multimedia/README.md                     |  4 +-
>  .../{pipewire_1.6.3.bb =3D> pipewire_1.6.5.bb}  |  2 +-
>  meta-networking/MAINTAINERS                   |  3 +-
>  meta-networking/README.md                     |  2 +-
>  .../{lldpd_1.0.21.bb =3D> lldpd_1.0.22.bb}      |  2 +-
>  .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  4 ++
>  .../dnsmasq/files/CVE-2026-4891.patch         | 40 +++++++++++++
>  .../dnsmasq/files/CVE-2026-4892.patch         | 36 +++++++++++
>  .../dnsmasq/files/CVE-2026-4893.patch         | 34 +++++++++++
>  .../dnsmasq/files/CVE-2026-5172.patch         | 34 +++++++++++
>  meta-oe/README.md                             |  4 +-
>  meta-oe/conf/layer.conf                       |  2 -
>  ...c-bypass-autoconf-2.69-version-check.patch |  2 +-
>  ...postgresql_17.8.bb =3D> postgresql_17.10.bb} |  2 +-
>  .../0001-detect-aarch64-Neon-correctly.patch  | 51 ----------------
>  .../0001-fix-arm-Neon-intrinsics-types.patch  | 59 ------------------
>  ...header-value-__builtin_ctzll-undefin.patch | 60 -------------------
>  .../{nodejs_22.22.2.bb =3D> nodejs_22.22.3.bb}  |  5 +-
>  .../7zip/{bit7z_4.0.11.bb =3D> bit7z_4.0.12.bb} |  2 +-
>  ...0001-fix-zlib-cross-compiling-errors.patch | 51 ++++++++++++++++
>  .../recipes-graphics/kmscon/kmscon_9.3.5.bb   |  5 +-
>  .../neatvnc/neatvnc/0001-Use-aml-v1.patch     | 21 +++----
>  .../{neatvnc_0.9.5.bb =3D> neatvnc_0.9.6.bb}    |  2 +-
>  ...ck_7.1.2-21.bb =3D> imagemagick_7.1.2-23.bb} |  2 +-
>  ...{uriparser_1.0.0.bb =3D> uriparser_1.0.2.bb} |  2 +-
>  meta-perl/README.md                           |  6 +-
>  meta-python/README.md                         |  6 +-
>  ...ngo_5.2.13.bb =3D> python3-django_5.2.14.bb} |  2 +-
>  ...jango_6.0.4.bb =3D> python3-django_6.0.5.bb} |  2 +-
>  ...n3-huey_3.0.0.bb =3D> python3-huey_3.0.1.bb} |  2 +-
>  ...6.bb =3D> python3-inline-snapshot_0.32.7.bb} |  2 +-
>  ...rd_4.5.1.bb =3D> python3-typeguard_4.5.2.bb} |  2 +-
>  ...ata_2026.1.bb =3D> python3-tzdata_2026.2.bb} |  2 +-
>  meta-webserver/README.md                      |  5 +-
>  ...gger-ui_5.32.2.bb =3D> swagger-ui_5.32.6.bb} |  2 +-
>  meta-xfce/README.md                           |  5 +-
>  41 files changed, 250 insertions(+), 234 deletions(-)
>  rename meta-gnome/recipes-gnome/tracker/{localsearch_3.11.0.bb =3D>
> localsearch_3.11.1.bb} (96%)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.3.bb =
=3D>
> pipewire_1.6.5.bb} (99%)
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.21.bb =3D>
> lldpd_1.0.22.bb} (96%)
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_17.8.bb =3D>
> postgresql_17.10.bb} (87%)
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly=
.patch
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-arm-Neon-intrinsics-types=
.patch
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-=
__builtin_ctzll-undefin.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.2.bb =3D>
> nodejs_22.22.3.bb} (96%)
>  rename meta-oe/recipes-extended/7zip/{bit7z_4.0.11.bb =3D> bit7z_4.0.12.=
bb}
> (98%)
>  create mode 100644
> meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-error=
s.patch
>  rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.9.5.bb =3D>
> neatvnc_0.9.6.bb} (96%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-21.bb =3D>
> imagemagick_7.1.2-23.bb} (99%)
>  rename meta-oe/recipes-support/uriparser/{uriparser_1.0.0.bb =3D>
> uriparser_1.0.2.bb} (91%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.13.bb =3D=
>
> python3-django_5.2.14.bb} (61%)
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.4.bb =3D>
> python3-django_6.0.5.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-huey_3.0.0.bb =3D>
> python3-huey_3.0.1.bb} (79%)
>  rename meta-python/recipes-devtools/python/{
> python3-inline-snapshot_0.32.6.bb =3D> python3-inline-snapshot_0.32.7.bb}
> (88%)
>  rename meta-python/recipes-devtools/python/{python3-typeguard_4.5.1.bb
> =3D> python3-typeguard_4.5.2.bb} (88%)
>  rename meta-python/recipes-devtools/python/{python3-tzdata_2026.1.bb =3D=
>
> python3-tzdata_2026.2.bb} (85%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.2.bb
> =3D> swagger-ui_5.32.6.bb} (94%)
>
> --
> 2.54.0
>
>

--0000000000009399360653b052d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now, thanks Anuj</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 4=
, 2026 at 8:01=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss=
.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Please merge these changes in wr=
ynose. Tested locally and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1540" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1540</a><br>
<br>
The following changes since commit 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71=
:<br>
<br>
=C2=A0 libtsm: upgrade 4.4.3 -&gt; 4.5.0 (2026-05-17 11:52:30 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to a43f0d532c399458cae44ce66f3799a220fbb497:<br=
>
<br>
=C2=A0 README: update listed maintainer (2026-05-29 09:29:32 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Abhishek Bachiphale (4):<br>
=C2=A0 dnsmasq: fix CVE-2026-4891<br>
=C2=A0 dnsmasq: fix CVE-2026-4892<br>
=C2=A0 dnsmasq: fix CVE-2026-4893<br>
=C2=A0 dnsmasq: fix CVE-2026-5172<br>
<br>
Adam Duskett (1):<br>
=C2=A0 kmscon: fix zlib cross-compiling errors<br>
<br>
Ankur Tyagi (3):<br>
=C2=A0 python3-django: upgrade 5.2.13 -&gt; 5.2.14<br>
=C2=A0 python3-django: upgrade 6.0.4 -&gt; 6.0.5<br>
=C2=A0 imagemagick: upgrade 7.1.2-22 -&gt; 7.1.2-23<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 README: update listed maintainer<br>
<br>
Guocai He (1):<br>
=C2=A0 postgresql: upgrade 17.8 -&gt; 17.10<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 Update README.md example with new branch name.<br>
=C2=A0 nodejs: upgrade 22.22.2 -&gt; 22.22.3<br>
<br>
Jiaying Song (1):<br>
=C2=A0 layer.conf: remove dead BBFILES_DYNAMIC entry for clang-layer<br>
<br>
Markus Volk (1):<br>
=C2=A0 pipewire: update 1.6.3 -&gt; 1.6.5<br>
<br>
Wang Mingyu (13):<br>
=C2=A0 localsearch: upgrade 3.11.0 -&gt; 3.11.1<br>
=C2=A0 neatvnc: upgrade 0.9.5 -&gt; 0.9.6<br>
=C2=A0 python3-inline-snapshot: upgrade 0.32.6 -&gt; 0.32.7<br>
=C2=A0 python3-tzdata: upgrade 2026.1 -&gt; 2026.2<br>
=C2=A0 python3-typeguard: upgrade 4.5.1 -&gt; 4.5.2<br>
=C2=A0 python3-huey: upgrade 3.0.0 -&gt; 3.0.1<br>
=C2=A0 swagger-ui: upgrade 5.32.2 -&gt; 5.32.5<br>
=C2=A0 swagger-ui: upgrade 5.32.5 -&gt; 5.32.6<br>
=C2=A0 imagemagick: upgrade 7.1.2-21 -&gt; 7.1.2-22<br>
=C2=A0 bit7z: upgrade 4.0.11 -&gt; 4.0.12<br>
=C2=A0 uriparser: upgrade 1.0.0 -&gt; 1.0.1<br>
=C2=A0 uriparser: upgrade 1.0.1 -&gt; 1.0.2<br>
=C2=A0 lldpd: upgrade 1.0.21 -&gt; 1.0.22<br>
<br>
=C2=A0README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0meta-filesystems/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0meta-gnome/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0...<a href=3D"http://search_3.11.0.bb" rel=3D"noreferrer" target=3D"_=
blank">search_3.11.0.bb</a> =3D&gt; <a href=3D"http://localsearch_3.11.1.bb=
" rel=3D"noreferrer" target=3D"_blank">localsearch_3.11.1.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0meta-initramfs/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
=C2=A0meta-multimedia/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0.../{<a href=3D"http://pipewire_1.6.3.bb" rel=3D"noreferrer" target=
=3D"_blank">pipewire_1.6.3.bb</a> =3D&gt; <a href=3D"http://pipewire_1.6.5.=
bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.5.bb</a>}=C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0meta-networking/MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0meta-networking/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://lldpd_1.0.21.bb" rel=3D"noreferrer" target=3D"=
_blank">lldpd_1.0.21.bb</a> =3D&gt; <a href=3D"http://lldpd_1.0.22.bb" rel=
=3D"noreferrer" target=3D"_blank">lldpd_1.0.22.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.92.bb" rel=3D=
"noreferrer" target=3D"_blank">dnsmasq_2.92.bb</a>=C2=A0 =C2=A0|=C2=A0 4 ++=
<br>
=C2=A0.../dnsmasq/files/CVE-2026-4891.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 40 +++++++++++++<br>
=C2=A0.../dnsmasq/files/CVE-2026-4892.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 36 +++++++++++<br>
=C2=A0.../dnsmasq/files/CVE-2026-4893.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 34 +++++++++++<br>
=C2=A0.../dnsmasq/files/CVE-2026-5172.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 34 +++++++++++<br>
=C2=A0meta-oe/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meta-oe/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
=C2=A0...c-bypass-autoconf-2.69-version-check.patch |=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://postgresql_17.8.bb" rel=3D"noreferrer" target=3D=
"_blank">postgresql_17.8.bb</a> =3D&gt; <a href=3D"http://postgresql_17.10.=
bb" rel=3D"noreferrer" target=3D"_blank">postgresql_17.10.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0.../0001-detect-aarch64-Neon-correctly.patch=C2=A0 | 51 -------------=
---<br>
=C2=A0.../0001-fix-arm-Neon-intrinsics-types.patch=C2=A0 | 59 -------------=
-----<br>
=C2=A0...header-value-__builtin_ctzll-undefin.patch | 60 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://nodejs_22.22.2.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_22.22.2.bb</a> =3D&gt; <a href=3D"http://nodejs_22.22.3.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.3.bb</a>}=C2=A0 |=C2=
=A0 5 +-<br>
=C2=A0.../7zip/{<a href=3D"http://bit7z_4.0.11.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bit7z_4.0.11.bb</a> =3D&gt; <a href=3D"http://bit7z_4.0.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">bit7z_4.0.12.bb</a>} |=C2=A0 2 +-<br>
=C2=A0...0001-fix-zlib-cross-compiling-errors.patch | 51 ++++++++++++++++<b=
r>
=C2=A0.../recipes-graphics/kmscon/<a href=3D"http://kmscon_9.3.5.bb" rel=3D=
"noreferrer" target=3D"_blank">kmscon_9.3.5.bb</a>=C2=A0 =C2=A0|=C2=A0 5 +-=
<br>
=C2=A0.../neatvnc/neatvnc/0001-Use-aml-v1.patch=C2=A0 =C2=A0 =C2=A0| 21 +++=
----<br>
=C2=A0.../{<a href=3D"http://neatvnc_0.9.5.bb" rel=3D"noreferrer" target=3D=
"_blank">neatvnc_0.9.5.bb</a> =3D&gt; <a href=3D"http://neatvnc_0.9.6.bb" r=
el=3D"noreferrer" target=3D"_blank">neatvnc_0.9.6.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0...<a href=3D"http://ck_7.1.2-21.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ck_7.1.2-21.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-23.bb" =
rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-23.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...{<a href=3D"http://uriparser_1.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">uriparser_1.0.0.bb</a> =3D&gt; <a href=3D"http://uriparser_1.0.=
2.bb" rel=3D"noreferrer" target=3D"_blank">uriparser_1.0.2.bb</a>} |=C2=A0 =
2 +-<br>
=C2=A0meta-perl/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0meta-python/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0...<a href=3D"http://ngo_5.2.13.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.13.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.14.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.14.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...<a href=3D"http://jango_6.0.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_6.0.4.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.5.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.5.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...<a href=3D"http://n3-huey_3.0.0.bb" rel=3D"noreferrer" target=3D"_=
blank">n3-huey_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-huey_3.0.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-huey_3.0.1.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...<a href=3D"http://6.bb" rel=3D"noreferrer" target=3D"_blank">6.bb<=
/a> =3D&gt; <a href=3D"http://python3-inline-snapshot_0.32.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-inline-snapshot_0.32.7.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...<a href=3D"http://rd_4.5.1.bb" rel=3D"noreferrer" target=3D"_blank=
">rd_4.5.1.bb</a> =3D&gt; <a href=3D"http://python3-typeguard_4.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-typeguard_4.5.2.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...<a href=3D"http://ata_2026.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ata_2026.1.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tzdata_2026.2.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0meta-webserver/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
=C2=A0...<a href=3D"http://gger-ui_5.32.2.bb" rel=3D"noreferrer" target=3D"=
_blank">gger-ui_5.32.2.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.6.b=
b" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.6.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0meta-xfce/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
=C2=A041 files changed, 250 insertions(+), 234 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/tracker/{<a href=3D"http://localsearc=
h_3.11.0.bb" rel=3D"noreferrer" target=3D"_blank">localsearch_3.11.0.bb</a>=
 =3D&gt; <a href=3D"http://localsearch_3.11.1.bb" rel=3D"noreferrer" target=
=3D"_blank">localsearch_3.11.1.bb</a>} (96%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/pipewire/{<a href=3D"http:/=
/pipewire_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.3.bb<=
/a> =3D&gt; <a href=3D"http://pipewire_1.6.5.bb" rel=3D"noreferrer" target=
=3D"_blank">pipewire_1.6.5.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-daemons/lldpd/{<a href=3D"http://lldpd=
_1.0.21.bb" rel=3D"noreferrer" target=3D"_blank">lldpd_1.0.21.bb</a> =3D&gt=
; <a href=3D"http://lldpd_1.0.22.bb" rel=3D"noreferrer" target=3D"_blank">l=
ldpd_1.0.22.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4891.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4892.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4893.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-5172.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
7.8.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_17.8.bb</a> =3D&gt;=
 <a href=3D"http://postgresql_17.10.bb" rel=3D"noreferrer" target=3D"_blank=
">postgresql_17.10.bb</a>} (87%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-detect=
-aarch64-Neon-correctly.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-ar=
m-Neon-intrinsics-types.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp=
-fix-NEON-header-value-__builtin_ctzll-undefin.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_22.2=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.2.bb</a> =3D&gt; =
<a href=3D"http://nodejs_22.22.3.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_22.22.3.bb</a>} (96%)<br>
=C2=A0rename meta-oe/recipes-extended/7zip/{<a href=3D"http://bit7z_4.0.11.=
bb" rel=3D"noreferrer" target=3D"_blank">bit7z_4.0.11.bb</a> =3D&gt; <a hre=
f=3D"http://bit7z_4.0.12.bb" rel=3D"noreferrer" target=3D"_blank">bit7z_4.0=
.12.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-fix-zli=
b-cross-compiling-errors.patch<br>
=C2=A0rename meta-oe/recipes-graphics/neatvnc/{<a href=3D"http://neatvnc_0.=
9.5.bb" rel=3D"noreferrer" target=3D"_blank">neatvnc_0.9.5.bb</a> =3D&gt; <=
a href=3D"http://neatvnc_0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">nea=
tvnc_0.9.6.bb</a>} (96%)<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-21.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-21=
.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-23.bb" rel=3D"noreferre=
r" target=3D"_blank">imagemagick_7.1.2-23.bb</a>} (99%)<br>
=C2=A0rename meta-oe/recipes-support/uriparser/{<a href=3D"http://uriparser=
_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">uriparser_1.0.0.bb</a> =3D&=
gt; <a href=3D"http://uriparser_1.0.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">uriparser_1.0.2.bb</a>} (91%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.13.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
13.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.14.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.14.bb</a>} (61%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.4=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.5.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_6.0.5.bb</a>} (75%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-huey_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-huey_3.0.0.bb<=
/a> =3D&gt; <a href=3D"http://python3-huey_3.0.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3-huey_3.0.1.bb</a>} (79%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-inline-snapshot_0.32.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-in=
line-snapshot_0.32.6.bb</a> =3D&gt; <a href=3D"http://python3-inline-snapsh=
ot_0.32.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-inline-snapshot_=
0.32.7.bb</a>} (88%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-typeguard_4.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-typeguard=
_4.5.1.bb</a> =3D&gt; <a href=3D"http://python3-typeguard_4.5.2.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-typeguard_4.5.2.bb</a>} (88%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tzdata_2026.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-tzdata_2026=
.1.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tzdata_2026.2.bb</a>} (85%)<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.32.2.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.=
2.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">swagger-ui_5.32.6.bb</a>} (94%)<br>
<br>
-- <br>
2.54.0<br>
<br>
</blockquote></div>

--0000000000009399360653b052d5--

