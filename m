Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF81ACD5BAB
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 02:44:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8502.1779677073608719556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 19:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=coeWs2MP;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gwbfM0M4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1BaMX4120815
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 02:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUvLkMPVeJHssO2Ox6Y7oQvF6ziG+4k6DVdF0OuE5hU=; b=coeWs2MPWYGT2aHU
	fTbLX+n5zi0EPMtJmxlMnXWKOPLMGQvTP8lnC2aqkSKt185WMVMpVy9JSwfI7+Rt
	Jpm8kqZLujOvOBB4PFenSnnhmnB02RLYMO/eLKg8oBNQxbKaaDJMO/6wfkm6IN1l
	F2xXeKU23b1AOFxUAOpQFmgG1PYIbN86LNpC9ybLYKa1JrH3NRvIckTEKeP69vO3
	rGhMQi9er5gzyQRZXKsU2aEzAXQlyELjmf4A0zIhIJ01pEPywu+WNVUevzz/PNFU
	FkkZsbl5IZzRJ/ANXCqy8HIttau716q2fWBRp6gPez4niLBSZytUZAhV/DUJvUDQ
	N7Cv4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fvgy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 02:44:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ceea1984so72169341cf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 19:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779677072; cv=none;
        d=google.com; s=arc-20240605;
        b=TY1HgV2PS08IcGI5DAxu+jZPVZXx//JbCti1Dd0x5nGQ5uMr1OqCcqkNFVdast7WxI
         rTm4u2m8MBESXcPGgN7xx6Y/GaiCbaIK7989/9srGC53cRjJx4/k23Fz6g1EbjUt1UTO
         jM6a6bYog0aw0K9UiU6UVYs7d7PSkijYoukRxuP8gfIwCHl7P6/Noqwl/oH2V/PrIF1J
         bIj4pST9GF3O0uAq7CdNtdcMYF/bTW7L9Ig8qYq4IAKU8FE8HBpt/jEWcPG7imS3mFlD
         +2lO2gkGYT332eKSjNDCe6j7u0ulHJyoIJM0vB0J4yP1/7G2NKnMYMj8kZZu73GabhRI
         qupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUvLkMPVeJHssO2Ox6Y7oQvF6ziG+4k6DVdF0OuE5hU=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=SI14cEoLG9O1iKommNmM/c6o5jsWCVMZwzPF760dAkq1mF/p8n45JEANY7KqswS/Sv
         anWpIcIrixyoFD9ue+SUkKlGAbiQiby37PwbAfnDtOl8aDXvCGJaTu5nWHSNLzYGt8U6
         7QSwLiVk6z8okxhEEh04R6T2XT5bI4eZGu7z9wHqaK2eLI+fC6zn0GoDjLtcU3/gxlJj
         SPn7Szac1FJCm+VoQOI42HWm7xcEjvYJ5nav3zk0RhtpLE3aJxxn7pmhbnvHl86jhLMq
         eWM9XbwyM6/Y8VkAaRzZ3oMf+TIOG5XZUJzy5l1FB5BlOu8opDP3sdNMloqy5EphEbGU
         ll3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779677072; x=1780281872; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUvLkMPVeJHssO2Ox6Y7oQvF6ziG+4k6DVdF0OuE5hU=;
        b=gwbfM0M4KfLhx4uwwBVOqxJGTnZ0egsP/G7XCe3I4ygUzCIT2fQuPgAVtA/lZ9zMCC
         DlnhgNCpCx+IxcAiLLdXggyW455LxuQZBYzICTri4wjOIgJs3TebZSO3UvbMWtnrWCOJ
         mT7jW3vokOiaKmLX1T1zeAnoNxsfDIKPhRZsVYwGhBs3kYAwrMysq11CmHAlo4j/1qiw
         RsQo4z7oQK8G9Yzw5A3Qm4VLPVEG/XvYqGVgUKQQlym3QIeo0wHA7R3GWt1KKKyQMSun
         rX7yVj69g9t/V0fvT3Xjcpue6g0zompPPxWeIquVFXtnMV/pqSU6JhVX+hp/rKsxCuYY
         enuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779677072; x=1780281872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zUvLkMPVeJHssO2Ox6Y7oQvF6ziG+4k6DVdF0OuE5hU=;
        b=kiTFodyc75liH+KE1rnM0LPndtz5EzRM0zELPiwEYniLwfnxim98oBfV+/8zMaoBUL
         lWJvZGOvuVEU/CwMixTWx7AZq1hMab47/qPZqVNiYJlh9dPnn00P9isUOG/CaahMFgAw
         l++RjOk50S+as9vRsBRzcvyzS/icG2RjmAdpNRDBu1bUz2rjema120a/Iisf8N+5nhSv
         9Xsxjc4C2pps2MvDHr4h7qJZG4HaSO6cuEbZ4Pllkv2uUba262MDMc8LepEbAGd+WXIe
         Z0cCr5u5we5s3j+actJzYQx/4FriBrrTj2IkPJa9cq1ePWfXL+Y5dxM4wavne/XuvZNL
         EYog==
