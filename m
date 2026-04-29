Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3B3FF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 03:22:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3848.1777432967610648206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 20:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UXzIjTz2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Szcm1qN/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2gOVY3183637
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 03:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBS8w4q3hxXsREL56XIc81Ls1EcFniI31dgynKXR0yo=; b=UXzIjTz2PBf+owQu
	CPfZRKoGWaf0Mj4khnpLEdga+2UjBiM6S/gUnqL1vqI4s+pIcgq8gW9DV6dSrivw
	OweJxowg3RCpIsxD5h8w8LSolnnBwkv1PLcbfrkuPbRWaGz7De6T6FC4DzD5JE5c
	PGMmtJAgWS5SB3g1FglYiQAxJ66GXCGZLKoyTrYxWKJpW22Zyk1BlKmuOU8mrDXL
	fpxR4+Bv0Cq+VwsDksQtB6cS74iARaxno8cuwhMedKbUaGDJRe/9wwb+9aWWTFEC
	pom//JLLWWfs8SowYbHaleIq84iQnOqNqOo8tjc88yrCdeJTD3qGaLuwDZMwgpxB
	UuRuvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em03ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 03:22:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca172588cso158858896d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 20:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777432966; cv=none;
        d=google.com; s=arc-20240605;
        b=PRE/EEaiggc4cb456jgWFr2IvhS1PtDvh8hbPWDE+Si/p0RPOdDEBydQt7q3Qf1B4E
         3vgzRBqgGl8UouOu2wYAvTddUqt3uPPg2GjwhHU/D62gRu7pVoQX7kcu0ZAeUrwpTIkM
         2by59Vz/JHXl2MI+p3/mjPRB6wmoak3y/s9kosBlWmVAwLA9ujdvjmhgg5e0E/ANN8z9
         IE/Hjg8Jf10F+66w1NOipTyO6FNMbLjP8CUeZNv7Iwxf31bLsBQHU3OTwut6q+b+DD8O
         hbgRHZ17+zQv85CWBQtZkNBijWrVg7Z+5mmzzTDlRsvK1ATWCEGxi2vFw7VaOiA63uqa
         yRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gBS8w4q3hxXsREL56XIc81Ls1EcFniI31dgynKXR0yo=;
        fh=1fUmEG8i/sBc8nYeuvnJ+BSAglAGnkI/5IxfgEYwEVQ=;
        b=SLyZ+G1fuXFbNj8iI3mII1/SPC8A3R9EJYGQHlhAm0GQihgYBTL3eJGPQuMagxdsQa
         FEb4sd1ZFSr0Vlzj/l3PcPInL9D6XPIe0MMQqkAy9T17xt6/5DA/937o/6H7WYXWthoj
         vEdQBlL3qluje8PrOm9ZEDXLV/22ac+bIYogU8/hTwDcoRIMdIE1nkgiyVHgq582t7rA
         BxL3fN54fzrPLr9Gh/g59xmMWgcXQaX5ifsbLZfDN2oRvGbmjW7Bb7AqDnSdRTIMYLyV
         NQHDj0Lpqm24S97fcixf33ViXNcr2zCs3d7O6+VVPKWr9vTGfsBOqOx53wv4S6i/rLON
         ryKA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777432966; x=1778037766; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBS8w4q3hxXsREL56XIc81Ls1EcFniI31dgynKXR0yo=;
        b=Szcm1qN/nTKtTmMh06MVZeyOCXxgFKDxJw2L5lxTQU3xG/XeQtiugxwkW0pzFv5Day
         czDJmmGE4RSd9+7L3qxASupH/Wu06WWOHo3z9OW+NzmO+wF6xlkk6J+tYyEHiPr0Y22k
         cTAsJ2E2LVqY56pc1DSIC8WggWUNty7RoMWshHhNGRGKnry2+RgpD6qCg+Vqdc+nSp7w
         78dAmTwbxu1KNaNwliEw4V4oeznTm20/Q9gMXQL8HrLqE2/Azb8ttMHGZtT9GLLQ5rP+
         tTbgkapQ1XDY2vanMYKblcnxj9imVn8h/mzOUQ7htv4PTC4FItNeCDAhPI7LBSPyUwXY
         vFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777432966; x=1778037766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBS8w4q3hxXsREL56XIc81Ls1EcFniI31dgynKXR0yo=;
        b=nWoYyAZ9elluKcxRV7hGQmAkKma0VaDDpZRt4PTrJBkkYrRfXwviIPUS8nTfbe9gDN
         fdLqlU2ubm8Xf6x33RI673UH9Q+c+CIQ9H3sMdZvNnWuPe6qlA1BjFHdawqgz8LHCI/F
         VyvKan1BHpV05hk2bJv29wnsdROc/eQCqZuXjDS3/VmoOrLaA28BHPQwYqYkSIQ8dGpT
         FVOQfxa8OwvQqg5Jva3t+t2Y5D++xs/78Fe14b9AxKLBnIJNrgwq6RJye4/zaVFDo0i3
         dsD+19OxHm3AN2xh6dwaQeEaOubkhptKX9ImlNlW+FkTXUJGxI5aA2YUD+rDG9ktRo02
         sPkw==
