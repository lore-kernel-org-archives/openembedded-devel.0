Return-Path: <lchristina26@hotmail.com>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Mar 2015 18:45:30 UTC
Received: from BLU004-OMC3S37.hotmail.com (blu004-omc3s37.hotmail.com
	[65.55.116.112])
	by mail.openembedded.org (Postfix) with ESMTP id A52F160034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 18:45:30 +0000 (UTC)
Received: from BLU436-SMTP74 ([65.55.116.73]) by BLU004-OMC3S37.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Wed, 18 Mar 2015 11:40:31 -0700
X-TMN: [nO4ax3QfoCV/cKgneSMhkbSTGoYiAwZB]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP740E8A01B854DAB7A40768D6000@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2015 12:40:14 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 18 Mar 2015 18:40:29.0021 (UTC)
	FILETIME=[01BD00D0:01D061AB]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wolfssl: change name from cyassl to wolfssl, update to version 3.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Mar 2015 18:45:32 -0000
Content-Type: text/plain

CyaSSL is now called wolfSSL. Recipe updates included RPROVIDE and
PROVIDE lines, with updates to sha/md5 sums.

Signed-off-by: lchristina26 <leah@wolfssl.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.3.0.bb     | 18 ------------------
 .../recipes-connectivity/wolfssl/wolfssl_3.4.0.bb   | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 18 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
deleted file mode 100644
index b6f852d..0000000
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
-DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
-               optimized for embedded and RTOS environments. It can be \
-               Up to 20 times smaller than OpenSSL while still supporting \
-               a full TLS 1.2 client and server."
-HOMEPAGE = "http://www.yassl.com/yaSSL/Products-cyassl.html"
-BUGTRACKER = "http://github.com/cyassl/cyassl/issues"
-SECTION = "libs/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://www.yassl.com/${BP}.zip"
-
-SRC_URI[md5sum] = "0303eb0f2f9065a1207d9104ab0eba7c"
-SRC_URI[sha256sum] = "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
-
-inherit autotools
-
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
new file mode 100644
index 0000000..2366fb1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "wolfSSL Lightweight, Embedded SSL Library"
+DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written in C and \
+               optimized for embedded and RTOS environments. It can be \
+               Up to 20 times smaller than OpenSSL while still supporting \
+               a full TLS 1.2 client and server."
+HOMEPAGE = "http://www.wolfssl.com/yaSSL/Products-wolfssl.html"
+BUGTRACKER = "http://github.com/wolfssl/wolfssl/issues"
+SECTION = "libs/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PROVIDES += "cyassl"
+RPROVIDES_${PN} = "cyassl"
+
+SRC_URI = "http://www.wolfssl.com/${BP}.zip"
+
+SRC_URI[md5sum] = "ec6ed4c5847454ac928215a46b3e0c33"
+SRC_URI[sha256sum] = "bc49a142c17b1e52a126417e5d7cbadcb7f18f5c81e446c12e214483395159ea"
+
+inherit autotools
+
-- 
1.9.1


