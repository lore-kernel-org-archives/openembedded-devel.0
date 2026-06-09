Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09139CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:05:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75926.1780999536771467223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ku8qDc8G;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Hzb5o4Y8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xnCt2245910
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 10:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htmgCTchr2D+DUHx+xJ2yCtc
	F4q7+39J49tVz5gmyys=; b=Ku8qDc8GX/42vGO38/OqD1l3zTPZo68XIKy+bjpT
	6Z3WroyzNG+fyGoGC1s2h8yRBNMqJsYbStsVvo3TcvDawPfErnrbqwfMOje4mCDC
	ruvjYJBup50twAdnoSteBNX7zUT2CJhOF3UCmxco5jeOxD5ACZ2Nr4nMny4aa85i
	cs0SCu2yGhncAYpqxgYU5WTwPpBgq/KFEn7MFSVb36O/de1wElEzjI2jbtLA6y8d
	LIjddZVNo64DmyGBfbGY/KxbMY74RUcsOKmLtVfaDbTLDOiKau4MC4e/AKoQYCM4
	7re4rCuOXu1UUB4Uz6kKHQRBFMFapKJKt9HXubi37BzBTw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8xv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:05:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2833238137.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999535; x=1781604335; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htmgCTchr2D+DUHx+xJ2yCtcF4q7+39J49tVz5gmyys=;
        b=Hzb5o4Y8Y3ZWkdIwhEzjfm9mC5AGlD4lWemH2rZUZ2FKFry2QChc/4Nb7FbaMsBwRk
         6NpEugXttPd43fDY+rb8b4BQ+3Qo3Onivt6J5mAw/tu+DYTRPB1CqdxBmC81x+tVrY6c
         H4VxWw1HC9vNGwTl+Wd5Y5fYE/7zGAG0f4ZACza8/Obj3L24+q64MDIScthu/6ZY4arr
         xbatEB8BIQF2B86Pfl/e3cRngSCQ6L8sqy+jeiwEcrqzUAZpf0TOUaA7StF/cF9MN8pR
         hYOAUeKc5Lk891f/7b+jZ52R621s+IUsJ51gPzoa/zFMKaxU8vDnuQ6Xv9hgbglSHmQb
         Qt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999535; x=1781604335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htmgCTchr2D+DUHx+xJ2yCtcF4q7+39J49tVz5gmyys=;
        b=Gf+syzhw95HStpvs1S/Ju7c0ZrSfzbogA3fmLbFqiCVntqKfg0i4wc81z7hKRbIs8D
         qFLq8lGvsNnKE/MqiyN4faOyBJz9U8xNAj3HOmd5LU+JVkq48UgIhwQJW4auAn9SeyK2
         3PvyTA/hVE2PcapGHQhbQkWmnkWIyG9pmZVu7nvAScOLeRkyBOFud9zXWv4tgn3RN2hM
         SlKQ0o7sMDgRECMYoVh+VNvrUSwWOUdYfS//iPBQw5KLwt4t3tbbAcZttRckNRksL18/
         ve4GIfW6IfWDk/lKKo/+HRt1f1yVLRAf6lUtgrpUtzlLQwgVQYrANYvJ+unKt4WTq8dE
         H3ig==
X-Gm-Message-State: AOJu0Ywmkdxl6klzUOkB6xBbE18hCyni3XL9zUAw10xpeW+6CWw+ONEF
	hwTyoEZVeVSXW1wrov2/ner8R5F8XLK0JNzFlrZQZUh6R/mRprQT488ypWiGBEC3Z6oiPFXUB/0
	aNmXhZsCdBYcUj0/Q54f2lt+aWhH6Aot8JD7X8jSvnGYzex9PIMuiRx9XYk8IHpiACspQFMfD4w
	9KW7Kgh/TX
