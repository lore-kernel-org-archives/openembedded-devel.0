Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web08.6317.1621583467042762021
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 00:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.kozemcak@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 14L7p4md010526
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 09:51:04 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.58])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 14L7p3Zx025515;
	Fri, 21 May 2021 09:51:04 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 7D8DC303F8FC;
	Fri, 21 May 2021 09:51:03 +0200 (CEST)
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-networking][PATCH] squid: upgrade 4.14 -> 4.15
Date: Fri, 21 May 2021 09:50:14 +0200
Message-Id: <20210521075014.10053-1-andrej.kozemcak@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes are found at: http://www.squid-cache.org/Versions/v4/changesets

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...0001-Fix-build-on-Fedora-Rawhide-772.patch | 25 +------------------
 .../squid/{squid_4.14.bb => squid_4.15.bb}    |  2 +-
 2 files changed, 2 insertions(+), 25 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.14.bb => squid_4.15.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch b/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
index 28a410c26..ff51f5344 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
@@ -11,10 +11,8 @@ Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634
  src/Makefile.am               | 4 ++++
  src/ip/QosConfig.cc           | 1 +
  src/ipc/mem/PageStack.cc      | 1 +
- src/proxyp/Parser.cc          | 1 +
- src/security/ServerOptions.cc | 2 ++
  src/ssl/helper.cc             | 2 ++
- 6 files changed, 11 insertions(+)
+ 4 files changed, 8 insertions(+)
 
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
@@ -70,17 +68,6 @@ Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634
  
  /// used to mark a stack slot available for storing free page offsets
  const Ipc::Mem::PageStack::Value Writable = 0;
---- a/src/security/ServerOptions.cc
-+++ b/src/security/ServerOptions.cc
-@@ -24,6 +24,8 @@
- #endif
- #endif
- 
-+#include <limits>
-+
- Security::ServerOptions &
- Security::ServerOptions::operator =(const Security::ServerOptions &old) {
-     if (this != &old) {
 --- a/src/ssl/helper.cc
 +++ b/src/ssl/helper.cc
 @@ -19,6 +19,8 @@
@@ -92,14 +79,4 @@ Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634
  Ssl::CertValidationHelper::LruCache *Ssl::CertValidationHelper::HelperCache = nullptr;
  
  #if USE_SSL_CRTD
---- a/src/acl/ConnMark.cc
-+++ b/src/acl/ConnMark.cc
-@@ -16,6 +16,8 @@
- #include "http/Stream.h"
- #include "sbuf/Stream.h"
  
-+#include <limits>
-+
- bool
- Acl::ConnMark::empty() const
- {
diff --git a/meta-networking/recipes-daemons/squid/squid_4.14.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_4.14.bb
rename to meta-networking/recipes-daemons/squid/squid_4.15.bb
index 6d154c87e..8ba10674c 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[sha256sum] = "4ad08884f065f8e1dac166aa13db6a872cde419a1717dff4c82c2c5337ee5756"
+SRC_URI[sha256sum] = "71635811e766ce8b155225a9e3c7757cfc7ff93df26b28d82e5e6fc021b9a605"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=0e03cd976052c45697ad5d96e7dff8dc \
-- 
2.20.1

