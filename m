Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C466D64084
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 07:08:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8873.1765955282243329686
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 23:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UIVi7Wzp;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jiB0abCH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F37V1501176
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqH7PwWFw1+BfK9GPFYtt9Oq9aNbg9JhgltbuNzhvI0=; b=UIVi7WzpjeS5qDG+
	1i2+rn95IqnGPak7yUvhC7WKJ09RPksGvM4EduBuHF1w3yjW+csnySK1hzpb5tBq
	Np7zZPMciJm3vft8VpxPSkxru/ARBnOsEvGjUh3JBqj53MjiqZdwTscOYlDYgpjh
	OFKM6LyZ9h4uwjTpQw6uCsSXwHMkOkCUlaUF+GHG7AlBTOQgowS4BHbTUfRKAiP0
	YpygpSq3xFX2QqUDoPWKLSj4HDcSWX3uuI3xWNZJadBvq3vae8XpXX4MfkURo2L/
	IJQMLXqUFdnnjvmCmlC1dXyf2Ry0xfpi3DwJYWKj4oxjao+koGfjOMIfW1IZrQVM
	OLLSAg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkers6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3356a310so91285786d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 23:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765955281; x=1766560081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqH7PwWFw1+BfK9GPFYtt9Oq9aNbg9JhgltbuNzhvI0=;
        b=jiB0abCHbeEqAhtB4DAMsUu45AqNFOIvDejFx3n5FJByr4Tbhdhtx0fFdVl7JQPj++
         Oy9h5VkAzqrfoTbob+YncfMVzBHezV996ehH1jyRdxaFf/SOsevlHMDLvdwfGstWd4fC
         KuDjt2+TObu77L8DuWmHlTgpCoieVpw28R4xsuKUTEUAHnH275YjfxIQ6qVSiHkNfWST
         bANLQh5E/m1LBfkcb302JS6Lcjoh2+t9BxsJawxIkxCzEz9RHZmxiAvbV9/26qrLrFqO
         nFRpHeaurx8O8PUQc2CuKyZVNSA7ooKf4oxTciuDpQYAp2vUBxjrCX5WRRoEpzXMzpXk
         EbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955281; x=1766560081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqH7PwWFw1+BfK9GPFYtt9Oq9aNbg9JhgltbuNzhvI0=;
        b=Yv3/JkEmerHgTki/DrQeX+NXeIKrZBkrq6BhhrggbtVOOvt7kEyyS2J4QgfXmujBSz
         u5myp5HciMIbBLREZLWr1LBzCqZmqAHZp7TXe6s2bHAcDyywdbVQ7qc0Qo0huRDWV7UA
         fofYFUlT6bhryIuMe1Yvumz9Ef0cVIWJy0wFUtTue14h7GZtdTkRJzPLtN/5A2JeaZDM
         8mE9TzRKoItU9WzZCVPmTYY83bEP84YjppAFB1Frz1U8gMRKFHS4yMCxaKDl5iWnToaH
         8M4gdVZ3csZygC5TWPw9nXlJEweSz1unrqr94ayJya+QQP3/tHKdfver+tuqe0zZsVr5
         A1nw==
X-Gm-Message-State: AOJu0Yz5eAVRxhC4yw5JYERW3PZPa6ADDaaFCOUVlignrQImZeam71fT
	dxdtDdQL+KI4n+D5k7urULUCzzmxDAMRzR35V48m3/xddUxAm22rRdjz13dFFkXk9Wm2/GQ9TSH
	lnAnoeMdz/qpuIDzcArpZrKEJ9xLrVkx0ABcP9OzLZLq+lMofDngnQ51c7gp4EsDSJbOTl2POrf
	xMgtF1WjEz9L/RCX++yp1M3djfeEpXp3SYBohw0Xc1rLO567sHk5z4bXP54Hg=
X-Gm-Gg: AY/fxX4WedtGJzwFVQnUt1qOZ07amoRoZDaF8rePqHK9eTjiiJ8hnt8ZKwHcLTbKmMQ
	jbwopVQe/LrZvdtsD91hOt9kdCNIV7PUO5yMc5O5UNdIFbZvDLPtCA42kSGjpj06VWqfayONIL/
	RGqDrICRmCvMo6HRfvxAl9Yq+oSAoMxJ5LJ4Jowec/smBbwwnaIj1c/Ib6p/nAt9si
X-Received: by 2002:ad4:5c8a:0:b0:884:6f86:e06e with SMTP id 6a1803df08f44-8887e01a509mr277773516d6.16.1765955280446;
        Tue, 16 Dec 2025 23:08:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw8E5qRzD5MRAruRPLmDiCshWvAuc15c3ndnW+EbAYPmKvWziH+qeIFz5mjQ2CYTPxKNlAAmcqgZXOJDV8+Go=
X-Received: by 2002:ad4:5c8a:0:b0:884:6f86:e06e with SMTP id
 6a1803df08f44-8887e01a509mr277773446d6.16.1765955279997; Tue, 16 Dec 2025
 23:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20251217065601.33454-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251217065601.33454-1-liuyd.fnst@fujitsu.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:07:49 +0800
