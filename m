Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70E7CA1019
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8051.1756890208805506403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B+IdHsbA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890210; x=1788426210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GAcPZHMc81mEuLJ4YYFnAvNiFBIzRCrh5tp7h+aCsTU=;
  b=B+IdHsbASAunAfBAhau7yVBmQkypr+c41CrekbbDUo6UV6Bur6CMICgV
   OxZOFjT11imrts9v72ZDiTSoKP71b5WcGor/dW4W2CEOKnH7UMtnPOiYj
   261MBxfBAxOLqzzKOCEx7ZQHfv8AQRn6Sk+f9RiIPfwf2INtl+MJ/h4zW
   sivgJMu0yfOCH3bHmQLtqKlDj55Lsh6UMdHsWTc7hXZliU8LEn3QiFRHJ
   MqfOS4YlolERbkdDJXGdHPJU3facx0TJc1w+esAvke8Ksb2eAa4mg7REP
   j2zvADrJZq4MTpNVo0XsqhYmx4Y1hJnimD5gJaWchSsW0eYiqugAEtu7C
   A==;
X-CSE-ConnectionGUID: Mz5bFr2USbSmTwdBSFRmkw==
X-CSE-MsgGUID: knPzlOiLTW2wm0J8DozytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455884"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455884"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 00B5142A325
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ACB5B1C2C200
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 84DAD1003107
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A121E1A0073;
	Wed,  3 Sep 2025 17:03:21 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/56] ctags: upgrade 6.2.20250810.0 -> 6.2.20250831.0
Date: Wed,  3 Sep 2025 17:02:24 +0800
Message-ID: <20250903090317.2002-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119201

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250810.0.bb => ctags_6.2.20250831.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250810.0.bb => ctags_6.2.20250831.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250810.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250831.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250810.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250831.0.bb
index a2c9618aa5..98bae15975 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250810.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250831.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "475a7bc246c22cb6ef1c6659103977a9de544667"
+SRCREV = "df6a390df3d96b1a0cb30edebdf8e4fcabd17cdb"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


