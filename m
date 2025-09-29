Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5EFCAC5BB
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 02:45:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.45319.1759113906598293500
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 19:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CfpCFEEE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SLhjfn028318
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P0NLtA4uCUVP+rliukbVzhUbLRUBAbs93Am
	l1HLZO94=; b=CfpCFEEEkpklgekefjHpue2cFzr8IW9FzAcyUPYGT7CpSkvNQkh
	gJHmpIs3dFhj6uerX/fe0hXJAYLXUavI4WUHaO7RE0XSGN7QjfPu/P90+ovMMCYZ
	bg+ebDst17EhRGwx1Dps1J5UtSASChD/NGz27HI4xl3G8YSQWhwgY7shL+ruFVQI
	+qEkg2u0G7ykl5IRmr8GDbOo7fXxDt8wPu92p6+qf7yN4bT8FV/WaMkxGERRIBfM
	LfH4q6qMwcBrIKxzvAN4TXZHmd+jeNggs4lb3fhSRaKPp5NlowCyQWge9cVeoVwO
	J8mRiPkMU6WFxYEcu8zI6Q6TEeIOoslTZIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5kqce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:45:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de23c3b40aso64680221cf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 19:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759113904; x=1759718704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0NLtA4uCUVP+rliukbVzhUbLRUBAbs93Aml1HLZO94=;
        b=N6JzlCLYw4H4VcmKZmFybxuEozcPJsqZDRRLzhoPwqcuNwpqUuSdp17KRQ8pQ/VM5a
         6uRbXezLQQVEbauRhZ+tmgsJ33M3GMnhIVDJSLfZnLktMM2dTpURUPLV9rQQfQRM0AQZ
         236nCmzIDeiDeyD1ixTsMqmZBGOA9KE2723UGSlRnPGCrbmXRfbklld6gZhpaQ6LllML
         WzHmOwUXk84gD2kBzXJkUVbj4ylzGN8YJMoHqUkO7rt4nLLPHk8WTbBRKIJb0YTXZ9mR
         HnK7kskcxALTB91O9R2sB7EMUa7A/Q7wDAfu05FYG36JOJ2ZQ+0SQUZWxqpqOHOo6PRN
         uBDA==
X-Gm-Message-State: AOJu0YxvpTdSqbxpaf59mM8C4LZ0Ss/bDqmloAhb2R7Po4ZSewbDWMbq
	zE7v3Edsw0SmfMvPWqLQoFhZ0z6q9lx98T8dfyVz5sdLpfP4t6jzRKbcBFFbGwAbSiiogeflWIx
	TH2d8jF9BmrhdhiKLhJSWi8DfegSg21OBSRI9LBA5RkwwaCiBP0bdXrvhQqzRbdMjM5tJjg3P+t
	Arcmwm5rXunk07jJk0StJi1g==
X-Gm-Gg: ASbGncufwlZX87JtCqI2xxcD94wwil3q95XqVuNmNtD8b6sVNK62vzFLjtuZTDN5bI0
	sRs7107aFjCx5wAqVV0GQYMUoNd9fjIusnLKMj5xrnjc3t0dKTV7VT6l6/pJz8PlTs7Pku5hWou
	gYQVpvpRhK5D94fhIgtsazZRRpS7i3sOqLe5ACzuDddUro0uQrmoHORZLdRmIuYUN2N1q3RiLWA
	ZIXkDUXMGF6lmxAMIgAVTFwW5GqmBU7+jVvg2Cz67T0o15bIKwX3NL+/zkl2qZf79frhS7+P6q2
	xCgJ5JJoL8YcaVJIoje4SFyj8IM+qR0UwQvl+zeG0AMbS6AyDKhQhisie0qx3BD1PfnjJ7cX3uK
	HnNulTbbQAEu0WZLnGTkoDHcVpybkpKYxeijsP9NJaIcaC85zwO1D
X-Received: by 2002:a05:622a:4015:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4da4b141621mr195823851cf.51.1759113904293;
        Sun, 28 Sep 2025 19:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxWAI4ZrhPz+rv5wZxVVuzfAlt0HUkFGgsM6LWxzpbXVOmisUT6ju9Nuw3/4mPAUonENMDvw==
X-Received: by 2002:a05:622a:4015:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4da4b141621mr195823621cf.51.1759113903624;
        Sun, 28 Sep 2025 19:45:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7bfaddasm25365641fa.49.2025.09.28.19.45.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 19:45:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vulkan-cts: update to 1.4.3.3
Date: Mon, 29 Sep 2025 05:44:59 +0300
Message-ID: <20250929024459.3213901-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UuODri6JfbYgTvR_UT87MYE8Jugk-3yh
X-Proofpoint-ORIG-GUID: UuODri6JfbYgTvR_UT87MYE8Jugk-3yh
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d9f2b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=how6_2uTLw6KFoVzDE0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXxITOzGsMipL8
 L3ZyCLIDA6Y3S8yyi12fbRcAkeF8nmqG9D+N/3D+OokeDJDarKXDp6G+rIth+0Pdf+23ADUVPnr
 HarpTqF1K8MTOBW+1T5ctL+IX4mizYLUCozDIY+n+piUWF015Hbv2o1q3V2EwLoF9TvdWWJRB1W
 q4LA9/uqB3Qn+md9AoCPh7gWZ5gAvL2r5SGXXwLSEdbilPAkquL9XYj3xiwRuhab7GjVsylJmIk
 h01L4XDCAg2Ts2l3qpdTQoZUD3SuIA9tU3PVrHuNvayzfiv99GwP8kP9aAUGEw0lht+rMda2LQ7
 zAtcOi/HIkpbMpW16d1aZyYWM/jTJpvQXzg0ScH7WYsjBnTbkvWaJtbCSKrHKdQ7aE6UdUm2Rwx
 KvFvkcd9h5mC1LZLOkGLVdecoT0QzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120006

Update Vulkan CTS to 1.4.3.3, fixing several issues in the tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc       | 2 +-
 .../vk-gl-cts/{vulkan-cts_1.4.3.1.bb => vulkan-cts_1.4.3.3.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.3.1.bb => vulkan-cts_1.4.3.3.bb} (92%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 8d70bf08c37e..6a8d781447eb 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.3.1":
+    if d.getVar("PV") != "1.4.3.3":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
index 3f7a2480ef2e..ca653aad132b 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "1ef11bc7acde6b53a499de73db4cf78db9572710"
+SRCREV_vk-gl-cts = "f36967dd19034bdfe30e5cb21544079078c154d1"
 
 require vulkan-cts-sources.inc
 
-- 
2.47.3


