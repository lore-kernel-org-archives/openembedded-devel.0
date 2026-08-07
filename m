Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D17EC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 01:35:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33850.1786066520751838087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 18:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CZOxTPWX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V46jlut3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Ggq03177110
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Aug 2026 01:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zm6bsk5jj8Gnxb+b5NHwWaIMgMH7m5mcIF3jOiJ68Rg=; b=CZOxTPWXHPHs5f7m
	e9tF5QzbMQ9PA7s2Z98ylGcPSdvy4jaXsLSmdOAVp1bMKY12buHjwPvvp5UTEZmb
	oktMgoFP66P0y8Ap3aSDaBqrZyAcnqPqexF+idNAjT/ZFGEJGcOcn4lVimw/JhGY
	HPMAuPP85XrujACIY2TPWIu0Iwtuo7GTb2D0wVT9sz4bsnXGd2iv0ggcbwrodX80
	DiUPi9giOsIEhFRWuOevMy6zJuA7psPeomIiR6p1GBwhhsDGYLihiUiHm9nl4dYO
	cOKgKxVLoBiLsxwVBLvIA9V2XIsXqXmUvTZ6CBUG4afvktnmpJAsiNnUwiA05Dvs
	8Xnyug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jhk31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 01:35:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a098ea19so317726785a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 18:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786066519; cv=none;
        d=google.com; s=arc-20260327;
        b=bR2Kde5d3fjNFnU2vCRiUv73EHf4sMMaUDkojtEvRuK6xZY1+BiLZ5BBGrpGwz7+Cy
         rXGLmhLED3OsYMv+rA/NJ+A/lZww155w+ut7aBC2V+wcRfeRtli/68NtW4EfcVNBM70a
         0MTEfYliqU4SkdrwTeTYMw8LXuRGZBXA8GpAKIApwzN2Q0TbkQ4dOB5Yt+5sfZmRhqT0
         5vhIcR4w5VrEsgxVOFzQkYCPLgP9prymDp2VLp6X209fkhXVPilKXGFR/6chdz818ZWy
         0IhkRWMQuYsp2CJxUq3jUkB17s+XrpUxreyorLGIQq8tf+51Lpy+iZQvDoe5f2sRfAYn
         cTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zm6bsk5jj8Gnxb+b5NHwWaIMgMH7m5mcIF3jOiJ68Rg=;
        fh=sVVE2+EE4Iexnf0eTjzX+ulv7BrJP/A0KxYJTceahuc=;
        b=NectSxHg8Sr22d/gPHl1BU9cEMd75KMvh7cOr3mnR439wEOR8jrB7yRsEZ+5xbgt4C
         Fk5U8+GmCV1oMkNhLkJHywPogLCKQgs6gckWxx0wfaII86ZLvM5VbrKOrBxKIusMzOZ7
         ZndWmZYYYbIcqCDcKVRLeVgbPgh+F/YQZWvvc/6FLCEmnzGPmof3FpJ0mOktJwZ2KD7W
         U0DMsN39mOF6DoRhoJnbM5/ti01r2P6t7uqP1x8YOI6dXJUpvmvZTCH27wNlMnX9c6WP
         t78XCQBYckhpBAVWnRgoYrY6aopzFyFxqT5lgE+ZKRT9qUy2Ze+eWmjZSprKbonPG+tJ
         WjuQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786066519; x=1786671319; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zm6bsk5jj8Gnxb+b5NHwWaIMgMH7m5mcIF3jOiJ68Rg=;
        b=V46jlut3xIMTfEULNm/eClep99O8A9FPcwX2eSebuoQJDBxkEBuJNoOguk22r1KIx3
         5oSKrc0o8iriDOBHJQgij5slZxIPZZg9/+ONynyeWaaZNXdwYruCsz/esSqz/3mpeyXQ
         ABJYSEpDE7r1VEAUsQufwrtrC57EeQP6uNsQ1PgFtZY25IBX7RLZ+pE1yWfgiam47gcd
         mCvidhxeb9g5r1sAOFZElcVQ9GGu4JqRjkYxCHN9XX1yF185N4BUgM0yLaPzOBbUciVR
         XYmKsXWeEuz41HfXBQMJBg+GkqrqF61lNkrsbBusWGF8Ze6RFaRKYpoBm68xX+sv0uru
         47+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786066519; x=1786671319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zm6bsk5jj8Gnxb+b5NHwWaIMgMH7m5mcIF3jOiJ68Rg=;
        b=Fp99w9b2vLWBQMsCH1pDQuzqTa7GsKgXfBgiohM5bHIC6MrgVKqSW9ZJ4olTp+AJXD
         0hXL/em/bzWhhG8d3ui1RhlmErRR21CR9Fkz/6qmLccHPY8hqGtQpbI5hRVkp/MOi8V2
         VOX+uk7Nn9N1HLj4YD5t2MfJ942lBDq9ok2c6eE7DSoz9lVBlqkHP2glTBVlVZIDKVxs
         J/Ty0IoVNN7WxE+MtS3XskhKxwsXct9L23qCcfhTzzcwpi888/lmJCFtMYjMmTAVITXS
         OoZGfUmUvoaSMDRjtzI95OIAiQsgz4vnp7oROpkEmBvj+SU2sOSuxwHT+s0N4CrJbuoF
         VrhA==
X-Gm-Message-State: AOJu0YwW8aEFF2lRoiKcBZRZNwh6mUzphn2fiwOWqFtpPv66xE9vrrTN
	rvz+6IrXyutVlqzPhlZfi5JErC90GS/Lo/i57LGGZWvg2UnnMBNeyT87HFsLh+/AWWoEKiHr4Ct
	IPC8jmnZK0WSry2a85LqUR+yCXUnzVy0UgrjDzuMym0lrzPF2f3mDM8fEAsX7ucQKpwfgpbxkwR
	UD/+b3vGCxRZD6OYZmHFjJaMYqW9ojHbpEoV4IWB6tyBblQ1oM+y8RxO130Z8=
