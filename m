Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC5F271985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JOe7012727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:24 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:26 +0800
Message-ID: <20170705081133.6496-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/10] hostapd: disable configs depends on des if openssl not support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jul 2017 08:19:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Distro feature 'openssl-no-weak-ciphers' is introduced to disable
openssl weak ciphers support which include des. Check the distro feature
to disable hostapd configs which depend on des.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
index 3b74f48..4a7275d 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
@@ -26,6 +26,22 @@ do_configure() {
 }
 
 do_compile() {
+    COMMENT="# Disable configs depend on DES"
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', 'true', 'false', d)} \
+        && ! grep -q "$COMMENT" ${B}/.config; then
+        echo >> ${B}/.config
+        echo "$COMMENT" >> ${B}/.config
+        for config in CONFIG_EAP_MSCHAPV2 CONFIG_EAP_PEAP CONFIG_EAP_IKEV2 \
+                    CONFIG_EAP_TLS CONFIG_EAP_UNAUTH_TLS CONFIG_EAP_TTLS \
+                    CONFIG_EAP_FAST CONFIG_INTERNAL_LIBTOMMATH; do
+            sed -i -e "s/^$config=.*/#&/" ${B}/.config
+            echo "$config=n" >>${B}/.config
+        done
+
+        sed -i 's/^CONFIG_TLS=.*/#&/' ${B}/.config
+        echo 'CONFIG_TLS=internal' >>${B}/.config
+    fi
+
     export CFLAGS="-MMD -O2 -Wall -g -I${STAGING_INCDIR}/libnl3"
     make
 }
-- 
2.10.1


