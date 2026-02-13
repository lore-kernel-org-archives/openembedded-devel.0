Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC15EDF14B
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:10:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68564.1770977417797606823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z1RAzMCQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770977418; x=1802513418;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MsL5VLD3v5XroD+XqJWWt9GEEmtwOsB6yozlV43Db6A=;
  b=Z1RAzMCQwbOpZFak3gFa0UssZaFNCQQGaz4tfZ+zpg3mQ6kvEsyqTiUO
   5EIisze2VYbdpEtlxnVx58zIHW8pAJ3gGM1xDOHpRVuNAGEwxFpH+/F2/
   d8j9Ply4jJMCaLl9elU0BcuRXaA3ghA5+qKg/nEZsNmDFUEgzQZ1lB71L
   1yC9zQGnS7hfIRJG6uC+wLRhZvkk8rgyIEqg2L0iz6yk+n4Dki5QdI8Xf
   mTPLiYOB+fSjr6LmWyRspWQYTIWsbPY3bNN4KOqGyQdAyM/V612EOmavU
   uddvnilphIq2sw5pvwn/0OGaAozIW1Rj1fk8+Pw7p4cgHKLotr02oRCsl
   w==;
X-CSE-ConnectionGUID: RHtYz5szSbGTpxuLajbqRg==
X-CSE-MsgGUID: A3tL0PozRaa91gTCHp4lHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="229504921"
X-IronPort-AV: E=Sophos;i="6.21,288,1763391600"; 
   d="scan'208";a="229504921"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id D36521C000A8
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:15 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 75119C01826
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2483220000EF
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:12 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 2/5] python3-toposort: Add new recipe
Date: Fri, 13 Feb 2026 18:10:02 +0800
Message-ID: <20260213101006.21517-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
References: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124383

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-toposort_1.10.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-toposort_1.10.bb

diff --git a/meta-python/recipes-devtools/python/python3-toposort_1.10.bb b/meta-python/recipes-devtools/python/python3-toposort_1.10.bb
new file mode 100644
index 0000000000..ce903dcec3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-toposort_1.10.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Implements a topological sort algorithm"
+HOMEPAGE = "https://gitlab.com/ericvsmith/toposort"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "bfbb479c53d0a696ea7402601f4e693c97b0367837c8898bc6471adfca37a6bd"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


