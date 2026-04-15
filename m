Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6907AF43833
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:58:59 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21139.1776265132733127719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ue9mI5ig;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651bc83e74aso3769226d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776265132; cv=none;
        d=google.com; s=arc-20240605;
        b=HPYg70+yy8qTFoLWFH+5lyRxpVGvndAjF6ik1PKTAI3IHeSyzQZ+bBg71gdwQV7kNF
         c6atI2lqXbWDAIMiKw3lEgccUMRG3Ibf3uWi9ZgoNOwLXOUlkBDeA71xE4WzW5HFuQN+
         zjyyww29hVuCVVZjMdJmWXb/8xdF6P6DkCJTmw8wc2174XWfhERPrADPjiB0mTUEBitE
         ROv0CuQdcxVTDXSAvaauffaE8sm11W/lU8ByolGA798sF1Le09xrY25hhVAYRcKyfSL5
         K4rj44X+DBvWUbnki0cJ9ang4uo+ivE/qqNJbC2FTd83fiKXlImcQ3OWaV52L9BFrVdj
         SVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xCcknkvhFfXYzOJZwzmT6gvMXxfs/hZs6XnTPND5GBc=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=bVa5o6KJaHqSyDVndR9vEvm7XdecN4FNvfXWgcLPjLzo4xT3p8BIJNkZJfjTzhkYOh
         yvJzyAZ1hVfOuTBAD6+k7W2QB13bOOxfo6OQscYXjQtHGp7pNC37OJxl4ioeMJKaOHyG
         dygYNy2XpDsbUWXSMr5MC+2xgdW+ZPcnKdtDO/6SwbSkZatPMcbS0p/SNDwg9N4RpqJY
         ObUYVFED5oF8Jtnx8OwA6cFaCtbmxetExXOYRPdRl+t8+k9QsoGG4eeh5kmWm8gahDYd
         t0faMhJkznxm+sGsRB+yCQ6FP/uyPzLB0CUgfRE2PwHF0+9FGPw1gXkeVYKn7cH+nNtZ
         7YiQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776265132; x=1776869932; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCcknkvhFfXYzOJZwzmT6gvMXxfs/hZs6XnTPND5GBc=;
        b=Ue9mI5igB99xZRGlOcoNf08r6pvTg9VQNpV1OXzHy8f9M95sq5CXi6cKTUXbe7idVa
         OmYTmsS0YEMbqpQLs9vwFC5lPD+9VnmJlycYti3uV1kMiPlUjkHakP8SSXQILs9XhkWI
         dEb7f3EpoNRhBdYrYlJtELzP2nQ110HoL7EoqffIYVK17tHG42jE+SkB3NDYrxlz7szS
         7m54QIiUiSe8cQuIoU3jcKTUb5iQDPzhl7lwaYAuyFpfZvhkHM61vFyiNolX9LPlvO8F
         lX6KIKd9GTCshUfCmuUNOsesW358Y42TU5Swb4ZETnBtOdjgrt+e0oytVhC5GExFivbm
         efmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776265132; x=1776869932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCcknkvhFfXYzOJZwzmT6gvMXxfs/hZs6XnTPND5GBc=;
        b=OgFNQoLiZ5//5qFTaGx4mBNGLpINDCDKshn7IRuGXpnDDFEKEQ7JABNA7VLLiz3KKr
         HQ/xdMQwwU3Io5QEnXvT3DdhM4b2QQaw/GLYDW2+Xs3u29wxslx5hqxFtiL+JCqZCgfF
         FkCM2WiVrdv852vvmx2MkMkVvG7kjLTA15iYmyV0ZWOpQipN304GaOgkllqh2zIFoROt
         kDxO9ceoYUlYxgR35wOx2VPBuTWwmo9n/aVlLmN7+s0r7UEmZ6cuSLsd+kmfO/w+C6UL
         3kgXeozyHd/zSGqeu4tg4nKXDipvnI2dxr+Pc+fLuldAa2UYy4c6DSp6N7ZOeRmUQ7l9
         vRKw==
