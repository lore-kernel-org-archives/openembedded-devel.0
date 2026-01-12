Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D02D2505B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:13:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29346.1768209195692259247
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c5+NI5hX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FKgkVH0c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8qvSq113539
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9TJh6+3aGUmYcIHLqX8Ema5nhoNmS/3w7EP7kR/GGg=; b=c5+NI5hXMU6m+AUs
	F9z7hVh7vop4wdZpsJpvai0NUYO9TDE69itm+YECYIxaaqYXgt56s3CoVW7/cK75
	/kime4MkhVUjQjm6M3IOoYMyBEVxFD6ci7WzF3k1dPi7kyB87wm6uMEXrDYuvemP
	GeVUE6WFuG19zyTuMR1F/236sXz3NTqc6gR7H8zzoVulBbQKtORoQj90/WdN+LNd
	MBrdbKirzuItOWW21a1aDTAuHAWclvTz+EUFqrm8AtXgckbWcuui+eErw1ObB0qk
	oUHjELZcEqS0rFvZYxRAOWt28sI3q0rIkeuUeePre5CzqsQQ3qnhlnNuQcc+CrSc
	4GQLnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uh4p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:13:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb4222a4eso132255391cf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 01:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768209194; x=1768813994; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9TJh6+3aGUmYcIHLqX8Ema5nhoNmS/3w7EP7kR/GGg=;
        b=FKgkVH0cadV+mwd6XJbCuz1WpB9nHXY2VYkt7OrFoYhUJ+gSSBY1l4XQaQSM7v7GsY
         fd+BwJrOY7xt6mB1V6UMohI+gxGAZNNTYn6ojmc2vutToIT2sNZH+yqDY7ra2h9sozAm
         UlN0xklJkavmnMJOLJ4rvULHUH0nCZV0k1XeX/UpSa9/IO1JDFLXmzkUJOLCNKiW0Y70
         oPznWZRWcsuGTgEw9c8iC4c35og9o2ivz4EDmuKS7VoWGnaSINZQcoTqD9BvK+tEZQbl
         RK24yOUwCAzVH/FyiF7jRnxJWHck/QUIxeklFfMRQo4A+t8fRIbmp4EEmY4uMwSX3L16
         i4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209194; x=1768813994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b9TJh6+3aGUmYcIHLqX8Ema5nhoNmS/3w7EP7kR/GGg=;
        b=ghRhMGPl0q6N4OANBQvpQ91s4M0fCkkfD41WYP5pfG79W/CQgiEQnK2x4B+2PYYxlk
         Oun5axewu+5aHXhf8w8aBNMU0zlAst6vzZwI/QUE5RG2Eqi1GkSpUf8kz0rqhYOGp2tl
         0MC8IatO6JIRpJ5dOVhzmX4XCM/WtzIpJ3JFKFn+r+1lGZZlbJnEXWTd4NGR9GlQ0GeN
         Xat2SZj/dUb5Vv8efrwbgNFh9Y35tUbIgPuN2SgmQipjJfZS7iuT8H4TO7cXpQoHAikr
         LjFcFOntg1BntCLw6YsUnigXNyFdwA/XnaWOOvuh/aaj7Onz7bkEKds9x9ucBbctISb8
         90zw==
X-Forwarded-Encrypted: i=1; AJvYcCU4XN1BJEBUt6nbvPeXRChw/TldZnhwz6X9FYdRkA9eDg6dortWL1nh6YOAYhOeY2tsNn0Da9FL+JN5SehnErQJ4+Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMkjD482AekCXQ1EocThHFbHn6VEUO31KQ7VPWG4n9wJWi+JXU
	EJSrkQPYlw2pnvSc6clruCccq5WNV0Oq3Q+CNF9SUGfHuHm9cVyMHkJxPJzFyNRHJaomIQBOhvF
	+wDGR7043gWFlFDc1RKoBuciXuZCSBdQDtGPRNyMqJOQSQUoRAN9ndmAyxmAQ5CJbBH9sQBlFJo
	N+MRO0THWhNdKtmV9LzFwrUz4lyQPYCkNmX5oGlDtbcGnM+yXQPR5QUP1yk6w=
