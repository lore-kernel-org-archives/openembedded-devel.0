Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647E6FD7F80
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92751.1772187319383634114
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UKGkV6oP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187318; x=1803723318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hPhMFeDEduueD7zknid5mivImWCgbKaqRMSO2HukOZ8=;
  b=UKGkV6oPBt00F6MVLDinsVKzResvdvXf8seOag6djXUgl/w9QkY8y1Wd
   TF2/xzIgFeBqVxq8ZRiII94BiC4eQILXTTcJ9qE2xG7YDcZm7INWdW9hT
   ZgVZvHtffP8PK7hWJWfFjx+uBKkuNIiuIoRy77vXOUz7MHkEBvbcachjP
   BrbOwJBiZsu7+02ujjKOkXGk9IFlm2IeUC3L3n1sbRmNLn+Ngnq7Uk7Wk
   C0S8JDEPpyR3fIjSF1VJpfrTsXGjlpSdllOSsV31qCl+sHtB/vrJ5IFzQ
   yUJ4QE+HQnDBMzX3t+SPGTwHz1LHgSVC7DFdwwal+SCZgguGe4tusheED
   Q==;
X-CSE-ConnectionGUID: GMgTbye5QTmpLPFYX3t3Vg==
X-CSE-MsgGUID: cftadUuBSaaQGWB1/oDS2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231300013"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231300013"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id C9EB7820C16
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:17 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 81099926760
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9D453180059F;
	Fri, 27 Feb 2026 10:15:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/52] python3-wrapt: upgrade 2.0.1 -> 2.1.1
Date: Fri, 27 Feb 2026 18:13:12 +0800
Message-ID: <20260227101327.1432-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124737

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wrapt_2.0.1.bb => python3-wrapt_2.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.0.1.bb => python3-wrapt_2.1.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.0.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.1.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.1.1.bb
index e2cdc960ef..6bd9139a76 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.1.1.bb
@@ -2,11 +2,11 @@ SUMMARY = "A Python module for decorators, wrappers and monkey patching."
 HOMEPAGE = "https://wrapt.readthedocs.org/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=945f689eb1f8c581bb9d635baba5abb5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=63a78af2900bfcc5ce482f3b8d445898"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "9c9c635e78497cacb81e84f8b11b23e0aacac7a136e73b8e5b2109a1d9fc468f"
+SRC_URI[sha256sum] = "5fdcb09bf6db023d88f312bd0767594b414655d58090fc1c46b3414415f67fac"
 
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


