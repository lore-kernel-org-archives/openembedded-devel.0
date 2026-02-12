Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CD2EDF044
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:55:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39488.1770875730917643149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d+Zk/SIK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kXCFpnAp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3Rldp3887981
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 05:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PABovsInqWZFcjzaV/yErTLw8+1OIdrh61SmXiR9LE8=; b=d+Zk/SIKajJo71+W
	f3c3tF+T7XR94Dvx03IRYEaCrou4aWYHZSzckmN11fbwrgtpKf7xTQjV/X1fIFEQ
	lC2LtlqZ7aJRbbI6k+/c2Eh44Nh4X6KYtzv+sBnGAHiUoy6F8ZPTBtR2XE2a7Rfj
	Rs6frRWcy8JzivsbcA12dY4RFgKMhKDubreswqtvA7NeCPS8o/7wHgQ0b7fZ9MdB
	q1tzS/oPgQC0qg2OqezjsOufJJ0L9srMukPfUHIpnuRhzpfSIInXNMZLiHKLYWoa
	IAtsSkW4J7jfaz7NS1njtNhvB47bEfU3x7892BHvK6UfJqvZCzOvxux3Ow86VVMW
	RXKF9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wj9b16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 05:55:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a289856eso516637785a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 21:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770875729; cv=none;
        d=google.com; s=arc-20240605;
        b=OE5+1A0OH3qEZye23+VeilEbUjIvhzGRcQ1c58hEeaUBLvPW8MEZz6lzChxNA0Nm0y
         aMVEmyALQ5JjNgVbB6atSItEYI7pt4e5r2+KB8owJbjK4/TH8PlXEeKlzQmyuN0WZQ63
         ZPta0m8AY7VvJEEPH/bpZuE+QEMXZu1MKcCw6e+Ft/jhXNvF2DHclnWkYCkvxNG3iY5F
         3/Omk5j0qm6nG2OpnAIQDhwwC8AvVQZgzVx+mueJjah/NuEud74yncAy+0QVGS/WVrDJ
         Q+g0MJMFj2Von4rX9Ui7GeMT/qEfsadcQx2qhHbasab5sSflBC1S/alLdD5LbSpPfYu/
         W9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PABovsInqWZFcjzaV/yErTLw8+1OIdrh61SmXiR9LE8=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=kXf7nuRpbyoV1C245t99iRK+wJhPyOR/Arwk2OQCH5CoaWY8EYIe88aoxpPyDx5Qb2
         E1g4WSULkgZlfCgXysYgyY6K78UBIug+m5KNZqWgGA21Se4BWXKxy4gsp4uoUocXLFvD
         Qb+Tuca5Hx0Qt/UAf+O5Om908Izd5C4K7MUX/s6WXRRykk5zCW20t6RbYRmF5j/2nYSe
         hglflCnVzaM/D8GULL6fvUVOHfCtd/2GK20IIetnz/kQ1Lze6njiwK5oQ1ZfqAS2KDK3
         p9A4l1/jJUG3mVYRqk0CZ8xMPUC4Oq1zwhTg3X8ZYcHjYX4wwDvHpnC9Il12uLbqcHyW
         Rwtg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770875729; x=1771480529; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PABovsInqWZFcjzaV/yErTLw8+1OIdrh61SmXiR9LE8=;
        b=kXCFpnApjzd9oARy8uapIR9l/118u/zeRfRvfNSKF4uGQvwdRR5TiOsEh4H+70txP6
         AT9jcHLeyvU+Tu7hVeoMl8c90vyvpyjTSz+ru8EEofDb7rYPgiXKQIYBKW/8+Ym6hwyt
         sCHz8bpj5IrHbQUFj/UvPeto7OmITh9OyG4mkrW4KDLbSQDI9TLuBHBscJ0N22auOKVM
         I7duDhkPZQfk9HjkG95JqjfnVzBeTTf4qeiPACsKUH3WoQv5WUt4fWRCMvK+OLdxrXQY
         ELuF+7N9TZ2MfJ0jU0GYAZm+I38PJaYWHRyBNkFlWr8wflJ64a0xS5czdzu/MxxtKUki
         MPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770875729; x=1771480529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PABovsInqWZFcjzaV/yErTLw8+1OIdrh61SmXiR9LE8=;
        b=RoEzEdb8LfR9oXaM4y1NO+9xPj8k4U2imVJML6y4YiVrUPswPpVKaoMJSHnwsp2inh
         Ci5lzfivgSKdob2vCwCheYyKKJCEe/pVX+E0FMVWwGKJyikKy0iOIqz69Hylca8RyBGn
         daBJE206fAf0fTgOIj3I9McjjN/qVRhf3ZTGc/8pcHvz7fTZl7IHv+f/Zs34JTX8ju8d
         cDT2VukoiN1rxTIezeK8pApY7dtpK6TU3+HwINPwDYcESpcA54ns37+p3CjuY8puvFVx
         0dFlB+/wZuGkqWUySTnBWPLLPmII63CqTIge9V8LdPswjaD03cKr6gHHbAcy16bLJ5Fn
         fuug==
