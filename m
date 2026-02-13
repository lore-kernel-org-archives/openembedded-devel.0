Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A21EDF151
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:10:22 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68684.1770977415886928487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JGrw2vHk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770977416; x=1802513416;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mH1zyrXnIwLuz/E4LWDgDlS4G8x7V63MZzcYtoCRdRY=;
  b=JGrw2vHkRWP9cZ8cgXAoj211ZY6Wr4bZ3X+9+uhoI8BJUbvRfiQ+Dysu
   DnqGR+6iue78CA1Z+QPKb/80WfMNClU+w0zVgozO6GoG/e8A3H+04KpBG
   oTxi09s2gP9kiPlUS71PUvL9g/Hp/5wpG+jMRBfTAao4sYJpxYLJ7OCvT
   orSYY4yot4LVeKM/UnZZWbZT3QKPU6ai9qRCAPeNV2ChrioWW4U3Tdv5w
   RU0rz412NmqnGC1kcM8SgYNB3sEXIwLXPKbdNXuZSi6t9Pb2cmVdui9ww
   V4IqMiinnxC3L+8dFDcOA4hrUdI8AuKG/yCfZ+eo16joa5VmHV3QMcaJA
   w==;
X-CSE-ConnectionGUID: EoS45lCuQs6vG+YjjyU9QQ==
X-CSE-MsgGUID: VIGHBFAiSOm1syf1RGyiOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="233656328"
X-IronPort-AV: E=Sophos;i="6.21,288,1763391600"; 
   d="scan'208";a="233656328"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 3DD4A100037E
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:14 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E6D71C00D79
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:13 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id AA6C62000218
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 1/5] python3-schema: Add new recipe
Date: Fri, 13 Feb 2026 18:10:01 +0800
Message-ID: <20260213101006.21517-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
References: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124382

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-schema_0.7.8.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-schema_0.7.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-schema_0.7.8.bb b/meta-python/recipes-devtools/python/python3-schema_0.7.8.bb
new file mode 100644
index 0000000000..b27b890374
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-schema_0.7.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A library for validating Python data structures"
+HOMEPAGE = "https://github.com/keleshev/schema"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=7e70914c99a6ec706baa9fad5e0502df"
+
+SRC_URI[sha256sum] = "e86cc08edd6fe6e2522648f4e47e3a31920a76e82cce8937535422e310862ab5"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


