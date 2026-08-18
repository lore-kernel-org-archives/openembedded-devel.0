Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA90C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 01:05:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9628.1787015099385194420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 18:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NkgEsLjc;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=W8zKUIUy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLknMn3532568
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXG53VMAcpNBkro/W2+xw/MUw/bQMQelZysdo9/aNlw=; b=NkgEsLjcMff2OO+a
	RuTb4oB1IytqmKCfprF82sdGMveDtjNnLiLArGRyGG9CiHENGZZkJgke/K/AoFq+
	kDXOnjK7jKNmf5+krjYclbtQ4j+94qf/dv3IQFRmx3IGnkWkJHnlM0M5zO8507a9
	BCevQy1zDm3JhuxxBzTOoFxtsNtBFD1VJKWqpDoyCcVd/wUO6MiZ0S6ReFW6l2CG
	sKQKbwQ2Z/89PuWHNWlB67fhhtUmsVfwURmQMj+CGYB619/I+3Ldxj03EdedLtnK
	AG/WqOQDod85RgitdLncvyEJQoq9lMp6n1188ZH02FxhjzC8GS7i6c4Tuv3DfX+l
	zoa1Iw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615hr0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:04:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so6394244b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 18:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787015098; cv=none;
        d=google.com; s=arc-20260327;
        b=IDSPdSptY7F3v8F8dZeZ9HrpUsHwQt+Bv6fuUdsSCsDcyj/KgngsARBJ+0Ep+xoNb2
         ua3EQWLaSh/PqZQlpfF1PEfcYVqA80u2sAC5GhIZqjkIVUzR6S/KbTfrzXgNn4AKr8nz
         bWrKJMFjvJsNfc/B/bf2ZKFvogVoIExHKgL+ai7BvUdffuGAXSHNgZroQWOliRBTb6Rm
         LysOybFWEZQ+8WWktCKprQESSAL+GdqlvUlSn1q9X8ZX9zPID206SuMIrDi/l/+rcvSu
         YVdRqdVSPVkvCMBE+SgJX5Iz16uXoXn4syq4Pa4rRgF1GXg8fjM9MI4179S3iVe4WIrH
         fmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXG53VMAcpNBkro/W2+xw/MUw/bQMQelZysdo9/aNlw=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=l1PSYbZd3G64gaJEx49PZvjARdQsFpyimZtNfwoB/oS/wqb9ZYC0kFhb/uOypWMhBr
         BV9JV89XckNXOaeEmmhYURP1B2deTjIS6bFEI/mxih6/4/SBuSKku9WvzYh0uiJePe91
         jJx9K86W9LUSxPBtWWY0VE665EEfnVUnNL7MdKdjmTkNQmf5eYiZFlV0ncOPB3DzFrSi
         1i8gUQEb/WaZY91HOa0d7EHbgrp2PvopPkINesaUIx9z9AsNRr5AH1auH9PVC/P2E/68
         kIkIBfbEMyUIZ5xPMCsTDvpWUMRCoNtO1QV4mO9E5MlR1bUEckvEXLTEgSstKxB11l38
         T/ZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787015098; x=1787619898; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qXG53VMAcpNBkro/W2+xw/MUw/bQMQelZysdo9/aNlw=;
        b=W8zKUIUyZApWTXbE9eAVCbhmnUSeKQCOmcjodPUc3JFhqn32tRGvk/JeMy8Coggi+i
         f/wSsv6MKzjhBUBIb4lZnb8xaTQL7FuM28vGuT7xiP5Bdb5vuHVFNae8N9NQOP7rl1hb
         QDcOR012o90g420t5dD9IJem5aaaEzg2VXqsLDOgXuiixTygypjBVzDiMOj9oa7AjjzU
         hPFI17+XlKneK4bm0t0qbCFL2vXewRUaEAlRmcf38uLOyrJhIEAmD+T71xbAG9TY0l5F
         oIfYmf5Wa3g/vt/lUEObH8ZocX9DZrwOrvOELTecveN4BAMqH+U9Z3l5r/ZNiLIeG2d0
         QV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015098; x=1787619898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qXG53VMAcpNBkro/W2+xw/MUw/bQMQelZysdo9/aNlw=;
        b=XOqTH61Qe3u3Vf4vFxVsUPGbjDH59XTZwPWbG0m+mPEt1cTHdVKnPI2hvejs9OaAMJ
         WAhCunrvLh885XSfGL2Ce7NSEPeG9MrOI1B1MeqoMLkFSu8V6lcw/HeXJTn0TVX8lo70
         B4WxX1Gc/jlwN4b+G9Qqgc7/h7PM8hX8CgPs6nNqifXf5nqaDMmwvDFxAaaeSAb/vg7M
         0cNavsxxYQeIP8AVpdWoL28pfRNH0uCKLuJxTUptjXoP0vx7TAneA2+gQMkkCcEQ9Ew+
         ou4916nA6SOYT+YXoon8s8wVKnVR1EOOw1s5Psofci2zA/JEPtMaB3Sg+GKGtcRsWMCb
         pP3Q==
X-Gm-Message-State: AOJu0Yy8r7/6nsvZuoMHDPVQgzBsbwykFWTGKU296hhyaU4GBl4LUg9o
	0hBCX/GCWzkP7wKMfcySclQ1FsV8kgm0FAwxz7CMSaxki6OeQxatgs+QiNnEfey7uoZmZmbX+c0
	oMvRaf1UIHtmi/Y3wUZgnt3SoRrIGpV3PPRgQqoRvg4ZDcYm0RyDsDixKnxPCDD9vYJ1FrOgtB5
	UeOrWq00WCgV7Vk9nG0oqUz/whHVezemQbB1yrZoFNtcnVAu00uyzTq4fqnJhOHiYUqzg=
