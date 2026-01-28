Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E22D35665
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 02:08:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4147.1769566134923025591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 18:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ke8Nedyw;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jJe9qUQw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RJ0mIK2436568
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETtnBvb9rnnCL/2v9q1tjiwX8fJVwOd2VCguQmShCY8=; b=Ke8Nedywt3NSsc0S
	mrHBp/d0tXLWvL3PeygSVJmN6cfi+xxoejoDIUa4nUQNlbbjZGjVVgeS0MlShHdW
	XaKgZqVZelJQ3EUGp1hlbpBl4+74QK4TuleBDObKXT6t8rE6iIJ8w7WybqJ4BuL4
	L9ZNjfK/g5XXwmMnUPfwk+RhgnX4M9mLRCvdikCMeQ9Iqc/wZnfU47nslHwuClpl
	+P4TMDpJ3UBAsFaXCZBBwL19Kh0kHu5nYO8qBPVk5/qwvjBhpd+jnLD8QqN1fTV4
	yK78GCbYtMI+mJG4G25RhNkbG3PfqZ1YMuaiYLRLP9BCHjiwyZ+gal7TpkmnUEDW
	cyPEtg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355s5wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:08:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so63080675ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 18:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769566133; cv=none;
        d=google.com; s=arc-20240605;
        b=chBo1esiLefHWlXkpKsTRYQsnSe5TWmskZv5Jq+1M8n4fxtiNqxovEMfEGKh+DFtBt
         lNrA0ltZ0/97GJLP/ALh3lLaEmdtQXspr1YMynTzmgTm/WvEbFb+Bg9afn8F7tUZRZzB
         N539dS7L/+egftYaLnSey+gBe5cgROB3NtA1yrKXp/w/2LgSQmVOdlSa/WUzpfwsDMk+
         Dd63E3JkXEiX8NtQeXsCha6Ysln+GJZ/N3Lfh88EL4XHR4olFevPbS4l46/CuTVHcwcz
         j73/03WDZNHYRmVmLJcQVGOYBF1j/QasovnHpOkVRXeLsBhTatj7PHE9lMyc9ZpNsNC0
         jOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ETtnBvb9rnnCL/2v9q1tjiwX8fJVwOd2VCguQmShCY8=;
        fh=rvHI9e8tDpzaYAeEOnf6K2mlrvItleqhmuCiHJJLFLs=;
        b=YHZcZ8kk7hONXy3NxYE7KA5O86//XmWaKwI5w92hUKoiJJ5W1u2JsT+485NV5IFbyx
         DGyXrhuqYhRwxu9KRJpDREMiXfLfwtVx+nBpwxgtjwS3HX420UFRwDcR/UNtr9LOBG/9
         x1nkDFnGvLRylo/RfObsvxICLBu0TkIR7cb4/31bpOJ/i/yAgx+wPv9YZQrz8WCPCwA1
         SXnW5uQbRJdGvziGMEHlpOSEO0Z7L++s5dxbK8q6gkKw0l/QakHcSuXmj48aeoUxppsy
         AS/rt6XyttoiUr2c8CAmWhlqhRPJT+IVVImPwc6LksXAguGStbPEPkSS/I3067MI+drq
         WGFA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769566133; x=1770170933; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETtnBvb9rnnCL/2v9q1tjiwX8fJVwOd2VCguQmShCY8=;
        b=jJe9qUQwW/cakmt598Z7y7zsAODzb30cUU1Yi4kLVu3NS+HKOZo6Jb8nqtG2vp1Omy
         nB8Z3FjUy2rnI0Twsr4tbq1KP1pwTJQK6jO9CCtE+K8zLkPO/x6kcCigLoNuf6mKFNLI
         pmjuIh4TqFo+IByiENQTqtMQLrsNxTDZY6fV8ZQPWk6ILKMtMKK1zkMycV5f4nlqvjkU
         szcPo9GGrVMs+Ax5YZsodsXYrKI9493a3vxN0o71o2zck1ft7VeGthwgmyY2ZFLYgY5w
         2MgfXzi/DtXduJWjfEh1+lhDMpYSjwPF0N5h2XPITHQD6PYhx/KyMiwXjZdG+FiWgNAY
         vDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769566133; x=1770170933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETtnBvb9rnnCL/2v9q1tjiwX8fJVwOd2VCguQmShCY8=;
        b=G2CpKFbwr1LqrSrIe7Co2bSvDh7jcmUXtNd0XbvP7AeLh0akiBuCcTgUiR0ZL0iHnu
         KvcUPu2kOPqCErbwy54VxpWsaq9+/5+ZWc/0z5jXHdiLIygVCqnAehNvyLNiRpnbvDqO
         TyL75NYqK2sKbUcofDO/L45FjP+Y2lO3bpAeuPlbotp7ILC/bN2Wtg/aLLxQGy5FhuWO
         +CS5FQUDD9DKvE/rh6bOkCITL2l/hx/1YQWcNz68pbNf+s4wRhqCaFlMEIiWmQkdKk+C
         7/Y36J2N2+Sn/RXoYbRDzl+81ZADFenV41a+LTwhuBrkcgGs864l7YZ/kTMNpAkX5t/p
         vuNw==
