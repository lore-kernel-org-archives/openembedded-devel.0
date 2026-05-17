Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2511CD4F4D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20203.1779006270927262319
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fkEG6skZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fjQA8DoH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H6jtI14083010
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rt1n7V4tjCZ
	Nm508veQ3K6zsxw9aJ+5tPS5h6PwU1o4=; b=fkEG6skZ4PGPBZ1giTCyJpx8Dub
	c7brEo16fDMJ8aY9ZYv2LLm/q4TOJNFeG2FyAyDyT9qXkOt7Xd2KEbDjNPQMaPuo
	VTBhnnrxAuyAoB8xu5GE7wKVPJeEUABDC7KfiRmAzm6PDly9UZW/RKDtpcIotrlM
	SYt6MxkHLbiFeEUpQEIh4y6Iqjv9NJq8NdBGyYfmCoGIrcSF7sh2AEljBooUv1TQ
	cJbEikvQGFNTPgfLAoK1U6QaxF8TKBrrT02b3lsUMkTiTDpJlEVdJFnT+fB9gdfy
	Gn0BotxmVUSnC+kf2jDVFikqeZsXAc/3B9wW7tJd0psFjJTtUaJY4BD26qA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qafre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso2894340a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006269; x=1779611069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt1n7V4tjCZNm508veQ3K6zsxw9aJ+5tPS5h6PwU1o4=;
        b=fjQA8DoHO2Y2Qn/8RH8QvLuiAyn+F5/h/Uhww8NXcebM5/eb4sf2OCVJM5wY7PIAIW
         ThVZZZ1CSHNwnDnb0k57fXBPEhn24dOBC9QiZSbreuzjX5RIn/fGjtcWps+h9TLsoskB
         f3FbG1YP70E6NkIoobnqSp26oO3y9c2dh7CwpYvbN7Za/TUxtnuY/gymWWx7PHs0zENb
         eRIwGE+D1X6mFw7krynUOJSPfUERV6sNxDEXzq0EptNPpCAqN3BZYQ5/dwcTM5X1wJoE
         +e2iL2MeOKrHT5h14oh4kFvlpL0Lk94H7f6gxIXZIglqcUEMuMMcUV1rNotPoKNNwBPh
         jccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006269; x=1779611069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rt1n7V4tjCZNm508veQ3K6zsxw9aJ+5tPS5h6PwU1o4=;
        b=k0uZ6VFzJppqoCmI8TeuwzJUJLipxtj+rPxx3crA180KIp7j1ZoJjDAdtJpVWCXx3U
         eKyTQaEupF1hEc+m4enLJQhGx5EUeM0pVAvXGVvNu87Cs4C3ST46ElPVtvodZzDiKnA6
         iUNYBpPw4Qy9ytBOnca9z7A3u8/FVjbkYyBVKfZBOILLz+njfWnjZiQgoWJSa8m/4KNm
         /jWytSwdA+is2OodX3uaHi262cTD1YgGBbEx9Na+5VpFWu5GER3W3rmwsRMVWnScum51
         Lp6zc3zBWD7VveLGQ9jI5ZjOpXjnSnrAyqG3qWOjkGrCNbfCtNZHEgdy8f4vSmV37yZw
         kn1A==
X-Gm-Message-State: AOJu0YyZdfqSDpp7HmxlfBYOVd4gLwuElQP70hAm2OQKf91Ads8wpSeg
	JG09K9qhzkZ6HVIzYIofxPeF3r76uGh3UYQaWFEsTifEw0UymTi7Vq31RS1DIn0oZd+h5etMBmt
	TH0QtaFEoOQlb2yYAqe185Qqn52w5QCvmwiKbGCsK0C9Jf8kXybvetA7daPSANIjNFh0aTcG2Gn
	7vT3ejkil3WbyQGvEY729H4g==