X-Gm-Gg: AY/fxX7npTLXd+2FxOJzJHWVg7E/P7r95tuDCYFYNkmNjUFTQGGFztbW2UA2tgMpnZz
	Wv3OtBx9RnGQgO+j1ZTxIBTLA6Ab7/APt6f/6mV4nU2bPqYBZfJJg81AjltGWD+8jXxS3rTh+jl
	6tBwGnSk1vLBe2PBMqekGi9oKit0T/CWm/Q3n84ZCZzvJJ9PdXsnHcWUE5KgPW0gnE
X-Received: by 2002:a05:622a:4d4e:b0:4ee:12e0:f071 with SMTP id d75a77b69052e-4ffb489de51mr236313831cf.20.1768209193985;
        Mon, 12 Jan 2026 01:13:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaXxtmWKQ0u9u+EV8wZG8rDVQzOEgtaKMoy6zzNycMG75Ztxl2gkIEtvEKe3HB2DqI+Cb/+pXR1tGvV88jNmo=
X-Received: by 2002:a05:622a:4d4e:b0:4ee:12e0:f071 with SMTP id
 d75a77b69052e-4ffb489de51mr236313661cf.20.1768209193616; Mon, 12 Jan 2026
 01:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com> <7f535a1b-9fd8-4966-b521-d77790726916@gmail.com>
In-Reply-To: <7f535a1b-9fd8-4966-b521-d77790726916@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 17:13:02 +0800
X-Gm-Features: AZwV_Qi74BkjQRJ1CiX1Bnwe1d-GJ9dz1zjAGDeY_Jyc5QJh1QHd_GpT1KmiWBQ
Message-ID: <CA+s=J=xjuLwtCyaN6-psutjEUXzDMD3acqxcFaXDzaLj2kXueA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/5] freerdp3: ignore CVE-2025-68118
To: skandigraun@gmail.com
Cc: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MSBTYWx0ZWRfXwef14/yodfLa
 B8Vmx41dVFqY3ohY5gz2FTWIXJkExsY5Rt2R1b10DV3eo8TOFhOyc2jE72XgIHxBBaXfOGaI6Yt
 Q9wxEl/zGWz7nkaa7FwSO+uvh8SJROlwhscw6tmNvCU22UOaTgzfF2/vdMRGbz3xChSLXb53/lx
 WvbVIZnFrsg3JjpqzCAeywlF2xgu0UNhRwrqNP8LWDHIWAqYxopr+y977Iso3j5odY/5P5/+Oca
 F5nvk97NlYFQ9vFhWb56SZf8Gvdr7BYWIpMec+LgxfU4LTIeHLaoY9vCtdEjejeLhqyG/Ad6JDt
 LkV405ZLdISO/WRZqC2a4dEssY4fOvKjWbi7yYuxJH66HRjgIa2unhxHPQr+T8uLBCKxyu4ir6+
 ql8AZTUYLZ90hC+wmnEzIYnumLURSCmGMa4xv+hsZwkhdR8j5bGJopA+R74PqHm1PmNCPNpv+v2
 k5kYtWWHp1cZv2tvdrQ==
X-Proofpoint-ORIG-GUID: hYMcYTJnwKnhs4_Gjf5nLqzCGvMCZSpU
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964bb2b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=7My3tD8mQqg5WsMdbSkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: hYMcYTJnwKnhs4_Gjf5nLqzCGvMCZSpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123371

On Mon, Jan 12, 2026 at 2:08=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> At this time this CVE is both ignored and patched[1] - I think the patch
> could be dropped.
>
> [1]:
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Danujm/=
scarthgap&id=3D19d7eedf67ea1b8fe27790366d98a7e888cb839a

Since this isn't merged yet, I will drop this ignore unless there are
problems with the CVE patch because of which it needs to be reverted?

Thanks,

Anuj

