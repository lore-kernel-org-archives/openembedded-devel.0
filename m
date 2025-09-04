Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EACCA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 09:12:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34931.1756977170141049940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 02:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JJnusRRu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13420b660a=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5848tUON2470208
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Sep 2025 09:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ELHzbXZENYGwX1oAl7xi
	pcPPvfYxcAT6WvqesRyhEP8=; b=JJnusRRuogbU2/4/lQKl1o4A1tEdUxS/43rq
	T5krMN2Z+HAql8lD2stySTFOVQWVVC19C50R/+QaYhm/JUGu8c0QaJAIBH4wqQxJ
	sWRmW5vWsQBuFNBzEG97+AQfjztuuUI/+5/SRvu3ic/wV4ilgCWpVldbpopd0V7G
	naccHVKrOU8N4aZQzQhK5Kc5z6CJp0eNFMEeFmdELkoPxZChfTpoitGGmUfuOrns
	XoBZlGSLXEflKuqB3p7eGv6/6oasP7YatXiEWAskC5XJ1d+YojUvWl6Jcd6xOtJ8
	GNisqj0OXDf6SQh9hOyY2j4k9I2yO7hAbJ8V7Fmm4jE16Wsr+Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7p7g0d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 09:12:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 02:11:07 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 02:11:06 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] webkitgtk3: fix do_configure error on beaglebone-yocto
Date: Thu, 4 Sep 2025 17:11:06 +0800
Message-ID: <20250904091106.1164862-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDA5MCBTYWx0ZWRfX8BoLdAcUOE5Y
 BQnlItMiKF5h4dnAKWHgJphtRd21jAIufZsmQa1Olh6k8i34zk1D1qS9mcqmxrylxiJUtA9jY9p
 /NbJhG7daRZblirSgT/SQZtv5suIHrPT28jPUQcaVmHMHJf5X8Zk8AtiW0d0+p0edkQeaTzN59a
 boFo/CcSE2kfLBsS8QuALQNuPEwrtYtfuzHo7WC+R4qSbgRpgw4uMyul7WpbUpE7rAv1DfvshsW
 ZHPv4NEH8bPsvWedqrB/o+Kl/cKneDlcI0oztg149XJ5bAte0Sf6vNQXQnoaY1fuxst1OWxpsmf
 OJvCMkWiQVYxXzab/tXy7x97tQl3ha66Yh087HIq7sgLI0wqM/IeXHQzooPRhU=
X-Proofpoint-GUID: QETotZIJVwBgoZ7gT-Uza5OpGdXm0wip
X-Proofpoint-ORIG-GUID: QETotZIJVwBgoZ7gT-Uza5OpGdXm0wip
X-Authority-Analysis: v=2.4 cv=faOty1QF c=1 sm=1 tr=0 ts=68b95811 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=LxHwoYbL2FXGP2J_mhgA:9 a=FkGh3qDytyf094M0uOEt:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 09:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119274

From: Jiaying Song <jiaying.song.cn@windriver.com>

* According to latest comment [1] and the mentioned pull request
[2], build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
supported, so original issue already fixed in current version, the
EXTRA_OECMAKE setting is not needed anymore.

* This EXTRA_OECMAKE setting causes following configure error on
beaglebone-yocto, remove the setting to let the configure process decide
the configuration:
CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
  ENABLE_JIT conflicts with ENABLE_C_LOOP.  You must disable one or the
  other.

[YOCTO #15254]

[1] https://github.com/WebKit/WebKit/pull/17447
[2] https://github.com/WebKit/WebKit/pull/17688

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/webkitgtk/webkitgtk3_2.48.3.bb   | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
index 23cacc021b..aa82831b81 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
@@ -123,18 +123,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
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


