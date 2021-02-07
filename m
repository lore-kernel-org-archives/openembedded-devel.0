Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.15059.1612661256392048047
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,158,1610380800"; 
   d="scan'208";a="104284706"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Feb 2021 09:27:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 69FC84CE6033
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Feb 2021 09:27:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 7 Feb 2021 09:27:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libnet-ldap-perl: upgrade 0.67 -> 0.68
Date: Sun, 7 Feb 2021 21:27:30 +0800
Message-ID: <1612704450-4621-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 69FC84CE6033.A135D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0.68 -- Sun Jan  3 17:58:18 CET 2021

Enhancements
* Control/NoOp.pm: new
* Control/Subentries.pm: new
* Constant.pm: add tags to allow exporting groups of constants
* Constant.pm: add Active Directory Control & Extension OIDs
* Constant.pm: add references to perl-ldap's modules

Bug Fixes
* META.json: update author & bugtracker
* Control/*.pm: typo & grammar fixes
* Control/Relax.pm: slight rephrasing
* FAQ.pod: fix spelling/grammar error
* Changes: fix typo

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libnet-ldap-perl_0.67.bb => libnet-ldap-perl_0.68.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-ldap-perl_0.67.bb => libnet-ldap-perl_0.68.bb} (88%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.67.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
similarity index 88%
rename from meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.67.bb
rename to meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index 57b5fbf89..595160744 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.67.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a949a2bab07b44cc043b965485fe493a"
-SRC_URI[sha256sum] = "19a2f7f7959fe23d16367475772c325109f8604d2949e34b96dddb2dfa031170"
+SRC_URI[md5sum] = "d091ed00302f0276069bca9df9478744"
+SRC_URI[sha256sum] = "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288f610daa8c27995b351"
 
 S = "${WORKDIR}/perl-ldap-${PV}"
 
-- 
2.25.1



