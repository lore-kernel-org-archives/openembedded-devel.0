Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF86CCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 03:18:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.408.1761103100694926124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 20:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KeuiOxeg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2390edad6f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M2wt9X2398381
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=yNjxmUbgQj+4+SH1+voB
	Fs+Fk9lSwmpLUo9dgcGRefo=; b=KeuiOxegIhZzYHLsRNq9jXl2tN3PI+6ILCiY
	9htBYjMWGLswLK0nOTXvynRRrOqZA1wDQ7W0ZSWGnQhG2QOuKJghL+QgHJ1IHkv5
	eNLCl8/7FDGeTCHXZsRAu93NLE/w5ropN7MrZusfafQgk7bbKbFEKGmDfQ8IkDY3
	mxUJ3eNpMENq6bei+Mnpwm3XFT/wDLejDN3nVaHxXUjTmV7dQmy+pUfGmn8WyIem
	0G9VnCR0alon0/xHjF/1Yov0BL9hPgcWA2zkhkl4Ylw7lSuhgiJXAIt8Kw1cFt0J
	ZrHyApuvi2xItr5vkN6Nmu6w3qyOmJxiZRWCmawZ3dlJ4QqWbA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpxa0br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:18:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 21 Oct 2025 20:18:17 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 21 Oct 2025 20:18:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v4] poppler: fix racing build issue
Date: Wed, 22 Oct 2025 11:18:16 +0800
Message-ID: <20251022031816.3641066-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68f84cfb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8
 a=1RYnrb_XOU5N2zFwRhgA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rxu16o8fm_VgbjKj_K4dZN5UvgvHrN7V
X-Proofpoint-ORIG-GUID: rxu16o8fm_VgbjKj_K4dZN5UvgvHrN7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDAyNCBTYWx0ZWRfX1At0C8B2YcsQ
 TIUZrrUsP0dPSnYLqkty3PCNzIZH6Vl1Xtfk86mhZC4LRV9D11JCf1uC32boQR8hH+0jFIgq1Eu
 Mn5jj8EAFZwH3ILLWrxCIAXc2NrG9mGBqnpNd7nBk9SfQSc1Cw7VhRxs0jBtCvyW9nF+mLNhOyy
 WBZ9EG9cYD2nyshJJ4jUclJFqXQHMAarevjNTDV8eRFShEb7HXdX0o09MpwpCVJpvPMCy3o5lTc
 gEBLhqtcwg2BAckIcfwR0HLPZeqvTTi6jZXkSGNVO8UpiOReAAlX20QcYjngBsEbhkvGko9WQ2U
 zCrLEgNyjihAb1umS85HEBt+sjiQjvIrhuYYVMm1SpL1A1zbcaLMaeY37lvQatMqjCdJ64aR6V4
 Zn+lrTZUN5HpmM4vyvjUqz/m6biscQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510220024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120883

There is a racing issue in world build while multilib enabled:

...log.do_install...
CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
  file INSTALL cannot find
  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/ca/pdfsig.gmo":
  No such file or directory.
Call Stack (most recent call first):
  utils/po/cmake_install.cmake:47 (include)
  utils/cmake_install.cmake:243 (include)
  cmake_install.cmake:229 (include)
...log.do_install...

The issue has reported to upstream [1][2] and upstream tried to fix it [3],
but the issue still existed. The catalan translation of pdfsig is not
vital for poppler. So revert upstream commit "pdfsig: Catalan translation"
to workaround

[1] https://gitlab.freedesktop.org/poppler/poppler/-/issues/1550
[1] https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551
[2] https://gitlab.freedesktop.org/poppler/poppler/-/commit/053acd5d2b310c696993dc97072d1f2b3b1dd7ac

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-workaround-build-racing.patch        | 43 +++++++++++++++++++
 .../poppler/poppler_25.10.0.bb                |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch
new file mode 100644
index 0000000000..fdf4f7ff70
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch
@@ -0,0 +1,43 @@
+From 83ad73024c69d41fda302f39acf50c381684890e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 21 Oct 2025 02:39:36 -0700
+Subject: [PATCH] workaround build racing
+
+There is a racing issue in world build while multilib enabled:
+
+...log.do_install...
+CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
+  file INSTALL cannot find
+  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/ca/pdfsig.gmo":
+  No such file or directory.
+Call Stack (most recent call first):
+  utils/po/cmake_install.cmake:47 (include)
+  utils/cmake_install.cmake:243 (include)
+  cmake_install.cmake:229 (include)
+...log.do_install...
+
+Revert "pdfsig: Catalan translation" to workaround
+
+This reverts commit 99f5416d9bfb6a34bbc5cbcb368e258b98fd3f08.
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ utils/po/ca/CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+ delete mode 100644 utils/po/ca/CMakeLists.txt
+
+diff --git a/utils/po/ca/CMakeLists.txt b/utils/po/ca/CMakeLists.txt
+deleted file mode 100644
+index 3225131c..00000000
+--- a/utils/po/ca/CMakeLists.txt
++++ /dev/null
+@@ -1,4 +0,0 @@
+-get_filename_component(_lang ${CMAKE_CURRENT_SOURCE_DIR} NAME)
+-gettext_process_po_files(${_lang} ALL INSTALL_DESTINATION ${CMAKE_INSTALL_LOCALEDIR} PO_FILES
+-  pdfsig.po
+-)
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-support/poppler/poppler_25.10.0.bb b/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
index 29a5f33e81..cce5e5f7ae 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
+           file://0001-workaround-build-racing.patch \
            "
 SRC_URI[sha256sum] = "6b5e9bb64dabb15787a14db1675291c7afaf9387438cc93a4fb7f6aec4ee6fe0"
 
-- 
2.34.1


