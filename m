Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DBACCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:55:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.9463.1761652554058498448
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=X6sIsUaW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7uMkv2752114
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KJPOg0cMHWEae92x1dML9xfX
	za6FFLzUGQBnJguhsJk=; b=X6sIsUaWqYkFDjpYi+iUvjUCKSwEXEw45qmp6Czu
	cw7nHfSwH0q0eiHWw6uj6hFrqDJpb9XxxxxBdvvP65aOiIbSJ4xPiz5N+hafo0p6
	FyZH/ZuCKoKY3fQgY48Gh8XDsMKdTH9UoBfhdxoWf3xaCquNICwIYWe03RJMFfpW
	bekIpvSIGcN9eAZdBSuWMFD3mNETsw05s0TUuvM8PFuXmmmlobt1LB+GUI1Z/2W8
	0MVffkuh2HbBNkb2jO3g0+x1b2VJSe7pq7ivkeeVb11Dwn/hIal5+XkZjE0jgeyX
	+3BNXrd8LefA+XstOH/PwctD2hX3rCyoYWyIhpnRX+UOOA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swkvyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:55:53 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-785c4b8a18bso65829487b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761652552; x=1762257352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJPOg0cMHWEae92x1dML9xfXza6FFLzUGQBnJguhsJk=;
        b=CMFSYQTn4jraURKW5HsXJAg35NUk78SjvqcEVKAAh4ZQJGuZbh8YfvYkn45yR7NUFV
         5pGWrVjaT6YN/j4unJYqhtCWJ1oqmJ74oQp0BsLRTGtl5HzYG0jvjJQHtev6E6ViwCuv
         MM8trabU1CznZrmxWc/r847hvBB+MtifQ6KyDsLSNv7kLuTjM4bB1qGPdg94TuQOWWAG
         DVl9yhhKI8Xpv2LbDIhdHGfy7Mk5Cp6Q29CqmZx2Ii/EMTtVzCZThQQcG+3TN3snfLta
         mejMVibOsKyI5anQVLZ08e0JG5aglaMVdheV1++xkNmC8HRcIGwuYj79YPIlKf/fQs1+
         b/4Q==
X-Gm-Message-State: AOJu0YxmwcyPhcqhnhGDPDyOufIfjA4um8IDHUkLbwX9pXhCDm0Ns3F8
	tVz0Ef1UaCfxSqZXwbgCcbSpG38yxfpEH49/UeQ3iQxriY57wGS12EQyHoV95ChMl9+U2t0yHrX
	TM345sE2kG5j7BGXwWJ5SVubH2QstRvh+q1FjWuIIrBnwAOQvrCANU1m0E1WiVl8D+vaZ+FbQXt
	WS9qeZKdwumS2BCuRHeS58dh8TO14+aCh4BWGHQ73DjJoviv98W9puPmg1EQI=
X-Gm-Gg: ASbGncuIhx3vtndzMZxNHFynp2We7cwfD0kmiNG/UCtADn50HAJcCmBJ3URRHrG0uPB
	KNdXFabs+jVmsnYqtVryOvY81oTTZLmsTfaQge5b4vGYkhxUgCcz4dH/aS6ZRH9iI9DG1QRNhGB
	DtESPia/Iz3TXzWdXk3YWxMns7yugoA/nNM+CnSvGon+NioUmUpQkjJf8R66v7DPAQ/OwzgQ==
X-Received: by 2002:a05:690e:4149:b0:63f:6bbc:ebc2 with SMTP id 956f58d0204a3-63f6bbceef4mr2619263d50.40.1761652552388;
        Tue, 28 Oct 2025 04:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNS+XhDQrlHVpNneI0qhOMeQBGg/Xh+BwF/oyJwQBUbRDV4d1DH4tb3bpyWnbFAq0J/iQO3pyLJZmMN7BK3/Q=
X-Received: by 2002:a05:690e:4149:b0:63f:6bbc:ebc2 with SMTP id
 956f58d0204a3-63f6bbceef4mr2619244d50.40.1761652551890; Tue, 28 Oct 2025
 04:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251022115730.4037373-1-dmitry.baryshkov@oss.qualcomm.com> <084fe444-a176-4bf4-b262-0b914b7770df@ti.com>
In-Reply-To: <084fe444-a176-4bf4-b262-0b914b7770df@ti.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:55:40 +0200
X-Gm-Features: AWmQ_blPSS3VKjGJS7qgCJnW-3-c3DB6JkJvGZSpJcudVs4vl5stC7pkzOTrtjE
Message-ID: <CAO9ioeVwptKogTEfAjzBumtXL7ncVjb_8D6wZNpT4ei9+XZxpA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: ekamOOvBX218ezjSoMU1TNIPYeIIBNvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwMCBTYWx0ZWRfXz16lvGWwxkc+
 EMvsE9mzLLGtLo27CEnGlXuIYF2ILw969o6lFTR6MZZJ9W1LICd/JLin5Q/DSb9Q+vOFXL/b0Ky
 53xgjDHaKdnlpEp7MurXp2gDkeLhzZU2eZMn/iUCffY5D/3EF3w53bNixIPxa6O66WcX4JXjDgK
 Q9GkazNBea9s85JWz4csmPyTvsZcYGbXL+Ec52jYl0qP93dKbew8UFZ705JGLAqtBabSusZ/IYe
 aoy89ma8VDXUVOugQdyAU9piQD9cfwihCU6NVbCPlIjxPc0n95R9MYOZE8kmFlIEaNDu5DHXHlg
 fMr0gxeYyl5/JiJiPTxR2GTP41E2ByFEg8A4aiinU4y1vPB6eaQOFekVa8mQsJDaNpxNkqXZUco
 pl+yp3s4X2qg2hMvwrGzXuMQrSkAqA==
X-Proofpoint-GUID: ekamOOvBX218ezjSoMU1TNIPYeIIBNvc
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=6900af49 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sozttTNsAAAA:8 a=ilC9QmkUte4UcMPRDZMA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121087

On Mon, 27 Oct 2025 at 20:57, Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> I'm seeing compile issues with this version bump patch on 32bit builds.
>
>
> .../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/15.2.0/include/arm_neon.h:11019:1:
> error: inlining failed in call to 'always_inline' 'uint8x16_t
> vld1q_u8(const uint8_t*)': target specific option mismatch
> 11019 | vld1q_u8 (const uint8_t * __a)
>        | ^~~~~~~~
> .../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:22:36:
> note: called from here
>     22 |         uint8x16_t vdata = vld1q_u8(pdatain);
>        |                            ~~~~~~~~^~~~~~~~~
>
>
> A bunch of these errors.

What is your target machine? I tested this with qemuarm, there are no
build errors.

>
> I've been staring at it and looking at the header and the source and
> cannot for the life of me see what the compiler is complaining about...
>
> If I revert this patch, the previous version (1.4.3.3) still builds fine.


-- 
With best wishes
Dmitry

