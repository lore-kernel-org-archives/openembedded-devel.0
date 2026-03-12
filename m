Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C29D103E307
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:36 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18739.1773312752372015178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DoljTtSD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312752; x=1804848752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Def8NNJ4aiGBgbG1QQ3KO1/shz41i1YxyjJPd++VG4o=;
  b=DoljTtSD/PSchzfDPjWK8s3Nttx5bwxPkbWhUSgZBXY+VLi4dYs6wJ59
   9ngA6C3kFqBF2S/lO9etMjo1isMdCkQ9K3qtAfjvsurwDiTC6bwDL51NI
   fVkSwskwGkrwtBlrlUCM3u711FFpHm0zLjTSPHXsIy3RvnsHkE2YlLbe3
   aVorCU+9/G3Nufh7VwTvKn1J/ioAhB4gwbzCpdON8kNMD4SmzBwBSMkcK
   F3g9ZwnCGi6dfuyo4s7oDG2BjGD+KAt4ZYDtveubhoZVg6jk42w2ECjbe
   7+HOOhlHjVOHsKINpCwQuoWQ42gBalh4TQs9F54O9ewUHcmvk8tdAt9w2
   Q==;
X-CSE-ConnectionGUID: CPHseAQtQ7KBtwniifoM6g==
X-CSE-MsgGUID: NsH9tv2vTVuShMCed0sZpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="237281198"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="237281198"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:30 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9BA191002B9C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:30 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4B38914042C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5BBAE18005BE;
	Thu, 12 Mar 2026 10:52:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/64] ctags: upgrade 6.2.20260222.0 -> 6.2.20260308.0
Date: Thu, 12 Mar 2026 18:51:18 +0800
Message-ID: <20260312105220.1856-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125102

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260222.0.bb => ctags_6.2.20260308.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260222.0.bb => ctags_6.2.20260308.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260222.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260308.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260222.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260308.0.bb
index 5dafe54062..51ad8cff8e 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260222.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260308.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "b4fdb901fc4930eebcf06ef72bfd67cec606eb4c"
+SRCREV = "db5c5e00f09e62d27108025de24bcec919eac83b"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


