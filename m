Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7ABCAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:05:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.5098.1758164734831683248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=KYGau8LA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGC4T6026800
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRqGntPY5INCvNoHMeHGh+LdqZKORU6E0UtXn5TwytY=; b=KYGau8LAiLeUJVQg
	/uOM1hoLOYVzPSliUMjFSHJpicTmDOWQjViI7IqqHliQby4amRqwzjxfjtk1hxcn
	BoJBthjZcGGMNx4QB06jsst/2KBT/caewqPEqF0iOyxzYgBHrlynjyllI4AZZCU+
	7RRvG8bqSgSPHgSXYj3HJzDRsUm5a0UCQipa/ZUh0t9brMnZTXISUZBU4JpkreM9
	V/4xoaLVlnP6tgbrWW/PcCk8gFzSe4iacGWJms6/W273lPT77Ih6E5eqT08PcTme
	IeLt4CiIPZz0z01kFd4t+aBnFyObS9dflkQ5Iy5Jty/sRf9uQ8u/N/QmQI4CwqAE
	UczyGQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt4qp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-79390b83c48so9656216d6.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164713; x=1758769513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRqGntPY5INCvNoHMeHGh+LdqZKORU6E0UtXn5TwytY=;
        b=FDxUEg9pxRdpbDIg5XWB5+el/0x6hpnh5s56H7znwAWzaWnC7Zmg4w7YGrwuZu9sJF
         ZdFKKnfocVHjzxPHGxMJJc2lBsfVv8nZZ89ZzUtMmwHZAyHaFUYMW2y1QnBKniymD2u5
         17f8CpYcu6KdvxCyEmL+2kfhkMwgyzLkAXVHZsd9fYzRKcEadCfubsfX2LLyNDXVL13g
         oAtRn20/we25Uw/IMo81/kCDyjhyHXIjzmk01qlp4hAOrGtPJWJAk1XXWOTJfOD3SIbs
         rj3jFKcoIHE3d9EmpeU0RHR21niL8mz1OmQeeMr0mCMfVeTylNdk7D9aV8XYkKfHX+pi
         T0ZA==
X-Gm-Message-State: AOJu0YydNkj8T1kRWBxsGl08Ip6eOjyvlTHWPpmLeC+04pSTS6Z26NPl
	RXVyXrHGCfsCABRcQJAywEee/doIlZiottnrdnhu3ZNb+1WA32utL7zvL5hBs+Lxf3862fsKhaz
	5MnKoGkgxz7A7alew4TuvtgM8z3RtgOEe64I+MXcAHVT5f+0O73BVOgOv3P6mf6/oB9+azJ8DXb
	BxHCJYjXvLPXnLMF/v
X-Gm-Gg: ASbGncug59s22M7zYHktG7Ybv8HUxJEcfsEt5oETnATAX43yQ9e7OhpawB1H/iHPxVd
	pziBGomftH3vPZUKAtM5Rs2HKBUm3Nj0dZ30SoawSfA0mswbryM+fhctIkO8aNyqK6pXKJBx3ee
	TeidrBAFPGevwDmzIAzVHzSV4BngFMJFgnv2E621lkgmCPTsl9ktJFEBx3/zggLRmX8u8xeYxhl
	WUkn8aqirJBttxbd+EfiuBPCFWdsMadedF3m9sRZVtiZ8FpYR/iva9VymYObawd/ULr58Bd7XoE
	J84d8y4sGWLsQQ9qV97xGR7X4sUfd8e1vXo9fi0TMQjOv3Rm4Xq0vZR4847iIkp8VtxlmvF9CSU
	jak7MVcLqS3IRC2tjAqyhKBXfi8pXTz0RJKl5AUMF
X-Received: by 2002:ad4:5ba3:0:b0:786:547:4946 with SMTP id 6a1803df08f44-78ecd4e2c07mr49309866d6.30.1758164713217;
        Wed, 17 Sep 2025 20:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAg8KJLvzL/HaVzFZpzptuRg5RUJnEWx6MTaFre45ZklBgTF1WRFXRCGy0OtwkpE0Cd9SY6Q==
X-Received: by 2002:ad4:5ba3:0:b0:786:547:4946 with SMTP id 6a1803df08f44-78ecd4e2c07mr49309656d6.30.1758164712614;
        Wed, 17 Sep 2025 20:05:12 -0700 (PDT)
