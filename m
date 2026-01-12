Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63366D2505A
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:10:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29553.1768209003847652249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WwowQZUn;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VIJQyrYc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8540R202098
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REl7KhRflqrB3zpVQ0+8ZzZnup5y3r/ygpJNd0Wtltc=; b=WwowQZUnfMZ9wFXm
	x8C0ChwuhZkGHORWp4jSvCORlFngmiA22Dz3XUkQtj35mk/hdmrXDrFsvKGGZ4UU
	GOwAekus8lSVa2IKiOXEfPk08ptRHYbGAVdsKTDQbzDII13RCe1ACAJQr3Qu2Rjc
	YxrwCQpQMyaxtqd7xy2BxywRh0Xo6wqGxCGT88fkj3flWlX81G8Hy+RNnl/wv/df
	YTRVKuuEslOi44VBtBsJr2r5SgE7XHMACC/VWHJiMylMUZaGczCC/ig8jRVvMsT5
	YEqEpqtinm6Gld97ZHPTS/kHNGIjuAG5FBs56xsDFzMhaF/tZkTHQzN3SOGHRKaB
	GBX9vA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytcmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:10:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8887c0d3074so159722736d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 01:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768209002; x=1768813802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REl7KhRflqrB3zpVQ0+8ZzZnup5y3r/ygpJNd0Wtltc=;
        b=VIJQyrYcNhSUBf+icE5miWGY7wyzqPJkbNSFldvHmTcCofm1rHJULHChCULgWukx9z
         VgnTl9Pv+pLTjcuX1Gq9eZLZvEzWeLbMIoV1AgQRf/DfBGYH0atTRgXjQE4Dozi4wqeQ
         sDK0x/dyHm9WMQCe+5qEcAibO5Mp7763NpoSlVtBL6nC+97xb/uCom7Z7GejT4MGfEaQ
         hKogYeZXPk7smmGUFd24r9IegrOiGeMlf2BucsV3vfLux2Tub9lTB0bDvj0mXmY4+H3t
         qp+KFH34q69hynRVNUY+hzL194vWrvlsjeKU7tOQq98mvAyS1GeU49QvO7X7ZO3CUU4y
         3wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209002; x=1768813802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=REl7KhRflqrB3zpVQ0+8ZzZnup5y3r/ygpJNd0Wtltc=;
        b=ZcvZI9psT44o4fHi1o0+1g5eywMlRTRvy1qYuCgAUV6AzaoZDxdWcPO3ToUv+v9BQE
         QREUdEFnvfhUlgixuo8RPDnaFs9z3K1cy5mb9AvIsBxRiPgGBWgNfC+KvbKwvruNhaUx
         Q31CU8N1KMT3j7lRVuxIToF/gLPowWRA2H3n+Tyj+fy2yw3spGmYs4e1rcdJjAlELry8
         oYcJC/Roo8khWBSTNMrJFlJ2Pc481iiFpFWjXaQqFBZv6Y8jKv722gXh2hYcVf7GB+vz
         iUqrUruw3HSZ8uEYU46aMttG88E6Nj3TcNUfZmJos/ronOgPQdt3v1BQn6ZhwJQtUcLT
         WtRQ==
X-Gm-Message-State: AOJu0YzgTKDdYXP7nNT/YfGCHAt0kb4AqN9me/aD8/O5u3kzu+F85E4s
	aB1ZsHyH4gaj5jwihir9xAy1VyjjhwDFT81xQ1PYLaLt3X+Li6bYsUj25YZk4ZoiIUFzq0o660n
	xaMzTQL8ThJSnEYRflkL4teHfUk2/l9sfmix2cul/a2F5WsyRuyVZmKxDFKUzRw8PRqpXt68oLU
	8BYHhgBoh//souroHzOot5I5xVetpVa/5YKrBt46VoISAIzAZLASvo25+ykD+MqXKR9Fs=
X-Gm-Gg: AY/fxX4vwPA+L2bFr9p2bE9Rr/KybxlbcVJdj3HXvA1hCIzdJxGQ6A1/pxZ6bSeGDjB
	5eQ++QEWoNSvRN8nyXSbunBWJTcwdZGQ9T16WfGw2hMhI8JiJfSlVKM0ysba2sqh5kfbfVxxBnI
	XehcDIuj7JqnNZjAvIMEbRfONPdN73Bkff1XNgAWQfbd64xHK75pXUDF5YbX4E8Lio