X-Gm-Message-State: AOJu0Yyt5f9nEvwsU6Pg/JMGTHnCPNJh6JSpM/w1ZoKCz4lYyvG2+lsT
	g8ibXpZg95iX6Qkgg6letZ+xHo0Y9YcJUr2km3ocRsNw12WJ59gVacpGpR1uQ2Ja3KdgVpijgvY
	NzjEhVOT1JwPEkPn0Zw7GUyFkpDyS2b5vDtaIvmhBZzy8FZ2Bkueyx4iqIIHmtlDYS0E33sOt4U
	Ged7g51FyUOsT1fVVBnOtBP7AcIW0WHMUCKMjO47n7Y5Z804U7drr2gsGaKWs=
X-Gm-Gg: AZuq6aLl7q488q0U0Oo3RQymH/Rt8t7Q9U55F+qc2oCamYzT4Va+OX8srgBBU1SuoSV
	xCoj6/4Iqud/AqylJyo0DWYUWxiG/vbtwKS4ZCNQRjF+6c4oDly7P/gEYrJrvxWesvsTRyvHhat
	iY5ZoDJXA4wdgObnJeq3Hp834NahOBaK7z25zad5Yf5Pb/WP4C3WZljUsH2zrFvYojgCxgTW8KR
	hSQ
X-Received: by 2002:a05:620a:4148:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb33b94e34mr171035685a.15.1770875728608;
        Wed, 11 Feb 2026 21:55:28 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8c7:3ff0:d472 with SMTP id
 af79cd13be357-8cb33b94e34mr171034585a.15.1770875727954; Wed, 11 Feb 2026
 21:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20260207103359.4177243-1-skandigraun@gmail.com> <20260207103359.4177243-6-skandigraun@gmail.com>
In-Reply-To: <20260207103359.4177243-6-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:55:17 +0800
X-Gm-Features: AZwV_Qj0_GzIKorHuv4LXCt9BYZ9zaEZTBMBMtzeFzPWtsmKQBvvjXq6Z65XOIU
Message-ID: <CA+s=J=zCL6Ud_5WQinoZNcf1mHhcRyU8ZVkavr_cOv1GfNf7-w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 06/15] nodejs: upgrade 20.18.2 -> 20.20.0
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698d6b52 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=AKDvgvr2AAAA:20 a=vTr9H3xdAAAA:8
 a=Oh2cFVv5AAAA:8 a=-LCu6K_DAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=20KFwNOVAAAA:8 a=cm27Pg_UAAAA:8 a=6riKLmWeAAAA:8 a=EUspDBNiAAAA:8
 a=OA1nI3djpDUaFSWriX4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=7KeoIwV6GZqOttXkcoxL:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ykqYCi_xeFNNVC5ly69F:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA0MCBTYWx0ZWRfX3gUr7WyGRpx0
 f1tlHZJ0bqamGtY2a4Y1NZZemHZF81QW4mYa0WWHfuFSR2fVRb2A5rXi9pmVGq/jErofSX0Slcv
 woczc5V7FRqx4QPQNWF1z3X2ipT6KIupnyD+Esn6xF5Zqu5xl2cD7+PloPJq89ecSRxa3LyhAK7
 hRxmvBKF68Q6XHd9Y20mnenjOzvDXtMNfbAr3+N3+6rF102Kvi3N+Mku8wVkLUynb1T5+K7ZeHt
 q0k3vk1hAZc5g2ubRBl1qhCt37aj+JqI94XSj50WiE5+zsu3G2YeRvWtUh7553hR78SeoNHWu0q
 j6Bc6CYiS4TKGYCOUdQFTo13RqlTg0amvUaz/jVVfPvVo/yhcdz0TANWT1tue4dvCo6WqBsmwYx
 ylXV0NXmKP1TMHzOg7pwpd728NkLS6jghJp1RHZrS4DKG4R5fFl4dTJnoFc8QXKDrSBf7ehrkBR
 vFjZIbhnaii+ePP1wrg==
X-Proofpoint-ORIG-GUID: VCh3UwHXA7M3vIyEGj1My3SPpJ3NqGJU
X-Proofpoint-GUID: VCh3UwHXA7M3vIyEGj1My3SPpJ3NqGJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 05:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124342

This is failing with qemuarm + gcc:

| ../deps/llhttp/src/llhttp.c: In function 'llhttp__internal__run':
| ../deps/llhttp/src/llhttp.c:2645:9: note: use
'-flax-vector-conversions' to permit conversions between vectors with
differing element types or numbers of subparts
|  2645 |         );
|       |         ^
| ../deps/llhttp/src/llhttp.c:2643:11: error: incompatible type for
argument 1 of 'vandq_u16'
|  2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           |
|       |           uint8x16_t