X-Gm-Message-State: AOJu0Yw/rg8E5uggWp44njGZQ9A+f4CJLPo0MzHDUhngoTrB5cGUmbNT
	+oDOnK/avrSyHdQR3EAgr9Fa9pBtM6/zejRsvC4d+ja41x6+nN4bkfTX5zhxsIh7fYIQuT0XXWw
	NRzMLw1jrWyGwZw/PsaKSTflwSadjFWUJtIQ7mbF4cJnHpzVjOOCRxH3Ihn6bMe5JF0tUxH9Af9
	E/6OgPtY4Z1klUbshxy+WGlviabGLRXHUfWal+aNIfBNp4lF/VEtHY56w3VtrltoKFa1A=
X-Gm-Gg: AeBDieuFT3hgHCldNRKS1Z7Ao2sjVs+rvthoW1Pf8vEcmw3ts708A6yzPsYGdeGnsYc
	SiK0H/TODpJMIIHeR7D/si4Vi7SBZmzFGxjWQ0nz9Q2/MckKvq1q6UpwgFpAtTOf57+wS71WH5f
	sfsTntKOBlIcRueFaL6ujKAwhVinH61BZsCiWTisfAsgAEjKMYuXfqA3g1Wzg7E5ouDAZULdbZp
	PZguPvsvSxzTr8=
X-Received: by 2002:ad4:5dca:0:b0:8ac:a4f9:da7a with SMTP id 6a1803df08f44-8b3edd641b7mr34894926d6.32.1777432966138;
        Tue, 28 Apr 2026 20:22:46 -0700 (PDT)
X-Received: by 2002:ad4:5dca:0:b0:8ac:a4f9:da7a with SMTP id
 6a1803df08f44-8b3edd641b7mr34894726d6.32.1777432965718; Tue, 28 Apr 2026
 20:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260428090053.3401574-1-mikko.rapeli@linaro.org> <20260428090053.3401574-2-mikko.rapeli@linaro.org>
In-Reply-To: <20260428090053.3401574-2-mikko.rapeli@linaro.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:22:33 +0800
X-Gm-Features: AVHnY4J5LLU46oAOftabGQ-ldlEwz3_IQtss7wZWIKabZ7nh4EQtoXFa_R5M1sg
Message-ID: <CA+s=J=zTPb2fjJXMsAg2P6pTujsJCbzdo9ppSUC9fo5GpyqeBw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] jq: fix build with gcc-15
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f17987 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=aV68vURUsAUjcO11tBAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ntTvJKQfSWWFIjQQILUMngOmCPF4Nrz7
X-Proofpoint-GUID: ntTvJKQfSWWFIjQQILUMngOmCPF4Nrz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAyOSBTYWx0ZWRfX3AHKZy5tS4yD
 uDMXLuIGKxUmjPN8K+5rwudxHQcj2/6I0D7HDeq54v4tH6j/f3So243xkWweIw4PwSYteSf53p6
 JKopp8I+k6CvHjpUn0CqhYy7r3O46IvUuxfTj8bpA6/To0d+rhpk/yXUDYIiGLzEfxF+SqpvmqQ
 UPTNGR/0+7Ew08fUxoIuYDQSpCpGvOfLmTTmLa/8TM93BSkHBtFqPwgS7R/JgQal47sSAZD16ib
 lJwM8sdLIAdniBMSpBGai78p++lPJEvucEz9MRkrp9w2D6PLb0nH5NioT9gpvGYzXNOzy6xStCC
 HAtfBQEbvsP5OEgpkQxcMEb5n9gr7FuYkNVq+SyJffuvTYib5hRVzyTKSVMLKlRJ6Wfc2haWxOr
 7Ubl+piKpPZH4JcS8DY/ErEW+la1sTrd+dZUmw+Woio8QRgJfbgS+Oq6i2bHi3LJG11Pn6HWklW
 01t1jsLKUn9dChC/Q/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 03:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126661

Hi,

On Tue, Apr 28, 2026 at 5:01=E2=80=AFPM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> * backport 3 commits to fix:
>   http://errors.yoctoproject.org/Errors/Details/848831/
>
> ../jq-1.7.1/src/builtin.c:1705:4: error: initialization of 'jv (*)(void)'=
 from incompatible pointer type 'jv (*)(jq_state *, jv)' [-Wincompatible-po=
inter-types]
>  1705 |   {f_ ## name,  #name, 1},
>       |    ^~

This was applied was later reverted in master because it regresses
tests. Can you please check?

Thanks,

Anuj