X-Gm-Message-State: AOJu0Yw8VCBU/TzqxDGTCsIMXYPW/s9KjU9yNjXl196VO5rDuBrOy1dg
	oTW0vBPQr8DcChWkG3EW7wERbBCd04/zpy3R+zCiwMBGe4ibp5Mrpr0ZTfplzJxwsRukWbbi58z
	sJUz6GNLVWoSNGAv+iTj2xwrN28Gk4K+SdySwG8Wo0aOxxdrPUX/pgKm8b/Wg+/pgUjtrwwpOXv
	BEzwSv88X6L6y6JJdMCPxrxtqpNKcoOhYxsSjAwVZkPsA2lcMCOARRBPfe+Ao=
X-Gm-Gg: Acq92OEr2z4sKZEdt6/pR/iQTJhMjE3rHcae4KJTh/eZNJZJsCXmQhz31AQVewpAE37
	CmDAS5PeCw1an4JWppsmKeRb6spPoCQZ3btLV+vUdnkf9OH86pzdqj72tOBJUrqXK7K3sArlujS
	YWmFTmD0MF9J68acUWrIoyZNP7GVfsEhxUg4GjpN0Dk46aGq621aa08eExb1Exsvf0HQ4LWW/Z/
	ZUW
X-Received: by 2002:a05:622a:40a:b0:516:df49:bea4 with SMTP id d75a77b69052e-516df49c60fmr135185161cf.16.1779677071612;
        Sun, 24 May 2026 19:44:31 -0700 (PDT)
X-Received: by 2002:a05:622a:40a:b0:516:df49:bea4 with SMTP id
 d75a77b69052e-516df49c60fmr135184911cf.16.1779677071090; Sun, 24 May 2026
 19:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260523123907.2609140-1-ankur.tyagi85@gmail.com> <20260523123907.2609140-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260523123907.2609140-2-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 25 May 2026 10:44:20 +0800
X-Gm-Features: AVHnY4LkSsjpYdwLfDFQkb6wFPmJyUT45jD_af4NM5wj-kds01byr_MiTa-mlDY
Message-ID: <CA+s=J=yqdHHStXHOk_yYgBYRiW_vKGqpx_DBJJeDZkBzptc_hg@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/3] redis: upgrade 7.2.12 -> 7.2.14
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDAyMyBTYWx0ZWRfXw1HvVpT5yBT4
 sAUg7cZlkibvc+bA0OL1+nqxnGqPpgKPoJ9fhaWyPfNoamB3VWg+LyB+K5e5cFzESvOXpAkXqJi
 ebCdUXnM6lK1R7nA/0mrvA9MR8j9xps6pF1X/9nIznR9moADg0r1h67PdRDRMbHkiisrl4LV/bT
 8tK7lDDWwuHRIZkPEHaFo4F1nvVatVcOUadNqtAkpIFI+i3SCTjf0147/RAhQX6CboR4aIt5NjF
 5Bg2WGcqkGLcjAye1xONsCehPFtTmc4miNyZxQXB7zVc6Bf8TSCfOrxAm+tRnh5lZWIq2m4YVBC
 i4jpzsWEIIF3r2iZg1ZnpeJXIWbpgOBUjWL2c+yWkyyXSzpS6XCxEofByrXfOU+jfQut2A5wL1A
 fCiBliqjF1qpEB9aRa1RchY5Lp59WNV+Y21wgoALb4kcdO1kIBFiYjJCtXeF30JAlnpIzIP/Gue
 lFHTqUhGZM0pW42/NGQ==
X-Proofpoint-ORIG-GUID: wqI3M65ZYqZhk9IpI97E9DI2EASjuTdv
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a13b790 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=kw_7P3TwAAAA:20 a=7UKGVgRVAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=1KubnttrAAAA:8 a=t7CeM3EgAAAA:8 a=JF9118EUAAAA:8
 a=EUspDBNiAAAA:8 a=pBSoQ8bF24UUFtfwxRgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=H0t3PWKhy-h45uLjrunQ:22 a=FdTzh2GWekK77mhwV6Dw:22 a=xVlTc564ipvMDusKsbsT:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: wqI3M65ZYqZhk9IpI97E9DI2EASjuTdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_07,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 02:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127193

