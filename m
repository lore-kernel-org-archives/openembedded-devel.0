Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C588D73612
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8212.1733185025095790183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d0JNH04K;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185026; x=1764721026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/Lu4jAz9gZ0ugn5lX8//3N0r902lW7iO3RQiwjXZbT0=;
  b=d0JNH04KCz4oEHWxGUwTR4PM3icERDRePwpMKWya+J4WZyTrUkK5GQk3
   E0BYBadXSYFIFuOGtrpft1ZjvAOC+qE7kwaLTusmT7FA365uu/8l940Un
   K/rPQi09tWygpa+TDZwL/SAmbaLqXLwnDRLI/OVN4S4GsKKjVWqPclPg6
   zO4HsZyJ3TjahWLXMLUxB8W4/tewkhlESgio0ePEP30kV7k8qL0/CQ8YS
   nfFBoJfEkWrLi/xyqQocjJ5kQCXTqR5jQbbifEM/6W9ElXE5yFjArM+GD
   IFERfIAdh1WHtUDfr6MtWHZehtYmKtZYmnOO3abkJSuoIq32BjbOSzRdS
   Q==;
X-CSE-ConnectionGUID: U2N77d9sQhSl87jfhpejyw==
X-CSE-MsgGUID: U8VnmNAoTeG5ZERCMCfIRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182351518"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182351518"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B36BDC69F
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2F36D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 73F8720071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 143FC1A0071;
	Tue,  3 Dec 2024 08:17:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/34] python3-pycares: upgrade 4.4.0 -> 4.5.0
Date: Tue,  3 Dec 2024 08:16:30 +0800
Message-Id: <1733184999-27041-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--8.287100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mra9qiaDSLgo2wZuykSn6+/FYM
	JR3dIrh2A/oe4NwFf2r0tkcxttrPvtS/P7msP4phEd0hnp51xuv/W9duQaNZ5UYfVjZroiq3zXI
	BDORx1c/QkGj4hVOCcQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vnAw
	8yp081LIGQRIwjTl3i64sVlliWKx8fE8yM4pjsDwtuKBGekqUpI/NGWt0UYPAUP0DySQkgolr6S
	9oD/95gHjwOpmkLXbvn7haew+zB1zl2y4XYU8Ei
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114167

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Test data updates to fix test failures
- Update test_idna_encoding_query_a with new errno to align to new c-ares version
- Do not define HAVE_GETSERVBYPORT_R for platforms Android, Cygwin, Darwin
- Drop distutils
- build(deps): bump actions/download-artifact from 3 to 4.1.7 in /.github/workflows
- Add 3.13 support, remove 3.8
- chore(ci): fix upload & add more platforms to cibuildwheel
- Test building release wheels on PRs
- Fix building sdist
- Fixup CI

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-pycares_4.4.0.bb => python3-pycares_4.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.4.0.bb => python3-pycares_4.5.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.5.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.5.0.bb
index 13ccaf99f0..c6a6f7d2ec 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.5.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "f47579d508f2f56eddd16ce72045782ad3b1b3b678098699e2b6a1b30733e1c2"
+SRC_URI[sha256sum] = "025b6c2ffea4e9fb8f9a097381c2fecb24aff23fbd6906e70da22ec9ba60e19d"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.34.1


