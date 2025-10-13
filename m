Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F20FCCD184
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 00:11:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29665.1760314299261060809
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 17:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=ge0QKlCK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CN3xc6012601
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 00:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5Qx+KgGFBuMLMtgjDQ/55lD2gEombEmCNxl6hbKFvY=; b=ge0QKlCKcSz7k6Bd
	fiR5Fk5rGXBLWWxxX4Wdwq7+YviXVCNtrIIV3b4mdL/e1reULik+e7fxBPTM3s/D
	/xY7ORoBLiqQk1a6Rz9VmPoIiuuStRXCRdcY3sBSTmOEalcCCsI5UrJoOg6QkVWy
	oCyXmuO8vn9xkPRFqkjWIicAvbwfoB8vR4Aug6MY9xsZ4douFiIPyoPySOFi7d9c
	Eb9jJaGnDQ3JfNIMsqkSKTE3hWqYxKP2g4hBNio6Hb/HE5qi0qWsDPsCH7zsuZX/
	ab7MmqUEcQ61N9pNeFuY/Cfq5E55eH43qL3Un+/1Ft1xOEUJ9UDoipz/lwuTqXz9
	CFbjPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0btph9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 00:11:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-871614ad3efso1973872085a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 17:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760314297; x=1760919097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5Qx+KgGFBuMLMtgjDQ/55lD2gEombEmCNxl6hbKFvY=;
        b=J2fDgPEnGL5XMYn/bIja0Ec5hqAR/EoQvNaKrbgLVimVsOpU7i79waWaCfQV21HFYz
         wb9BQNQX2QKVP7MowAnTfBMVDXuYHrPqjILf8Yg+M2XHBH944UsUEV+LoHI+Mzz82Wsu
         zu6mwEeo8QnHCw2QF/9V9qBJPfnToXSxaOcpZpxcidXr00WDhfS2LYb6esrTkYfa678n
         x8XVsHo+0uBxuU3B2HIhVo9pmgJ6549/I54R5x5YTeyozpKiEK0deaLALLAw7ILbKJkr
         WYG8+W0M/k6wx+fykjIuivhn54+MNMnqyyyl77coa74s0ZebKMbpvrOoP+m4nfGLnorj
         FvnQ==
X-Gm-Message-State: AOJu0YwhOONzZoA/JpwNHFq/OBdciu2njq2vZXTOyq+LsJY5jggF7PJr
	Iqp18kYRHhFewTBpGlUTJS+PKinogjWqBgunSfngJ1ztHXRimFunlKqvAS/HZx1qq+XwQU23SBf
	qRIxHMeP8SM8/haq2Wnfd5qJlXYsGQ9vwKMVLWkX9BVH2AGDnpatMItSmmpsWZak12V7/UqJnMe
	0deT/uFzzb6bNzED43
X-Gm-Gg: ASbGnctVCb/ZRJM9Kp7e93cKeX3iOGGvakwD2fN5gecRHWEk2h+fg3IDVGlyZmMugkg
	CQvE4PAQmME8N6SnU4y4ngSx4Td0JqeLiJCBIQ2T3J6p9CrtVNb+NxXnltxdNXmkxeQA8LcP7qn
	IDESjiLIUsWqbm/kLm8XIN+Q2OBAuVvEvyRcGtLESYzAN61OghE1s5P9ViJfJHVOGJsZ7qHKsGF
	g5ZrzKyKxCZK881ndOeNmm+SIQLtHhNbfK5SL/rUJg49U0zGaUxR2AHb+pKrJ5/3fSDzBA7pmAd
	Obo4ZH7elSXhu/7tdL1GscKC1qLNATX9xDT2ND8r9TuMwb0ZGB3OI3FJe7UZaPR/dbSi1vXSN+/
	ADWWugJFkfylrdAtd2Mvu6uLJfTtGKPeH4gftrD/ujXXXyAWIhXN0
X-Received: by 2002:a05:620a:1b96:b0:883:9634:516e with SMTP id af79cd13be357-88396345450mr2336184785a.32.1760314296998;
        Sun, 12 Oct 2025 17:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMd+57YqjWFBWUvHICh5u5QHNDBUvKASNxqqTE0rKKXXTiHNBNUSnBzAPzP+Q1bNIbZCe1mQ==
X-Received: by 2002:a05:620a:1b96:b0:883:9634:516e with SMTP id af79cd13be357-88396345450mr2336182785a.32.1760314296490;
        Sun, 12 Oct 2025 17:11:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577016sm3487336e87.101.2025.10.12.17.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:11:35 -0700 (PDT)
Date: Mon, 13 Oct 2025 03:11:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
Message-ID: <vds6ywkuqqaka3n7ka47u6drjcsexpdr7amsiqmvpjhxewytzw@omx5ziryifwn>
References: <20251011132213.1704548-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1srv+2TbJd7paRz-55cnYfhqhOq+VE7AGPXGSD5qHfCqNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1srv+2TbJd7paRz-55cnYfhqhOq+VE7AGPXGSD5qHfCqNQ@mail.gmail.com>
X-Proofpoint-GUID: PAIhTVUwKHo_s_11lyWlz0GQkROwUU-C
X-Proofpoint-ORIG-GUID: PAIhTVUwKHo_s_11lyWlz0GQkROwUU-C
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec43ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=HF61OqVfQPWx-aVN6p4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX3AyNpCI/OXdM
 78wYvtWFRaZAibJ7RuHsWekhFeynmUqtczqhcKqARCHipYKTU8vHljcLzOQJST5k3MTTl79o39l
 Ynxtiqkd4TyJu4DaPvaauu4P7JJqLTSWBKazWkOVM8WQXv4GjN589dXakL6LgSLGzXHRvFegD2K
 VfuYSmRdPvfzdPZNJfsTBGuwCbFax9HhQhWFIpK+b5eHGsA/zN+udKcQLxEWrIwnbySIJb2XST0
 Yg4G2oZCKf8/2JURV1ZpRm35hExzlwiCt4uCmDJXMaukmlUx4RGKrLPd7f3Sd4DBwks6Tv/bEzm
 u1Ux1GWnC9YTO8U8sbgBuf26y6JJ1cKRYMIru0rgMwu1DS+04bucwnqfXIW8pmzXoqcSNXLEnvJ
 ZiNsQH7WbI0HfABGNFMzmCaKPGw+kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_09,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 59CN3xc6012601
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 00:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120524

On Sun, Oct 12, 2025 at 10:23:36AM -0700, Khem Raj wrote:
> configure fails for x86_64 -
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3801833/raw_i=
nline

Interesting. I'm using glvnd, so I didn't notice it. I've sent a patch
to OE-Core (and Mesa) to fix the issue. I'll resend this patch once the
issue is solved in OE-Core. Or (if the patch is rejected) I'll apply a
workaround to the CTS.

>=20
> On Sat, Oct 11, 2025 at 6:22=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Upgrade Vulkan CTS in order to pick up tests for new extension and al=
so
> > some fixes or old tests.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../vk-gl-cts/vulkan-cts-sources.inc              | 15 +++++++------=
--
> >  ...ulkan-cts_1.4.3.3.bb =3D> vulkan-cts_1.4.4.0.bb} |  2 +-
> >  2 files changed, 8 insertions(+), 9 deletions(-)
> >  rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.3.3.bb =3D=
> vulkan-cts_1.4.4.0.bb} (92%)
> >

--=20
With best wishes
Dmitry