X-Gm-Gg: Acq92OHb1WyKy0fQQsiQO4/jF08DRMY3d815W54h0kq8GiOV8sEhcO0ceGWCx4TXTue
	6LhzoyO91cIna3alpGhIdKp/MiuM+lD3G/LqfvTZN6jyjR4Yua1TnUS0eu9DxvFybMyRCA+wbGv
	7rxrRTx2EcVpY4FbaZJStyLxD4WzAmhT8pY1eIlmgKFTfPCAmHU+sS1H0Dn5TuWNZJOGAOa4Nd1
	znRz7G1sA7EXxO13X8bt9piuuYxuwkeexsIvf235bJc1nRYct+YCj6ae6e1InEWGblyAByF1ZVg
	8mjV+ZY2qP6gky+j9+sSX9GSpe8LTeLYSd+1QOYU4Ta5FvxJw18aIedpq0aBICQJ1nKKDUOhM77
	j495gvfqK/IteMk62EyvZ/mLI3OGOBerKi7HkssDx/hc+5qL5IM8GgRY8UzAFs9qGh1C9DpVX+e
	falMup16TjpkUkaQAg7gKqUskN1KgEsIJkhksUkrjxckdbwg==
X-Received: by 2002:a05:6102:149a:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-6ff07fd12f7mr10506530137.28.1780999534921;
        Tue, 09 Jun 2026 03:05:34 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-6ff07fd12f7mr10506508137.28.1780999534483;
        Tue, 09 Jun 2026 03:05:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9929cfsm4468115e87.75.2026.06.09.03.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:05:33 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:05:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>,
        Khem Raj <khem.raj@oss.qualcomm.com>
Subject: Re: [meta-oe][PATCH v4 1/4] android-tools: remove android-tools 5.x
 from meta-oe/recipes-devtools
Message-ID: <relbc3u3fwyfvt37xybbegkc2iezia7xelbyo4tjh6n77xt4i5@dvjvs2whwggq>
References: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
 <20260524065341.82660-2-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524065341.82660-2-emailaddress.ashish@gmail.com>
X-Proofpoint-ORIG-GUID: epVOFwbwshasxTOzdJXApwIt1-ulYHAq
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e56f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WId3VufB3h2Ij2heIogA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: epVOFwbwshasxTOzdJXApwIt1-ulYHAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NCBTYWx0ZWRfXw53x7X8Jee94
 I+AA21+iOuxlBIwkY1JGn6g8NqnCsewVdNTCxRN4OcSMsUya+Gf7sF2BDniFrhajGeH4fe01nmQ
 0YlF06/zDOoKsknw+GXeqNMvtAdtbmSJa1JNJF0Zi5UzdgHXTznzqLCWLRESHvmO5uQEd77S5y1
 kY5fFQ2k7d2jhMm8cVun1rNidMB+PK3G0VRkB21BiduY2d/z29yPobxGTVLiRk5FFC54mPIqefj
 5scTYKNRtICCwdQ5Yv3SX25jwjJsWL6qJBWsz/XwROOXByeSv8g1kfy+zIbktjwaHY+s92YbUie
 fhg9iMfRh8xI4CPcD+yPdaXYnWbabQSD8KQziezlNC3PIq4ugRUiPWKkEQbuk4mrsegc5Vxe68F
 Q4OOoewaX52KVkiUWTUOWf+IlvIDPDMnDm/qxsLZBqTfH7CWXPUcAC9jkKZOPmEitO3LGT2u8AE
 lB5/FHiKK5Jqwwt/bgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127452

On Sun, May 24, 2026 at 12:23:37PM +0530, AshishKumar Mishra wrote:
> From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> 
> We plan to upgrade android-tools from the legacy 5.1.1 version to 29.0.6.r14
> To achive this we are removing the older version from meta-oe/recipes-devtools/
> 
> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  .../10-adbd-configfs.conf                     |   4 -
>  .../android-gadget-cleanup                    |  24 --
>  .../android-gadget-setup                      |  38 --
>  .../android-gadget-start                      |   9 -
>  .../android-tools-conf-configfs_1.0.bb        |  38 --

Thanks, this broke android-tools-adb for anybody using upstream ConfigFS
approach instead of the Google's /sys/class/android_usb/ (not available
upstream). I'll send a partial revert, but please test your changes on
the upstream Linux kernels before sending them out.

>  .../android-tools-conf/android-gadget-setup   |  37 --
>  .../android-tools/android-tools-conf_1.0.bb   |  22 --
>  .../android-tools/android-tools/adb.mk        |  72 ----
>  .../android-tools/android-tools/adbd.mk       | 164 --------
>  .../android-tools/android-tools-adbd.service  |  13 -
>  ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
> 

-- 
With best wishes
Dmitry

