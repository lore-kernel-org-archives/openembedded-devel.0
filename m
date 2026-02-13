Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A58EDF14D
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:10:22 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68685.1770977418638003662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aUcr7jIp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770977419; x=1802513419;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=McNR/nu4WufQbCmRy0E4ifQ9qBH1JztBFpbZem7jPrY=;
  b=aUcr7jIpdMILmT5SIqziJxLWHEwOXK3PCeRVRXP/a9FyOYCBTqb+y6qW
   Uy0yaWSACgjx0LsH1UrEhShBpVwT0wXjreeFYu2zADBwD5g+Ca6CTOKGs
   g6HB2yon04xQy+p6NlmElSDknFEM/+uSOPycCqeLE7htIQ4j6TRYtL1hz
   Ae8YzEXqKWQgDTZvEh27/n8Unk4pS10ZVWNx8yGUvg66Xj6zPaqAQZ+iR
   Wwatn6T7eqa0WN0v76FaI0IBRIFJhMG4snSvfqaxpaEkcNV/biBKLvsc9
   FJfy/LiGYyPT57S09gBtQaKnTVMmYE1WLIQRci/uMBwdKSdHf/RZtAtWI
   w==;
X-CSE-ConnectionGUID: 3Wc3zq1WT8KunTNjP+TU4Q==
X-CSE-MsgGUID: eVZdA33HTl6RUwtxBWwz/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="228928292"
X-IronPort-AV: E=Sophos;i="6.21,288,1763391600"; 
   d="scan'208";a="228928292"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 2B9F61C0019C
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:17 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D58521004177
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:16 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 98C2120000F9
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:14 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 3/5] python3-wheezy-template: Add new recipe
Date: Fri, 13 Feb 2026 18:10:03 +0800
Message-ID: <20260213101006.21517-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
References: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124384

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/python3-wheezy-template_3.2.4.bb         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
new file mode 100644
index 0000000000..9386b0ca2f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "a lightweight template library"
+HOMEPAGE = "https://github.com/akornatskyy/wheezy.template"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa10554c46b94944529c6a886cf85631"
+
+PYPI_PACKAGE = "wheezy_template"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+SRC_URI[sha256sum] = "465b9ac52e1c38bc9fc30127ae90bd232ce8df07fc2ac53383cb784f238b144f"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


