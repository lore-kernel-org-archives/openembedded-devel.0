Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE471C9830C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 03:12:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28359.1768792320608777094
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 19:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TjRFbUln;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Avt9t6Hm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ICYONI3029629
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNjYd+d3yhaEGn7LRaxGGclRReH6kJ/L5UCzqynmdCg=; b=TjRFbUlndzaE86OD
	etxE3FixFwpJIADds+4ztIJbg9a+ZJM1HuTkztWwm9fYXVidxs5cKPJszuiuI1O+
	zv1+Sf/eI9s86LTVvKsPWVib8OcS5bpt4M7BWSpc9Xjdr1kuTCJ9prm8soosQN8Y
	R97pYaPb7/E7pNGO4gZ0GJRR/qnP9/Zc2UQJV7Gr8Yrxulm/kSy+b2YXq9jXuPvx
	EgA0Kc6k8cAuxjl/4pb7aO5LHIZBfdBhcSPd8OLI5Taf73CIe2qh+MjE76iXvojG
	me2F4XPgn9UuM6Gp1RRrmSbkc2IKmqekYVQECSinXTcnYPyuTrSIgnS6KztiJsZw
	7bRSqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqbkxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:12:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88233d526baso149010406d6.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 19:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768792319; cv=none;
        d=google.com; s=arc-20240605;
        b=lM29Uj4Ttnm1R3wi6pCxaY8Ur6UmqNUbfmqPp3vx0qBDb5mtp+kKy1LZaYkMs9T0QQ
         BfcWvfQfE/PZTcnxchWiZiP+Bif2RcQMDUmoKAvr3X+V7tOBZWy8TojcjcW0lUA8jBcN
         fHyl9atuxWb8yA0lbXJ7otFDD4iso/JJZYMeKWcyI2IVfF4f/QHKv6YJ8VFGIzpCU+7k
         GXhGfxZ9lgsjWFCsbaBB0mH1yGRI6szTalR6mzrQMyciBnG6bRh7TWtxlHcpM7SVZXHj
         0md5qk3mnkoSbBf5VMZBE1i/nSwiI5oMTW/A5GWaXmpyCPJZmjjf5/qA+AE2Kaj9Tgg5
         7Zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNjYd+d3yhaEGn7LRaxGGclRReH6kJ/L5UCzqynmdCg=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=VUQQkqQrSD7kWCDcxJAhNrRuhI4NOOZL1cJp8tFA1KoglnTxzyrS7CH4M1FmVXXOby
         QZEKcjgIzMsuCy7DT7N52SwjEgUh5sfhDdcQQexsjA+vjro4O7H9K3aPnBAqtt6ZcdCC
         UEhfmL+OkC0bUwnNhbu4p4gyltDNmEl5h4ICMLRKsvBxQIf+6ZaksMAz9JEOM0/2i3jz
         Imrb+409tzvdRvNP9CndmKFieMuv02YKKGE0dyaHAZMZ6Hfkrb9lNmkHWV5PHvZW3IkN
         VXIaqDb7hd6LFp5skRWspAMuDI1G5CrOkyL3u9SqE0EjhjQD5Nkurrv14Npym6XaPiML
         unZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768792319; x=1769397119; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNjYd+d3yhaEGn7LRaxGGclRReH6kJ/L5UCzqynmdCg=;
        b=Avt9t6HmbrQ+OdN81+P86WkXhaWQgiqVllY+/9ItSkbSyckID9srEHUBWWl6HUzNoT
         7agcS1s5rByXbzMFlN1XIimabWb18nBV9LN3cfCj0b7Zv3Bh5cyhLup8jODwAkdChx6C
         I4cZuUI2DYLCD7zYnHPIFrqKGOyALrcNG7ddlYdF5oxkVpJBUCuh/V5ZyTREBezqSbKR
         D9+GDOx5H2slvBzhzvjAOCfVPqMh8lU2dz8UoPdpjlKcjs3GgVb2GNxXACJ8/0/XJxou
         K5wvpEeN/GF00SLLK7ygxGoZEb/7M8hBlA+3FJgAKm1yGd0FSiOoVv0UdqATALfQvYEB
         VPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768792319; x=1769397119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNjYd+d3yhaEGn7LRaxGGclRReH6kJ/L5UCzqynmdCg=;
        b=JI22okiUR3IFAzWY45NVD295KhXcd5bnF855o2HSD5O6CZMt4XQJsRFdF6jFvuoRc8
         +JVcjg2ru5zxRb59DR9ukTef/+IBXrZ/qot77L2/UGBTe0oLInif6yK10QDnTbSf5PVj
         2EovNAlRIRk4bG7yVlhOPlG9WBuvUIpEnWGM9sWlnXhl3aVt/xhPfdiMURG6rBZSlNHb
         VYEbTfMqUtkMf3p+ujd6nCKMbxTMHfQNAGDaTG91JVHPUOIjWDVpJK5NLu+5ZWjkgQA9
         3JsFeMLfGwV1Vlzda0fapAbG3q3SI6gJJ0HiWGsyc74E7F1kms0xDYfZyhQKPhzJx/A1
         WMyQ==
