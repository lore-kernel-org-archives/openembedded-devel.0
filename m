Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35240C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 22:05:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11126.1744322749813049055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 15:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ezCdr/VG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGBw5S028891
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 22:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eQe9NhJSRenAm2huGrE66EMb
	w8H8S5gs1cjO1XvC9+I=; b=ezCdr/VG/O9dFf8UawbkpwAcItFajhQ2OBVkmPEO
	O7vMLMfO8povaisbXgkpwMOL9GUxg896VTGlGOQ+EVYPUNdIYrS0ihGqZbx04HWf
	GMQDskMHd6lUavKJhU0xhRW7KXXVoWreIPVbVxamEwXRlYiPi24aXV/+/CFr0/nW
	i6DlALdB4dk5KXqwVylpRXp0khM3Gu7jg9dqs+XZ3XZ8GJXxPN9ENPrdEk6b1thg
	N1IsuLPacsIw75LrTNVdrjVsNVRDhdBFRs/QDJeGeBIi8HMbB4X4tqt1uDT8mkWc
	r1bf+Rojh/LWsSYDRwcddSOFu61SEOe0XKlfrM40EFtNzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twburf02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 22:05:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so229333485a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 15:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322748; x=1744927548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQe9NhJSRenAm2huGrE66EMbw8H8S5gs1cjO1XvC9+I=;
        b=sBTu3Q06pGKmxjmBWJ2HlzPtvbG1w4BHDsVUurrpYA5bCK9RIrOel7OmsrHIOmd76e
         zRbtUZjjdhv0FAk6cehr4Mg+XN74GAeAY+looGAT3zZLMOjP5AAzzvbxmLT31lDwG8KY
         v+elyLY0+gPe/SYNLfqBTr70KpzjFeMtTpa55wPFY1a2L7t9pnKj1pbC9bQjNAhS606D
         VTxAFHPcCI5YBZrEEKh5r8CmwZXN5fAeDg3D8lRvsjT5tNtYc4E1z65qPrHJG42C4PC3
         VtvnbMDjsDdsmV8l+ENZfkjEjzRKB4SYWQXhuypiQoJTyWoolkB1+La9BLcrDPAHqveg
         uAQg==
X-Gm-Message-State: AOJu0YyFpQfjdqtdYtNVcyElEU/n6GnAYk2jHmYuiesDWbEc8SfvSqaD
	2O0DO0lqtNpsyhEHYD8UD0Y/wRf9xGz+8iRC6SBMzzDjESsOk7mj3L0selJ4//ucSN2g808Iq2K
	bzCuXdGv8frRDdA36olWMMF2Ab1UAxDpn8w/SdtIGWl5ZsHdfFlbXOtqMKtaa7QQauHTZFq4k0o
	kvw6xWPAw1/veF
X-Gm-Gg: ASbGncviT9C9GUSU4KfrHZyvVn54iY6AEtd1Wv1LPc/gJPpfNz71moXjqswINNwG3+0
	k8PkMAnMvpMCO+uCEZT5LMJs9SM61NoUBRL/mljOFsbf6rH98+kt0qgziO57Q9L0GJC6MwE5uh6
	+MsVQiTP3k8oXP7OcIiQWbO9csIGpl72pdwJ9YGNhs9VtF6rsaUHJgH0cYVfOuHmkeU6olt7Qg2
	iN2HRXmJmy6AKq139oTwDFZOVNeZw+jdDruGHqChPSSAbh0+X45bGEt3nPhqp7ZscIzUIzJnjac
	XqSp4GMXBKvcWTpEA8siFlDB4MIpWOjvmHYAtWPznQJLvQ03T4yFFjRLTvSMPB2On71saTCSsbE
	=
X-Received: by 2002:a05:620a:414b:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c7a76b96dbmr603361585a.22.1744322747597;
        Thu, 10 Apr 2025 15:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+E5gHNngOZWprqKBONGNJCCuET6//fRunMqPnmdOfwnH4PE8rylUZHAgUv0ToWXszYietsw==
X-Received: by 2002:a05:620a:414b:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c7a76b96dbmr603357985a.22.1744322747142;
        Thu, 10 Apr 2025 15:05:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5201b0sm254133e87.246.2025.04.10.15.05.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 15:05:46 -0700 (PDT)
Date: Fri, 11 Apr 2025 01:05:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/5] opencl-headers: upgrade to 2024.10.24
Message-ID: <vcqsx7hy5jlmcwwpq5vbydou6k2yehxjxv7nsnqm2iartl7kn7@tshogi7vdy5b>
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
X-Proofpoint-GUID: youKVCvhLEkiHZE4RK8ZDVkv_454myT3
X-Proofpoint-ORIG-GUID: youKVCvhLEkiHZE4RK8ZDVkv_454myT3
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f840bd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sCSw_Xtk_YupkP8Gdo0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=888 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100160
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 22:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116773

On Tue, Apr 08, 2025 at 01:20:54PM +0300, Dmitry Baryshkov wrote:
> Upgrade OpenCL-Headers to the latest release. Upgrade opencl-clhpp with
> the same commit so that they stay in sync, otherwise projects using
> clhpp might fail to build.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../{opencl-clhpp_2024.05.08.bb => opencl-clhpp_2024.10.24.bb}  | 2 +-
>  ...pencl-headers_2024.05.08.bb => opencl-headers_2024.10.24.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.05.08.bb => opencl-clhpp_2024.10.24.bb} (91%)
>  rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb => opencl-headers_2024.10.24.bb} (89%)

Khem, gracious ping for v2.

-- 
With best wishes
Dmitry

