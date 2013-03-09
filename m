Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UEQmu-0005oK-HT
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:54:40 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id C71A0EA040;
	Sat,  9 Mar 2013 21:54:15 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 760A6A42DCF; Sat,  9 Mar 2013 21:38:17 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2013 21:38:04 +0100
Message-Id: <ba5084a1d73111f3b2549492d55e1196e71d9fac.1362861075.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362861075.git.apelete@seketeli.net>
References: <cover.1362861075.git.apelete@seketeli.net>
In-Reply-To: <cover.1362861075.git.apelete@seketeli.net>
References: <cover.1362861075.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH v4 1/2] gnutls: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Mar 2013 20:54:45 -0000
X-List-Received-Date: Sat, 09 Mar 2013 20:54:45 -0000

Update SRC_URI since the gnutls source packages were moved into a
different directory on ftp.gnutls.org.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/gnutls/gnutls.inc       |    2 --
 recipes/gnutls/gnutls_2.10.4.bb |    7 ++++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
index a8e1e0d..146a0c8 100644
--- a/recipes/gnutls/gnutls.inc
+++ b/recipes/gnutls/gnutls.inc
@@ -8,8 +8,6 @@ LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-extra = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
-
 inherit autotools binconfig pkgconfig gettext
 
 INC_PR = "r12"
diff --git a/recipes/gnutls/gnutls_2.10.4.bb b/recipes/gnutls/gnutls_2.10.4.bb
index 9f40684..c5619b2 100644
--- a/recipes/gnutls/gnutls_2.10.4.bb
+++ b/recipes/gnutls/gnutls_2.10.4.bb
@@ -4,9 +4,10 @@ PR = "${INC_PR}.0"
 
 EXTRA_OECONF += " --without-libgcrypt-prefix "
 
-SRC_URI += "file://gettextize-with-gettext-0.18.patch \
-            file://gnutls-openssl.patch \
-            file://gnutls-replace-siginterrupt.patch \
+SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${PV}.tar.bz2;name=gnutls \
+	   file://gettextize-with-gettext-0.18.patch \
+           file://gnutls-openssl.patch \
+           file://gnutls-replace-siginterrupt.patch \
            "
 
 do_configure_prepend() {
-- 
1.7.10.4



