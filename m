Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.10718.1586940409269592104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 01:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=aqE/5CwS;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id B2A886008F;
	Wed, 15 Apr 2020 10:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586940405;
	bh=aUF9ueYh4YjDgoVmy5Q6qIj1vuFsLhAY1ObTeUJygtc=;
	h=From:To:Cc:Subject:Date:From;
	b=aqE/5CwSXm2l+HhiMffQEevqf5m1cWbB6+pShQ0Y2bEPNZGlggMhgNl1gmc79V6YL
	 mecE4WLkCCJTOPumvM59nijcsFz+OLpdEca8XJ1uvG3dqwblN1nrWJmEAEYswuYlBC
	 B2yMBycL2Oq4rOJN3Q27flRqRKhk8SrOQcZZZ1mqSRJyR0u2Ld3YIZjUtc3qAZTnC3
	 iLeQnOf2S2lHySudZmCOHHdWDOeyOrwg0eluhl4OMT2E/M58Ucfw7WU+s6jDuFRtJz
	 EE/u+3O2HOLQPmA8/yvG7R0TwRiuS8uxv7ViVh6+zavy5KVuaAXTRBvnvu+8iRQrOt
	 /Vm8hPfN9uDQg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH] mbedtls: upgrade 2.16.5 -> 2.16.6
Date: Wed, 15 Apr 2020 10:46:42 +0200
Message-Id: <1586940402-8197-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Mbed TLS 2.16.6 is a maintenance release of the Mbed TLS 2.16 branch, and
provides security fixes and bug fixes, see:

 - https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../mbedtls/{mbedtls_2.16.5.bb => mbedtls_2.16.6.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.5.bb => mbedtls_2.16.6.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.5.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.5.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
index 8dcfe91..12ad397 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.5.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
 SECTION = "libs"
 
 SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-SRC_URI[md5sum] = "339f0505323b29851ef3128a53d2de20"
-SRC_URI[sha256sum] = "65b4c6cec83e048fd1c675e9a29a394ea30ad0371d37b5742453f74084e7b04d"
+SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
+SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
 
 inherit cmake
 
-- 
2.7.4

