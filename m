Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CF5CD4F3D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20199.1779006255407936824
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ykb43Mwu;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=P2R0dF6G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4r1683076365
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ygJIeweJ5a2
	sb6lN/PFbJj51Ycyh7rwqoKMCkexsnJY=; b=Ykb43MwuM1dnsTm363WKhsJk6Hh
	Co6KCaNDmFZRfboJjwrwJpnV8eS2Tkud3sR9kCiDilSIjWCFFbozO4FVM+s/wUTa
	vbna2KyBFw+xEq7RC1EBiMieWKyAZssA3nusDjiCFXOkTMQ6TwRK9FaoIKlX+8c8
	E1mlQwZrQ6NEdvHv65vOGUrp9VJVd04cW2ORCWc3rAx9nOmRkPwC5pgSCYXHUtO/
	2t86/SfO2OWdmKOXHF7ZcPdIpzouaaGLv7/Wq6EfwcWmWzRVosy6i3gycwowNw4p
	YnTqgUKdhWZa8hxHcq8jpdhZbdMFIMoD22RVgQPCvGBjDFl+OSPV05X71rw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy52h2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so1006567a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006253; x=1779611053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygJIeweJ5a2sb6lN/PFbJj51Ycyh7rwqoKMCkexsnJY=;
        b=P2R0dF6GmaDTFFSsH/tkLBORsZP4Gl/E7J21gWluN8qF88v02v5aE7Zgn+NgclbbU8
         QU0Bx5gSCUEN7Zt6d6XWCC70EsuXiu29UqikEiSfsBfDzp5BTL+waJyY0OMjmmbdWvtp
         hSN4CuHyPja4IStfC83rixC2Y6hCcfQtq/SaO/YWe+JQ0dD6olFEIp0aXk45+a3GFyfb
         UjtdjmenYWcxnRvKsO53zSArqBMZ+//FEp0irHlfhZmSlFn4AbafKudJZVm1Pyn9kQG7
         TIuAPCAS/DfG0siTCJwgYdi4BkR4EVaqN70Mj3FQYHh3OSuciuYk7bC+saxDan7zyAWS
         vGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006253; x=1779611053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygJIeweJ5a2sb6lN/PFbJj51Ycyh7rwqoKMCkexsnJY=;
        b=LJFIjZj+Sk/3C64m/sY4OmfUJrr15g5PKdRdo9oElHGg2pbq8Z1DITgv+Rt4BulKaR
         ckZ5Vg2k97FF5keuD79ZiJ8GAJMXDZIPmbUOvVRAFsE3wb6eS6CXv9qpzPI6KiPcVjoK
         /pSoSeVbu4sPTMnNzVFKiJSxnvqg2iGy66sulVdFMNop7kimBPuwA1WrUu1yQxuRx62U
         4Uo37GLaealrok7/Bnuzbz6XiFLlbH9hq5cdqDjuEGAQxtNQ9EccqABlKHAL6ng05QHr
         XtVywzFe5wV3VoY15nZFXUzUqLBvjAK1WxUT+Ng+UjjpxCQzcz0RXHQLrBXSMDH2jvw0
         nhAA==
X-Gm-Message-State: AOJu0Yz+MuBwIj84qZTJL3I8qTsluJrlAJRwzCbvIWnTA/nwWGNlPUSS
	FCkyTxU3mGHWsSKxh7g7XLd4O2H/i1dncvSK8Uga1YFf+A+LocW6g8rnUWBn3s8/p29Gaaw3B5q
	W8pqMHrNQTzafWbVxco+3PwKUEzwFFnxiIvl5NdUHuKWekTOIwJK6jUW/xce5N5JiGIH0Ens59G
	PoICChbDjn1j6hIvsJZrL06g==
X-Gm-Gg: Acq92OHFnrpsTc+UvqjiT6Pgi9ygBkJjWH556HxtScXjehltQpVDTtss8jCyia9orFu
	hR1oPkzaTWadcwaeYe4tB/1Aa1yqX3wjfhYiPcTUxatzPx7igjEdEfGa1BxMEGMxVqqH2vzKX0g
	srU3FQgTt4+PdUgZbOvprEOjE8j8aiGErAGkSjiFTniW7qq+Ivh8g6pi1mk67hlXM9R8YfVhwb9
	jdJbXbdlkxnS8DetR6B+WG16VEvbJzD0Q0/Y4I7qzh7kqgiA0rMXl0XuHY8yW9o6Hzb3CdLeovX
	T2ORlFvBM8Ey8IYoYfrKYzGOQnL/crguouLevGe9iLQnMB9AsQZpYjQ19OmbyD6W6cE605+qCfN
	bli0OonMMlgpXuTbyznmkJBQXDZ5WqezKeWo9kMMPA6JSE0d7tfd6
X-Received: by 2002:a17:90b:48c2:b0:366:1d5f:885 with SMTP id 98e67ed59e1d1-36951cbea4bmr11588997a91.24.1779006253279;
        Sun, 17 May 2026 01:24:13 -0700 (PDT)
X-Received: by 2002:a17:90b:48c2:b0:366:1d5f:885 with SMTP id 98e67ed59e1d1-36951cbea4bmr11588977a91.24.1779006252811;
        Sun, 17 May 2026 01:24:12 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:12 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 09/29] fastfetch: upgrade 2.61.0 -> 2.62.1
Date: Sun, 17 May 2026 13:49:37 +0530
Message-ID: <21a481f20c6710ab6423d5ad5adcc5f23866e4ed.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a097b2e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=9BJ1DIxs74pRWvVZZBoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: i4uR-eWtx7i9eVkgKgdYY1blokPhkZU_
X-Proofpoint-ORIG-GUID: i4uR-eWtx7i9eVkgKgdYY1blokPhkZU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX1gmKbP8xO7zg
 ftR7FHNkhpmlNvGn4j+hJnf/3kTzCdoL9Ji6koCsLiK2kFnrgCkcbWe5x8d1+KaRkRwUphIfFlr
 ck17nTtrQpWAwKUYC8dZx02y7dJf78KmjoBCnBFrVO1jk+NbF+OOz0gw5YeubfeBSjaY9KrUx9I
 nIuw3own2kUH22CC8v867hhbtGTW+nh92AC3FlUgzmn2UipM1SReh8D8BuHtfFOv2Y+RmbKioE8
 fGwlnnzZPUlTpRGgYh/40jbKCJU3hw2caTec4qfDJ7/LSjd+y2awz5rLshAzUQlYire7BsVTAqh
 C5Q5srebV3ItH9ggtkO4EBdiMvZ8L9GPhwXwYeYEOjiV+QzSvdSZ1M0CSzl640iVvC5hM4mfoHa
 L/YlEzPU7kFnSIqh+IyiRhb4wywpC3jj3TIAFbWi9UiKZsDd9A/x37AafZuZi0060BjcVDbBDW4
 FeooEMtkJPKZ+yUGonQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixes Host module not working on some devices
- Logos : Adds EN-OS, LimeOS, Redrose and Uzbek

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e61d33aa5306b856eecbe912b42db4685e0515cc)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../fastfetch/{fastfetch_2.61.0.bb => fastfetch_2.62.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.61.0.bb => fastfetch_2.62.1.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
index 8db0b608f1..160ac87bcb 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "e5d600600614f5496b02907a11a7bc80c369d266"
+SRCREV = "4a61cdb1c9e4044ee959751e00bac1266dc6ebf9"
 
 inherit cmake pkgconfig
 
-- 
2.53.0


