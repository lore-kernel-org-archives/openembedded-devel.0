Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6767CCD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:47:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16892.1779875213936627549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BO1wijio;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QocP8S5I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTqE2282549
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f3W7Vr+4psYqXnPatnuXjsZr
	dxZdG4n2l/lbUtCjUDQ=; b=BO1wijioOMuBJ/RmpxYd4Ai9afNxypXxhoUrw951
	B0AgWjbJ04Rg8wF12qr/H1PW6sy+sHROyKu8Gik6nlBUziO4HeD5Hv2m1yjthgrF
	jg3l+SF/gvg3lJ3ix6TgT56VXCMtD+LY54++S10ZI2hUTfEmcMr6VoLxr+ps7CsI
	OT930M6elYk4Tf1gLfurSDyrd481z76OfUJ/uV7ERVW/0A+FwSC/Y3EIb0AJiaWM
	3v/LDPbXSWYoqzoldZaXk4LxThg7NgzxI340KsiYtZFRy74xkw2age6QttGvtKuj
	aseoF89+nJEEw3J8uzUYiXS+1s0vBZGCn4MbLZpLArGtLw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrvbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:46:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5752c4a82ebso9393266e0c.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875212; x=1780480012; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3W7Vr+4psYqXnPatnuXjsZrdxZdG4n2l/lbUtCjUDQ=;
        b=QocP8S5I6QTd+/fCXeyv2mbDZf4yvTFGKdVQCrNdaOtS4f9psfxeqmgyAfiJ0dL7ni
         PndqZrfacS0QvxSRq57jInR9pv2mm9ZJuoIJ+jS9EK/BQ0uEtJ4RDRkqLlBcqBaccQM7
         jxXZhurUQiOiLHC5Qn8UkY4pDU+0ORWONV1/4ROJAe+NnxkIGG8+ldGFyrfU+jRxV4GW
         VVLbzmzyrxSqDc+ZotdUYeocYLAGWlvnsx5RnLwl1C+c/Izd/1FWbKojgCJBE6Xohvqm
         0J75T31CUNh99NPrfcouaONA1AIpIKvlxSp6HtDfLkDyHkqJTh1/nh0EVi9Fu8XgfXXu
         McGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875212; x=1780480012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3W7Vr+4psYqXnPatnuXjsZrdxZdG4n2l/lbUtCjUDQ=;
        b=XHm9wq8l//94zt/2vRr2bovtSmjMA2mMGMwfEntVxM+99baS02wOl1o2SroDCr0byu
         LSRpoE/Bz4awmg3xAgDEMJ3l2Bd15/l/AFlKeRv1L5qK4wPo342k+XGVPA9bu5h+pUHB
         hUAJO9rUssczuEAuEjDY4C0qLbV7bbe4VrjZ6rV5BaRzLWOGjf3ntGEbjiIR/0cWdlhz
         DZHsMfOE1zYLnke9tDGapye/hg0TcWwJcG993i2pqMo4os1mi95M3u47yPFwSfzpMZLz
         RWBbbgwuIxUs3ZdDvxOhnY/LNwe3TYkOo6Al5EHU6MX/gwGgqEyCAndoGs6nY8n9IZMH
         6l1w==
X-Gm-Message-State: AOJu0YwXVroiJn/t0zu4jb88ihIPqJw5jAO3wPXdyNKuXI33LosApqj1
	ObRl8UQqdLDmjR9kIIdwmNFipvGzwpUxn5S+MV285EgGiS5++bujHtT+1MpjB2gX5ozeLUl7xCz
	jkdEkpJ71QEZQY51pC8ls9XJrXMr7uKbuKFw3+s6ugDug+kjhm8Uxfx/SDAb2R7Pth91EuYpken
	n4xaXgRHLr
