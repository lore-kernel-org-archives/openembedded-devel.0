Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2A9CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:10:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76252.1780999829855814317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hlxVSZTK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=SSgGARO7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xjvi2245517
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 10:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v5dNiJzO8EdJ3Mrc+1//KC0r
	xIiux1vVpO0sfE8eGyo=; b=hlxVSZTKrONspZVrB9OyFuNwA2qf2exgb+qpiKN4
	ObPcpYM7RdsLoL1cxxH0E3OU22yarRIbkIorkknKmb1Z5RtFqg8kSpsG01rHVAon
	D50mpNQJYOwBjI72BjcpYcXWnYsDi3eUvM6Ki8MLLrUB9mwNPye6ke42bFaC19ie
	NEz+Fzlg+qiuJTnddyAN4wXdd79He6LxmtaTx5QxLNnZc5u5ziv05snEOXwMUQmC
	4B+b7D+jVDYPf8RjkI5uohgHN+J+uUtelYdPaF8nIVOKg3a8oxFQe86Llj+g1L5q
	o9oJVYQ8hPEehMqNqRWhpRjSWlm22IJIoA3cTaaZ02QaVQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8yfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:10:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so2204700137.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999828; x=1781604628; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5dNiJzO8EdJ3Mrc+1//KC0rxIiux1vVpO0sfE8eGyo=;
        b=SSgGARO7itUR5hbdFq+0orPT/U3RJiB/e/B2/Fa+rgYXLhmz6pIp1zwNs2OieYKDR6
         Ib+43A40ClYCyH/6+nil8vmQC0wyvcf3fEA5oqRJnmeZZTDlpWEWk4d9GYuAm0p0kgRu
         IQ0Y7gOe66nMMUHnTdanWcz668YwTiQt7RBiNafas1mjqrvdp1Cs0voj2TZ5XpXsoeNJ
         RXIKFtJivFEgD2V8PRYBg5fpRK9olkqQghSussQrNh+PORenvsPdb27DNXHB0n3gU41j
         GWIcoqDtfmIAEctXnakrReQ/pPdruLBFaJFYYjFpoeCrIhK5/Y9v77dxRETp4JMRwrDH
         2PGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999828; x=1781604628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5dNiJzO8EdJ3Mrc+1//KC0rxIiux1vVpO0sfE8eGyo=;
        b=c3NqAYWWqOMzGzvUG3nzjN6vH3VNAjtbkLQiOeiNbYUJqv2fVxpH9MRZIL9wVBr4Hu
         qomfpxnAap9u2rhJ/7HNbrCM9IvHWDLmKqH3jEvJKLP7hoaKdSi9QVsoOZPOB+ozNNgB
         8c3wZRZ35g8rDBh0BYkFFRZ5qshxg383Vomz3Z3s0EfzE3GevvC9ocQ/CDq/5TtK2shN
         V18y26nWA/gTp7ZXHffdqWM9Tb7x9LihIefLppOn5EzA7w42SCrWrkIdHHSWrO9gXuqx
         jNr28ifhbzkdYTylLl0Rwt/QhRd84hXSEVAOpbWe14KeGvNlysX44L3266LTrsEQ3Yc/
         tK1A==
X-Gm-Message-State: AOJu0Yyr1e9qDXX7EQCAV0bHHt/4Jlf8thiYmN0ZPzIzqjPNNdiogwZ1
	VOEiH6+U9zFyagLV11QCqxuVEjXuXnLZePUPfY82NxbbquVQmR7ADoO9SIt5r/IalQmPXq+/fdJ
	pZc+hczNtPCk2kJORnU0Eoy0ydcsueso9cgOM44+PnHW1RQ0LZ7js/u7gwCSQ0Px2Cg0yOq5i3I
	69N6JjvPnx
