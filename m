Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5ADFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 07:27:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6168.1777447668313088039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2026 00:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AIiZ/SAN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OMeVXNNl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2mS9h831361
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 07:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrlhHJ6tjfzr37Y/q2Frm+Jn7faUy7SA4BoUBm6YVsc=; b=AIiZ/SANOS4CuQ2P
	3S2Sgxk+9yL12RsWWisUMwC14zvUJoULBTk8WHSU29iQ9VhEy7aJbFXmMzWBSE1q
	f5NtcQ2A+Q5Hu9E9fdeOV8szYh8thY8umQWtgaAyHcQt3Yzq/l9uiQUQtn62DDVV
	2cvJdmngcOfhd19ODCjyx1zvm2vnpVVM7IujAZ2YYClCWMHSgDGH3RqEOWXgSX/v
	P4/GehlZ6L+9DOXVywBWlfZwH1RB4kD4M2Tui9yYSAhHxciQzbCIJpw6PaQRPrOU
	DjPYyZxlogVEQPbC36zQC7O9kNbFwqSECu9FC0l9vNL/C+Aq3P6aAAsk2vlY4+5D
	Xw9x/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqan79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 07:27:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so180848716d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 00:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777447667; cv=none;
        d=google.com; s=arc-20240605;
        b=d0/pdsiWziMp/TWEq6P5Fv9yJDB2kJtxyjNsds1vuWna/xNfeByII/ygqdLEJoT4ED
         Abv6/632EK5b9RNaM7Zkd/NNKoHo70NJHVgG3tbDRWdSQE6lTB8lwxtEsK7AJ+krikSf
         mbTXYNKkKLyFbRlixD4d2sUiRffZ5YV9lwYlWsD/JQjGPjMaJHAGCevLTtkhr6pSM772
         Ia9sJc4I4qknt2GO+22x/MMbJFpVM6SKQXpFnn7ATwp39mg1ETzbu6Mg6/6NB7T/V2/l
         8dv6ToeOJcASO3eoMbvV2/rwiPEtwzqq6YeRCig9bdvZTZAlCSTkbdHtvXPRE/aMwt1d
         KUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrlhHJ6tjfzr37Y/q2Frm+Jn7faUy7SA4BoUBm6YVsc=;
        fh=1fUmEG8i/sBc8nYeuvnJ+BSAglAGnkI/5IxfgEYwEVQ=;
        b=hBsHO5xYiG39f35T8ksRxTWUq2CifQy/Bn9FkfAFzIlAaLGFLe9c5qy6jJxNJRj0ua
         aEDydTteELlw7Yg04kTOJhHLV5VmcTbCb0lOjl9V4prxedGc/1+baSQvc5yLfDQ1B0cP
         3tkeegGNKMgvBX+c3e/Q5lZJbLSwGPveAQYfa0kWmnxFRZVQq+39k/1JtwCzxAYUiEkw
         jUSeM3kGJMzAuVlagnOTrMDwzA1nHY76V/PC1CckNLGfQJv+PQZ8woDVx124dGGIYk2M
         aMX7IuGsn0ZicnG9F1IXSkatbqx2+0lN94DhnlGpMTb0j2/d5nrFoh6+qeOGKTqzlvHN
         1KHw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777447667; x=1778052467; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrlhHJ6tjfzr37Y/q2Frm+Jn7faUy7SA4BoUBm6YVsc=;
        b=OMeVXNNlTjD6znq5BlWzgJRab8bAKe47VqhQE14wwtWFak8fA2aJauLCzRU27ibk3Z
         iA9oMlo79iMTxwudRVnAihyds5gagCgQci+pJhy76kB1AxK8WJH8OHGCdoSPcdAwWw27
         p+ljQKtE8HrGC5oti2Tt5OKVgS4aQzIsr+wVsWGxtPNikdZ1lwrMolhSLFJCrVr2Ifxl
         KbT8h8KR/OdzMVqA5qkNWhUGF+8weTo31ElerDiSstE4FlMFZD+uGT2lGSOmcegXEwe4
         cY26uXteMyNCl2PhCrgl2Ioh2dJ/IE144Szgx4qnoXQuyyUkdy6RclCwt+OiJDndi4k5
         9Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777447667; x=1778052467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrlhHJ6tjfzr37Y/q2Frm+Jn7faUy7SA4BoUBm6YVsc=;
        b=Mdmz4HPDNEB8BGDuF1wsMOdJ7MjQgoMu/bI8l63uM989Kyzr/+lZCLWw0OoX0A7lh6
         2cf/UlkUiD38dIbcaDT84/s0o5addlwOxRKRX5HV1FDkfZHSiKcCd5tfBzSu/8xTwTu1
         Iu0Wdj426Wpt2Xr+xuQjzuieNhbRLBctqP7747sjsAQ4ljEZsOTCPlMcxJM2VgUHMPDn
         1/67ghqOt1s4Y7kBiU539zXamgxf2lNPpoCzo2QMDaMLFhHjav0ROevZksxk7/hgIuqn
         7j0wcfzRFWr3WyE8Wr4bNO1iM26qNPxVMjox+CFHa6flug0/vEVi6LmAWf4ZKeqcaCEO
         CiYQ==