X-Gm-Features: AQt7F2rwjKyJzP2t9eWQhykF-8-S-GW2jvwbNAhY2hWUL7gaNljigRjaqbiik9A
Message-ID: <CA+s=J=y8AFEgnDhTKDDGs1kQUG=q7uT41bpH73O2rxAn=k8ZYg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 3/5] double-conversion: upgrade 3.3.1 -> 3.4.0
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1NSBTYWx0ZWRfXzo9p8cC9rPTV
 MjOr8D06YtlguPTK3cmZIZoe86tp7LZ3bvPbNm1cUIhqxP614XW313SFnquDARIgoXCkk77HCvY
 HFWt4/o0BdzwG7AmvhfGrpCGN5kM/L1XHIjsecmDsVZ2iwGvQtQupesgYW6mhbx9Ai+jzThpIry
 KUjRAMJ0w8/p6r4wUjbaThRX9HKfkL1N32ef+7yMzKu9sz/wzNBk2PNDO23LsDABUKHNj3qFP03
 LknihfZytcOtfSYKXfoSMoV5wcTO+YusbHmVxe0dB51f5sPyy/z+mlVbYGqOLuI7N0XCq3zDDWH
 fmEJtw7bpaWBxhDgUvjNf6vagjJw5a/4Jl00pnu+h4pOnJ5BPlFh6I/Y5QFZX/5/hQ6cfuahM92
 3X9e4lv+eAI4X0cBKszsgApqp2agAA==
X-Proofpoint-GUID: MLun466z6TiWQ9BojVyqdah0OJzM_oSN
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=694256d1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=f8AkXjsUk07Hb1MmZ64A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: MLun466z6TiWQ9BojVyqdah0OJzM_oSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122718

On Wed, Dec 17, 2025 at 2:56=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:
>
> Drop 0001-allow-build-with-cmake-4.patch as it was merged upstream.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...on_3.3.1.bb =3D> double-conversion_3.4.0.bb} |  3 +-
>  .../files/0001-allow-build-with-cmake-4.patch | 40 -------------------
>  2 files changed, 1 insertion(+), 42 deletions(-)
>  rename meta-oe/recipes-support/dc/{double-conversion_3.3.1.bb =3D> doubl=
e-conversion_3.4.0.bb} (92%)
>  delete mode 100644 meta-oe/recipes-support/dc/files/0001-allow-build-wit=
h-cmake-4.patch
>
> diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta=
-oe/recipes-support/dc/double-conversion_3.4.0.bb
> similarity index 92%
> rename from meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> rename to meta-oe/recipes-support/dc/double-conversion_3.4.0.bb
> index 42777971d8..2e64da1b71 100644
> --- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> +++ b/meta-oe/recipes-support/dc/double-conversion_3.4.0.bb
> @@ -8,9 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ea35644f0ec0d=
9767897115667e901f"
>  SRC_URI =3D " \
>          git://github.com/google/double-conversion.git;protocol=3Dhttps;b=
ranch=3Dmaster \

Can you please add ;tag=3Dv${PV} as well?

>          file://run-ptest \
> -        file://0001-allow-build-with-cmake-4.patch \
>  "
> -SRCREV =3D "ae0dbfeb9744efd216c95b30555049d75d47116a"
> +SRCREV =3D "9dd6227ee3e29807183e56877f0282aeb40b8b1e"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake=
-4.patch b/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.p=
atch
> deleted file mode 100644
> index db8296c65d..0000000000
> --- a/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patc=
h
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 1652f5b555b4b4a7916af40bebacc32c23e4aca5 Mon Sep 17 00:00:00 2001
> -From: Alper Ak <alperyasinak1@gmail.com>
> -Date: Tue, 8 Jul 2025 20:43:45 +0300
> -Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> - compatibility
> -
> -Fix:
> -
> -| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> -|   Compatibility with CMake < 3.5 has been removed from CMake.
> -|
> -|   Update the VERSION argument <min> value.  Or, use the <min>...<max> =
syntax
> -|   to tell CMake that the project requires at least <min> but has been =
updated
> -|   to work with policies introduced by <max> or earlier.
> -|
> -|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyw=
ay.
> -|
> -|
> -| -- Configuring incomplete, errors occurred!
> -
> -Upstream-Status: Backport [https://github.com/google/double-conversion/c=
ommit/101e1ba89dc41ceb75090831da97c43a76cd2906]
> -
> -Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 8749ef8..3145772 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -1,4 +1,4 @@
> --cmake_minimum_required(VERSION 3.0)
> -+cmake_minimum_required(VERSION 3.5)
> - project(double-conversion VERSION 3.3.0)
> -
> - option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of =
static ones (.lib/.a)" OFF)
> ---
> -2.43.0
> -
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122715): https://lists.openembedded.org/g/openembedde=
d-devel/message/122715
> Mute This Topic: https://lists.openembedded.org/mt/116823298/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