X-Gm-Gg: AR+sD10GADPgPV2bdie0nmK9mZJCBrXiIgUPBuMpeAXE25Hb1K/eln+MlYaT420UaWe
	QqhhPVKqt3B9xBYvfUotZeBbjAdjj3J/va1LiL5IyyMY5ej7fK5RnxqtB/wDQZW6tfHe5m6ClRe
	SXl60ydNJUCAWXIBFqUNpr0+rnErRxBuTi++OPhg+YQW8xvBQVnn8yLDI=
X-Received: by 2002:a05:6214:540e:b0:907:37d3:1ed1 with SMTP id 6a1803df08f44-908a7100249mr1369396d6.28.1786066518828;
        Thu, 06 Aug 2026 18:35:18 -0700 (PDT)
X-Received: by 2002:a05:6214:540e:b0:907:37d3:1ed1 with SMTP id
 6a1803df08f44-908a7100249mr1368996d6.28.1786066518361; Thu, 06 Aug 2026
 18:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260805045919.233514-1-hthakar@cisco.com> <20260805045919.233514-2-hthakar@cisco.com>
In-Reply-To: <20260805045919.233514-2-hthakar@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 09:35:07 +0800
X-Gm-Features: AUfX_mz8Ar_G22P8SRxVzo668PTJAKUCfhcMaLKrXA2ixU2vX8_eqAJKaakJtG4
Message-ID: <CA+s=J=wwSVOymk5DVCKKpGD018etuNDuLin-BXpzjqmmOvp6WQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][wrynose][PATCH 2/2] python3-twisted: upgrade
 25.5.0 -> 26.4.0
To: hthakar@cisco.com
Cc: openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com,
        Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAwOCBTYWx0ZWRfX1QA7QKkZZTZl
 Zbh66pcCcWrEFGVEN15tUwg1m1VniT9v2MVEsJqPzU6frAQK7gP1A1ArftsylRwbnRqJRxlEnQB
 IuIaLwJYP2zPAC75Tb/bpOhIZjztW2UFTMjDdD9sgKS78Ji9MXDkHSc7LNV8AhfMfnQFdanAwcB
 Q1tf6uutZ17YhO7z8H2EFYHH2FLReWy90tbEfQnWXi0luPRKOGi1+Xqy0Fc6cYHZPztd+/FNPy5
 pxw7eY8Jwt9RIHy1w93Rk3OJMohiaBJwLxN/9KNH0VM6OwciM0TgjwbAz1tMS2i3RHzPQ4REHdm
 BaPdTKr56rvJkZ9zxXk0WitAnC4x8LhtrpR23wnaSPfXRO54rZ3Mxw+F0itM8ndDinOJ2nXuGwf
 PHDhjGiPUhvKSGxoHi7F3Z6vQ5DgZ08IqH84f3bYCcMrcQSivIFxlouCXfguoIFcDLcRpwUbHhH
 T5EWiVAsmeBy62vYUSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAwOCBTYWx0ZWRfXyL1sw2Q8hAnL
 ONrZ94f6Vj+oFJTsVGiNRDDzICp1oanB+Rj1p09GGUbjtrU/DDfZ3jgalM1fng6al2SuFjHXf//
 3hC2IPioPGFMFcPbUwtoszx5zgYzaUM=
X-Proofpoint-ORIG-GUID: NEP4V_B-OGLrn9ZvmC0vsb63ULYofcFE
X-Proofpoint-GUID: NEP4V_B-OGLrn9ZvmC0vsb63ULYofcFE
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a753657 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=qBIegmJ3AAAA:20 a=PmPdvnPKAAAA:8 a=Q4-j1AaZAAAA:8
 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8 a=AUd_NHdVAAAA:8 a=D0ArUNb39teKkGOs8KgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=ZCh4QoaBVut9GMebS46n:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 01:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128852

This isn't a bug fix only upgrade and has some deprecation as well so
not suitable for this branch:

https://github.com/twisted/twisted/releases/tag/twisted-26.4.0

On Wed, Aug 5, 2026 at 1:02=E2=80=AFPM Hetvi Thakar -X (hthakar - E INFOCHI=
PS
PRIVATE LIMITED at Cisco) via lists.openembedded.org
<hthakar=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Upgrade Twisted to 26.4.0 to address CVE-2026-42304.
>
> License-Update: Copyright year updated to 2026
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit 8ae0b005d24355945a4cc756d16eecc9b402cc3c)
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../{python3-twisted_25.5.0.bb =3D> python3-twisted_26.4.0.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-twisted_25.5.0.bb =
=3D> python3-twisted_26.4.0.bb} (97%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.b=
b b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
> similarity index 97%
> rename from meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
> index 8ce5740e0b..7d7f5d3053 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
> @@ -4,9 +4,9 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix socke=
ts, a large number of p
>  HOMEPAGE =3D "https://twisted.org"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5316a448a61a38d722c291f78d915=
d11"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dff950f7bafa004a86f478dc9eaf81=
06f"
>
> -SRC_URI[sha256sum] =3D "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2db=
e11ec6fee04ea316"
> +SRC_URI[sha256sum] =3D "dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376=
291f805e1501fae9"
>
>  CVE_PRODUCT =3D "twisted"
>
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128790): https://lists.openembedded.org/g/openembedde=
d-devel/message/128790
> Mute This Topic: https://lists.openembedded.org/mt/120606158/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

