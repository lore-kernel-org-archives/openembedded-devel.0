Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB5EC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.77966.1749526445651764459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iNJnnPsx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526446; x=1781062446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F/sUMkiHwBvVBLHX/Y0huqlgguUF76wXjFod8iAau3Y=;
  b=iNJnnPsxtuhUVZ25DOnjMx1O4lmECOQvNtxHn28yojdJfLBqasqMuDK4
   N8ojbDCkMeBOZ97uPLvoiRLu2wNXDCDz1Qf/9lfD4ty9A/9q1iEiOLBsw
   t0mZB9ZYZ+sRQnbl0C2Fahi2cGRxN2bLXN24qhobi/T7J7zFGcyw281ZJ
   qVLK2LApcrOFBq5Oq4hj5iK1tans0EBmBywBofLJs+yMzxIqp6UhHg0tv
   7w7oMe737tXlOC6jChYJIVsZhyyIH/bgTEv22nhOfN0jEVgU90K3yyC7U
   wRziBiNJleIqHMfP98sCnMYGfuPeT8+Y1belacq8q9lv8hr4ffhS4mCM9
   Q==;
X-CSE-ConnectionGUID: 82yLhckQSGqtA3OY7uYKYA==
X-CSE-MsgGUID: 9jfXSmkgSC6HL4K/f9StNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202190337"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202190337"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:34:03 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1474ED8033
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7127BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 351911A0071;
	Tue, 10 Jun 2025 11:33:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/64] python3-tomlkit: upgrade 0.13.2 -> 0.13.3
Date: Tue, 10 Jun 2025 11:33:19 +0800
Message-ID: <20250610033330.924-53-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117857

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix: register encoder's doc incorrectly mentions TypeError
- [pre-commit.ci] pre-commit autoupdate
- chore(deps-dev): bump virtualenv from 20.26.1 to 20.26.6
- chore(deps): bump jinja2 from 3.1.4 to 3.1.5 in /docs
- [pre-commit.ci] pre-commit autoupdate
- chore(deps-dev): bump jinja2 from 3.1.4 to 3.1.5
- [pre-commit.ci] pre-commit autoupdate
- feat: add .item() method to retrieve the item object
- Fix: Inconsistent newlines on Windows
- Replace pytest's legacy tmpdir fixture with tmp_path
- Update README.md
- Prevent repeated whitespace items in arrays
- Aot setitem not implemented fix
- [pre-commit.ci] pre-commit autoupdate
- Fix removal of items from Arrays
- Fix: reject single keys that aren't strings
- [pre-commit.ci] pre-commit autoupdate
- fix: Invalid serialization when overwriting out-of-order table key
- fix: Dumping a subelement of a parsed toml fails starting on 4rd level of nesting
- chore(deps-dev): bump jinja2 from 3.1.5 to 3.1.6
- fix: ensure unique table indices when adding items to out-of-order tables
- fix: add newline indentation after existing items in Container class
- fix: Missing newline at end of file with multiple array of tables can corrupt during dumping
- chore: update version to 0.13.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.13.2.bb => python3-tomlkit_0.13.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.13.2.bb => python3-tomlkit_0.13.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.13.3.bb
index 8eeb9d7603..934c624670 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79"
+SRC_URI[sha256sum] = "430cf247ee57df2b94ee3fbe588e71d362a941ebb545dec29b53961d61add2a1"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.43.0


