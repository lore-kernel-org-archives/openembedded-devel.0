Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569C1C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 14:21:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20252.1786630904119193721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 07:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GBUBtW79;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e6f0b4610so25132897b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 07:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786630903; cv=none;
        d=google.com; s=arc-20260327;
        b=SWHyYPdvTsTgCHyF3UeX8VpHZxYMg0Um/NqGDQvV4HmshjAloWR2x/g95gY5L/23DJ
         D9+XQtNqsNvdWqy8vfBa0iLwaSy7SmJ6hhQSmCmbpyu44q7pcM9n97PA/P+GnV4c6Gfz
         o52Kwe4xcTq+fO8BDgOQonpc5MS1+QRKRC9EU39Jd4fBsRrOVY9qi6wRorseyLvY/k4r
         webG+BIqRZiRWg/AtOZzTH1+i/OB/U/16FZkypbKVS9g7e5GnVznLB+Ch+eRnTIQl/vR
         u1FzcMVRJm4pW6y47ld7gVt/1/Hr5O4CdufvpGrlv6NG6yX/EaeTNzx6MlHNzQKUWXkZ
         LHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nKhZqNKzPvxq2uM6nQt4GJIo2pudXdZQYYQJ+MZ5Jjg=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=Fcpv6T/LfUPsvS/1oMRcoDzLTXgsghXBp6uFO8u/vJxtSBFzcSfu3uabQv8bAxrBtb
         xlWPAbRUr2c+SKphJ4pCQ0H+RSDwMBhrWDGL9BH6y+el4ty/9fIivXGv/RBQqDGxOU+J
         x2sQgoIDxLPYjFJsU8vb1998SDRX1oSABfa0FjFrT48espfnNnp+PLUeG0VbPR12KkVQ
         5zb1Yu+G4V5rjFU1iBhMtGnEKgN5BX0of73Hee3MmWibR7CrQtcjSvULPmoVdGLJg9Ex
         VM2SKtK/oolygOyncFR1DF9lg8vKL0VCd1v+BjGGZAgfE7l3Sb9W/h14yfrVfZzq5tdr
         +TbQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786630903; x=1787235703; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKhZqNKzPvxq2uM6nQt4GJIo2pudXdZQYYQJ+MZ5Jjg=;
        b=GBUBtW79rtun0ggRumE0HWuzuxgvpd17UlbAovSz0Kg9p84gLHNtaMoY0uqZX3Eofe
         a/G9N0RhOtz7BXD/2oBsxx8/eWnZwKONQr7Yw50tL0/6W31rBFO5NtahzhlMxSb3RdTE
         My+gv5TTpAnftFSo93igTAEiSPhcrEGg4+86vKIEtZ/+sQB8Zgmm2SsR2tvB0IcQDjD6
         iUfutlhVUnFqfwCeJSdMh/F6mDXZl1zgLlEYl8zr0J8ryoDPH9bbEY0x6UiTZ054Ee//
         tAwFJ/UIFFjWMcEa8j/g0+6VDBmMDo3ayOXKFJXTK2L6nwBfb9ssJqiwG13RJYzIwKBg
         me2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630903; x=1787235703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nKhZqNKzPvxq2uM6nQt4GJIo2pudXdZQYYQJ+MZ5Jjg=;
        b=g0wfSllaZIdFE/LzTd/cx2dGCBSpDqkFfsd2gIW3qgwkEBbDe/JRtbUG6D1HKhfF2U
         xCCJ9SN87TP98BstX8iqB14xnbq+FxvtPJZ1WobZN46G07nyUpQLEe447po5od1kKDC7
         LwjuCkd29WJ6jYb2Y9NhmJPGzdruGWc/F/LYX/qMgpcV5hbvdeZfGx8Jp1/mircEaTes
         dt8xoTDHQKYm5UCzP2eH0ftwc2CMbYdXNIpwcMTIZLWN0y+laVuU9aQwT+0NFDzEY9uv
         SFT7JyZjF4cCwbBs7jNoU6+vJBmGZuxgrd3AELLS0isHJu3kpWf/M+NUFYZjdFBjiinF
         qDUQ==
X-Gm-Message-State: AOJu0Yy0sU2LRmxnv4gUSKy75nj6c9W9l3Ddb4FW8A4Uyzes0GTYdcow
	+XD0U0fTFlpwgnHZsXdhDKm2yvyYBx7dEVFmuGTuAYPZ8pobB+T3qy/6vfEIocxyoR9zNe2pPO/
	7HtmWAXsKYZT0UWZo5FVIjOOfHqwbshw=