X-Gm-Message-State: AOJu0YwjTeQRLOOIwImjTEOTFhtZbtTv40OI6zv9NDT2NSxrPfRb746A
	IpJRDfwsQZ8kpITWKNGmoQBUoIraelGdcO12aecZffNH4b8vQcf2Eb44niMRlGXcFBNf3TRizC+
	8iPfyfZgzxbYoRetWTGYgK/bnzolNOmU9Qg==
X-Gm-Gg: AeBDiesu/A8mJnPywhaZ4/z6ClZmWVLtq4bpg7sX6TNL9rEsKdb3i4hFbLyhIEPaSBB
	VnbsmNJWfcCHRAr9KrrWMM/mRrSdwbvwsZQCdvEw56R4Nale8ZXYmsC3sUCRXWW5qXFudK4NaNU
	+Shw6Tn0J1UnjkR7XwA0vFC4qblsyFGUYIjaR+ZXvvDhYDKaYioOh7KamKkFySI7Q9h8WlbzNG2
	GIBiKF60wvA30T2gSkLp6eNUcqlYB4PQpv5s8OdmvNKp0ecq7RlBfn70GMy1v2L5qbCgzgXyTE3
	z2ASPzLM/hEnaIVGAwEgp8D5X5kglX0uhBXuQx67JCQhWI5j9z0xBockliH/k36bSTJlgEcnj9h
	FKMURKnzNvq2fMLcCIW1UduJkZJ1ca2kWdNlMHXlDsBxZFjAbzSkQHo0UBYLBpN3h1vzy8SZLdG
	uvTlD/AhH64nkY2fo=
X-Received: by 2002:a05:690e:16d3:b0:64c:b6d9:a847 with SMTP id
 956f58d0204a3-65198a6cb17mr16365792d50.5.1776265131706; Wed, 15 Apr 2026
 07:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776247700.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1776247700.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Apr 2026 07:58:24 -0700
X-Gm-Features: AQROBzBhliHC4RIL8UMWixICBLAgOe3hgohw5x86vvyH8GDdjdJJjJwyEPVPFWk
Message-ID: <CAMKF1spByZ66R_Exd7i43r95AWYmL05BJ1-EtZYwrhF+VkwLNA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/47] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000033cba0064f80f486"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126362

--00000000000033cba0064f80f486
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now. Thanks Anuj