Received: from [192.168.10.39] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a8f571b0sm2477331fa.39.2025.09.17.20.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 20:05:10 -0700 (PDT)
Message-ID: <0d7fcc11-3deb-4543-88b9-025841d1f41f@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:05:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] ocl-icd, opencl-icd-loader: drop
 RPROVIDES for virtual-opencl-icd
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sr6v-ohV3LsB+Xot3z0L4woDddx7P9sVrtcDD-K1ko7Xw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMKF1sr6v-ohV3LsB+Xot3z0L4woDddx7P9sVrtcDD-K1ko7Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-GUID: yjVe7y0a2VC6DDK0ZPxjdSOSAeIfRT5Q
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cb76fe cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=_MeuLneiLn5y4xMtY-oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2Yw2mn0VrR1R
 gx3odOd05J8agb6vI/kwyKF5S6yHadGB019MECSquAtIkB8A22CLwiLJc4mmXj5hQWBJb1rUvFM
 LZ+UMqRBQhQkRSwgNgOjDm1geGOGMO14zQrau4S2dGDgDudPqXFNnqyKinJ2NGTTZjBoWgkyXSx
 EBpeEafFF3aQ2mvh7EyAg2II5E+C3VY/CQfm9s0VIIpaB+p2bd0toNEhZJCugqdT/WnIui5wbjc
 3VULQoQISGx2Mpi2L1LnJNdfIiFw1V2h8PquLt1d9SJL+WJLJjln+mrrjW5lEO7xgplr+9H4yFu
 StlwD3JiYNV4KwgwDIMTovNPerPEwuJ5RPmD/AdKIQe2XxNu/DfSSuiIYkaEAyKg+hKBUnTLntq
 s3kIodqk
X-Proofpoint-ORIG-GUID: yjVe7y0a2VC6DDK0ZPxjdSOSAeIfRT5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 58HGC4T6026800
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119513



On 18/09/2025 06:02, Khem Raj wrote:
> Hi Dmitry
>=20
> Thanks for v2, it looks more complete. Sadly, it does not apply for
> me. It will be helpful if you rebase it on master-next and resend

Sure, I've send v3 based on master-next.

>=20
> Thanks
> -Khem
>=20
>=20
> On Wed, Sep 17, 2025 at 6:44=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> These two packages don't provide ICD drivers at runtime. They provide
>> the libOpenCL.so.1. Corresponding package is selected at the build tim=
e
>> via the PROVIDES_virtual/opencl-icd. Drop the useless and incorrect
>> RPROVIDES for virtual-opencl-icd.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   meta-oe/conf/layer.conf                                     | 1 -
>>   meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 1 -
>>   meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 2 --
>>   3 files changed, 4 deletions(-)
>>
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index bddfabc2195b..2f3da6170e89 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -59,7 +59,6 @@ PREFERRED_PROVIDER_android-tools-conf ?=3D "android-=
tools-conf"
>>   # Configures whether coreutils or uutils-coreutils is used.
>>   PREFERRED_PROVIDER_coreutils =3D "coreutils"
>>   PREFERRED_PROVIDER_virtual/opencl-icd ?=3D "opencl-icd-loader"
>> -PREFERRED_RPROVIDER_virtual-opencl-icd ?=3D "opencl-icd-loader"
>>   PREFERRED_RPROVIDER_virtual-redis ?=3D "redis"
>>
>>   SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>> diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/re=
cipes-core/opencl/ocl-icd_2.3.2.bb
>> index 9e32242e3151..b266d6af6d91 100644
>> --- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
>> +++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
>> @@ -14,6 +14,5 @@ inherit autotools
>>
>>   DEPENDS =3D "ruby-native"
>>   PROVIDES =3D "virtual/opencl-icd"
>> -RPROVIDES:${PN} =3D "virtual-opencl-icd"
>>
>>   BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.=
bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
>> index 2ff9a6ae7ea5..d5337af8e5fb 100644
>> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
>> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
>> @@ -9,8 +9,6 @@ inherit pkgconfig cmake
>>   DEPENDS +=3D "opencl-headers"
>>
>>   PROVIDES =3D "virtual/opencl-icd"
>> -RPROVIDES:${PN} =3D "virtual-opencl-icd"
>> -
>>
>>   SRCREV =3D "861b68b290e76d08e7241608479c16431f529945"
>>   SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;bra=
nch=3Dmain;protocol=3Dhttps"
>> --
>> 2.47.3
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119491): https://lists.openembedded.org/g/openembe=
dded-devel/message/119491
>> Mute This Topic: https://lists.openembedded.org/mt/115303503/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
With best wishes
Dmitry


