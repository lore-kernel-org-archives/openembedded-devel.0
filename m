Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2FCCCD1AF
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 19:49:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.22411.1761076170533408032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 12:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jjZywyLD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LErJgn024521
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 19:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2gj41EV2bxvLSnDlEWivIcHaMnRD6JJp5NqhirHdVw=; b=jjZywyLDfShEHxGM
	6eT6QJc+PwAoYPovdztK+g51LLdV28v3xJRj1N1nQ4Bh1XXHHgXLUHUW0a4DHD6i
	iaa9RFP4gmrYWljRMS7tQ+CvYA8yQ6JGk8ZGB0I/9inx25qolZPHhA2OtKhduhwW
	r1J1EuiF8jNVTmDZhRM+5mFt/KJu3ChwPdHU8mv+h3b9iPAXaUy7ijLDbGClXhO+
	Lb1fzKeUwD8IxbaFt6oQuewgju5QeOPKGQ1j+BV5P9Tz0S+xZVHxrmBXxlO2vhkA
	Lh9Om+1u8ieSq0C+nt/Iu2Z12RFLJ9l22IVmmeTD+V/hu+J7k55mgUOg8oQkJFGP
	VnK+pw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws4e7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 19:49:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33da1f30fdfso6270383a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 12:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761076168; x=1761680968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2gj41EV2bxvLSnDlEWivIcHaMnRD6JJp5NqhirHdVw=;
        b=IWnFKpV0FCW4hBtW76IFFsa5Uk+Yk5BBM+j9dhaGmQW6EwZ+uU3h7yGwFPhhjaitrP
         SnqGnhw5O5tgtvWVy7GdfK9ZTSjlcA8R8pq8q/Yz4DT6sGzNiHViOew1mFQiLEV+yuB2
         g3yy13sESdo27CBi23Qx9yb5XxAPd7jHIAstnagS9f8hrfnQSxFw7YQ4ebyLCroOo6hk
         5gtwZc6WLdY2PkyXzLWo29Swh8DRUYRSEYShkGelqx2BCrwNWOTDTmAcJDD5/WZrI2gN
         sz3bsIvYu81lCInCubGyaDrmjUxXx4g+FSxl7G49XJidj8RDyUnKij4RiozGtbgpmFnh
         10xA==
X-Gm-Message-State: AOJu0YzzI21BNRy2055rYFKVydX2RMeYGexlUacKyxn5te5D1okLY3vz
	Qiva3AeaRZMAyha1cZbln+ZvNHMXa6FRJ68beVGe1XvxKY3NQpz/jefJCfh5SF9DdS04hc8EJVq
	1F/FLROmhdnKjoDDiLKT8DGoHabvauUoaTrDXO0HLyWAZf96w/hVUHxPxfLdKIWh/X0gLvi10KD
	Cdd93LvoIgkFywYktXtygd2bdaFrqEQVzrgquef6Bk9Y75lViZMbAP2XGJ4L4=
X-Gm-Gg: ASbGncvs7O4rMbFQFuOy6eCfxGVq3zDw5THY/aKEYpYTMDONVIYOcc2//m38IJqn55i
	QYGHi8t+7V6HWkCDxtbyd0ryQlCdNLWJKGO0j93NPiFps4us5Uwxccy8Kr1h/4+9XaDXXSETQHL
	kxFTg/OuSqQg+fl5rFGulpNItyXnpn0oUE2YpU0tZIinFZwcmCmaFd76hd/V/V4ljlDYGllFgbB
	yc7/DY8hXAnKg==
X-Received: by 2002:a17:90b:3848:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-33bcf84e18emr24139691a91.7.1761076168297;
        Tue, 21 Oct 2025 12:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuHs6ZZp653tGSz9dTxx5mi30/tP0lYOrxvFjoflVI0MzWijIML7VQ6oxoR30VXNpRQ49UNvPKYpQZZ3IY/9w=
X-Received: by 2002:a17:90b:3848:b0:32e:e18a:368c with SMTP id
 98e67ed59e1d1-33bcf84e18emr24139632a91.7.1761076167772; Tue, 21 Oct 2025
 12:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <vds6ywkuqqaka3n7ka47u6drjcsexpdr7amsiqmvpjhxewytzw@omx5ziryifwn> <20251021170056.2738168-1-raj.khem@gmail.com>
In-Reply-To: <20251021170056.2738168-1-raj.khem@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 22:49:15 +0300
X-Gm-Features: AS18NWCqMxG-AWwbaw3jlYi1xTW1gIstdRnTAT3zib3xBNPZM9hE2iTr9tb7HwE
Message-ID: <CAO9ioeWkJf3c1RvexKvvp4GfjNt8qtniJ22+LYuZX19vi=78rA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfXzLx68lmAYh3P
 LUjgV1Y2bwiA4cYyEZrCq3TtnBPJFd7KUt5ydbnp+UiMrSF90zV/8UQjt43h1jes8zTpxVSOW6z
 VNRNjnjH6jcAEvqblhZswHry6BSxzbQGL6aB7S2wciYrgriIFFcGAz12KfuGXrblglj0JaQ8Dbw
 h1E+8dRmyOHOylT11n4vhRfONcmUaW8Z1FFTNQFRmXasOmaXyubmNukQrJqTIiOvLoB8mZrJFze
 BsdzqMhzhIkOCApLeNuV0xWsKbmoX/fDMBPIabiHBD2Bn9PFAjuOo3RYe7qe/JNaEogHGLjs/nS
 LlqvblpArdWvMgWqPCkx2g40YFWRgx7L58cn6pt0t+D9Greyo1n3AqSL33L09Mo3uzD9mMcGIq+
 jHBBNHHTj+ajdwhlXXNSnlp2W3D7cQ==
X-Proofpoint-GUID: h2U8EVLGrMKYg0CVyzUm2vejTxQGpnrR
X-Proofpoint-ORIG-GUID: h2U8EVLGrMKYg0CVyzUm2vejTxQGpnrR
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f7e3c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=8p70vFt3ncAN9kY0NRwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 19:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120847

On Tue, 21 Oct 2025 at 20:01, Khem Raj <raj.khem@gmail.com> wrote:
>
> here is next failure seen with clang on qemuarm
>
> | /mnt/stash/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/vulkan-cts/1.4=
.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_=
decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp: In member function 's=
ize_t VulkanVideoDecoder::next_start_code(const uint8_t*, size_t, bool&) [w=
ith SIMD_ISA T =3D NEON; size_t =3D unsigned int; uint8_t =3D unsigned char=
]':
> | /mnt/stash/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/vulkan-cts/1.4=
.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_=
decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:39:57: error: cannot c=
onvert 'uint8x8_t' to 'uint64x1_t' {aka 'long long unsigned int'}
> |    39 |                 uint64_t resmask =3D vget_lane_u64(vmax_u8(vget=
_low_u8(vmask), vget_high_u8(vmask)), 0);
> |       |                                                  ~~~~~~~^~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |       |                                                         |
> |       |                                                         uint8x8=
_t

Reported: https://github.com/KhronosGroup/VK-GL-CTS/issues/547

--=20
With best wishes
Dmitry