X-Gm-Gg: AR+sD13SKB0irgtZz4RhEW4CEvm33BF+8g3dpQ7DQlKAUDOGCP+67rRixk1pHcKwBJx
	E0Ogcqsvazgammam6sZv9+hadH0TX0flHBa4P6LmSVOm+o7/jFVOAY+EZURlUypT+VFcn7zZrxl
	f8YQk/i024YpQgPFkKL5m+/scqEtL4NEvfU6o9e9TonJJBMPXmwLg2lAitNQOtwVSvS7zjB+WYY
	9agamCUKCTIPaMFJ9NtDdiqVe9oMZgr9HNc3qepn6SRT2z9ZfHywbCLFqWE6w4uvgqkmzREncoE
	+gj/01lUkD1YyUoANC8jQ9VlmUI1l50PxOLy/iuebT4mY1NyypUN4NlTm/zCL+1AJL9Ck4yo9G4
	0QkXruQEkV0WX58VYPwEpsOpIA5SF4UimAgeJYPrGJlrHEpheXcXoOoYUPN1ia7TqPMcnebQpyP
	ELRhN3sdim8816d65d8zzKlH3RZcO/Zj08q4fSfQJTx0c0AlByvWJ7IhWKrn+/3rNJsOlcNRYLe
	uBDjjib1KooLg==
X-Received: by 2002:a05:690c:660a:b0:81e:7075:e2e3 with SMTP id
 00721157ae682-8347930d143mr26026037b3.35.1786630902792; Thu, 13 Aug 2026
 07:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786607800.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1786607800.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 07:21:16 -0700
X-Gm-Features: AUfX_mwaWg9_diARPCdaPOVQXHjwOp4Uucs3bMdHuc9XoJ2O_HBHPwrsP5Qlgz0
Message-ID: <CAMKF1soP_gOUbe84E3GVhLHKw4Mwm_-9tnvauyLp_jF0NVSUcg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/23] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e48e10658ee6c5c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 14:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128944

--0000000000004e48e10658ee6c5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now thanks Anuj