X-Gm-Gg: AR+sD10RPxmp8PzzzfJOMkbJFFUe2AGtmlWkLW0I20SAYI1IQe1NY/EPb8xJ+lrU8Hd
	dEeAv70pnanDWc+p2Do3ozM58rgphLu5ROwwd3As3wf9p7+Mp67K5M9/NRGxccoT38+7v/udoXV
	0gvf2/JntTXoT/810jus5QfUTHdyr3W2zjXuu47f7y9MXpk5a74cctFPgWZ78=
X-Received: by 2002:a05:6a00:b4a:b0:845:4cb5:2343 with SMTP id d2e1a72fcca58-851b882d7femr4661126b3a.19.1787015098218;
        Mon, 17 Aug 2026 18:04:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4a:b0:845:4cb5:2343 with SMTP id
 d2e1a72fcca58-851b882d7femr4661057b3a.19.1787015097765; Mon, 17 Aug 2026
 18:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
 <CAMKF1sq_Rbg3gs2E4C+SUexJ3xZkkQ57hJP_NpeUt4wXZY2Ycw@mail.gmail.com>
 <CAA_5yovr5sZQsNtCR5B1kOAieUndWwzj+54i26ELHiG5CSO-Ng@mail.gmail.com> <CAMKF1sr32BBBQTiB9rYw+2K42LnEj04BUTJx++Zhvop01YbyGA@mail.gmail.com>
In-Reply-To: <CAMKF1sr32BBBQTiB9rYw+2K42LnEj04BUTJx++Zhvop01YbyGA@mail.gmail.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 22:04:21 -0300
X-Gm-Features: AcwNN1UoxXNVX0kCC-hzDynCWyU7pi1mnXZa9YI30RhjvCApWLl2GWbgs5-zksc
Message-ID: <CAA_5yos1iGj_EEmVKm2eq=5dATihK4fxLCjgePXJ3JrfPDq_sg@mail.gmail.com>
Subject: Re: [oe] [PATCH] redis: fix build of the bundled xxHash with -Og
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wLOBhMcdjx48u3P0ZyW3xpzFLkdsw2rB
X-Proofpoint-ORIG-GUID: wLOBhMcdjx48u3P0ZyW3xpzFLkdsw2rB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfXwFkpksDndxtA
 msPgDYWuoIc6iw0G3xpeuJJkRLnupC1sjgfDXM9LOoP+5Ow6tEvbDM5I6hrfyHuxH4+oT8gpPWJ
 uUx2+wfJFUCGjzj7v2YCuZMF2Q3mrwnHU+s41+qI4kNm95KECL1vSABI4zwYKMh6TKP3eWFvSWc
 4V1T6ywSDJHa61cVLh8bsExBdUJ1mnY8rp4zLom07E33Ipcag92c7TpYFi2noeuWBam//9+25WM
 am7HipRjdt7hFNCCiuJSsDrJzjhM+lirkaFw1QyixgOFjs/YeNqpkptJGb6kjBlPbMKLcZEbQEl
 6FNg8UVdlcTbqNYToMMJw/TNKnAVvUt7QbOVx0XBLOzIVtEMwLHEAXrdzNTzOiawsOgrdtF8Anr
 QMUXrnUPCOl5XtR+/cgPT/mBoDNGuno7pze1zzwgEkgZ4LIitxwJn09yYgsX5KC8KYrjUCA0IIt
 sJNftrIpUa2RhPzThCQ==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a83afba cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=EkxfaK2YLSOplvj6XkwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX+4kGWg9IeAuv
 kfsVVK3ZSH9qGBQPfPaMnoa+Ac9UKNxqD7i1uO4YRdXas9x12lJr8Lt+edXS3QUxLfEcj0GRvuw
 NiGxNuJyRIQ47oKL0+vzGHiXrF92wgw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129199

On Mon, Aug 17, 2026 at 5:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
> On Mon, Aug 17, 2026 at 12:50=E2=80=AFPM Ricardo Salveti via lists.openem=
bedded.org <ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrot=
e:
>>
>> On Sun, Aug 16, 2026 at 7:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>> > On Sun, Aug 16, 2026 at 9:40=E2=80=AFAM Ricardo Salveti via lists.open=
embedded.org <ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wr=
ote:
>> >
>> > I see that its fixed in xxhash recipe in oe-core
>> >
>> > CFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DX=
XH_NO_INLINE_HINTS', '', d)}"
>>
>> Indeed, I can do a v2 copying over the same line from oe-core.
>>
>> > I wonder if its better to depend on system xxhash instead of using ven=
dored
>> > version. Please explore if that option is possible.
>>
>> There are a few issues with this since it is not based on the exact
>> 0.8.3 release (it is post release), and it could cause potential
>> dependency issues in the future. The other issue is that there is no
>> logic in redis to consume it as an external dependency, so it would be
>> another patch we would have to carry which will probably not be
>> accepted upstream.
>
> I wanted to know if there is a configure time option to easily use system=
 version
> or vendored version of xxhash library. It seems there is not, can you con=
firm ?
> if thats the case then just send the patch ported from xxhash oe-core rec=
ipe.

There is no option because the source is available as a vendor
dependency, we would have to add that. Just sent V2 then.

Thanks,

Ricardo