X-Gm-Gg: Acq92OEMCRiEcIH/7jvN6BjSA/sB9Xs1ptW1icPn2YXnf1ANVBUddB8dOBL1q2XyJrb
	N6lZ/yneZmFFC9/J0efW4bT1rtT8WRlADwSD9mTR4oznIrbvNAlllD/EG83mHoV68XT5RCgScaq
	d9zWgCVeSfZIiznhKkEGcxll2ehvAAdECCrlLCXolssZdz+usSP8gVT2kM4JL5nyTN1JTLZ2F7t
	hfnTe8thIpOF8aOvccIBhCTMyCrA4VqQPmyF5DwQ4xZdegShAKyHWakyU5hCawL+pZgtz8QkpTB
	+ESXPEvlqdp7C5IHFleEPAmlVausR51Y0rqYFarTnIv61sA3MagFz3sElGOTVaq8WBkNWBv3NbO
	o6NJ6QAkV1MkbnVHLnVASWiCCnlTLRKwiIDT9FxQBN4Qz7RLggNPFEUMhmfeYOUeDzedFsv7RBW
	H1DJsNsTKXK7bS2Djq45o7eMi4vLuHEskBOas=
X-Received: by 2002:a05:6102:418f:b0:660:d26b:5077 with SMTP id ada2fe7eead31-67c738b7be1mr10934618137.6.1779875212184;
        Wed, 27 May 2026 02:46:52 -0700 (PDT)
X-Received: by 2002:a05:6102:418f:b0:660:d26b:5077 with SMTP id ada2fe7eead31-67c738b7be1mr10934602137.6.1779875211606;
        Wed, 27 May 2026 02:46:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa463312a5sm992354e87.67.2026.05.27.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:46:50 -0700 (PDT)
Date: Wed, 27 May 2026 12:46:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hostapd: Fix clearing settings for color switch
Message-ID: <zsxojndeb7cr64qbhg4uf7batcqxlhfwfhas7pvdi7pc4ry65o@qfs5nkzigjsq>
References: <20260526082629.4120984-1-wei.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526082629.4120984-1-wei.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: vId93mQ0K1hkKR6GhaQB5oaqs13e2cnP
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bd8d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tQTqXVUTMqrKRr7mc0UA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NCBTYWx0ZWRfXzIPr9Ps6gQDX
 A1H8Xx4Z01Tf4QGXRYZ4+rXTc1Y5jey6Ar6AP+BHqSNr2AD4K8uTGbbal9alRxNX+Ig/78zPh+N
 BXJyz5d8NP5w2M3ezcYPWUKVdtUFf5IzH+/Mm047YrvA+rR9jQi/5NuaFgf9L63x4RCeflzEphj
 ia9nJgNP1Iy+HTYGHzHBGzVVvbQVKeyHgG/Sqd2P1PZKZ3rhO95OgIIG6R+fnth11EpTvAySHC7
 wkfy+0dlzR34OXG8oJKo7cL8RKyqwYU29g/CgGATCMv5pY/J+bai8VbjcqyNtTZZITiyGQhHSqW
 zHtG3GOiqa8IAh2UJWU51CnxUT5YO4IClEzPXNrAJRdyCM+9mOdHWImeBNX4knkXDgqfROVm+nb
 WfT7+xAo5SViTkje1YmjsV+eUXvEtH6E9yCMLhYvS28Pl04KxtTe8Q4TYlrUQVllJPhm84uBrit
 NEHMX0VrtJK1fV4cMBA==
X-Proofpoint-ORIG-GUID: vId93mQ0K1hkKR6GhaQB5oaqs13e2cnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127207

On Tue, May 26, 2026 at 01:26:29AM -0700, Wei Zhang wrote:
> cca_settings is used without zero initialization, which may
> introduce random values and result in invalid nl80211
> attributes.
> 
> Without this fix, BSS color switch may fail completely and
> the feature becomes non-functional. Initialize the structure
> before use.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---
>  ...learing-up-settings-for-color-switch.patch | 34 +++++++++++++++++++
>  .../hostapd/hostapd_2.11.bb                   |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

The patch also needs to be backported to the wrynose branch, I assume.
Should it be backported to older LTS branches?

-- 
With best wishes
Dmitry

