Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ADFCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 21:46:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1960.1763415987254313732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 13:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PlaSFH3G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3416e21d6e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBFWh12644462
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=mj6QyU7y9JgVzPqh1LE5ESa6cYnKjZgodEmVbm5VG0Y=; b=PlaSFH3GtBXn
	YJaJP6VisfSQxbBTQoHpmv5qCcp3+Vn0WSKPj7HJN+E1ipFiaqpF2xkvpUcZwCD7
	RZXjDGLCQFU2nc5nNBPeLbIkSTo/rroA37MztGwamAemmOAM7YCnbcALmKZ8nX2f
	0ukS6Px69Q+r0vk+mPLOtWrk3rRFeqY8AO7v2LTOM5G6RSXIX0Wi6wf3fPunOMEO
	ZwK0jA3e892TZgGVHXevKOUghsrhbSBXHaLCMUc4TslxFQ3X0e3XZxKjqSTplk+A
	SE0y1C1j+MSPWdbEDPc5jKkq8G6TLFt1DvGtHvby/Wb0+raZIICKutf3v+qCij1q
	YALJLLcfWw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aegg8aexb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:46:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Nov 2025 13:46:25 -0800
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 17 Nov 2025 13:46:24 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] nano: upgrade 8.6 -> 8.7
Date: Mon, 17 Nov 2025 16:46:24 -0500
Message-ID: <20251117214624.941380-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117214624.941380-1-Randy.MacLeod@windriver.com>
References: <20251117214624.941380-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE4NCBTYWx0ZWRfX9+uXjcB34l5O
 UffclmCsC9e8dUmJGlc6iMXOJSzZKeRS1POAfJn82U+vNmPv9n8QEO1E+RFt4sPs+MjZCI8n/7D
 /fYAZJ5wMZe0YckFfjcTR6FFz6vy1kSV5EN5JEQNfe50o1JklmopQupH9qR6vyXI7+0sUV7ZVJ/
 JE245LpY2Rt/oaoTKLCxLdGSn9nSg7SStbUw7OeuGOFAsQW5d7LGXPrwqaBwhctiaQonAjFv2kw
 mKhBIG+0m6a1C8Psghmku38QUwWNY8gAtT/5tPSJjADmLbhOQKq9cIbQKIJZoe0sb+nP0uKj10m
 FNhIQLA362lIwydVrJTugo7t8W2cQVn9GDnMe7vq3ATb89qKUWrkUfPikKO4XK3I+xBu/lvCkXn
 bp6UbkqRbUwGo6IRTBkcWl17r2y/KQ==
X-Authority-Analysis: v=2.4 cv=U+CfzOru c=1 sm=1 tr=0 ts=691b97b2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=BjMif5yZAAAA:8 a=t7CeM3EgAAAA:8
 a=PlDW632PJzLYe19DHn4A:9 a=ftVT4cx30j6SLCxtN1ED:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hhxikU8LWkRCXpxYwxDqK-xnn0HC_PLO
X-Proofpoint-GUID: hhxikU8LWkRCXpxYwxDqK-xnn0HC_PLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170184
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121786

From: Randy MacLeod <Randy.MacLeod@windriver.com>

ChangeLog:
==========
      build: avoid a warning when configured with --disable-multibuffer
      bump version numbers and add a news item for the 8.7 release
      display: regenerate the screen after a resize during a spell check
      display: regenerate the screen only before and after waiting for input
      display: upon resize, redraw the subwindows only when fully initialized
      docs: add example of copy-to-clipboard-with-OSC52 to the sample nanorc
      docs: mention that `execute` can pipe buffer or region to the command
      gnulib: update to its current upstream state
      moving: prevent a negative relative jump from going beyond top of buffer
      new feature: execute a command without capturing the output
      startup: register the handler for SIGWINCH much earlier
      text: when blanking a line due to --autoindent, keep the mark in sync
      tweaks: improve a few comments, drop one, and unwrap some lines
      tweaks: improve the punctuation of one item in the sample nanorc
      tweaks: replace a remaining double dash with a true emdash
      tweaks: reshuffle some #ifdefs, and rename a function
      tweaks: unwrap three lines, for esthetics

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/nano/{nano_8.6.bb => nano_8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.6.bb => nano_8.7.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_8.6.bb b/meta-oe/recipes-support/nano/nano_8.7.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_8.6.bb
rename to meta-oe/recipes-support/nano/nano_8.7.bb
index e45c6df757..b6c65a6f31 100644
--- a/meta-oe/recipes-support/nano/nano_8.6.bb
+++ b/meta-oe/recipes-support/nano/nano_8.7.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619"
+SRC_URI[sha256sum] = "afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
-- 
2.34.1