X-Received: by 2002:a05:6214:d49:b0:888:710a:1750 with SMTP id 6a1803df08f44-890841ae7eemr251410226d6.31.1768209001879;
        Mon, 12 Jan 2026 01:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5U7/UgRKzLs1Y+rGWqDdaler4Jj4W4A/VeK8BZwJmom7jkp3BxqzaL5gWwK4167ISgpG9vVEL2AfmVrlpojA=
X-Received: by 2002:a05:6214:d49:b0:888:710a:1750 with SMTP id
 6a1803df08f44-890841ae7eemr251410086d6.31.1768209001391; Mon, 12 Jan 2026
 01:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
 <CA+s=J=y+tCNA9PjOwfgcR68vx10nEuu+P5Denc_HmSjfWmhNPw@mail.gmail.com> <1c1a7717-97f9-4177-b4e4-ae8902080002@windriver.com>
In-Reply-To: <1c1a7717-97f9-4177-b4e4-ae8902080002@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 17:09:49 +0800
X-Gm-Features: AZwV_Qjv5gnILsj9QWEH4ElUUf0EKsGQMBroiynDuWv30y6VwCKQCE_kyKXy6sY
Message-ID: <CA+s=J=yHdgNtdDWMyNz4fcF_d8vdrrR69uTe0vNUw3WNW6ABpw@mail.gmail.com>
Subject: Re: [oe] [meta-python][krikstone][PATCH v2] python3-django: Fix
 '_lazy_re_compile' is not defined
To: Haixiao Yan <haixiao.yan.cn@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: dfw4kD7TlDvdfLNfIL4F8E9RU3hmZNMl
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964ba6a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=7uAQkYcWpMFC7z5qEk0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: dfw4kD7TlDvdfLNfIL4F8E9RU3hmZNMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MSBTYWx0ZWRfXylfLt2E3kEtc
 0ezna5xRCw29jlbl/k/24h0f8WWMR32B9Ptk0qeszqAggLazou9LMWscdIdS7AAi1YjCtsY9RAn
 n/UetVFPsqIDYK8UN1o6zF2C6ruypl+/+XrEDavJMA32fjLZaw7P0NtjGakoL5w+NKf8QInasds
 6Yc9uQn1O0suVaG1bGQjKRy3Nqss1gkQ90WL4GR/bZI2UdFGW2bB2z/aHg4knnS4olz/k1LS2ud
 4Y3Yd1Fni9QZBuFEYH3YokjcN+sKEMptIPPa77gVafuZi8JLX1ahgVzDAbsMby4bFRomUTqkX4K
 e84r//GZncFiJfH3RcfoAop9bx6ZHTmzzKNnywyrTHuvc1EWx9ZyIyYGN+asOZHVN+ckfAOGFdw
 y1AuCeUbt3m898jhr/oxxYsQcNMc43hQW3anATRk9q86/UIdgSHDk8Es44VR+DHQauvPHoUnOVB
 sX/YnbAwXNagWvdctyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123370

On Mon, Jan 12, 2026 at 1:06=E2=80=AFPM Haixiao Yan
<haixiao.yan.cn@windriver.com> wrote:
>
>
> On 2026/1/12 11:10, Anuj Mittal wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Sat, Jan 10, 2026 at 6:01=E2=80=AFPM Yan, Haixiao (CN) via
> > lists.openembedded.org
> > <Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> >>
> >> - Fix:
> >>    NameError: name '_lazy_re_compile' is not defined
> >>    introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
> >> - Revert the modification for docs/releases/2.2.28.txt
> >>
> >> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> >> ---
> >> v2: Fix a typo in the title
> >>
> >>   .../python3-django/CVE-2024-27351.patch       | 35 ++++------------
> >>   .../python3-django/CVE-2024-39329.patch       | 27 +++---------
> >>   .../python3-django/CVE-2024-39330.patch       | 40 +++++------------=
-
> >>   .../python3-django/CVE-2024-56374.patch       | 42 +++++------------=
--
> >>   .../python3-django/CVE-2025-26699.patch       | 37 +++++-----------
> >>   .../python3-django/CVE-2025-32873.patch       | 33 ++++-----------
> >>   .../python3-django/CVE-2025-57833.patch       | 33 ++++-----------
> > It's hard to look at a patch patching a patch file .. Why are the
> > other patch files being changed which didn't have this problem?
> For CVE-related fixes, I don't think updating the release notes is
> necessary, as no version upgrade is involved.

Is this fixing any issue?

> For fixing the issue '_lazy_re_compile' is not defined, do you suggest
> leaving the original patch untouched and creating a separate patch instea=
d?
>

Yes, I think it'd be better to separate these two issues.

