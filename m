Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3FBC3E8A8
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.7138.1649903564330767705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k3ehNghP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903562; i=@fujitsu.com;
	bh=nlXCNrtXM5+eyA3gAP58OLNIXv03SnLkSIJMKvE9t5w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=k3ehNghPXK1h+yAAlfT/T0LD7PrjAYOytNVRcXL6qW7k04PmMmUg9lXY+1i8NmUv7
	 h/FMzWSyVoNYc5aCy7OaoWkVtbCeDwF3frweAidPlKhfiqjzRY7MjmYlCBEU5kw/7E
	 14naqNW5V+LlLcbH89xkLC6LZvqd8wAUNU4+qb0tPb5hxUXtwRMuSUGbL0CfnVjx6n
	 JpigTS6zSwnxU9RIvh12DcQeTiFrUC3Fwm3/AQ8efmaIK10xUqilYCxpV4ZDtEbRIV
	 35nQwkjojrlVpoxRL7RY2CrYlAlGV7y704ZkFB22jaOcxaiAhW/QVHykbXSwTm7Shr
	 is9L2NRErlaRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8MxRfdEe3i
  SwaPHkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/abfYC34IVyycf4+tgXG2UBcjF4eQwGwm
  iceL7rJDOHsYJXafXs/YxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfPewgtrCAu8TBx
  bfBalgEVCU+3JoGVsMr4CSxYeczNhBbQkBBYsrD91BxQYmTM5+wQMyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRuukosz0jJLcxMwcXUMDA11DQ1NdY1NdQwsTvcQq3US
  91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwDBLKVbesYOxbdVPvUOMkhxMSqK8WYbh
  SUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeL1agXKCRanpqRVpmTnAkIdJS3DwKInwNtUApXmLC
  xJzizPTIVKnGHU5dm65vJdZiCUvPy9VSpz3cxtQkQBIUUZpHtwIWPxdYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTMOxVkCk9mXgncpldARzABHfFtVSjIESWJCCmpBibDuEj36JXyfyrdGJa
  8nd16sZ55urh++jTmIrEXdstPzlYO/dHftGj2zA8GkiftPeUXGyjY/phRfG39yg3NuxrnVi1d
  sOKP0dlbLTH/9WMvOifv+sndoue1SGdbe/bFjcsUl/vE7yqOlZn2YcaMFE3hp2F/FpS8WVeRy
  ll34MVzm15VplsfXfcu2brOLKHJaFGvsVB0fFTxrys3FuQdL/0y9zRziul+PmYu55+av6UKzU
  VZOW1D71meX17fb1yp81+F+Q/Tw+t2e3wak/+td147VWvqVtXdkj++H9R5YHl5V15Vnr2b3/t
  74RfSP+7YliCf8X1228TSDYxpB5dxyD9dMU9h68qNC8NeL/Lxad+mxFKckWioxVxUnAgA5cmh
  4ToDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1649903560!118579!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14048 invoked from network); 14 Apr 2022 02:32:40 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:32:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23E2Wa1f020812
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:32:40 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:32:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pam-plugin-ldapdb: upgrade 1.3 -> 1.3.1
Date: Thu, 14 Apr 2022 10:32:27 +0800
Message-ID: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96634

0001-include-stdexcept-for-std-invalid_argument.patch
removed since it's included in 1.3.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-stdexcept-for-std-invalid_argument.patch | 25 -------------------
 ...apdb_1.3.bb => pam-plugin-ldapdb_1.3.1.bb} |  6 ++---
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch
 rename meta-oe/recipes-extended/pam/{pam-plugin-ldapdb_1.3.bb => pam-plugin-ldapdb_1.3.1.bb} (80%)

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch
deleted file mode 100644
index 0a93411533..0000000000
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3e97c9004f4ec58ca3696ee6298f91e6eeb76e04 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Dec 2019 14:46:25 -0800
-Subject: [PATCH] include <stdexcept> for std::invalid_argument
-
-Upstream-Status: Submitted [https://github.com/rmbreak/pam_ldapdb/pull/11]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pam_ldapdb.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pam_ldapdb.cpp b/pam_ldapdb.cpp
-index 9baf1e6..be5d85c 100644
---- a/pam_ldapdb.cpp
-+++ b/pam_ldapdb.cpp
-@@ -1,5 +1,6 @@
- #include <map>
- #include <string>
-+#include <stdexcept>
- #include <utility>
- #include <syslog.h>
- #include <pwd.h>
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
similarity index 80%
rename from meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
rename to meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
index 6985590068..d5137f80af 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
@@ -10,10 +10,8 @@ DEPENDS = "libpam openldap"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "84d7b260f1ae6857ae36e014c9a5968e8aa1cbe8"
-SRC_URI = "git://github.com/rmbreak/pam_ldapdb;branch=master;protocol=https \
-           file://0001-include-stdexcept-for-std-invalid_argument.patch \
-"
+SRCREV = "3e026863cad1fd45c760ee1bc93ef4f0606cc852"
+SRC_URI = "git://github.com/rmbreak/pam_ldapdb;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


