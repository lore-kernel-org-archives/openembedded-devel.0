Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBE4FD7F87
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92472.1772187338700479929
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N36MIonQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187338; x=1803723338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OWO7FlQ2ivCaqSVJobZsaDBi7cNPwx2zpdUiYUQ6fEM=;
  b=N36MIonQnfWMmPSGdFlvX///6lVHrJ8UaF1QB2cJfj1LXT5DYzOFbBA8
   zOMevid6H4IKo+oMScjOXk5yl1ZZ1TUH5IRaAKZUAe1pSXzkhb1f4mR8t
   YlPsKhWBB6z/fLTuLeVkVmLdCLC8bTxcrXUpgvETATZ7wgbCmyuR9o9+T
   2qOW9eamq0Eg/OnTkem6ogBPvCRkO5Dli8KPJl22twRuVntnX9Je3LCdR
   M7PWFPbmvkrjHu+WWs0s09dS6A7VsfR9aPd7s43PPhWkj+0XYyEVfjBKq
   ZJpy15j0ura3Z3E1t68wvSX155Q7nJg18jyMz81E+fMTEiuu5OX2ACYr5
   A==;
X-CSE-ConnectionGUID: 8IgiOeT/TU2CXFNP+rDztg==
X-CSE-MsgGUID: qztHP5DvSKW4P6hc0PaQSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740650"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740650"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 398C5820C16
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E04E68D65CC
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id F15C518005BF;
	Fri, 27 Feb 2026 10:15:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 46/52] utf8proc: upgrade 2.10.0 -> 2.11.3
Date: Fri, 27 Feb 2026 18:13:21 +0800
Message-ID: <20260227101327.1432-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124746

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../utf8proc/{utf8proc_2.10.0.bb => utf8proc_2.11.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/utf8proc/{utf8proc_2.10.0.bb => utf8proc_2.11.3.bb} (95%)

diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb b/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
similarity index 95%
rename from meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
rename to meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
index 626836bd1c..4510eb9bf3 100644
--- a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
+++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     git://github.com/JuliaStrings/utf8proc;protocol=https;branch=master;tag=v${PV} \
     file://run-ptest \
 "
-SRCREV = "a1b99daa2a3393884220264c927a48ba1251a9c6"
+SRCREV = "e5e799221b45bbb90f5fdc5c69b6b8dfbf017e78"
 
 inherit cmake ptest
 
-- 
2.43.0


