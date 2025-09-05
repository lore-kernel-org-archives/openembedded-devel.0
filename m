Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EA2CA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 08:15:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16206.1757060150623855072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 01:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BUI+sXzy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1343d20619=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856CsFn681643
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 Sep 2025 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lPFOyM1o4Xniw6zGAXDmUXDO6TTxpES7LFIAubI4TTE=; b=BUI+sXzyAsWz
	/G9ik2RvSb37yqq2lWBoWCFD+zOfGFtdz8a05Dhry/r4PUJIxFZTpbwGfupf2brj
	gsmi6KYiGUKMIXq+sMhu6c60Cg4eXdHZh8GbaTMN1vQF1cqhwqXQsWaodo0RVvHi
	eAA0Ob4vhRuPOIrCfTJp1KblesX9OkVt36/iHf3r9NXMTeNpPnXnhiVsMb5X2JYY
	r8+lLdSWvFx6NTZCgAqmV4s3Pxxcv/joek3L7CIGFwHmCIoV3MhKxvX7//NW9Xhk
	xbwBi6Bwgv1UkHQmXFB/IzZZoSXCyjDjRM83NNmkFx92u/xbjDQ1PXS2cRXMtY3v
	ECbp9RQn6g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7k2hjqw-19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 08:15:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 5 Sep 2025 01:15:41 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 5 Sep 2025 01:15:42 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH 2/2] webkitgtk3: fix do_configure error on beaglebone-yocto
Date: Fri, 5 Sep 2025 16:15:38 +0800
Message-ID: <20250905081538.3082838-2-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905081538.3082838-1-jiaying.song.cn@windriver.com>
References: <20250905081538.3082838-1-jiaying.song.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA3OSBTYWx0ZWRfX9wQp43qy5I08
 CaQGxTxdvjpS58tqmu9xdwk9pbYzKjSDdLmbhAzvlVdLA6ptuS/aWoPL4HF4GzxqKnnNn1FOV75
 uQD13C5HyeM4/4vwLAEafO/2v3xKX+NB1lmPgintO0ocrDQ0FShMTK0gfeyfT8X6kl7yINNK9XB
 4yzKESjC13tROqdm+atwhG+s+ucWzgWZ7dNjvxyK6XTS6/FWsUMqBkqAFBdMCgYXviCRk27OSIe
 YVXcUSYnoAmG/RWpIFMHCH3qW3+aK/R6WdxA6y7wmeCUQpe9Uofw3fEHk/4RlhBT0qb3btirl2L
 ZC0a6QBIXd2HQYbz/qKHhvAY4XpcmhzKwpncoCkyGGN1ATZ2SGPtNYB04W6/j4=
X-Proofpoint-ORIG-GUID: zqvKPeSL2hHO4Et1IPFyApT0Tmkn3QDM
X-Proofpoint-GUID: zqvKPeSL2hHO4Et1IPFyApT0Tmkn3QDM
X-Authority-Analysis: v=2.4 cv=E8LNpbdl c=1 sm=1 tr=0 ts=68ba9c35 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=LxHwoYbL2FXGP2J_mhgA:9 a=FkGh3qDytyf094M0uOEt:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 08:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119314

From: Jiaying Song <jiaying.song.cn@windriver.com>

* According to latest comment [1] and the mentioned pull request [2],
  build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
  supported, so original issue already fixed in current version, the
  EXTRA_OECMAKE setting is not needed anymore.

* This EXTRA_OECMAKE setting causes following configure error on
  beaglebone-yocto, remove the setting to let the configure process
  decide the configuration:
  CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
  ENABLE_JIT conflicts with ENABLE_C_LOOP.  You must disable one or the other.

[YOCTO #15254]

[1] https://github.com/WebKit/WebKit/pull/17447
[2] https://github.com/WebKit/WebKit/pull/17688

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/webkitgtk/webkitgtk3_2.44.3.bb   | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 7d70cbda78..440cae62dd 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -115,18 +115,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
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
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
-- 
2.34.1


