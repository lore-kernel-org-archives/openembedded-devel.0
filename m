Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B55D2504F
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:24:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29152.1768206282430182668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qlsacECm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54725d1a56=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C76OuO4114104
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NdEP9Wa1pzLfeeedWRk4
	7+HB2XVgC1U2F17IwT07Lak=; b=qlsacECmRXst/IEa+Lt5jHL1somrUnue4SR8
	Lv/OYju4QkbfFFMbsCjstJ0cK+oqmdq6gtGU2TH7kZOGuntoM8eTJrYxFQSQce97
	KjblVlFDzY1k/+9WFKxfoxn37cETuNKWuq9w8N7K6VTba3ZFCThXJiMNqAdoHFXy
	LB5drDJ2wEOK1Ry1KPeieFoBpj3KtzxLX0lxXYBjlPVeMRSF+8Ox3p2HcP/uXVrT
	9drO95/tch1tiCS/y7zpeF3sIan24bbufv7BxpnLEFt/d92llRdp9MLT3prCZ01U
	C9DyfmYOX0jRRBmFgSAmukPNaL3ncZbWRxopoEQizcxlrcalGA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbythjtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:24:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 12 Jan 2026 00:24:40 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 12 Jan 2026 00:24:39 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nodejs: Make libuv related patch conditionally
Date: Mon, 12 Jan 2026 16:24:38 +0800
Message-ID: <20260112082438.1529670-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8XjnZ4UGjAXayH13ZLJPO684xuiBwYbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NCBTYWx0ZWRfX9w/cLDh5csDh
 cyvg9PFKSmm5CuWGYdBUEbrgIsSSRIU3/L6lRPHN9hZ3jb+c7RMNR8aiI1yX1WIKKrBnUhPMgnw
 l3IUZrVE7QQx9TP6x/6Ybd37eq2qtnM9l9xZsIoKtXqVwSY45VqeODbNGm2RFfmaF6KC1KzyYIP
 yefknHEfWXg9F+pQG0TvJgoTVgEeJuAM2meZKgWChXvQ1acUvmAkB8VHOzz+TTAbWn1vI2a/cGl
 Fl5RHq0R6kn56xqnpWu12MvYgbDh0vrR9SuRa94zxzwquD4zBZZHxvl7z4Czj0lbYRwQPxVtnOW
 VEGFjjR8Qfv8FO0XGkn0iVXJkqE3TUUl9eBdMsUGAizohP0wbeqJEf/ImQsLEKSW/mse9dLpZya
 BuIOjyoroEryVK6n1r4xBFxiBO9IfPZ9AtLMD2COusw+SyQonjnFSoCRPGei9lGZP7sRHskFpPi
 gXTeRMRobkFStmb0Ytw==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=6964afc9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=-LCu6K_DAAAA:8 a=t7CeM3EgAAAA:8
 a=3k9ziyYjAcfRlEKEkpUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8XjnZ4UGjAXayH13ZLJPO684xuiBwYbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123364

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: nodejs-22.21.1-r0 do_patch: Applying patch '0001-deps-disable-io_uring-support-in-libuv.patch' on target directory '/build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/sources/node-v22.21.1'
  CmdError('quilt --quiltrc /build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-deps-disable-io_uring-support-in-libuv.patch
  can't find file to patch at input line 27

The sources which related to libuv as deps/uv/ are removed when depends on
libuv.

So make the 0001-deps-disable-io_uring-support-in-libuv.patch conditionally
to fix the gap.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
index ccaf9f7bb2..489fcbde45 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://libatomic.patch \
-           file://0001-deps-disable-io_uring-support-in-libuv.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '', 'file://0001-deps-disable-io_uring-support-in-libuv.patch', d)} \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
            file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
-- 
2.34.1