X-Gm-Message-State: AOJu0YzLbThgeaR/Bc0UGny/VPfN8AF5lMKQAxElee+ayEo+fL4N5AXF
	j37fsWEX1dfKXnFjtLT3ZKyKVpLoLFhRLH6Sij+rEqgkwyHY6Ozv6MNQ0QP5qMt94u+4oB+WaRU
	tUa75eCgHIAeS5MrH5nmxbj7Ms4Jju7kAUJLhrrz4l/jD8mErejEYlKsYJSwPeOFn420lc/GM92
	J6wAzb3I9Yw3bjS8QjsRfOvzYkjLd1yMLKdT4ghNWsOIfOoCjjK5herNVlREA=
X-Gm-Gg: AY/fxX5DgyoVFlW7RYrVoviSdwZlqO3rTpxG0Mi00e5CT8RPfHsfx6seBPuvWf8cAGl
	k7ObeDD2SzAqcAeq6314cFtJLqHRuE5OPi5RqHFM7fRTjNWwjnyHeg7lTfOfUjZg8EOdfiZh9DQ
	ug6fIWHjhgBl/N9k6er4U81f4feq/3UVz9wt6f+i9/9XaHxYiM6MN4kenZzaIlKCU/
X-Received: by 2002:a05:6214:5191:b0:882:42e6:171a with SMTP id 6a1803df08f44-8942e48897bmr159049416d6.29.1768792319133;
        Sun, 18 Jan 2026 19:11:59 -0800 (PST)
X-Received: by 2002:a05:6214:5191:b0:882:42e6:171a with SMTP id
 6a1803df08f44-8942e48897bmr159049206d6.29.1768792318593; Sun, 18 Jan 2026
 19:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com> <20260114130100.1016416-17-ankur.tyagi85@gmail.com>
In-Reply-To: <20260114130100.1016416-17-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:11:47 +0800
X-Gm-Features: AZwV_Qgsw5Y917zbH9sMw1g05wQPmKcisx3a0e1IUHtcd713lOnCZU7Cx8JdHpo
Message-ID: <CA+s=J=zLE43Ox920AVAeStZTQuJ6nL=Un6HCpb9g0eZiDUG-UQ@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 17/20] python3-virtualenv:
 upgrade 20.25.3 -> 20.25.3
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: W1KQmzeKOvJpyLlj0n7cqBuR8bvdW7u1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNCBTYWx0ZWRfX/dAYN8qnkKUz
 scqLCBilgqmOQ316mzp6ppoMauWIUC/GGCBO2FlFHsJoC8r7BRtkiZSIP7IRHoAiuHCSjwgnNgG
 FduQvbNtxE9iSPWtXJ/Wt7ybiekkTTBInO06GDkZ9nnmoVBcfRPC4dV5d869OLTBn2PbeNQfKVa
 TfK2hfHc751X+OnA8NVIiD/SThNjO+Ziu9yUeKGwN7TG0f+QysHCnoI2m2eNcgI8VhP4tZXWz5h
 VzEv4xUeWm1+YBWJ3PkL82TDtDKsiPc5dEnyEa08jiEIy2iK7tRO59PI03lLtphjjHuDj74Aza+
 Pf838V9LGzbMebWsEim2j9Xil0L9thTZRUXIleHRo2oQKIqwzEwhoEemzm18ghKNGcyTKsBCXcI
 qPGq8XwjI4jOYE9GqLcD8gqAOzbUVbgJIQbmZc/FwkIaL8Qzptrl9SvNUIoGml8EN/KbcmKH6z3
 rtpRlGjdPSg7ykFau1g==
X-Proofpoint-ORIG-GUID: W1KQmzeKOvJpyLlj0n7cqBuR8bvdW7u1
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696da100 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=dXvAoEkxAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVGe_8tO6pZDTkSjrWEA:9
 a=QEXdDO2ut3YA:10 a=0YYwiJrbKVEA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=iJ39DRKJB4kz2P1Iyp3E:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123583

Commit message says 20.25.3 -> 20.25.3 .. Please send v2. The
virtualenv patches in this series after this also fail to apply.

Thanks,

Anuj

On Wed, Jan 14, 2026 at 9:02=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-3-2024-04-17
> https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-2-2024-04-16
> https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-1-2024-02-21
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...hon3-virtualenv_20.25.0.bb =3D> python3-virtualenv_20.25.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.b=
b =3D> python3-virtualenv_20.25.3.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25=
.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-virtualenv_20.25.=
0.bb
> rename to meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.=
bb
> index 1858fee25a..fee5250c4d 100644
> --- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/pypa/virtualenv"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ce089158cf60a8ab6abb452b6405=
538"
>
> -SRC_URI[sha256sum] =3D "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b869592=
57378aef020e1f1b"
> +SRC_URI[sha256sum] =3D "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9fac=
f3a3bcfc703f45be"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>  inherit pypi python_hatchling
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123470): https://lists.openembedded.org/g/openembedde=
d-devel/message/123470
> Mute This Topic: https://lists.openembedded.org/mt/117260247/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

