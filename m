Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C9CF256A
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 03:21:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6246.1763522456089430825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 19:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lp8nEdBI;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=I5CDItUh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIJQ2H13373358
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJBvGCS73i3SFprRV/c7OYZ6v+5oirWHq8lJP9EnK4Q=; b=lp8nEdBIQ3pSHKyR
	mF+tAU1SgmEqIy7nLjEP0xgtKeASqkTCMxn5578TVHlJGLl/hbeObmBkl7gsv2Al
	TQFavRaexIJlqexhwCK4GlI037YpSEBE6dstX5dP5KuvUAOW4C9m5RFyPfctXUDy
	2TUgUOwRhLgoTounXdOkRVbho5sAU48+aK1PD+ScVS+hefFTg3gP8A7Uan7qf5Oi
	LggPs2uMsRNVzQ/xn3oSZnFFRBWxx+KKTiWyKX4yCVgleToVeEWhEk7W8l0jYuED
	kp9mwcrhAwiU5cRb+thNA9Je8eDp2oGrQXYVXglK9uJxpaa8pmJN7X0otOjrYYRw
	xzy5QQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agxy113jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:20:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1d8f56e24so1716447985a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 19:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763522451; x=1764127251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJBvGCS73i3SFprRV/c7OYZ6v+5oirWHq8lJP9EnK4Q=;
        b=I5CDItUh0PL3NZGetLMHhLhjpzCMuATh1W4emdrCFCWibJ3yCENN44xVmvuEECL8S5
         zuIGQMKExrg52x+yHmck3PO+m1IemrLDVEiv6aYQ3S+0YesX/KSQPucDttICFEH5vmzJ
         B47ZcooRXhr2TZehpakfOzkeVFspexMNnkbxZJYpG+9x/M9q1C1wLI+Vsi8oNkuQE8/Y
         bE/Jds2+Na8tyXlWu5h/0C828jsc/WZ4x0/gh2wFcN+/fjXSm+ER8MLtBTsVsNBrFzQ/
         ylz72pOylI3Ozb1whugXkmQVydoGmTGYrQUcjD1WYMgJK62eIDvDJtdUevMkDqxdeBTk
         k/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763522451; x=1764127251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJBvGCS73i3SFprRV/c7OYZ6v+5oirWHq8lJP9EnK4Q=;
        b=bCvBvyYyNg8Ik2dutrv3hmbxNBxdnuqr2Tc78PaVDoj0VlGXgOpt7m6GqsvG3QS1vz
         6BIbbSs7L61t9ylM5WG22EULq/3+EHcPydZ2jaznET8kvII1z0V0MSS7iNX28cTdQ34e
         hcs/g1rg7ZVs9SUbkkIJuRdeKkfzfkaCEmj/p/BKo3hZIK19ST9Xf4NTy1L0snvL4RtV
         JMzFI3ylg1XGcmvHmvoCjDJX9wkgHI64IzGD/7pfjOlYqY02Fk7WMGAM4kAqsTiQxGdz
         RXLObnA2SAm+9ZpDRHO9CTYz1dRQPO2p69OJvIGrqOAJOO17fdEXbSM7DZTpiWkYd2Ms
         Lh7g==
X-Gm-Message-State: AOJu0YwaibP/ADjpQkGeUvgk3N0khA+fgu3CuGkWgqMkp7XdWuP7DOjX
	zG9WegLIsQ2zx6VvQK3vYArvmNqi8ZJFxrMvanfmiMDm1MRzqjHqSH4swJ3yNGuJFifTYieuysI
	TZ3BRdo9hg0+yDi6QQ4hoFFN6mCzHVu7jggn63sP5whu6OWxBw4iyQy2C27FzeXP/MV6PzA4hce
	0Co6BOzcEum2g6ZFfoShy9N9R5i076EggTrVJ9WEbGyRuk6OaPglIPQWnqUbo=
X-Gm-Gg: ASbGncvcmLzWSVOMdflbBBbkQLRyCNaYQk9WkwBkjfuACHU84cKEPonYb/W8K2TqlwA
	Hq0v74ed5ohwkoweSt2q4TOUxOR0T84L/VBUaLd/vXmu8XAM6UyCcrAg0JnhmsC/ztuMvyb+4EJ
	mO/cF+TwJMpISS5r0yWkziNR/KnVlBWuURF8+IniSuasLM0rThZ9RngDtKhlOQiQpU
X-Received: by 2002:a05:620a:40c2:b0:8a5:6ca3:d56 with SMTP id af79cd13be357-8b2c317e8ccmr2316042685a.39.1763522450886;
        Tue, 18 Nov 2025 19:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsE23cqfdduP9gYl2J1mXie7ERSdTuRrNHg38ePoLNoWPn17FGwqGVteMN+GhzizsLYq4mVf6+TaxyK39fHjw=
X-Received: by 2002:a05:620a:40c2:b0:8a5:6ca3:d56 with SMTP id
 af79cd13be357-8b2c317e8ccmr2316040885a.39.1763522450404; Tue, 18 Nov 2025
 19:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20251118103128.1471091-1-skandigraun@gmail.com> <20251118103128.1471091-6-skandigraun@gmail.com>
In-Reply-To: <20251118103128.1471091-6-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 11:20:39 +0800
X-Gm-Features: AWmQ_bl25a22mptRJULrGYNtlOOvfQfV54CNqR_-5pgTuqCxOuxWOA7BjUhrgHA
Message-ID: <CA+s=J=zEc5VE_doMHUaH85NhvW6iDY_9STHa6Th4sFPzOV76DA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 6/6] libwmf: patch CVE-2016-9011
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAyNCBTYWx0ZWRfX4lxzzfjsDS4K
 145krAW2GosAgXBiBiF3DS75QNuqXdkjI9Q+quhvWs7+yOuNBSk+RK+31+vsWF6rKLdwfcE74yK
 OG1il5zL6in3hUjXzg4uMV63YUbA8gr31orcoam2q+v7HmpHeWiRR91iXUFSeUcTtp7Recmp7Dc
 e9cr548urlNVQOWVV1uaSRq/3mldFgOxeYVJfQNfUFP17leu6RmqHdnFk3GWUdwrbTpojYmtPDp
 4+11tiOE+mhbRgkB+tIvh+mXWs8iqzsDi4iHCzvHZzAsl6kuQAGYI1NbHmNraBz4nOWUBfJPWIE
 /QzzXwuHDNayUfgJg38D6qHBRvaUwdfsYerVSeFyjoYZcyH8lSNH533+EQu+LQJ5b5XpENpBoEk
 CQbYfnfQNtK9e84IuHhKhDLX5CdhTA==
X-Authority-Analysis: v=2.4 cv=Dt1bOW/+ c=1 sm=1 tr=0 ts=691d3793 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=y8qI7olcwghS5DILn1oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: oFJZZD-sL1kjAgBAIxOzxbduoG2sySNJ
X-Proofpoint-ORIG-GUID: oFJZZD-sL1kjAgBAIxOzxbduoG2sySNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121872

On Tue, Nov 18, 2025 at 6:31=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Gyorgy Sarvari via lists.openembedded.org <skandigraun=3Dgmail.com@=
lists.openembedded.org>

Something wrong with your git config? I've fixed it locally for these 3 pat=
ches.