On Wed, Apr 15, 2026 at 5:32=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1469
>
> The following changes since commit
> 1ad0d777d1de1769e5995eb806f7ae5c15d0be54:
>
>   strongswan: Fix CVE-2026-25075 (2026-04-03 15:00:48 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e:
>
>   nginx: fix CVE-2026-28753 (2026-04-15 14:12:18 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (32):
>   abseil-cpp: ignore CVE-2025-0838
>   freerdp3: fix CVE-2026-25941
>   freerdp3: fix CVE-2026-33952
>   freerdp3: fix CVE-2026-23948
>   freerdp3: fix CVE-2026-24491
>   freerdp3: fix CVE-2026-24675
>   freerdp3: fix CVE-2026-24676
>   freerdp3: ignore CVE-2026-24677 and CVE-2026-24678
>   freerdp3: fix CVE-2026-24679
>   freerdp3: fix CVE-2026-24680 and CVE-2026-27950
>   freerdp3: fix CVE-2026-24681
>   freerdp3: fix CVE-2026-24682
>   freerdp3: fix CVE-2026-24683
>   freerdp3: fix CVE-2026-29774
>   freerdp3: fix CVE-2026-29775
>   freerdp3: fix CVE-2026-29776
>   freerdp3: fix CVE-2026-31806
>   freerdp3: fix CVE-2026-31897
>   freerdp3: fix CVE-2026-33984
>   libde265: upgrade 1.0.12 -> 1.0.16
>   libraw: ignore CVE-2026-5318
>   libvncserver: fix CVE-2026-32853
>   libvncserver: fix CVE-2026-32854
>   nodejs: upgrade 20.20.0 -> 20.20.2
>   python3-django: upgrade 4.2.29 -> 4.2.30
>   python3-ecdsa: fix CVE-2026-33936
>   python3-flask: upgrade 3.0.2 -> 3.0.3
>   python3-tornado: fix CVE-2026-35536
>   python3-werkzeug: ignore CVE-2026-27199
>   nginx: fix CVE-2026-27651
>   nginx: fix CVE-2026-27654
>   nginx: fix CVE-2026-28753
>
> Guocai He (1):
>   yasm: fix CVE-2021-33454
>
> Gyorgy Sarvari (2):
>   giflib: patch CVE-2025-31344
>   mbedtls: upgrade 3.6.5 -> 3.6.6
>
> Haixiao Yan (3):
>   python3-django: fix CVE-2025-64459
>   python3-django: fix CVE-2025-57833
>   python3-django: fix CVE-2025-59681
>
> Hitendra Prajapati (2):
>   nginx: Fix for CVE-2026-27784
>   nginx: Fix for CVE-2026-28755
>
> Jackson James (1):
>   unbound: Fix CVE-2025-11411
>
> Jinfeng Wang (1):
>   nmap: rename enum PCAP_SOCKET
>
> Libo Chen (4):
>   hdf5: fix CVE-2025-2153
>   hdf5: fix CVE-2025-2310
>   hdf5: fix CVE-2025-44905
>   hdf5: fix CVE-2025-2309
>
> Peter Marko (1):
>   grpc: set status for CVE-2026-33186
>
>  .../libde265/libde265/CVE-2023-43887.patch    |   39 -
>  .../libde265/libde265/CVE-2023-47471.patch    |   42 -
>  ...{libde265_1.0.12.bb =3D> libde265_1.0.16.bb} |    4 +-
>  .../{mbedtls_3.6.5.bb =3D> mbedtls_3.6.6.bb}    |    2 +-
>  .../unbound/0001-CVE-2025-11411-1.patch       | 1874 +++++++++++++++++
>  .../unbound/0002-CVE-2025-11411-2.patch       |  153 ++
>  .../unbound/unbound/CVE-2025-11411.patch      |   48 -
>  .../recipes-support/unbound/unbound_1.19.3.bb |    3 +-
>  .../abseil-cpp/abseil-cpp_20240116.3.bb       |    2 +
>  .../giflib/giflib/CVE-2025-31344.patch        |   28 +
>  .../recipes-devtools/giflib/giflib_5.2.2.bb   |    3 +-
>  meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb  |    2 +
>  .../{nodejs_20.20.0.bb =3D> nodejs_20.20.2.bb}  |    4 +-
>  .../yasm/yasm/CVE-2021-33454.patch            |   29 +
>  meta-oe/recipes-devtools/yasm/yasm_git.bb     |    1 +
>  .../libvncserver/CVE-2026-32853.patch         |   76 +
>  .../libvncserver/CVE-2026-32854.patch         |   66 +
>  .../libvncserver/libvncserver_0.9.14.bb       |    5 +-
>  .../files/nmap-rename-enum-PCAP_SOCKET.patch  |   81 +
>  meta-oe/recipes-security/nmap/nmap_7.80.bb    |    1 +
>  .../freerdp/freerdp3/CVE-2026-23948.patch     |   55 +
>  .../freerdp/freerdp3/CVE-2026-24491.patch     |   52 +
>  .../freerdp/freerdp3/CVE-2026-24675.patch     |   32 +
>  .../freerdp/freerdp3/CVE-2026-24676.patch     |   34 +
>  .../freerdp/freerdp3/CVE-2026-24679.patch     |   44 +
>  .../CVE-2026-24680_CVE-2026-27950.patch       |   24 +
>  .../freerdp/freerdp3/CVE-2026-24681.patch     |   26 +
>  .../freerdp/freerdp3/CVE-2026-24682.patch     |   31 +
>  .../freerdp/freerdp3/CVE-2026-24683.patch     |  114 +
>  .../freerdp/freerdp3/CVE-2026-25941.patch     |   28 +
>  .../freerdp/freerdp3/CVE-2026-29774.patch     |   75 +
>  .../freerdp/freerdp3/CVE-2026-29775.patch     |   30 +
>  .../freerdp/freerdp3/CVE-2026-29776.patch     |   30 +
>  .../freerdp/freerdp3/CVE-2026-31806.patch     |   36 +
>  .../freerdp/freerdp3/CVE-2026-31897.patch     |   28 +
>  .../freerdp/freerdp3/CVE-2026-33952.patch     |   38 +
>  .../freerdp/freerdp3/CVE-2026-33984.patch     |   34 +
>  .../recipes-support/freerdp/freerdp3_3.4.0.bb |   19 +
>  .../hdf5/files/CVE-2025-2153.patch            |   51 +
>  .../hdf5/files/CVE-2025-2309.patch            |   41 +
>  .../hdf5/files/CVE-2025-2310.patch            |   37 +
>  .../hdf5/files/CVE-2025-44905.patch           |   46 +
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |    4 +
>  .../recipes-support/libraw/libraw_0.21.2.bb   |    2 +
>  .../0001-lower-setuptools-requirements.patch  |    0
>  .../CVE-2025-57833.patch                      |   88 +
>  .../CVE-2025-59681.patch                      |  178 ++
>  .../CVE-2025-64459-1.patch                    |   57 +
>  .../CVE-2025-64459-2.patch                    |   63 +
>  ...ngo_4.2.29.bb =3D> python3-django_4.2.30.bb} |    2 +-
>  .../python/python3-django_5.0.14.bb           |    7 +-
>  .../python/python3-ecdsa/CVE-2026-33936.patch |   56 +
>  .../python/python3-ecdsa_0.19.0.bb            |    1 +
>  ...-flask_3.0.2.bb =3D> python3-flask_3.0.3.bb} |    4 +-
>  .../python3-tornado/CVE-2026-35536.patch      |  155 ++
>  .../python/python3-tornado_6.4.2.bb           |    1 +
>  .../python/python3-werkzeug_3.0.6.bb          |    1 +
>  .../nginx/files/CVE-2026-27784.patch          |   88 +
>  .../nginx/nginx-1.24.0/CVE-2026-27651.patch   |   34 +
>  .../nginx/nginx-1.24.0/CVE-2026-27654.patch   |   81 +
>  .../nginx/nginx-1.24.0/CVE-2026-28753.patch   |   93 +
>  .../nginx/nginx-1.24.0/CVE-2026-28755.patch   |   48 +
>  .../nginx/nginx-1.25.5/CVE-2026-28755.patch   |   48 +
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |    1 +
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |    8 +-
>  .../recipes-httpd/nginx/nginx_1.25.5.bb       |    2 +
>  66 files changed, 4247 insertions(+), 143 deletions(-)
>  delete mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
>  delete mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
>  rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb
> =3D> libde265_1.0.16.bb} (84%)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.5.bb =
=3D>
> mbedtls_3.6.6.bb} (98%)
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/0001-CVE-2025-11411-1.pat=
ch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/0002-CVE-2025-11411-2.pat=
ch
>  delete mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2025-11411.patch
>  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.20.0.bb =3D>
> nodejs_20.20.2.bb} (98%)
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.pat=
ch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-23948.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24491.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24675.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24676.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24679.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24680_CVE-2026-27950.pa=
tch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24681.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24682.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24683.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-25941.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29774.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29775.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29776.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31806.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31897.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33952.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33984.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-44905.pat=
ch
>  rename meta-python/recipes-devtools/python/{python3-django-4.2.29 =3D>
> python3-django-4.2.30}/0001-lower-setuptools-requirements.patch (100%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-=
1.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-=
2.patch
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.29.bb =3D=
>
> python3-django_4.2.30.bb} (82%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-ecdsa/CVE-2026-33936.patch
>  rename meta-python/recipes-devtools/python/{python3-flask_3.0.2.bb =3D>
> python3-flask_3.0.3.bb} (80%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-35536.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-27784.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126359):
> https://lists.openembedded.org/g/openembedded-devel/message/126359
> Mute This Topic: https://lists.openembedded.org/mt/118839095/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000033cba0064f80f486
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now. Thanks Anuj</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1=
5, 2026 at 5:32=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:os=
s.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Please merge these changes in scarthgap. Tested locally and on autobuild=
er.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1469" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1469</a><br>
<br>
The following changes since commit 1ad0d777d1de1769e5995eb806f7ae5c15d0be54=
:<br>
<br>
=C2=A0 strongswan: Fix CVE-2026-25075 (2026-04-03 15:00:48 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e:<br=
>
<br>
=C2=A0 nginx: fix CVE-2026-28753 (2026-04-15 14:12:18 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (32):<br>
=C2=A0 abseil-cpp: ignore CVE-2025-0838<br>
=C2=A0 freerdp3: fix CVE-2026-25941<br>
=C2=A0 freerdp3: fix CVE-2026-33952<br>
=C2=A0 freerdp3: fix CVE-2026-23948<br>
=C2=A0 freerdp3: fix CVE-2026-24491<br>
=C2=A0 freerdp3: fix CVE-2026-24675<br>
=C2=A0 freerdp3: fix CVE-2026-24676<br>
=C2=A0 freerdp3: ignore CVE-2026-24677 and CVE-2026-24678<br>
=C2=A0 freerdp3: fix CVE-2026-24679<br>
=C2=A0 freerdp3: fix CVE-2026-24680 and CVE-2026-27950<br>
=C2=A0 freerdp3: fix CVE-2026-24681<br>
=C2=A0 freerdp3: fix CVE-2026-24682<br>
=C2=A0 freerdp3: fix CVE-2026-24683<br>
=C2=A0 freerdp3: fix CVE-2026-29774<br>
=C2=A0 freerdp3: fix CVE-2026-29775<br>
=C2=A0 freerdp3: fix CVE-2026-29776<br>
=C2=A0 freerdp3: fix CVE-2026-31806<br>
=C2=A0 freerdp3: fix CVE-2026-31897<br>
=C2=A0 freerdp3: fix CVE-2026-33984<br>
=C2=A0 libde265: upgrade 1.0.12 -&gt; 1.0.16<br>
=C2=A0 libraw: ignore CVE-2026-5318<br>
=C2=A0 libvncserver: fix CVE-2026-32853<br>
=C2=A0 libvncserver: fix CVE-2026-32854<br>
=C2=A0 nodejs: upgrade 20.20.0 -&gt; 20.20.2<br>
=C2=A0 python3-django: upgrade 4.2.29 -&gt; 4.2.30<br>
=C2=A0 python3-ecdsa: fix CVE-2026-33936<br>
=C2=A0 python3-flask: upgrade 3.0.2 -&gt; 3.0.3<br>
=C2=A0 python3-tornado: fix CVE-2026-35536<br>
=C2=A0 python3-werkzeug: ignore CVE-2026-27199<br>
=C2=A0 nginx: fix CVE-2026-27651<br>
=C2=A0 nginx: fix CVE-2026-27654<br>
=C2=A0 nginx: fix CVE-2026-28753<br>
<br>
Guocai He (1):<br>
=C2=A0 yasm: fix CVE-2021-33454<br>
<br>
Gyorgy Sarvari (2):<br>
=C2=A0 giflib: patch CVE-2025-31344<br>
=C2=A0 mbedtls: upgrade 3.6.5 -&gt; 3.6.6<br>
<br>
Haixiao Yan (3):<br>
=C2=A0 python3-django: fix CVE-2025-64459<br>
=C2=A0 python3-django: fix CVE-2025-57833<br>
=C2=A0 python3-django: fix CVE-2025-59681<br>
<br>
Hitendra Prajapati (2):<br>
=C2=A0 nginx: Fix for CVE-2026-27784<br>
=C2=A0 nginx: Fix for CVE-2026-28755<br>
<br>
Jackson James (1):<br>
=C2=A0 unbound: Fix CVE-2025-11411<br>
<br>
Jinfeng Wang (1):<br>
=C2=A0 nmap: rename enum PCAP_SOCKET<br>
<br>
Libo Chen (4):<br>
=C2=A0 hdf5: fix CVE-2025-2153<br>
=C2=A0 hdf5: fix CVE-2025-2310<br>
=C2=A0 hdf5: fix CVE-2025-44905<br>
=C2=A0 hdf5: fix CVE-2025-2309<br>
<br>
Peter Marko (1):<br>
=C2=A0 grpc: set status for CVE-2026-33186<br>
<br>
=C2=A0.../libde265/libde265/CVE-2023-43887.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A039 -<br>
=C2=A0.../libde265/libde265/CVE-2023-47471.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A042 -<br>
=C2=A0...{<a href=3D"http://libde265_1.0.12.bb" rel=3D"noreferrer" target=
=3D"_blank">libde265_1.0.12.bb</a> =3D&gt; <a href=3D"http://libde265_1.0.1=
6.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.16.bb</a>} |=C2=A0 =
=C2=A0 4 +-<br>
=C2=A0.../{<a href=3D"http://mbedtls_3.6.5.bb" rel=3D"noreferrer" target=3D=
"_blank">mbedtls_3.6.5.bb</a> =3D&gt; <a href=3D"http://mbedtls_3.6.6.bb" r=
el=3D"noreferrer" target=3D"_blank">mbedtls_3.6.6.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../unbound/0001-CVE-2025-11411-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
874 +++++++++++++++++<br>
=C2=A0.../unbound/0002-CVE-2025-11411-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 153 ++<br>
=C2=A0.../unbound/unbound/CVE-2025-11411.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A048 -<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.19.3.bb" rel=
=3D"noreferrer" target=3D"_blank">unbound_1.19.3.bb</a> |=C2=A0 =C2=A0 3 +-=
<br>
=C2=A0.../abseil-cpp/<a href=3D"http://abseil-cpp_20240116.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">abseil-cpp_20240116.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../giflib/giflib/CVE-2025-31344.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A028 +<br>
=C2=A0.../recipes-devtools/giflib/<a href=3D"http://giflib_5.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">giflib_5.2.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 3 +-<br>
=C2=A0meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.60.1.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.60.1.bb</a>=C2=A0 |=C2=A0 =C2=A0 2=
 +<br>
=C2=A0.../{<a href=3D"http://nodejs_20.20.0.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_20.20.0.bb</a> =3D&gt; <a href=3D"http://nodejs_20.20.2.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_20.20.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0.../yasm/yasm/CVE-2021-33454.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A029 +<br>
=C2=A0meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../libvncserver/CVE-2026-32853.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A076 +<br>
=C2=A0.../libvncserver/CVE-2026-32854.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A066 +<br>
=C2=A0.../libvncserver/<a href=3D"http://libvncserver_0.9.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvncserver_0.9.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 5 +-<br>
=C2=A0.../files/nmap-rename-enum-PCAP_SOCKET.patch=C2=A0 |=C2=A0 =C2=A081 +=
<br>
=C2=A0meta-oe/recipes-security/nmap/<a href=3D"http://nmap_7.80.bb" rel=3D"=
noreferrer" target=3D"_blank">nmap_7.80.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
1 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-23948.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A055 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24491.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A052 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24675.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A032 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24676.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A034 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24679.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A044 +<br>
=C2=A0.../CVE-2026-24680_CVE-2026-27950.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A024 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24681.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A026 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24682.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A031 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-24683.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
114 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-25941.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-29774.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A075 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-29775.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A030 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-29776.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A030 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-31806.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A036 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-31897.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-33952.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A038 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-33984.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A034 +<br>
=C2=A0.../recipes-support/freerdp/<a href=3D"http://freerdp3_3.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">freerdp3_3.4.0.bb</a> |=C2=A0 =C2=A019 +<=
br>
=C2=A0.../hdf5/files/CVE-2025-2153.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A051 +<br>
=C2=A0.../hdf5/files/CVE-2025-2309.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A041 +<br>
=C2=A0.../hdf5/files/CVE-2025-2310.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A037 +<br>
=C2=A0.../hdf5/files/CVE-2025-44905.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A046 +<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb" rel=
=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A0 4 +<b=
r>
=C2=A0.../recipes-support/libraw/<a href=3D"http://libraw_0.21.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libraw_0.21.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +<br>
=C2=A0.../0001-lower-setuptools-requirements.patch=C2=A0 |=C2=A0 =C2=A0 0<b=
r>
=C2=A0.../CVE-2025-57833.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A088 +<br>
=C2=A0.../CVE-2025-59681.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 178 ++<br>
=C2=A0.../CVE-2025-64459-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A057 +<br>
=C2=A0.../CVE-2025-64459-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A063 +<br>
=C2=A0...<a href=3D"http://ngo_4.2.29.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_4.2.29.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.30.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_4.2.30.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-django_5.0.14.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_5.0.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +-<br>
=C2=A0.../python/python3-ecdsa/CVE-2026-33936.patch |=C2=A0 =C2=A056 +<br>
=C2=A0.../python/<a href=3D"http://python3-ecdsa_0.19.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-ecdsa_0.19.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0...-<a href=3D"http://flask_3.0.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">flask_3.0.2.bb</a> =3D&gt; <a href=3D"http://python3-flask_3.0.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-flask_3.0.3.bb</a>} |=C2=A0 =
=C2=A0 4 +-<br>
=C2=A0.../python3-tornado/CVE-2026-35536.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
155 ++<br>
=C2=A0.../python/<a href=3D"http://python3-tornado_6.4.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-tornado_6.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-werkzeug_3.0.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-werkzeug_3.0.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../nginx/files/CVE-2026-27784.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A088 +<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27651.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A034 +<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-27654.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A081 +<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-28753.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A093 +<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-28755.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A048 +<br>
=C2=A0.../nginx/nginx-1.25.5/CVE-2026-28755.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A048 +<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 |=C2=A0 =C2=A0 1 +=
<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 8 +-<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.25.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.25.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +<br>
=C2=A066 files changed, 4247 insertions(+), 143 deletions(-)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2023-43887.patch<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2023-47471.patch<br>
=C2=A0rename meta-multimedia/recipes-multimedia/libde265/{<a href=3D"http:/=
/libde265_1.0.12.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.12.b=
b</a> =3D&gt; <a href=3D"http://libde265_1.0.16.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libde265_1.0.16.bb</a>} (84%)<br>
=C2=A0rename meta-networking/recipes-connectivity/mbedtls/{<a href=3D"http:=
//mbedtls_3.6.5.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3.6.5.bb</=
a> =3D&gt; <a href=3D"http://mbedtls_3.6.6.bb" rel=3D"noreferrer" target=3D=
"_blank">mbedtls_3.6.6.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/00=
01-CVE-2025-11411-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/00=
02-CVE-2025-11411-2.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2025-11411.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31=
344.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_20.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_20.20.0.bb</a> =3D&gt; =
<a href=3D"http://nodejs_20.20.2.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_20.20.2.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-32853.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-32854.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-en=
um-PCAP_SOCKET.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
23948.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24491.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24675.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24676.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24679.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24680_CVE-2026-27950.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24681.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24682.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
24683.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
25941.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
29774.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
29775.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
29776.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
31806.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
31897.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
33952.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
33984.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2153.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2309.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2310.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-44905.=
patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{python3-django-4.2.29 =3D=
&gt; python3-django-4.2.30}/0001-lower-setuptools-requirements.patch (100%)=
<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2025-57833.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2025-59681.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2025-64459-1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2025-64459-2.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.29.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
29.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.30.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.30.bb</a>} (82%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/=
CVE-2026-33936.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-flask_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask_3.0.2.b=
b</a> =3D&gt; <a href=3D"http://python3-flask_3.0.3.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-flask_3.0.3.bb</a>} (80%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-35536.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
27784.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-27651.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-27654.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-28753.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-28755.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CV=
E-2026-28755.patch<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126359): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126359" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126359</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118839095/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118839095/1997914</a><br>
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

--00000000000033cba0064f80f486--