On Sat, May 23, 2026 at 8:39=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Also refreshed patches to resolve patch fuzz QA issue.
>
> Bug and security fix release
> https://github.com/redis/redis/releases/tag/7.2.13
> https://github.com/redis/redis/releases/tag/7.2.14
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../0001-hiredis-use-default-CC-if-it-is-set.patch   | 12 ++++++++----
>  ...e-Makefile-to-use-environment-build-setting.patch |  6 +++---
>  .../0003-hack-to-force-use-of-libc-malloc.patch      |  8 ++++----
>  .../redis/0004-src-Do-not-reset-FINAL_LIBS.patch     |  6 +++---
>  ...GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 10 +++++-----
>  .../0006-Define-correct-gregs-for-RISCV32.patch      |  8 ++++----
>  .../redis/{redis_7.2.12.bb =3D> redis_7.2.14.bb}       |  2 +-
>  7 files changed, 28 insertions(+), 24 deletions(-)
>  rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb =3D> redis_7.2.14=
.bb} (97%)

Fails with error:


ERROR: redis-7.2.14-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-hiredis-use-default-CC-if-it-is-set.patch
patching file deps/hiredis/Makefile
Hunk #1 succeeded at 36 with fuzz 2 (offset -6 lines).


Applying patch 0003-hack-to-force-use-of-libc-malloc.patch
patching file src/Makefile
Hunk #1 succeeded at 13 with fuzz 2.


Applying patch 0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pat=
ch
patching file src/zmalloc.c
Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).


The context lines in the patches can be updated with devtool:

    devtool modify redis
    devtool finish --force-patch-refresh redis <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]


>
> diff --git a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-defaul=
t-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hiredis=
-use-default-CC-if-it-is-set.patch
> index 51a6e9c957..035f533661 100644
> --- a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if=
-it-is-set.patch
> +++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if=
-it-is-set.patch
> @@ -1,4 +1,4 @@
> -From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 2001
> +From 61ae3e0277ac92323584bbe75ce79de6e030e84a Mon Sep 17 00:00:00 2001
>  From: Venture Research <tech@ventureresearch.com>
>  Date: Fri, 8 Feb 2013 17:39:52 -0600
>  Subject: [PATCH] hiredis: use default CC if it is set
> @@ -6,6 +6,10 @@ MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
>  Instead of trying to automagically figure out CC, which breaks with OE
>  as CC has spaces in it, just skip it if one was already passed in.
>
> @@ -23,15 +27,15 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
>   1 file changed, 2 deletions(-)
>
>  diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
> -index 7e41c97..54717e3 100644
> +index bd2106b..9ce768d 100644
>  --- a/deps/hiredis/Makefile
>  +++ b/deps/hiredis/Makefile
> -@@ -42,8 +42,6 @@ endef
> +@@ -36,8 +36,6 @@ endef
>   export REDIS_TEST_CONFIG
>
>   # Fallback to gcc when $CC is not in $PATH.
>  -CC:=3D$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(C=
C) || echo gcc')
>  -CXX:=3D$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $=
(CXX) || echo g++')
>   OPTIMIZATION?=3D-O3
> - WARNINGS=3D-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-fi=
eld-initializers
> + WARNINGS=3D-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings -W=
no-missing-field-initializers
>   DEBUG_FLAGS?=3D -g -ggdb
> diff --git a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefil=
e-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/r=
edis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
> index 17b533669b..c163aaae8b 100644
> --- a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-us=
e-environment-build-setting.patch
> +++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-us=
e-environment-build-setting.patch
> @@ -1,4 +1,4 @@
> -From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 2001
> +From a35a89981e28fb118efa86a798dacda826eb6f74 Mon Sep 17 00:00:00 2001
>  From: Venture Research <tech@ventureresearch.com>
>  Date: Fri, 8 Feb 2013 20:22:19 -0600
>  Subject: [PATCH] lua: update Makefile to use environment build settings
> @@ -23,10 +23,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>   3 files changed, 6 insertions(+), 12 deletions(-)
>
>  diff --git a/deps/Makefile b/deps/Makefile
> -index cbe3aef..76bc222 100644
> +index 3bf0363..fd8765a 100644
>  --- a/deps/Makefile
>  +++ b/deps/Makefile
> -@@ -81,7 +81,6 @@ endif
> +@@ -94,7 +94,6 @@ endif
>   # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes it =
more
>   # challenging to cross-compile lua (and redis).  These defines make it =
easier
>   # to fit redis into cross-compilation environments, which typically set=
 AR.
