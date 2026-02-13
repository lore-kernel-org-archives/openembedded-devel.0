Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4175EEA87E
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:32:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62501.1770949958652617339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KDsrxdav;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770949958; x=1802485958;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=McNR/nu4WufQbCmRy0E4ifQ9qBH1JztBFpbZem7jPrY=;
  b=KDsrxdavFe46eD3JlfNCeOcEzEcva5oejBM8T2lOczmHeiCEf6DJv7FT
   lkUwyDBbs5vgtvFQAdxiYZFdfbl7htZ2cguEunESrwJKwwimPMR060vFL
   5fAFhvm19jGf7iKSbUGKM/V3248f0INpzwf+mwf7+zBZCbsDPmkcxDRpf
   +B1fUwzyAHym/iZN+afQfTPiGn2ahHS4Nmva60W+MbWirKk5PXYE9YGEh
   VhivN5SYJn5D7aKiYIfVLQWAzYrUgq8KN/PwRNUcY/F2EsBLPmwPpbFWG
   ElJVWbO4zdG5tm5R7+XhXle5oMeYLFDoYsBbyG9VlyxNWBzbcGJxo4MC5
   w==;
X-CSE-ConnectionGUID: QMCMahh3ThupJ/89n+ZWTw==
X-CSE-MsgGUID: Nn8UaJlhQyeFnkU/YoevMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="218057330"
X-IronPort-AV: E=Sophos;i="6.21,287,1763391600"; 
   d="scan'208";a="218057330"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 29BE51000149
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BF218C008B2
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:36 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 65D0620000F5
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:34 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 3/5] python3-wheezy-template: Add new recipe
Date: Fri, 13 Feb 2026 10:32:15 +0800
Message-ID: <20260213023217.19706-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
References: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124368

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