On Thu, Aug 13, 2026 at 1:54=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1720
>
> The following changes since commit
> ef3df29f2cfca6a9513b51ebcdccf82b6c8a836f:
>
>   libdbi-perl: Fix CVE-2026-14740 (2026-07-30 07:53:25 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to bec755063a8b5da65df626f5749496aadaa4f4bb:
>
>   thrift: fix CVE-2026-58389 (2026-08-13 10:01:51 +0530)
>
> ----------------------------------------------------------------
>
> Adarsh Jagadish Kamini (4):
>   thrift: fix CVE-2026-55971
>   thrift: fix CVE-2026-58023
>   thrift: fix CVE-2026-48144
>   thrift: fix CVE-2026-58389
>
> Ankur Tyagi (4):
>   redis: upgrade 7.2.12 -> 7.2.15
>   redis: upgrade 6.2.21 -> 6.2.23
>   nginx: upgrade 1.25.5 -> 1.26.0
>   nginx: upgrade 1.26.0 -> 1.26.3
>
> Benjamin Bouvier (2):
>   librelp: add CVE_PRODUCT
>   tcpdump: add CVE_PRODUCT
>
> Darsh Kelaiya (1):
>   python3-flask: fix CVE-2026-27205
>
> Emanuele Ghidoli (1):
>   jq: fix build broken by the CVE-2026-43895 backport
>
> Hetvi Thakar (5):
>   python3-pyjwt: Fix CVE-2026-48522
>   python3-pyjwt: Fix CVE-2026-48524
>   python3-pyjwt: Fix CVE-2026-48525
>   python3-pyjwt: Fix CVE-2026-48526
>   python3-twisted: Fix CVE-2026-42304
>
> Jason Schonberg (1):
>   php: upgrade 8.2.32 -> 8.2.33
>
> Roland Kovacs (1):
>   thrift: fix multiple CVEs
>
> Tugrul Kukul (2):
>   jq: fix CVE-2026-39956
>   jq: fix CVE-2026-44777
>
> Vijay Anusuri (1):
>   libssh: Remove duplicate CVE_STATUS entry for CVE-2025-14821
>
> s-tokumoto (1):
>   fuse: Add "fuse:fuse" to CVE_PRODUCT
>
>  .../recipes-support/fuse/fuse_2.9.9.bb        |    2 +-
>  .../recipes-support/tcpdump/tcpdump_4.99.4.bb |    2 +
>  .../thrift/thrift/CVE-2026-43868.patch        | 1381 +++++++++++++++++
>  .../thrift/thrift/CVE-2026-43870.patch        |  127 ++
>  .../thrift/thrift/CVE-2026-48144.patch        |   36 +
>  .../thrift/thrift/CVE-2026-55971.patch        |   98 ++
>  .../thrift/thrift/CVE-2026-58023.patch        |  231 +++
>  .../thrift/thrift/CVE-2026-58389.patch        |   93 ++
>  .../thrift/thrift_0.20.0.bb                   |    8 +
>  .../jq/jq/CVE-2026-39956.patch                |   55 +
>  .../jq/jq/CVE-2026-44777.patch                |  233 +++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   12 +
>  .../php/{php_8.2.32.bb =3D> php_8.2.33.bb}      |    2 +-
>  ...-hiredis-use-default-CC-if-it-is-set.patch |    3 +-
>  ...ile-to-use-environment-build-setting.patch |    3 +-
>  ...003-hack-to-force-use-of-libc-malloc.patch |    3 +-
>  .../0004-src-Do-not-reset-FINAL_LIBS.patch    |    3 +-
>  ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |    3 +-
>  ...006-Define-correct-gregs-for-RISCV32.patch |    3 +-
>  .../init-redis-server                         |    0
>  .../{redis-7.2.12 =3D> redis-7.2.15}/redis.conf |    0
>  .../redis.service                             |    0
>  .../{redis_6.2.21.bb =3D> redis_6.2.23.bb}      |    2 +-
>  .../{redis_7.2.12.bb =3D> redis_7.2.15.bb}      |    2 +-
>  .../rsyslog/librelp_1.11.0.bb                 |    2 +
>  .../recipes-support/libssh/libssh_0.10.6.bb   |    2 -
>  .../python/python3-flask/CVE-2026-27205.patch |  260 ++++
>  .../python/python3-flask_3.0.3.bb             |    2 +
>  .../python/python3-pyjwt/CVE-2026-48522.patch |   94 ++
>  .../python/python3-pyjwt/CVE-2026-48524.patch |   91 ++
>  .../python/python3-pyjwt/CVE-2026-48525.patch |  115 ++
>  .../python/python3-pyjwt/CVE-2026-48526.patch |   87 ++
>  .../python/python3-pyjwt_2.8.0.bb             |    8 +-
>  .../python3-twisted/CVE-2026-42304.patch      |  369 +++++
>  .../python/python3-twisted_24.3.0.bb          |    2 +-
>  .../CVE-2024-7347-1.patch                     |    0
>  .../CVE-2024-7347-2.patch                     |    0
>  .../nginx/nginx-1.25.5/CVE-2025-23419.patch   |  119 --
>  .../CVE-2026-28755.patch                      |    0
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |    3 -
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |    3 +
>  .../{nginx_1.25.5.bb =3D> nginx_1.26.3.bb}      |    2 +-
>  42 files changed, 3324 insertions(+), 137 deletions(-)
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
>  rename meta-oe/recipes-devtools/php/{php_8.2.32.bb =3D> php_8.2.33.bb}
> (99%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/0001-hiredis-use-default-CC-if-it-is-set.patch (92%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/0002-lua-update-Makefile-to-use-environment-build-setting.p=
atch
> (94%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/0003-hack-to-force-use-of-libc-malloc.patch (90%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/0004-src-Do-not-reset-FINAL_LIBS.patch (87%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pa=
tch
> (86%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/0006-Define-correct-gregs-for-RISCV32.patch (95%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/init-redis-server (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/redis.conf (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D>
> redis-7.2.15}/redis.service (100%)
>  rename meta-oe/recipes-extended/redis/{redis_6.2.21.bb =3D> redis_6.2.23=
.bb}
> (97%)
>  rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb =3D> redis_7.2.15=
.bb}
> (97%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-flask/CVE-2026-27205.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48522.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48524.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48525.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48526.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-twisted/CVE-2026-42304.patch
>  rename meta-webserver/recipes-httpd/nginx/{files =3D>
> nginx-1.24.0}/CVE-2024-7347-1.patch (100%)
>  rename meta-webserver/recipes-httpd/nginx/{files =3D>
> nginx-1.24.0}/CVE-2024-7347-2.patch (100%)
>  delete mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
>  rename meta-webserver/recipes-httpd/nginx/{nginx-1.25.5 =3D>
> nginx-1.26.3}/CVE-2026-28755.patch (100%)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.5.bb =3D>
> nginx_1.26.3.bb} (77%)
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128938):
> https://lists.openembedded.org/g/openembedded-devel/message/128938
> Mute This Topic: https://lists.openembedded.org/mt/120730789/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004e48e10658ee6c5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now thanks Anuj</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13=
, 2026 at 1:54=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss=
.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1720" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1720</a><br>
<br>
The following changes since commit ef3df29f2cfca6a9513b51ebcdccf82b6c8a836f=
:<br>
<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14740 (2026-07-30 07:53:25 +0530)<br>
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
for you to fetch changes up to bec755063a8b5da65df626f5749496aadaa4f4bb:<br=
>
<br>
=C2=A0 thrift: fix CVE-2026-58389 (2026-08-13 10:01:51 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Adarsh Jagadish Kamini (4):<br>
=C2=A0 thrift: fix CVE-2026-55971<br>
=C2=A0 thrift: fix CVE-2026-58023<br>
=C2=A0 thrift: fix CVE-2026-48144<br>
=C2=A0 thrift: fix CVE-2026-58389<br>
<br>
Ankur Tyagi (4):<br>
=C2=A0 redis: upgrade 7.2.12 -&gt; 7.2.15<br>
=C2=A0 redis: upgrade 6.2.21 -&gt; 6.2.23<br>
=C2=A0 nginx: upgrade 1.25.5 -&gt; 1.26.0<br>
=C2=A0 nginx: upgrade 1.26.0 -&gt; 1.26.3<br>
<br>
Benjamin Bouvier (2):<br>
=C2=A0 librelp: add CVE_PRODUCT<br>
=C2=A0 tcpdump: add CVE_PRODUCT<br>
<br>
Darsh Kelaiya (1):<br>
=C2=A0 python3-flask: fix CVE-2026-27205<br>
<br>
Emanuele Ghidoli (1):<br>
=C2=A0 jq: fix build broken by the CVE-2026-43895 backport<br>
<br>
Hetvi Thakar (5):<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48522<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48524<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48525<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48526<br>
=C2=A0 python3-twisted: Fix CVE-2026-42304<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 php: upgrade 8.2.32 -&gt; 8.2.33<br>
<br>
Roland Kovacs (1):<br>
=C2=A0 thrift: fix multiple CVEs<br>
<br>
Tugrul Kukul (2):<br>
=C2=A0 jq: fix CVE-2026-39956<br>
=C2=A0 jq: fix CVE-2026-44777<br>
<br>
Vijay Anusuri (1):<br>
=C2=A0 libssh: Remove duplicate CVE_STATUS entry for CVE-2025-14821<br>
<br>
s-tokumoto (1):<br>
=C2=A0 fuse: Add &quot;fuse:fuse&quot; to CVE_PRODUCT<br>
<br>
=C2=A0.../recipes-support/fuse/<a href=3D"http://fuse_2.9.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">fuse_2.9.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../recipes-support/tcpdump/<a href=3D"http://tcpdump_4.99.4.bb" rel=
=3D"noreferrer" target=3D"_blank">tcpdump_4.99.4.bb</a> |=C2=A0 =C2=A0 2 +<=
br>
=C2=A0.../thrift/thrift/CVE-2026-43868.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
381 +++++++++++++++++<br>
=C2=A0.../thrift/thrift/CVE-2026-43870.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 127 ++<br>
=C2=A0.../thrift/thrift/CVE-2026-48144.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A036 +<br>
=C2=A0.../thrift/thrift/CVE-2026-55971.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A098 ++<br>
=C2=A0.../thrift/thrift/CVE-2026-58023.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 231 +++<br>
=C2=A0.../thrift/thrift/CVE-2026-58389.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A093 ++<br>
=C2=A0.../thrift/<a href=3D"http://thrift_0.20.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">thrift_0.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
=C2=A0.../jq/jq/CVE-2026-39956.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A055 +<br>
=C2=A0.../jq/jq/CVE-2026-44777.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 233 +++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A012 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.2.32.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.2.32.bb</a> =3D&gt; <a href=3D"http://php_8.2.33.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.2.33.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0...-hiredis-use-default-CC-if-it-is-set.patch |=C2=A0 =C2=A0 3 +-<br>
=C2=A0...ile-to-use-environment-build-setting.patch |=C2=A0 =C2=A0 3 +-<br>
=C2=A0...003-hack-to-force-use-of-libc-malloc.patch |=C2=A0 =C2=A0 3 +-<br>
=C2=A0.../0004-src-Do-not-reset-FINAL_LIBS.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 3 +-<br>
=C2=A0...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |=C2=A0 =C2=A0 3 +-<br>
=C2=A0...006-Define-correct-gregs-for-RISCV32.patch |=C2=A0 =C2=A0 3 +-<br>
=C2=A0.../init-redis-server=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../{redis-7.2.12 =3D&gt; redis-7.2.15}/redis.conf |=C2=A0 =C2=A0 0<b=
r>
=C2=A0.../redis.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../{<a href=3D"http://redis_6.2.21.bb" rel=3D"noreferrer" target=3D"=
_blank">redis_6.2.21.bb</a> =3D&gt; <a href=3D"http://redis_6.2.23.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_6.2.23.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://redis_7.2.12.bb" rel=3D"noreferrer" target=3D"=
_blank">redis_7.2.12.bb</a> =3D&gt; <a href=3D"http://redis_7.2.15.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_7.2.15.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rsyslog/<a href=3D"http://librelp_1.11.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">librelp_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 -<br>
=C2=A0.../python/python3-flask/CVE-2026-27205.patch |=C2=A0 260 ++++<br>
=C2=A0.../python/<a href=3D"http://python3-flask_3.0.3.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-flask_3.0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-48522.patch |=C2=A0 =C2=A094 ++<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-48524.patch |=C2=A0 =C2=A091 ++<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-48525.patch |=C2=A0 115 ++<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-48526.patch |=C2=A0 =C2=A087 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.8.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-pyjwt_2.8.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
=C2=A0.../python3-twisted/CVE-2026-42304.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
369 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-twisted_24.3.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-twisted_24.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../CVE-2024-7347-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../CVE-2024-7347-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../nginx/nginx-1.25.5/CVE-2025-23419.patch=C2=A0 =C2=A0|=C2=A0 119 -=
-<br>
=C2=A0.../CVE-2026-28755.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 |=C2=A0 =C2=A0 3 -=
<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 3 +<br>
=C2=A0.../{<a href=3D"http://nginx_1.25.5.bb" rel=3D"noreferrer" target=3D"=
_blank">nginx_1.25.5.bb</a> =3D&gt; <a href=3D"http://nginx_1.26.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nginx_1.26.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A042 files changed, 3324 insertions(+), 137 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-43868.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-43870.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-48144.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-55971.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-58023.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-58389.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patc=
h<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.32.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.2.32.bb</a> =3D&gt; <a href=3D"=
http://php_8.2.33.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.33.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/0001-hiredis-use-default-CC-if-it-is-set.patch (92%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (94%)<=
br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/0003-hack-to-force-use-of-libc-malloc.patch (90%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/0004-src-Do-not-reset-FINAL_LIBS.patch (87%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (86%)<b=
r>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/0006-Define-correct-gregs-for-RISCV32.patch (95%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/init-redis-server (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/redis.conf (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.12 =3D&gt; redis-7.2=
.15}/redis.service (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_6.2.21=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.2.21.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_6.2.23.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.=
2.23.bb</a>} (97%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_7.2.12=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_7.2.15.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.=
2.15.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-flask/=
CVE-2026-27205.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-48522.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-48524.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-48525.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-48526.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-twiste=
d/CVE-2026-42304.patch<br>
=C2=A0rename meta-webserver/recipes-httpd/nginx/{files =3D&gt; nginx-1.24.0=
}/CVE-2024-7347-1.patch (100%)<br>
=C2=A0rename meta-webserver/recipes-httpd/nginx/{files =3D&gt; nginx-1.24.0=
}/CVE-2024-7347-2.patch (100%)<br>
=C2=A0delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CV=
E-2025-23419.patch<br>
=C2=A0rename meta-webserver/recipes-httpd/nginx/{nginx-1.25.5 =3D&gt; nginx=
-1.26.3}/CVE-2026-28755.patch (100%)<br>
=C2=A0rename meta-webserver/recipes-httpd/nginx/{<a href=3D"http://nginx_1.=
25.5.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.25.5.bb</a> =3D&gt; <=
a href=3D"http://nginx_1.26.3.bb" rel=3D"noreferrer" target=3D"_blank">ngin=
x_1.26.3.bb</a>} (77%)<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128938): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128938" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128938</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120730789/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120730789/1997914</a><br>
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

--0000000000004e48e10658ee6c5c--