X-Gm-Message-State: AOJu0YwIn5Eiyq9+ngY1JifU3C9hEj0VWlwvmF0aVLA9eLxeoMG78q3M
	6XF7V8lzReg6ZRdiSFWkXfDL5MNQTByJkFR6XSWlaOvT4DO8VAqU9gPRAxDBjhQ9Az8Xu/XIMsg
	zoZiwrTZYQQgAQo1Y5HHRmPyTktvfvuHQ06ic5mtzbkWlAgxJH7t/4ZVPwp4SyUCMGQCTGnBTVY
	v9YYvRF1LFzxxRaFWVfTZpHDYT8tKV1kP/pF0T15XsLd1ZE2APmmoUBuBcbIc=
X-Gm-Gg: AeBDiev/tbeYnpVRXXCbqB8a54jZTWuRTulEmLn2RaCEAwNODvU+8pRtO1d1gvJ315o
	THB6X26biS/vUmjGHKmijTy5r/NBpnCX2V4Uu1rIHCI1n0x4fOw1QLcAcJbDQvo8u3pRAJsKoil
	32SscC+IQQ+z/AZAPD6jMPkGrFgpOVCCVV5iiKYtbs6dkuhfWZyD0yLnZnIFGSw3966xYaq8sde
	w8Ii52v+t2z4XU=
X-Received: by 2002:a05:6214:1249:b0:8ae:3e38:54ca with SMTP id 6a1803df08f44-8b3edb3177bmr48453506d6.0.1777447666679;
        Wed, 29 Apr 2026 00:27:46 -0700 (PDT)
X-Received: by 2002:a05:6214:1249:b0:8ae:3e38:54ca with SMTP id
 6a1803df08f44-8b3edb3177bmr48453306d6.0.1777447666175; Wed, 29 Apr 2026
 00:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
 <CA+s=J=xW4-4Os8Y=nkvAX9SjuSmzuebd-=SKhdT_RrMBZcx4=Q@mail.gmail.com> <afGkOJHzKIOXnCzc@nuoska>
In-Reply-To: <afGkOJHzKIOXnCzc@nuoska>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:27:35 +0800
X-Gm-Features: AVHnY4ISOUMv__okDN53hGq2ahRmmhUNCCfmN5p4k5MZD9EgTnOp9ZwLjLBrymw
Message-ID: <CA+s=J=xFpQfmHRT3s3zDhCzHxTZ5awpq3_unQbhk9symcW0cvg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] onig: fix gcc 15 build
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WAIHL1Go9J1sRy4fB63x5tfLAM7xjpvW
X-Proofpoint-ORIG-GUID: WAIHL1Go9J1sRy4fB63x5tfLAM7xjpvW
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1b2f3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=rjB2innocwKpOvQGncIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3MyBTYWx0ZWRfX2hFVtzwhdZWZ
 dvMqCAhGBDfbJqwv+xVmqx2SrKbfkYT+YanZiMCSY3ACj03T+L/S/LNyb0Tq5nqSP93zbxdJgxS
 BtSwh8fvcZYYY47tSvywDYc+UxAzc9gYcvoggnRSaCSgJdpk7UhwAiXZk/v0g67A0+kauNXPepv
 tY/q611TeZeZ6cIDVhXKUAXETzGz+BqdKWQb16H4GZej9tV4H+9ohgmoC1i42iuAsrhT7FB9nyJ
 vCTL/iAH372qXB3Z1WXAtVgTONOs6jpNLM81VO1n/JHeJ/+nnOJqxyBPBclq+EcXz2fnhimrdMG
 Gvq3WzO9kVFBtP68+J3k8sPTr3vc0OwJloSiA+8flD/sghloaq9mxx6sKGplrTibXX7yYECZOpN
 KAAN4LGKXMtq5dQtyTl1wxlrahre6PNfHhDVYU5DuRsJWzjt7HmS4DzKTp631+LIWaSD0WrqLxJ
 Vn2dJDoFEWUWiq/KKpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 07:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126664

On Wed, Apr 29, 2026 at 2:25=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Wed, Apr 29, 2026 at 11:17:55AM +0800, Anuj Mittal wrote:
> > Hi,
> >
> > On Tue, Apr 28, 2026 at 5:01=E2=80=AFPM Mikko Rapeli via
> > lists.openembedded.org
> > <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > >
> > > With backport from upstream 6.9.10.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 ++++++++++++++++=
++
> > >  meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
> > >  2 files changed, 139 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01de=
e60c4cd67f2e2e46484ef50a5.patch
> > >
> > > diff --git a/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd=
67f2e2e46484ef50a5.patch b/meta-oe/recipes-support/onig/onig/5f1408dee4a01d=
ee60c4cd67f2e2e46484ef50a5.patch
> > > new file mode 100644
> > > index 0000000000..f0683c2ebd
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e=
46484ef50a5.patch
> > > @@ -0,0 +1,138 @@
> > > +From 5f1408dee4a01dee60c4cd67f2e2e46484ef50a5 Mon Sep 17 00:00:00 20=
01
> > > +From: "K.Kosako" <kkosako0@gmail.com>
> > > +Date: Mon, 18 Nov 2024 00:18:12 +0900
> > > +Subject: [PATCH] fix #312: Build failure with GCC 15 (C23)
> > > +
> >
> > This is missing Upstream-Status and Signed-off.
>
> They are...
>
> > > +---
> > > + src/regparse.c | 44 ++++++++++++++++++++++++++++++++++++--------
> > > + src/st.h       |  9 +--------
> > > + 2 files changed, 37 insertions(+), 16 deletions(-)
> > > +
> > > +Upstream-Status: Backport [5f1408dee4a01dee60c4cd67f2e2e46484ef50a5]
> > > +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> ... right here.
>

Thanks. So used to seeing it over the --- line and missed it.

Thanks,

Anuj