This seems same: https://github.com/xmrig/xmrig/issues/3673


On Sat, Feb 7, 2026 at 6:34=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Part of nodejs LTS release, contains many security- and bugfixes.
>
> Ptests passed successfully.
>
> Full changelog:
> https://github.com/nodejs/node/blob/v20.x/doc/changelogs/CHANGELOG_V20.md
>
> Dropped patches that are included in this release.
>
> Added 0001-Revert-stop-using-deprecated-ares_query.patch:
> Nodejs has changed a deprecated c-ares call to a newer version,
> however this newer method is not available in the c-ares shipped
> in meta-oe, and it failed to compile (the new call was added to c-ares
> in v1.28.0, but Scarthgap comes with v1.27.0). This patch reverts this
> failing commit completely. Based on the PR/issue discussions, the
> only goal was to eliminate deprecation warnings. There seem to be
> no logic change from this change.
>
> License-Update:
> - The license file was regenerated, to ensure it is up to date.
>   It contains all licenses from all vendored dependecies. This
>   resulted in adding nlohmann-json license to the file, which
>   is MIT. There were already other MIT dependencies, so this
>   didn't change the overall license declaration.
> - base64 related license was removed, because base64 code was
>   simplified, so it doesn't depend on this library anymore.
>   (It was BSD-2-Clause, but there ar other dependencies using
>   this license, so the overall license didn't change)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../oe-npm-cache                              |   0
>  ....18.bb =3D> nodejs-oe-cache-native_20.20.bb} |   0
>  ...e-running-gyp-files-for-bundled-deps.patch |  46 -----
>  ...ert-stop-using-deprecated-ares_query.patch | 164 ++++++++++++++++
>  ...4-Do-not-use-mminimal-toc-with-clang.patch |  27 ++-
>  .../0001-src-fix-build-with-GCC-15.patch      |  33 ----
>  .../nodejs/nodejs/182d9c05e78.patch           | 182 ------------------
>  .../nodejs/zlib-fix-pointer-alignment.patch   |  64 ------
>  .../{nodejs_20.18.2.bb =3D> nodejs_20.20.0.bb}  |   9 +-
>  9 files changed, 185 insertions(+), 340 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.18 =3D> nodej=
s-oe-cache-20.20}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.18.bb =
=3D> nodejs-oe-cache-native_20.20.bb} (100%)
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-r=
unning-gyp-files-for-bundled-deps.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-st=
op-using-deprecated-ares_query.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-b=
uild-with-GCC-15.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.pa=
tch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-point=
er-alignment.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.18.2.bb =3D> nodejs_20=
.20.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.20/oe-npm-cache
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-=
cache
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.20/oe-npm-ca=
che
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.20.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.=
bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.20.bb
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-=
gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0=
001-Disable-running-gyp-files-for-bundled-deps.patch
> deleted file mode 100644
> index 12f6cd8b96..0000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-fil=
es-for-bundled-deps.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 2001
> -From: Zuzana Svetlikova <zsvetlik@redhat.com>
> -Date: Thu, 27 Apr 2017 14:25:42 +0200
> -Subject: [PATCH] Disable running gyp on shared deps
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Probably imported from:
> -https://src.fedoraproject.org/rpms/nodejs/c/41af04f2a3c050fb44628e91ac65=
fd225b927acb?branch=3D22609d8c1bfeaa21fe0057645af20b3a2ccc7f53
> -which is probably based on dont-run-gyp-files-for-bundled-deps.patch add=
ed in:
> -https://github.com/alpinelinux/aports/commit/6662eb3199902e8451fb20dce82=
554ad96f796bb
> -
> -We also explicitly prune some dependencies from source in the bitbake re=
cipe:
> -
> -python prune_sources() {
> -    import shutil
> -
> -    shutil.rmtree(d.getVar('S') + '/deps/openssl')
> -    if 'ares' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/deps/cares')
> -    if 'brotli' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/deps/brotli')
> -    if 'libuv' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/deps/uv')
> -    if 'nghttp2' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/deps/nghttp2')
> -    if 'zlib' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/deps/zlib')
> -}
> -do_unpack[postfuncs] +=3D "prune_sources"
> -
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -169,7 +169,7 @@ with-code-cache test-code-cache:
> -       $(warning '$@' target is a noop)
> -
> - out/Makefile: config.gypi common.gypi node.gyp \
> --      deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
> -+      deps/llhttp/llhttp.gyp \
> -       deps/simdutf/simdutf.gyp deps/ada/ada.gyp \
> -       tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi =
\
> -       tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-usin=
g-deprecated-ares_query.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001=
-Revert-stop-using-deprecated-ares_query.patch
> new file mode 100644
> index 0000000000..ae4c316baf
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-depre=
cated-ares_query.patch
> @@ -0,0 +1,164 @@
> +From f421a0f1f962acff2c71cba06c9ae2af85bd09ee Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Fri, 6 Feb 2026 21:42:56 +0100
> +Subject: [PATCH] Revert "stop using deprecated ares_query"
> +
> +Nodejs has removed the usage of some deprecated c-ares calls[1],
> +however as a result the c-ares requirements have increased beyond
> +the c-ares version than what is available in Scarthgap.
> +
> +Due to this it failed to compile:
> +../src/cares_wrap.h:264:22: error: 'ares_query_dnsrec' was not declared =
in this scope
> +
> +To be able to still compile nodejs, keep using the original, deprectaed
> +calls. This patch reverts the below linked commit.
> +
> +[1]: https://github.com/nodejs/node/commit/22e0d17097fa419cde5fcd5d648fe=
70aa9fb80e2
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/cares_wrap.cc | 24 ++++++++++++------------
> + src/cares_wrap.h  | 35 ++++++++++++++++-------------------
> + 2 files changed, 28 insertions(+), 31 deletions(-)
> +
> +diff --git a/src/cares_wrap.cc b/src/cares_wrap.cc
> +index 2388c604..5a8e11c7 100644
> +--- a/src/cares_wrap.cc
> ++++ b/src/cares_wrap.cc
> +@@ -825,62 +825,62 @@ void ChannelWrap::EnsureServers() {
> + }
> +
> + int AnyTraits::Send(QueryWrap<AnyTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_ANY);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_any);
> +   return ARES_SUCCESS;
> + }
> +
> + int ATraits::Send(QueryWrap<ATraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_A);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_a);
> +   return ARES_SUCCESS;
> + }
> +
> + int AaaaTraits::Send(QueryWrap<AaaaTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_AAAA);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_aaaa);
> +   return ARES_SUCCESS;
> + }
> +
> + int CaaTraits::Send(QueryWrap<CaaTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_CAA);
> ++  wrap->AresQuery(name, ns_c_in, T_CAA);
> +   return ARES_SUCCESS;
> + }
> +
> + int CnameTraits::Send(QueryWrap<CnameTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_CNAME);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_cname);
> +   return ARES_SUCCESS;
> + }
> +
> + int MxTraits::Send(QueryWrap<MxTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_MX);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_mx);
> +   return ARES_SUCCESS;
> + }
> +
> + int NsTraits::Send(QueryWrap<NsTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_NS);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_ns);
> +   return ARES_SUCCESS;
> + }
> +
> + int TxtTraits::Send(QueryWrap<TxtTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_TXT);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_txt);
> +   return ARES_SUCCESS;
> + }
> +
> + int SrvTraits::Send(QueryWrap<SrvTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_SRV);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_srv);
> +   return ARES_SUCCESS;
> + }
> +
> + int PtrTraits::Send(QueryWrap<PtrTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_PTR);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_ptr);
> +   return ARES_SUCCESS;
> + }
> +
> + int NaptrTraits::Send(QueryWrap<NaptrTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_NAPTR);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_naptr);
> +   return ARES_SUCCESS;
> + }
> +
> + int SoaTraits::Send(QueryWrap<SoaTraits>* wrap, const char* name) {
> +-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_SOA);
> ++  wrap->AresQuery(name, ns_c_in, ns_t_soa);
> +   return ARES_SUCCESS;
> + }
> +
> +diff --git a/src/cares_wrap.h b/src/cares_wrap.h
> +index a770d9e3..820c5d88 100644
> +--- a/src/cares_wrap.h
> ++++ b/src/cares_wrap.h
> +@@ -254,20 +254,18 @@ class QueryWrap final : public AsyncWrap {
> +     return Traits::Send(this, name);
> +   }
> +
> +-  void AresQuery(const char* name,
> +-                 ares_dns_class_t dnsclass,
> +-                 ares_dns_rec_type_t type) {
> ++  void AresQuery(const char* name, int dnsclass, int type) {
> +     channel_->EnsureServers();
> +     TRACE_EVENT_NESTABLE_ASYNC_BEGIN1(
> +       TRACING_CATEGORY_NODE2(dns, native), trace_name_, this,
> +       "name", TRACE_STR_COPY(name));
> +-    ares_query_dnsrec(channel_->cares_channel(),
> +-                      name,
> +-                      dnsclass,
> +-                      type,
> +-                      Callback,
> +-                      MakeCallbackPointer(),
> +-                      nullptr);
> ++    ares_query(
> ++        channel_->cares_channel(),
> ++        name,
> ++        dnsclass,
> ++        type,
> ++        Callback,
> ++        MakeCallbackPointer());
> +   }
> +
> +   void ParseError(int status) {
> +@@ -314,20 +312,19 @@ class QueryWrap final : public AsyncWrap {
> +     return wrap;
> +   }
> +
> +-  static void Callback(void* arg,
> +-                       ares_status_t status,
> +-                       size_t timeouts,
> +-                       const ares_dns_record_t* dnsrec) {
> ++  static void Callback(
> ++      void* arg,
> ++      int status,
> ++      int timeouts,
> ++      unsigned char* answer_buf,
> ++      int answer_len) {
> +     QueryWrap<Traits>* wrap =3D FromCallbackPointer(arg);
> +     if (wrap =3D=3D nullptr) return;
> +
> +     unsigned char* buf_copy =3D nullptr;
> +-    size_t answer_len =3D 0;
> +     if (status =3D=3D ARES_SUCCESS) {
> +-      // No need to explicitly call ares_free_string here,
> +-      // as it is a wrapper around free, which is already
> +-      // invoked when MallocedBuffer is destructed.
> +-      ares_dns_write(dnsrec, &buf_copy, &answer_len);
> ++      buf_copy =3D node::Malloc<unsigned char>(answer_len);
> ++      memcpy(buf_copy, answer_buf, answer_len);
> +     }
> +
> +     wrap->response_data_ =3D std::make_unique<ResponseData>();
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use=
-mminimal-toc-with-clang.patch b/meta-oe/recipes-devtools/nodejs/nodejs/000=
1-ppc64-Do-not-use-mminimal-toc-with-clang.patch
> index dd9c9015e2..3c78ac87ae 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminim=
al-toc-with-clang.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminim=
al-toc-with-clang.patch
> @@ -14,12 +14,21 @@ Upstream-Status: Pending
>
>  --- a/common.gypi
>  +++ b/common.gypi
> -@@ -417,7 +417,7 @@
> -             'ldflags': [ '-m32' ],
> -           }],
> -           [ 'target_arch=3D=3D"ppc64" and OS!=3D"aix"', {
> --            'cflags': [ '-m64', '-mminimal-toc' ],
> -+            'cflags': [ '-m64' ],
> -             'ldflags': [ '-m64' ],
> -           }],
> -           [ 'target_arch=3D=3D"s390x"', {
> +@@ -498,7 +498,7 @@
> +                 'ldflags': [ '-m32' ],
> +               }],
> +               [ 'host_arch=3D=3D"ppc64" and OS not in "aix os400"', {
> +-                'cflags': [ '-m64', '-mminimal-toc' ],
> ++                'cflags': [ '-m64' ],
> +                 'ldflags': [ '-m64' ],
> +               }],
> +               [ 'host_arch=3D=3D"s390x" and OS=3D=3D"linux"', {
> +@@ -522,7 +522,7 @@
> +                 'ldflags': [ '-m32' ],
> +               }],
> +               [ 'target_arch=3D=3D"ppc64" and OS not in "aix os400"', {
> +-                'cflags': [ '-m64', '-mminimal-toc' ],
> ++                'cflags': [ '-m64' ],
> +                 'ldflags': [ '-m64' ],
> +               }],
> +               [ 'target_arch=3D=3D"s390x" and OS=3D=3D"linux"', {
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-wi=
th-GCC-15.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build=
-with-GCC-15.patch
> deleted file mode 100644
> index 9d09f4f482..0000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-=
15.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From bade7a1866618b9e46358b839fe5fdf16b1db2be Mon Sep 17 00:00:00 2001
> -From: tjuhaszrh <tjuhasz@redhat.com>
> -Date: Sat, 25 Jan 2025 10:34:54 +0100
> -Subject: [PATCH] src: fix build with GCC 15
> -
> -Added cstdint to worker_inspector as on more recent version of gcc
> -the build was failing due to changes to libstdc++ and the removal
> -of transitive includes.
> -
> -PR-URL: https://github.com/nodejs/node/pull/56740
> -Fixes: https://github.com/nodejs/node/issues/56731
> -Reviewed-By: Antoine du Hamel <duhamelantoine1995@gmail.com>
> -Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
> -Reviewed-By: Richard Lau <rlau@redhat.com>
> -Reviewed-By: James M Snell <jasnell@gmail.com>
> -
> -Upstream-Status: Backport [https://github.com/nodejs/node/commit/bade7a1=
866618b9e46358b839fe5fdf16b1db2be]
> ----
> - src/inspector/worker_inspector.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/inspector/worker_inspector.h b/src/inspector/worker_ins=
pector.h
> -index d3254d5aa0ebe4..24403bb1704c40 100644
> ---- a/src/inspector/worker_inspector.h
> -+++ b/src/inspector/worker_inspector.h
> -@@ -5,6 +5,7 @@
> - #error("This header can only be used when inspector is enabled")
> - #endif
> -
> -+#include <cstdint>
> - #include <memory>
> - #include <string>
> - #include <unordered_map>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch b/m=
eta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
> deleted file mode 100644
> index 9b3fc566c8..0000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
> +++ /dev/null
> @@ -1,182 +0,0 @@
> -From 182d9c05e78b1ddb1cb8242cd3628a7855a0336f Mon Sep 17 00:00:00 2001
> -From: Andrey Kosyakov <caseq@chromium.org>
> -Date: Thu, 17 Aug 2023 13:50:11 -0700
> -Subject: [PATCH] Define UChar as char16_t
> -
> -We used to have UChar defined as uint16_t which does not go along
> -with STL these days if you try to have an std::basic_string<> of it,
> -as there are no standard std::char_traits<> specialization for uint16_t.
> -
> -This switches UChar to char16_t where practical, introducing a few
> -compatibility shims to keep CL size small, as (1) this would likely
> -have to be back-ported and (2) crdtp extensively uses uint16_t for
> -wide chars.
> -
> -Bug: b:296390693
> -Change-Id: I66a32d8f0050915225b187de56896c26dd76163d
> -Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/4789966
> -Reviewed-by: Jaroslav Sevcik <jarin@chromium.org>
> -Commit-Queue: Jaroslav Sevcik <jarin@chromium.org>
> -Auto-Submit: Andrey Kosyakov <caseq@chromium.org>
> -Cr-Commit-Position: refs/heads/main@{#89559}
> -
> -Upstream-Status: Backport [https://chromium-review.googlesource.com/c/v8=
/v8/+/4789966]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/inspector/string-16.cc                             |  8 +++++++-
> - src/inspector/string-16.h                              | 10 ++++++++--
> - src/inspector/v8-string-conversions.cc                 |  6 +++---
> - src/inspector/v8-string-conversions.h                  |  6 ++++--
> - .../inspector_protocol/crdtp/test_platform_v8.cc       |  9 ++++++---
> - 5 files changed, 28 insertions(+), 11 deletions(-)
> -
> ---- a/deps/v8/src/inspector/string-16.cc
> -+++ b/deps/v8/src/inspector/string-16.cc
> -@@ -27,7 +27,7 @@ bool isSpaceOrNewLine(UChar c) {
> -   return isASCII(c) && c <=3D ' ' && (c =3D=3D ' ' || (c <=3D 0xD && c =
>=3D 0x9));
> - }
> -
> --int64_t charactersToInteger(const UChar* characters, size_t length,
> -+int64_t charactersToInteger(const uint16_t* characters, size_t length,
> -                             bool* ok =3D nullptr) {
> -   std::vector<char> buffer;
> -   buffer.reserve(length + 1);
> -@@ -50,6 +50,8 @@ int64_t charactersToInteger(const UChar*
> -
> - String16::String16(const UChar* characters, size_t size)
> -     : m_impl(characters, size) {}
> -+String16::String16(const uint16_t* characters, size_t size)
> -+    : m_impl(reinterpret_cast<const UChar*>(characters), size) {}
> -
> - String16::String16(const UChar* characters) : m_impl(characters) {}
> -
> -@@ -241,6 +243,10 @@ String16 String16::fromUTF16LE(const UCh
> - #endif  // V8_TARGET_BIG_ENDIAN
> - }
> -
> -+String16 String16::fromUTF16LE(const uint16_t* stringStart, size_t leng=
th) {
> -+  return fromUTF16LE(reinterpret_cast<const UChar*>(stringStart), lengt=
h);
> -+}
> -+
> - std::string String16::utf8() const {
> -   return UTF16ToUTF8(m_impl.data(), m_impl.size());
> - }
> ---- a/deps/v8/src/inspector/string-16.h
> -+++ b/deps/v8/src/inspector/string-16.h
> -@@ -6,6 +6,7 @@
> - #define V8_INSPECTOR_STRING_16_H_
> -
> - #include <stdint.h>
> -+#include <uchar.h>
> -
> - #include <cctype>
> - #include <climits>
> -@@ -17,7 +18,7 @@
> -
> - namespace v8_inspector {
> -
> --using UChar =3D uint16_t;
> -+using UChar =3D char16_t;
> -
> - class String16 {
> -  public:
> -@@ -27,6 +28,7 @@ class String16 {
> -   String16(const String16&) V8_NOEXCEPT =3D default;
> -   String16(String16&&) V8_NOEXCEPT =3D default;
> -   String16(const UChar* characters, size_t size);
> -+  String16(const uint16_t* characters, size_t size);
> -   V8_EXPORT String16(const UChar* characters);
> -   V8_EXPORT String16(const char* characters);
> -   String16(const char* characters, size_t size);
> -@@ -48,7 +50,9 @@ class String16 {
> -   int toInteger(bool* ok =3D nullptr) const;
> -   std::pair<size_t, size_t> getTrimmedOffsetAndLength() const;
> -   String16 stripWhiteSpace() const;
> --  const UChar* characters16() const { return m_impl.c_str(); }
> -+  const uint16_t* characters16() const {
> -+    return reinterpret_cast<const uint16_t*>(m_impl.c_str());
> -+  }
> -   size_t length() const { return m_impl.length(); }
> -   bool isEmpty() const { return !m_impl.length(); }
> -   UChar operator[](size_t index) const { return m_impl[index]; }
> -@@ -78,6 +82,8 @@ class String16 {
> -   // On Big endian architectures, byte order needs to be flipped.
> -   V8_EXPORT static String16 fromUTF16LE(const UChar* stringStart,
> -                                         size_t length);
> -+  V8_EXPORT static String16 fromUTF16LE(const uint16_t* stringStart,
> -+                                        size_t length);
> -
> -   std::size_t hash() const {
> -     if (!hash_code) {
> ---- a/deps/v8/src/inspector/v8-string-conversions.cc
> -+++ b/deps/v8/src/inspector/v8-string-conversions.cc
> -@@ -12,7 +12,7 @@
> -
> - namespace v8_inspector {
> - namespace {
> --using UChar =3D uint16_t;
> -+using UChar =3D char16_t;
> - using UChar32 =3D uint32_t;
> -
> - bool isASCII(UChar c) { return !(c & ~0x7F); }
> -@@ -386,7 +386,7 @@ std::string UTF16ToUTF8(const UChar* str
> -
> - std::basic_string<UChar> UTF8ToUTF16(const char* stringStart, size_t le=
ngth) {
> -   if (!stringStart || !length) return std::basic_string<UChar>();
> --  std::vector<uint16_t> buffer(length);
> -+  std::vector<UChar> buffer(length);
> -   UChar* bufferStart =3D buffer.data();
> -
> -   UChar* bufferCurrent =3D bufferStart;
> -@@ -395,7 +395,7 @@ std::basic_string<UChar> UTF8ToUTF16(con
> -                          reinterpret_cast<const char*>(stringStart + le=
ngth),
> -                          &bufferCurrent, bufferCurrent + buffer.size(),=
 nullptr,
> -                          true) !=3D conversionOK)
> --    return std::basic_string<uint16_t>();
> -+    return std::basic_string<UChar>();
> -   size_t utf16Length =3D bufferCurrent - bufferStart;
> -   return std::basic_string<UChar>(bufferStart, bufferStart + utf16Lengt=
h);
> - }
> ---- a/deps/v8/src/inspector/v8-string-conversions.h
> -+++ b/deps/v8/src/inspector/v8-string-conversions.h
> -@@ -5,14 +5,16 @@
> - #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
> - #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
> -
> -+#include <uchar.h>
> -+
> - #include <cstdint>
> - #include <string>
> -
> - // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}.=
 You may
> - // want to use string-16.h directly rather than these.
> - namespace v8_inspector {
> --std::basic_string<uint16_t> UTF8ToUTF16(const char* stringStart, size_t=
 length);
> --std::string UTF16ToUTF8(const uint16_t* stringStart, size_t length);
> -+std::basic_string<char16_t> UTF8ToUTF16(const char* stringStart, size_t=
 length);
> -+std::string UTF16ToUTF8(const char16_t* stringStart, size_t length);
> - }  // namespace v8_inspector
> -
> - #endif  // V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
> ---- a/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
> -+++ b/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
> -@@ -11,13 +11,16 @@
> - namespace v8_crdtp {
> -
> - std::string UTF16ToUTF8(span<uint16_t> in) {
> --  return v8_inspector::UTF16ToUTF8(in.data(), in.size());
> -+  return v8_inspector::UTF16ToUTF8(reinterpret_cast<const char16_t*>(in=
.data()),
> -+                                   in.size());
> - }
> -
> - std::vector<uint16_t> UTF8ToUTF16(span<uint8_t> in) {
> --  std::basic_string<uint16_t> utf16 =3D v8_inspector::UTF8ToUTF16(
> -+  std::basic_string<char16_t> utf16 =3D v8_inspector::UTF8ToUTF16(
> -       reinterpret_cast<const char*>(in.data()), in.size());
> --  return std::vector<uint16_t>(utf16.begin(), utf16.end());
> -+  return std::vector<uint16_t>(
> -+      reinterpret_cast<const uint16_t*>(utf16.data()),
> -+      reinterpret_cast<const uint16_t*>(utf16.data()) + utf16.size());
> - }
> -
> - }  // namespace v8_crdtp
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alig=
nment.patch b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-align=
ment.patch
> deleted file mode 100644
> index 824ff678c6..0000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.p=
atch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From bbcd1f33161fd9874e8a61999d2739b177f99723 Mon Sep 17 00:00:00 2001
> -From: Jeroen Hofstee <jhofstee@victronenergy.com>
> -Date: Mon, 28 Apr 2025 14:21:44 +0000
> -Subject: [PATCH] zlib: fix pointer alignment
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The function AllocForBrotli prefixes the allocated memory with its
> -size, and returns a pointer to the region after it. This pointer can
> -however no longer be suitably aligned. Correct this by allocating
> -the maximum of the the size of the size_t and the max alignment.
> -
> -On Arm 32bits the size_t is 4 bytes long, but the alignment is 8 for
> -some NEON instructions. When Brotli is compiled with optimizations
> -enabled newer GCC versions will use the NEON instructions and trigger
> -a bus error killing node.
> -
> -see https://github.com/google/brotli/issues/1159
> -
> -PR-URL: https://github.com/nodejs/node/pull/57727
> -Reviewed-By: Shelley Vohr <shelley.vohr@gmail.com>
> -Reviewed-By: Tobias Nie=C3=9Fen <tniessen@tnie.de>
> -Reviewed-By: Daniel Lemire <daniel@lemire.me>
> -Reviewed-By: Gerhard St=C3=B6bich <deb2001-github@yahoo.de>
> -
> -Upstream-Status: Backport [https://github.com/nodejs/node/commit/dc035bb=
c9b310ff8067bc0dad22230978489c061]
> ----
> - src/node_zlib.cc | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/node_zlib.cc b/src/node_zlib.cc
> -index 66370e41..a537e766 100644
> ---- a/src/node_zlib.cc
> -+++ b/src/node_zlib.cc
> -@@ -493,20 +493,22 @@ class CompressionStream : public AsyncWrap, public=
 ThreadPoolWork {
> -   }
> -
> -   static void* AllocForBrotli(void* data, size_t size) {
> --    size +=3D sizeof(size_t);
> -+    constexpr size_t offset =3D std::max(sizeof(size_t), alignof(max_al=
ign_t));
> -+    size +=3D offset;
> -     CompressionStream* ctx =3D static_cast<CompressionStream*>(data);
> -     char* memory =3D UncheckedMalloc(size);
> -     if (UNLIKELY(memory =3D=3D nullptr)) return nullptr;
> -     *reinterpret_cast<size_t*>(memory) =3D size;
> -     ctx->unreported_allocations_.fetch_add(size,
> -                                            std::memory_order_relaxed);
> --    return memory + sizeof(size_t);
> -+    return memory + offset;
> -   }
> -
> -   static void FreeForZlib(void* data, void* pointer) {
> -     if (UNLIKELY(pointer =3D=3D nullptr)) return;
> -     CompressionStream* ctx =3D static_cast<CompressionStream*>(data);
> --    char* real_pointer =3D static_cast<char*>(pointer) - sizeof(size_t)=
;
> -+    constexpr size_t offset =3D std::max(sizeof(size_t), alignof(max_al=
ign_t));
> -+    char* real_pointer =3D static_cast<char*>(pointer) - offset;
> -     size_t real_size =3D *reinterpret_cast<size_t*>(real_pointer);
> -     ctx->unreported_allocations_.fetch_sub(real_size,
> -                                            std::memory_order_relaxed);
> ---
> -2.43.0
> -
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.20.0.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
> index d757a7395c..1bc5a6e9cd 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Ap=
ache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc83fcdcd43ab352be6429ee1fd882=
7a0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dac91fab5dbaf757274d2b29888f94=
3ef"
>
>  CVE_PRODUCT =3D "nodejs node.js"
>
> @@ -20,14 +20,11 @@ COMPATIBLE_HOST:riscv32 =3D "null"
>  COMPATIBLE_HOST:powerpc =3D "null"
>
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
> -           file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
>             file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>             file://system-c-ares.patch \
>             file://0001-liftoff-Correct-function-signatures.patch \
>             file://libatomic.patch \
> -           file://182d9c05e78.patch \
> -           file://zlib-fix-pointer-alignment.patch \
> -           file://0001-src-fix-build-with-GCC-15.patch \
> +           file://0001-Revert-stop-using-deprecated-ares_query.patch \
>             file://run-ptest \
>             "
>  SRC_URI:append:class-target =3D " \
> @@ -36,7 +33,7 @@ SRC_URI:append:class-target =3D " \
>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>             "
> -SRC_URI[sha256sum] =3D "69bf81b70f3a95ae0763459f02860c282d7e3a47567c8afa=
f126cc778176a882"
> +SRC_URI[sha256sum] =3D "5294d9d2915620e819e6892fd7e545b98d650bad36dae54e=
6527eaac482add98"
>
>  S =3D "${WORKDIR}/node-v${PV}"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124247): https://lists.openembedded.org/g/openembedde=
d-devel/message/124247
> Mute This Topic: https://lists.openembedded.org/mt/117686814/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

