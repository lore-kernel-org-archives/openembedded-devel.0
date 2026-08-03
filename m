Return-Path: <rouven.rastetter.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BA5C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 17:19:10 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1452.1785777541703308935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 10:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=W2tr5V7E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=267521c273=rouven.rastetter.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwW3I1322277
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Aug 2026 17:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=93Fxb
	/+0/iKdVUv3Ug8NdYTO4n47P7wbtzrkVZg5tz4=; b=W2tr5V7EEwV6onxVwPtG8
	JpyIZFdKY009Ns1EJ/6kO25d2GhudVB8mX98mGX07X3W1N2Mo9FNPpfsuRqsBWgE
	WVzIndeqOeBtY6YRlYqPEi0QXmibvEYtd28wyesqfSEYjtkztE07UZE29N2b+c0u
	6bOKX2ClaV9XM09Q/KN26YxDYeE2lRu84M6n12nkwm9cm5k/vbJLgFKAHgMjm/E6
	pTPLLcMZJUgVfTo5bz65cSBht4uG3B1Z3zimn6B5XMNq41g3nmN6BiRq2Sb9Mxcq
	wx4wmnUnMy0UVJzzUo/OTW15Zvb5oqKZX3Rf78o+cidD/2weyvqEQwRdTPE6dMLa
	g==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4fs8tjwwm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 17:18:59 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 3 Aug
 2026 19:18:58 +0200
Received: from tutn-jjhfqf4.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 19:18:58 +0200
From: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
Subject: [meta-oe][PATCH] vboxguestdrivers: Provide target kernel version
Date: Mon, 3 Aug 2026 19:18:13 +0200
Message-ID: <20260803171813.318922-1-rouven.rastetter.ext@karlstorz.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xsIzu3Tv3bsQqQLbwLGIj8-5hcYuSi4s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE1NCBTYWx0ZWRfXxRJ8qCDEjSEk
 R2astd9WK5RfWdT1NflTDn/La7EFmI9f4LlHw3hgfAWSwlzJj5T61MezXSCHizL1byyT3cgeI1W
 JUiK9a5pkiW4s5gMFp7IIAgaMBZOiQGtiiOQeeHMXgtOJN4L+cgw
X-Proofpoint-ORIG-GUID: xsIzu3Tv3bsQqQLbwLGIj8-5hcYuSi4s
X-Authority-Analysis: v=2.4 cv=CMMamxrD c=1 sm=1 tr=0 ts=6a70cd83 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22
 a=-VCclSYHLTda9MBvNMHz:22 a=UGY95wR5ipXtWyEIMhIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE1NCBTYWx0ZWRfX3CuP4AloqsIk
 nCi49oldrNMwgeFMp2l5zE9qpNeddt2EwLvQqb0bkMkqfbG7cgUHyJ95qM49Npolu4IZemOepej
 RQNWJ155mKFOsfsjY+ME2988kAvpw7h7uuZbcYSXbLIS52Wq0/RP8U2IA8wyqvv833Qo+ZUgEV0
 +dyHFKHY+htHSs57SxSBjgOk9DTKY5q3bC5r7YnAFyF8e8I2ES/sRL+ou2Kbk8VJbGymGcndB5h
 zqqPY8SHEy6ISuPEDV4V9NdcR7R0L++k/vfLRWqaiRnx2Oogox9/RAWNCifnMPOY1m0nh8KB5jS
 dl8zACqX+qc5dLT+aoSOjJRKA8JrDs+JX/qOuAYsJePu2Pp64hBe8YwLWcszsEePB6F0/T36MIV
 sy83+1YgFlMMotLj6/m5rsqizgaynyucUi00yFEcDcwYlhqr0Ryc3Sv/FnlyYTKE9Yu5eDKusBq
 yW1r0aIzsi3kGtJ3Wpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 17:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128696

The Makefile uses `uname` to determine the kernel version. We must
override this with the actual target kernel version.

The kernel version might be empty during parsing (e.g. when using
linux-dummy), therefore `or ''` is needed.
---
 .../vboxguestdrivers/vboxguestdrivers_7.2.14.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
index 18fda0393d..6a870c267c 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
@@ -14,7 +14,7 @@ DEPENDS = "virtual/kernel"
 # compiler-runtime deps needed to compile and link the userspace utility.
 DEPENDS += "virtual/compilerlibs virtual/libc"
 
-inherit module kernel-module-split
+inherit linux-kernel-base module kernel-module-split
 
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm64)"
 
@@ -32,7 +32,7 @@ S:task-patch = "${UNPACKDIR}/${BP}"
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${@(get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') or '').split('.')[0]}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"