X-Gm-Gg: Acq92OFyB2oGjk3qcU/FAs6pgacONBCnlmDU/chKaMEZeMIvmUk62dMOY7z6iDuqcW9
	fq0H4G74l6HBhZOowAPsSSqrs3V+dMRL/k31OjsgrLMD0ZcJqqD6AhlpsDbq/r0bDuvqiz3OEUY
	m01n7ZKfjoc9iPPavRXuAKA5KySzkjudcTw5+rdWjiA4LoPC5Z14ASgTTHf+P4pq7BhM7Pm6nlt
	cZANdnvGa5PuHLMx72CJDaOaD9hooAOUOlfbiN2h8eaQfGoUfD9pjMIiY1rMO9JEF88PYBnbp0e
	D4tvOIkpn2f7NwtGtByRVj5xfGwMunrZHCt6YjFNPkRkHZCpLQZgi9PpokBVlc50r1yuaIzHCIJ
	8sLvs3mOEie+2s1N9zCOJio5uIko/mmziFRpXaUsZ+kLn8hlLa0cJm0McXBPi5u8wO6gkGoleLl
	R8TTDm7T86ILadKoIF1tUnW73d6hWJ36jUnZI8P/ISFKF6RA==
X-Received: by 2002:a05:6102:3e13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6ff149353admr9689049137.26.1780999828215;
        Tue, 09 Jun 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3e13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6ff149353admr9689003137.26.1780999824206;
        Tue, 09 Jun 2026 03:10:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a74asm4423286e87.53.2026.06.09.03.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:10:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] opencl-cts: update to release 2026-05-05
Message-ID: <kqqp4gxe5monqtcgbn76hrbnbz5f7xiiulskjwqj6mvktz77eg@o6m62jjjyove>
References: <20260608225132.4012664-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608225132.4012664-1-reatmon@ti.com>
X-Proofpoint-ORIG-GUID: JU_29sopriK5nQgera6zbP5L5sbl99lJ
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e694 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=sozttTNsAAAA:8
 a=3jhSqQ8iogHR6gG_6vQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: JU_29sopriK5nQgera6zbP5L5sbl99lJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NSBTYWx0ZWRfX6UvAgl46yMBH
 tQw9MDTvLFs+bVo7tmlLHSwhsQBJmvDvYEjzo4BY8287RJkmu/cKEgN92A0LrzyMwEMOHVZj00d
 +AZDvUQ5+ImHfOsHv/xVUkZMQ+U9hWBbQEibbzRKHpGl/vIDgO4fu4MAJ2v7GV4QPrhT5F6VJM0
 gztmI6BvmMej8IeBrvyA7h7vrQ7MPkGOTsI8NL0L2zdtNgIB8zYMKl+N2FqVT/exWkGPcQFeYe/
 YBsDIEw2d725qlGuiNmmjQPRW4SByWD+6dP7aHr5M2GB6PH8rTfZjevK3HzpTyHWrfnWJIyLWCl
 EGggCraDB8pGxusbtxYq6CYJOKGBKxHMVWEpCzSdNHaxjwObZcUpt2wfIeOb/wS3nYLrW2rOprT
 S3FFkSWJH9scEYbO/Zc/Zv7yeC+SEXJsvjiZh1Zdrv5WlsM82U9u2a64Oeon4Kn25nbVbbExRgx
 3yK4ayebliq6lWHnEPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127453

On Mon, Jun 08, 2026 at 05:51:32PM -0500, Ryan Eatmon wrote:
> Update OpenCL CTS to the latest release.  With the move of the
> opencl-headers and other opencl-* packages to a newer version, this one
> also needs to update to fix compile issues related to the header
> changes.

Either this, or backport a simple patch.  But yes, I was surprisedto see
OpenCL headers update landing, which broke CTS.

Khem, how was it possible that the landed changes break the layer itself?

> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../files/0001-Ignore-Compiler-Warnings.patch | 43 -------------------
>  ...2025.04.14.bb => opencl-cts_2026.05.05.bb} |  9 ++--
>  2 files changed, 4 insertions(+), 48 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
>  rename meta-oe/recipes-core/opencl/{opencl-cts_2025.04.14.bb => opencl-cts_2026.05.05.bb} (80%)

-- 
With best wishes
Dmitry

