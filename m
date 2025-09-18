Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565B2CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:34:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8386.1758180861114414586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lvw6J0pF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13560e645f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I5cBEw2526535;
	Thu, 18 Sep 2025 07:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qmCB+0wG6w2iP82iU/MLySGDMeICy+91myo032v7dJg=; b=lvw6J0pFbXuY
	UxS/7ulGSGr8ql657Z9zYRF50yrQlqGmb0PBeMEFToRR5V44+PVED0v6RmTj9jQs
	wDvso9erf32hyqfuyYbJweaHX/Sru076+s6YmmAECWOgKOSOi2Tor+PXMeQ+SyCK
	NO6VvRS+2sZK6wPNgCihAS+RiaPQ3xfiWdTVbKA6LZIub/ZNaXxSuYrGVrLYXRPW
	8ZkldfmIPky8Iryyy4IkSafkPbrM2fbYNlXZcZuROIDuNXFxKMxHRy3ItDLWrV04
	cApFR2njxo/YB11EV6toixzjJ4WRir2K/UvzNCa9dVdeAKAyxWW+y2RL/ozFZwS1
	dVUNJXzfbQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwsssb0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Sep 2025 07:34:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 00:34:18 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 00:34:18 -0700
From: <jiaying.song.cn@windriver.com>
To: <skandigraun@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][walnascar][PATCH 2/2 v3] webkitgtk3: fix do_configure error on beaglebone-yocto
Date: Thu, 18 Sep 2025 15:34:16 +0800
Message-ID: <20250918073416.320603-2-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918073416.320603-1-jiaying.song.cn@windriver.com>
References: <20250918073416.320603-1-jiaying.song.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AlEZNYD6mOlDmRGpQs-rOiK6kICIx175
X-Proofpoint-ORIG-GUID: AlEZNYD6mOlDmRGpQs-rOiK6kICIx175
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cbb5fb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=LxHwoYbL2FXGP2J_mhgA:9 a=FkGh3qDytyf094M0uOEt:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA2OCBTYWx0ZWRfXz63j2p7s9lOa
 0BFr07z2oQgzl+8lqo1wgxVLUaMhRzG3nhqrsQjItUgdSP0M7AJsM4kSWXddbP/nc/H9S1hKOCK
 x8+8J8gDSayS8xW9ejX55aXXYxavRFbSHQmrjkT32itj76KX++7FGT4D/plKE6mHzDFv4Ldb0L/
 68fr64TsG1szR9mYhngCeVtYvcJDUrK6RtBCYlMnde6eeiPtMgKVvV7duc4wZfQmv0Z6BH/JU2n
 k/u01oHx9RI8MTc9pxXlrK5QQp6T4dXjUVPPEgsUoDuYaWPZAnK+jUDjTmGKJReugMj5+VC+2r2
 Gyho3zU8ni6AxYB5TjIZ1tsELD0kXf6h/ttt5IJunXFBXM1Z3aIw5kR+amEoI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119537

From: Jiaying Song <jiaying.song.cn@windriver.com>

* According to latest comment [1] and the mentioned pull request [2],
  build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
  supported, so original issue already fixed in current version, the
  EXTRA_OECMAKE setting is not needed anymore.

* This EXTRA_OECMAKE setting causes following configure error on
  beaglebone-yocto, remove the setting to let the configure process
  decide the configuration:
  CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
  ENABLE_JIT conflicts with ENABLE_C_LOOP.You must disable one or the
  other.

[YOCTO #15254]

[1] https://github.com/WebKit/WebKit/pull/17447
[2] https://github.com/WebKit/WebKit/pull/17688

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/webkitgtk/webkitgtk3_2.48.1.bb   | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
index 9f44dfa924..c4347bb136 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
@@ -126,18 +126,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
 
-# And for armv7* don't enable it for softfp, because after:
-# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
-# https://bugs.webkit.org/show_bug.cgi?id=242172
-# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
-# explicitly disabled causing:
-# http://errors.yoctoproject.org/Errors/Details/734587/
-# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
-# https://github.com/WebKit/WebKit/pull/17447
-EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-
 # JIT does not work on RISCV
 EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF"
 
-- 
2.34.1


