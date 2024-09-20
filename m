Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEBBCF58DF
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 07:03:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.12343.1726815821429803159
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 00:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=fI+XBYQg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3qLP004243;
	Fri, 20 Sep 2024 07:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D89Nl/blo71u6FCke9AKWKor3R1LwYPTc87OI1pjBNQ=; b=fI+XBYQg2ldHiyO3
	2Wlb1ojWgZsgFey3hmh9nmQpU2Sm0EB1e20zm7Fbv9ahfMFX5lq29sTaiFLI0ftw
	6k8qrwJGHZht+10Vfb7w0rUCU4nIHhowFpmtxx97o0G3y1IBghVQRzgkp/7rNCHg
	g6jV32VMRSdm56ivxCVHC3IuoK7XQDBLNovwoUSm/CNUSg/Ar0LbE2hl7qYLHxNT
	kYrw0q4yZRMKDV1NDHomBYd43jgapWkX44uw9rgdiKbm6X/P8V/StIn9HhrgvcUu
	pnidUzu/UXkj1ZxPp9xP8Jz4quZkyumxj2AuKURFCtQxtfulfYjom0wRQXhsBf4V
	V2mGMw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4je044v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 07:03:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K73cch000351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 07:03:38 GMT
Received: from [10.214.229.249] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 00:03:36 -0700
Message-ID: <b7d89517-a6b1-4e88-8552-f8946ee0233f@quicinc.com>
Date: Fri, 20 Sep 2024 12:33:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] android-tools-adbd.service: Update ConditionPathExists to
 /etc
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_snb@quicinc.com>, <quic_vkraleti@quicinc.com>
References: <20240920065823.260243-1-quic_raghuvar@quicinc.com>
Content-Language: en-US
From: Raghuvarya S <quic_raghuvar@quicinc.com>
In-Reply-To: <20240920065823.260243-1-quic_raghuvar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c-HkRO8Z_ycNE2a6-hUfELMpu5q9I4Mq
X-Proofpoint-GUID: c-HkRO8Z_ycNE2a6-hUfELMpu5q9I4Mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 07:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112394

Hi Khem Raj,

This is a request to backport a fix from the master branch to the 
kirkstone and scarthgap branches. Below are the details of the fix:

Bug/CVE: /etc is more suitable for build-time files than /var. Hence 
change ConditionPathExists from /var/usb-debugging-enabled to 
/etc/usb-debugging-enabled in android-tools-adbd.service

Commit Hash on Master Branch: 8106cfe769aa3f0ebdff7a1caed018f9ab49a090

Stable Branches for Backport: kirkstone, scarthgap

Best regards,
Raghuvarya S

On 9/20/2024 12:28 PM, Raghuvarya S wrote:
> To ensure android-tools-adbd.service starts at boot, the path
> for ConditionPathExists must be present at build time. /etc is
> more suitable for build-time files than /var, which is for
> runtime files. Changed ConditionPathExists from
> /var/usb-debugging-enabled to /etc/usb-debugging-enabled
> 
> CC: Khem Raj <raj.khem@gmail.com>
> CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> ---
>   .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> index ddf8d7f74..b6661f2e3 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> @@ -1,6 +1,6 @@
>   [Unit]
>   Description=Android Debug Bridge
> -ConditionPathExists=/var/usb-debugging-enabled
> +ConditionPathExists=/etc/usb-debugging-enabled
>   Before=android-system.service
>   
>   [Service]


