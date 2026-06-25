Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D835CDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7242.1782378153418426027
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rsd6UJNM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378155; x=1813914155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yEA9kE3JkcPM3uCa+6zpYLPhHuml3zpsnnngjo7J2Lk=;
  b=rsd6UJNM/AZgakgDB+30UCWDin9Obk13eAeTKv5lxR1U6HfTQOavM02s
   s5t3IlQ+qXcoLHtKLzvCTDEiPalhT4OAckka9tKaBE7W7yMGxLZ5IIBNm
   XtgpTBfrwnwYtWY4ju9QyOPRRT6WFVhil6cvDIcVX15LSk77ZmmB/E2J+
   HL0SSurBxFauv+NV7oJ2nEMoU4LUyneFwIgAiMMyBjDRxR3uRBzfvtflH
   GCeHOuPJepEZph/fbRendEyv5StvGOmXIBZVSX9WVI0BbZZWCO5hFERij
   uUlmdZf7sDY9MWmi1+aKIsAvZGqZ3ziLy5KZkIdwBeI1e3niqr4jVpj1A
   A==;
X-CSE-ConnectionGUID: erHXdjIoREmBOLB0OiEr9A==
X-CSE-MsgGUID: umLKPXjBRfaVZv8IyFN3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="231468260"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="231468260"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CDDB41C00183
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:31 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 810221800BC3
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 941341017325;
	Thu, 25 Jun 2026 09:02:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/47] python3-sqlalchemy: upgrade 2.0.50 -> 2.0.51
Date: Thu, 25 Jun 2026 17:01:18 +0800
Message-ID: <20260625090127.1563-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127770

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.50.bb => python3-sqlalchemy_2.0.51.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.50.bb => python3-sqlalchemy_2.0.51.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.51.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.51.bb
index aa14e1570b..42ed5e341c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.51.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "af5607d11ef90fd6a5c0549fe0045dce1663d427426bcfb506dcb5346a85a3b9"
+SRC_URI[sha256sum] = "804dccd8a4a6242c4e30ad961e540e18a588f6527202f2d6791b01845d59fdc9"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


