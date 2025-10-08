Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDABCCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 17:50:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.530.1759945843892699959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 10:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DEKf01LN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23769bf0b3=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598HEN8D1631627
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Oct 2025 10:50:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=HBUu5VABAlGHVUcEdYlQ
	dIvK19KvP/XIjOMXz67Ba18=; b=DEKf01LN6ogUmgeTfmkh7YQXZnAmi3ZET4Wa
	aHxrj4zu/XzQm9cREyuGXduwZvtf3IipHequQP7c1mc78Vgy5bf/AXD+f5797f9v
	POJOPMUXFUEPkpoQeQkwKRmDLlnz+P8sTCdvW6+j8TwopBgp7qlACegbn6Zm7mI7
	ykMirKbt2ZSJmJblHis8dQ6pzmCzVYm2btbYKcz/4qsxoNanTLj6AX1Xy3hPKD02
	4nXoD5apR6PplExMPRBSK5STbsw6xmkKhTrc0dGkGvTWy4YaZgedx/bSHqJea0/3
	pqBsUPNlOssZEuQFs063VafBSSjWn3+a3vDzU6WUKieQXLtgZw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49k33f4jxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 10:50:43 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 10:50:41 -0700
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][PATCH  1/1] open-vm-tools: upgrade 12.5.0 -> 13.0.5
Date: Wed, 8 Oct 2025 23:20:21 +0530
Message-ID: <20251008175021.2755554-1-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyNSBTYWx0ZWRfXwrqQwWacrMdx
 tqQNAE9HL/j2wyM8kaCZ8s1pCwI0dV4BxKbbZcse+hqFbD2oYvwh79hqk6Wc57h57d5aSaTkqSM
 0ncLx3h1OJn7AavSzuJ9BRaj41rDI/TPxXYk+Sd+yfo5Ckt/kDDXWkp0+3FK94S4Frh322i6N9w
 mBxtAYgASbt2hLtwmwHZW0r+zkAa0/ZKVqevT9h0xgID8keD1rkMwTVqxCsXPwV+69QzZCIbgp2
 BySqQfZexybRGW8vLSzQtkwIeFe1+E5nXzb2W4AqTtcITshhRrGBhSiWvO4P3SEgxSB6c7QiwCk
 Jwjk44ttLiHTgpjgKQYmEDYQBdeZMH7bvk/Wjj0Hzil2qtfSI4iyq3io8IYCxMUOriWOzcC8aKi
 KdFnc54Q13BnvSFNm+j55UEkMxDH6A==
X-Proofpoint-ORIG-GUID: 0kdzb3mIo-UsBp_EZ12QmCvNFRPbeVCg
X-Authority-Analysis: v=2.4 cv=XeCEDY55 c=1 sm=1 tr=0 ts=68e6a473 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=cmWlzMUdAAAA:8 a=pGLkceISAAAA:8 a=NqpkZ4OBb5eSaYoPGJAA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=93ApFmx_MQ_BoSUK457J:22
X-Proofpoint-GUID: 0kdzb3mIo-UsBp_EZ12QmCvNFRPbeVCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510080125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 17:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120374

this release addressed below CVE:
CVE-2025-41244

Drop 0001-Fix-build-when-compiling-with-std-c23.patch which have been
merged upstream.

Changelog:
https://github.com/vmware/open-vm-tools/releases

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
---
 ...ix-build-when-compiling-with-std-c23.patch | 26 -------------------
 ...ools_12.5.0.bb => open-vm-tools_13.0.5.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.5.0.bb => open-vm-tools_13.0.5.bb} (97%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch
deleted file mode 100644
index aad1b10b52..0000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2a79621f58bf1c4bc0166ccc044fcf343fb66b44 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 10:40:03 +1100
-Subject: [PATCH] Fix build when compiling with -std=c23
-
-Fixes the build when using gcc 15
-
-Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/751]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- open-vm-tools/lib/lock/ul.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/open-vm-tools/lib/lock/ul.c b/open-vm-tools/lib/lock/ul.c
-index d376a98af..fc9fdb714 100644
---- a/open-vm-tools/lib/lock/ul.c
-+++ b/open-vm-tools/lib/lock/ul.c
-@@ -29,7 +29,7 @@
- static Bool mxInPanic = FALSE;  // track when involved in a panic
- static Bool mxUserCollectLockingTree = FALSE;
- 
--Bool (*MXUserTryAcquireForceFail)() = NULL;
-+Bool (*MXUserTryAcquireForceFail)(const char *) = NULL;
- 
- static MX_Rank (*MXUserMxCheckRank)(void) = NULL;
- static void (*MXUserMxLockLister)(void) = NULL;
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
similarity index 97%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
index fa26a759dc..304d910940 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
@@ -25,7 +25,7 @@ LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
-SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.5.x \
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-13.0.x \
            file://tools.conf \
            file://vmtoolsd.service \
            file://vmtoolsd.init \
@@ -43,7 +43,6 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
-           file://0001-Fix-build-when-compiling-with-std-c23.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
@@ -51,7 +50,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "f2ca37ef3510543172657b82493d1eceefa9a134"
+SRCREV = "fbc80ffbd226b4a61bb8ea1c9a682b5c7614e3fd"
 
 S = "${UNPACKDIR}/${BP}/open-vm-tools"
 
-- 
2.48.1