> diff --git a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-=
of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-to-fo=
rce-use-of-libc-malloc.patch
> index f1021eef6c..f142ff6ec2 100644
> --- a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc=
-malloc.patch
> +++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc=
-malloc.patch
> @@ -1,4 +1,4 @@
> -From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 2001
> +From a6246b17e94a2f7ad3560787a476b18aa7a45358 Mon Sep 17 00:00:00 2001
>  From: Venture Research <tech@ventureresearch.com>
>  Date: Wed, 6 Feb 2013 20:51:02 -0600
>  Subject: [PATCH] hack to force use of libc malloc
> @@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.c=
om>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/src/Makefile b/src/Makefile
> -index 7d75c83..35dd314 100644
> +index 6a87909..b8e0d44 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
>  @@ -13,7 +13,8 @@
> @@ -31,5 +31,5 @@ index 7d75c83..35dd314 100644
>  +# use fake uname option to force use of generic libc
>  +uname_S :=3D "USE_LIBC_MALLOC"
>   uname_M :=3D $(shell sh -c 'uname -m 2>/dev/null || echo not')
> - OPTIMIZATION?=3D-O2
> - DEPENDENCY_TARGETS=3Dhiredis linenoise lua hdr_histogram
> + CLANG :=3D $(findstring clang,$(shell sh -c '$(CC) --version | head -1'=
))
> + OPTIMIZATION?=3D-O3
> diff --git a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-F=
INAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-rese=
t-FINAL_LIBS.patch
> index 958106e261..ecf8714d33 100644
> --- a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LI=
BS.patch
> +++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LI=
BS.patch
> @@ -1,4 +1,4 @@
> -From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 2001
> +From 1b59adad94137eedfbcddb27adae74b80b4e0909 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 10 Sep 2019 20:04:26 -0700
>  Subject: [PATCH] src: Do not reset FINAL_LIBS
> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/Makefile b/src/Makefile
> -index 35dd314..3770f96 100644
> +index b8e0d44..3a68fa6 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -93,7 +93,7 @@ endif
> +@@ -122,7 +122,7 @@ endif
>
>   FINAL_CFLAGS=3D$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
>   FINAL_LDFLAGS=3D$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
> diff --git a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE=
-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/re=
dis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
> index d73c66c9d0..cd8fae4074 100644
> --- a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get=
-PTHREAD_MUTEX_INITIALIZER.patch
> +++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get=
-PTHREAD_MUTEX_INITIALIZER.patch
> @@ -1,4 +1,4 @@
> -From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 2001
> +From 5a58c573d486411a3a1585ca42bee70a661a983d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 21 Dec 2019 12:09:51 -0800
>  Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
> @@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/src/zmalloc.c b/src/zmalloc.c
> -index 1f33d09..5e182d1 100644
> +index bbfa386..93e07ff 100644
>  --- a/src/zmalloc.c
>  +++ b/src/zmalloc.c
> -@@ -28,6 +28,7 @@
> -  * POSSIBILITY OF SUCH DAMAGE.
> -  */
> +@@ -32,6 +32,7 @@
> + #include "config.h"
> + #include "solarisfixes.h"
>
>  +#define _GNU_SOURCE
>   #include <stdio.h>
> diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gre=
gs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-cor=
rect-gregs-for-RISCV32.patch
> index bb3f5c607e..dd44797437 100644
> --- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-=
RISCV32.patch
> +++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-=
RISCV32.patch
> @@ -1,4 +1,4 @@
> -From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 2001
> +From 8a16ff40b75671725e4bd92b50a5f083460e796b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 26 Oct 2020 21:32:22 -0700
>  Subject: [PATCH] Define correct gregs for RISCV32
> @@ -14,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>   1 file changed, 24 insertions(+), 2 deletions(-)
>
>  diff --git a/src/debug.c b/src/debug.c
> -index bb76c5d..55a0696 100644
> +index 684f692..2ee151f 100644
>  --- a/src/debug.c
>  +++ b/src/debug.c
> -@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, =
void *eip) {
> +@@ -1215,7 +1215,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, =
void *eip) {
>       #endif
>   #elif defined(__linux__)
>       /* Linux */
> @@ -28,7 +28,7 @@ index bb76c5d..55a0696 100644
>       GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
>       #elif defined(__X86_64__) || defined(__x86_64__)
>       GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
> -@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
> +@@ -1401,8 +1403,28 @@ void logRegisters(ucontext_t *uc) {
>       #endif
>   /* Linux */
>   #elif defined(__linux__)
> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/rec=
ipes-extended/redis/redis_7.2.14.bb
> similarity index 97%
> rename from meta-oe/recipes-extended/redis/redis_7.2.12.bb
> rename to meta-oe/recipes-extended/redis/redis_7.2.14.bb
> index 2b4087a74b..93235e3707 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.ta=
r.gz \
>             file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZ=
ER.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
>            "
> -SRC_URI[sha256sum] =3D "97c60478a7c777ac914ca9d87a7e88ba265926456107e758=
c62d8f971d0196bc"
> +SRC_URI[sha256sum] =3D "21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f=
75ac22835ea30025"
>
>  inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127177): https://lists.openembedded.org/g/openembedde=
d-devel/message/127177
> Mute This Topic: https://lists.openembedded.org/mt/119453647/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

