Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFCDCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 14:19:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8818.1759501131876055172
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 07:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kACepJcM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593C2jZN006059
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Oct 2025 14:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H89ldFYGzmhaXAvHuPOolC81
	KRb33Sppr5KkvHSz1ZA=; b=kACepJcMR++pikm4eZlV4jM6gZsSUP2puM9XFP2U
	NJp7zxTDD56eqc8KSBzjX6eB2EyLk4jgw3p2+bC0Mm8q2CI0k17od2/EC/Od5Jiv
	nruK5eiAgL517VEJlS7gRcdCibuJ/oLs/ZUj+ZJ9X9vp9r3M/WTtZpwQmz7vrYuX
	IczbFHprZfVuopCMQKFVPhpPlUdJdxkj55jVSjVc8kb8bUDBF/KZ9k4AqCtRn6Xl
	Hpj/5kdhwb5I7kMHxkddKWs52idgevg2qRQpDzqisLbEHKE7aixVEJ9kqiukBYEB
	2s58i6s0QuPuT63UoYfbGkN4wswhdySFikUvFXhIT/H8TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdtr9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 14:18:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-286a252bfbfso48106555ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 07:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759501130; x=1760105930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H89ldFYGzmhaXAvHuPOolC81KRb33Sppr5KkvHSz1ZA=;
        b=TDc1xJrkr4idoCspdOZ2Bicpfon9+0qkAC5KYLC7fe04QyAG4ucKPRSSc6HyAaBYd1
         Jjsi//l1K3ZffK6tUlsp8no5svjUtZaoReajO4dLR9OnBi/7kGQJGAG/Zk/LTBg42vaY
         xvXfJxoX0vaEpQ8NOQex6i+b9ZWduDkKGn9MYmuEcWVkujDGxqao5AekFenvYD3QFSdp
         0sQvTr0hZyBwSbx8M8667XlvwGESmq02zHk6ol7Uj7ZJMFfWDGqHKAuuXJW0FbmdCxLH
         1cn/+zuVrtGrvcq7feVTY7ApBavXFQuFr5GK93YqbmWzUA+rujrEqEsdeLuRPF++krk3
         EW8g==
X-Gm-Message-State: AOJu0Yxl+VTE4o4Uo55nAonkeZR+Qa78WiFahePKnMWVFJc0orOP7RdL
	S4B7PmQRSLxQvZ6bDb3+st+aM2mssdWvchbktpAZBvic5MtplyJ+DDVWOeTeibO2EofNqcHvFZP
	eXx/X+zKUf5Y6OxTVSue+DdwH/8d2DDtYITUJTzc13CaNRB9EGnYvg0ejFKs/zQ5+oXURuywT9k
	D2s+OdjxdzFwKhI71ZkFqKnqRbqhU/bqKtRvILmtkKuz92ZH7Exluks7pfjV0=
X-Gm-Gg: ASbGncuko1KYEEYtMvoO0X908zYi79pm1/zQSZEVAdTchWj61OkNFJMRL6i/whtLHdp
	bCBKPtBnDNn+LVZ+mWhpMdsgOk4GYPm9w3T+88Gk7zzfOpH6W2SN5fDPOsaTQ49UYJv5vtXD30/
	9pyluQfwGaMLtvzrWL8vNWJQ75QbQ=
X-Received: by 2002:a17:903:13c6:b0:24c:da3b:7376 with SMTP id d9443c01a7336-28e9a5ba7a1mr39652665ad.26.1759501130595;
        Fri, 03 Oct 2025 07:18:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdQQCg2ywenRZBIMNLKhq37aFdJzLYCGGan0+TgzYp78xFE1cv8Vk2vusPdBwqChc6obz0qlYxCJkdpUFWwFg=
X-Received: by 2002:a17:903:13c6:b0:24c:da3b:7376 with SMTP id
 d9443c01a7336-28e9a5ba7a1mr39652325ad.26.1759501130106; Fri, 03 Oct 2025
 07:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250929024025.3210337-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250929024025.3210337-2-dmitry.baryshkov@oss.qualcomm.com> <46701dc2-87fa-4587-8636-3d4f9bd1985a@ti.com>
In-Reply-To: <46701dc2-87fa-4587-8636-3d4f9bd1985a@ti.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 17:18:42 +0300
X-Gm-Features: AS18NWBIFRxaFM5zfz3vDuxwqXknr5k-Push57JZ9uby7teQduwoRVAKzUuw5L4
Message-ID: <CAO9ioeX5_dAM_U38r+4q2r=4_aw1mARGKg0fvW5h7V4L7FfNoQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] opencl-cts: build GL, GL ES and Vulkan
 interoperability tests
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: eqWtwKyCQ7IMQoCh7c85CBSUNyOs8YA4
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dfdb4b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=sozttTNsAAAA:8 a=Uy_pLh3CumhodOBtARQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: eqWtwKyCQ7IMQoCh7c85CBSUNyOs8YA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX0waRzYyV4S3r
 S9Cm2Z+IG/70WFhsnZB3xgiL4+iB7yZ1T4woJq0xS/CO5WEqHpManisrp6momSci+iA1Q30u3n4
 YPYQp3AQrhWuZSc6ZCO4dD725BoK5eIx9Xj0cfxOczub3YUGO43jGKi7yeWy8i8QjHqCgImdJpc
 HxxeMl/Dyc3Zg3Y9t4FHP0pwj6ZmNOBJdW7gOXKY8TdU2tq5+3Dzw/kgOi39IiNb/nP9O8jyZts
 6C7qStcvyBCxZKVfSKGWuYKeejKLwTWZjKYBNFL4KNzKfb/lahdYGGDmyTuBmgFY/Tce0mKT1hx
 Pvx+XGISZDCgIKwsebKbb/YmH7fTi8w/ecJ2HoCJeqbJp6s6D3ra6F0Dg58rjM2ny336P7m/lPk
 RQ4pznzb1rpoN+5zAbZG0Ajv622tjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 14:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120220

On Thu, 2 Oct 2025 at 18:00, Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> I'm seeing build errors with this patch.
>
> ERROR: opencl-cts-2025.04.14-r0 do_package_qa: QA Issue: File
> /usr/bin/opencl_test_conformance/vulkan/test_vulkan in package
> opencl-cts contains reference to TMPDIR [buildpaths]
> ERROR: opencl-cts-2025.04.14-r0 do_package_qa: QA Issue: File
> /usr/bin/opencl_test_conformance/extensions/cl_khr_external_semaphore/test_cl_khr_external_semaphore
> in package opencl-cts contains reference to TMPDIR [buildpaths]
> ERROR: opencl-cts-2025.04.14-r0 do_package_qa: Fatal QA errors were
> found, failing task.

Interesting, I can't reproduce it here. What is your configuration?



-- 
With best wishes
Dmitry