X-Gm-Gg: Acq92OE5ep8iphIFW7OgMQ8i9BleiyLOtkbxaoeIgtUO89bXdX5jaOKJoE4/Qu5Zprl
	7Iwhrj9DFhQgZDnq8iFhvjoAkKCujkTNk7nPgWHeIO6WnpvGFpX1NBqjgC3hDNfPz1tH09WcCWh
	y2w/8+jN1Khj1G2/wUKKe38/qRmd0lfgbrfjVZIhqZ+lsa9D03b36m+frNKPzFtUZNktHxHsiLb
	jCYbUnpJc07hA+6GD16XAe0m0QwcY+QAvU2l8fjVzQRoRXNrSxsRaGx9xySrXk5P1uR6Un62Lf5
	MZ0UzUdpmXIC94MNuZnholqAuFFHO6gYXzJosVoxnz4LN04oBFiJTiWlOG+e4pIkVQWil2YD08w
	YWBkr5R6SAf6MsHmDtI69vE5kdPB21m3q9A5hedO+t8yyvpbd78c4
X-Received: by 2002:a17:90a:d40d:b0:366:4b0f:d3da with SMTP id 98e67ed59e1d1-36951ca4ee1mr11328941a91.26.1779006268642;
        Sun, 17 May 2026 01:24:28 -0700 (PDT)
X-Received: by 2002:a17:90a:d40d:b0:366:4b0f:d3da with SMTP id 98e67ed59e1d1-36951ca4ee1mr11328930a91.26.1779006268137;
        Sun, 17 May 2026 01:24:28 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:27 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 19/29] kmscon: upgrade 9.3.3 -> 9.3.5
Date: Sun, 17 May 2026 13:49:47 +0530
Message-ID: <eeb6d01481afe2b558c6b1ac4ba6f57b2db152c8.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VnWC4X9syxleF0iK7dmyTs0hQzFGb4cV
X-Proofpoint-GUID: VnWC4X9syxleF0iK7dmyTs0hQzFGb4cV
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a097b3d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=F9ieIVjbAAAA:20
 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=rXVMTPS5SJwEhv6gDygA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=lHLH-nfn2y1bM_0xSXwp:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX0EFJQ0HA0CHl
 qGChZJ7ow5f0uWV7uoIYgcHuqIbOJUT278RPpbn5iBSQDJutxq3b/TzL/ws+gSakcFtD+V8C+0B
 OGUo9bMvjrxeRT7QqxAzzjP6X8XM1Td9cdXQTESoEMezSnqG2FJv4lkC2arIJ1BOMekHGh1ks6E
 P2n+iCSCJ+QR/m1UaJp58qk4PFVBFWZfxLpv+A8KjXAFrf4grzwumzyUOyncuS1dTIMwYS9wv/8
 H2JN80h00xyb5/R2DZjadsBX53alOe4OH0DBJ11aP2Pc/5JAxa0LYcW6rd5HFK5qetlWoGwQf/u
 hIsJfz6fFnM51FPIYXSQO5GSgR1OvQJ/drjsb7BYjfKc59A4JRlyPiJGOw1cM7sfUlShKEsCkO0
 DWnpchKnEDhUdAbZT+YiZjv9+/3//y9tMwjjGrmExeHWcq0U73g/EeTap7wTWbOSX1qBpQCLi33
 XtLJ7WMR3/oRhSpjAZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127032

From: Adam Duskett <adam.duskett@amarulasolutions.com>

Changelog:
https://github.com/kmscon/kmscon/releases/tag/v9.3.5

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f36312669ce6c501c603e4cbfbe1cf6112d0f146)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../kmscon/{kmscon_9.3.3.bb => kmscon_9.3.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.3.bb => kmscon_9.3.5.bb} (97%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
similarity index 97%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
index 46550bb6d1..b730faf414 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
@@ -21,7 +21,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "03e50c7db0489daaa41b5f62946fd6aaeab63a6e"
+SRCREV = "a8832afb1dcca5bb4c0476d4c13c7239fecbd93a"
 
 inherit meson pkgconfig systemd
 
-- 
2.53.0


