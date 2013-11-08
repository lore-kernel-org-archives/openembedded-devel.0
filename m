Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE7FE6D7E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 04:32:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA84WJLx002207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Nov 2013 20:32:19 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 20:32:19 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2013 12:32:13 +0800
Message-ID: <568c0cba0af47d5f6a0402ef4ac8316db7769326.1383884700.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383884700.git.hongxu.jia@windriver.com>
References: <cover.1383884700.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] quagga: add pam support for vtysh
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
X-List-Received-Date: Fri, 08 Nov 2013 04:32:21 -0000
Content-Type: text/plain

According to DISTRO_FEATURES to add pam support for quagga, and import
configure file from Fedora.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-protocols/quagga/files/quagga.pam | 13 +++++++++++++
 meta-networking/recipes-protocols/quagga/quagga.inc       | 13 ++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.pam

diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.pam b/meta-networking/recipes-protocols/quagga/files/quagga.pam
new file mode 100644
index 0000000..3541a97
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/quagga.pam
@@ -0,0 +1,13 @@
+#
+# The PAM configuration file for the quagga `vtysh' service
+#
+
+# This allows root to change user infomation without being
+# prompted for a password
+auth		sufficient	pam_rootok.so
+
+# The standard Unix authentication modules, used with
+# NIS (man nsswitch) as well as normal /etc/passwd and
+# /etc/shadow entries.
+auth       include      common-auth
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 2106c9b..52cd7a3 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -32,10 +32,12 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
            file://watchquagga.init \
            file://watchquagga.default \
            file://volatiles.03_quagga \
+           file://file://quagga.pam \
            file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
+PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
 inherit autotools update-rc.d useradd
 
@@ -98,6 +100,15 @@ do_install () {
     # Remove generated info dir file, it doesn't belong in the generated
     # package.
     rm -f ${D}${infodir}/dir
+
+    # For PAM
+    for feature in ${DISTRO_FEATURES}; do
+        if [ "$feature" = "pam" ]; then
+            install -D -m 644 ${WORKDIR}/quagga.pam ${D}/${sysconfdir}/pam.d/quagga
+            break
+        fi
+    done
+
 }
 
 # Split into a main package and separate per-protocol packages
-- 
1.8.1.2