X-Gm-Message-State: AOJu0YwRL9d8j1YdUQdmHnFtUlEfXKaDmbmJu0oz+1neprNNDhYecl/M
	zfOSsoj/p7AbPnFyrzGcLYYsB9Ex68go5rdMM3jDP5WODoFIb6k/56ud8tRfENcpmKFt+8gE1Z9
	pjiMd8mzux5FQmtxuPDbItZDPKNjobEbmoygZJnhbjEeC3h1Ap0n4zeXmqvTljReBBe/X/LM5x4
	5Qc7Zni1BHkbDnAE7KyaFhbSl9MkBaGgRQ77zVxqhsOdeX2vCoCZ30Ug42RYI=
X-Gm-Gg: AZuq6aK5X6AME5w95D5Azew3G1/QUIX/kYT+GIYQ7vIp5SRWQArsD02S1HgHsKnGOCX
	cpozLOXxGiWaXAfkpWZr82ggBEcbrZqMo7YL5nSgtOQpBuJ2RrBzwJfV3UVqY6//KOfXIQSpq53
	MrA3wNvucpJpuzeuCXrDrZz9FwnRBJdwtfhiuV53oa7y8ysj+HX34Hl/3SQz/wBxOSImv5
X-Received: by 2002:a17:902:d2c6:b0:2a4:8cd:c3cf with SMTP id d9443c01a7336-2a870e77eedmr41393825ad.49.1769566133436;
        Tue, 27 Jan 2026 18:08:53 -0800 (PST)
X-Received: by 2002:a17:902:d2c6:b0:2a4:8cd:c3cf with SMTP id
 d9443c01a7336-2a870e77eedmr41393475ad.49.1769566132759; Tue, 27 Jan 2026
 18:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20260127055329.3727567-1-shoudil@qti.qualcomm.com>
In-Reply-To: <20260127055329.3727567-1-shoudil@qti.qualcomm.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 23:08:16 -0300
X-Gm-Features: AZwV_QgryjIJdn-xkHmtpAKw0flSIax3_N_SLG1qEPAWjhtx9KRUz4eQcfsIHHQ
Message-ID: <CAA_5youHfEEeRo6yy88W4qzOQ03=+FRs_7swEb8NM-5GtnjT=w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] android-tools-conf-configfs: remove this
 recipe without selinux dependency
To: shoudil@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=69796fb6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=Bx9Rq_O0B1RHcinQBQQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: QnVUWjDYoZHeCKTRXRq0YIdiXIq3TesW
X-Proofpoint-GUID: QnVUWjDYoZHeCKTRXRq0YIdiXIq3TesW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxNCBTYWx0ZWRfXyQZyc4vCc/kB
 COqo+UKIQNdnA57ZlsfhPX5l0XHvxRbTPn9kSqpEVv11DhuOmRbrCvech9bu+pUeEBaRg5swAOx
 nLzh2XHXhMpKW/3mdznKyfBa7eK9Y1cAMz4FRE5ydwt3vd9HRh/fmjbDdTEY7i/pBDljjm8R/U0
 gtLnmMFN839lyPqZRtUpn7S+ZziZEs2eUB19z1hGbWFrEjX3IB5936U9HqFiPP0zDXmDW7iKDDE
 YfxAEOCy91XnnGaawDYD3IHJzt60OleugL669OZ1Y8cGwJQtg2OYhuii1wZI9rqDnLUjfLp5gNf
 D5fw80qipCJ0xS4jXq2qglVWDJKwFrGmMMiq2OSm1Id2H0ObI5L7FdnKJzCW0GLB20afRr6OSYJ
 K7KQZOJH6se3sSe21TYdSdEsFCHnkFGpRYux8DOlD0KtU9r4Aa/c25z9Xc5Pgv/lmmYJjm2OZpA
 +kXZzu7EwQ/sFKf0GLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123963

On Tue, Jan 27, 2026 at 2:54=E2=80=AFAM Shoudi Li via lists.openembedded.or=
g
<shoudil=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> For the boards with multiple UDC ports, when compiling with meta-selinux
> layer adb funtion will be impacted due to below error. Remove the recipe
> under dynamic-layers/selinux/ to avoid it.
>
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy

You are removing it because it is not really required anymore, so add
that to your commit message.

The consequence of the removal is that boards with multiple UDC ports
will be functional with adb.

Thanks,

Ricardo

