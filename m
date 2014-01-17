Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17DE360C14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 06:40:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0H6edZl021317
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 22:40:39 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 16 Jan 2014 22:40:38 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2014 14:40:48 +0800
Message-ID: <1389940848-376-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Fri, 17 Jan 2014 06:40:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add a patch to fix the function parameter.
* Add PACKAGECONFIG for optional packages instead of explicitly
  disable, and set sqlite and curl as default.
* Add rdepends on strongswan-plugins.
* Add configure option --without-lib-prefix so it doesn't
  search for libraries in includedir and libdir to avoid QA error.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../strongswan/files/fix-funtion-parameter.patch   |   98 ++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.0.0.bb |   36 -------
 .../recipes-support/strongswan/strongswan_5.1.1.bb |   51 ++++++++++
 3 files changed, 149 insertions(+), 36 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb

diff --git a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
new file mode 100644
index 0000000..da96983
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
@@ -0,0 +1,98 @@
+fix the function parameter
+
+Upstream-Status: pending
+
+Original openssl_diffie_hellman_create has three parameters, but
+it is reassigned a function pointer which has one parameter, and
+is called with one parameter, which will lead to segment fault
+on PPC, Now we simply correct the number of parameters.
+
+    #0  0x484d4aa0 in __GI_raise (sig=6)
+         at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
+    #1  0x484d9930 in __GI_abort () at abort.c:91
+    #2  0x10002064 in segv_handler (signal=11) at charon.c:224
+    #3  <signal handler called>
+    #4  0x48d89630 in openssl_diffie_hellman_create (group=MODP_1024_BIT, g=...,
+         p=<error reading variable: Cannot access memory at address 0x0>)
+         at openssl_diffie_hellman.c:143
+    #5  0x482c54f8 in create_dh (this=0x11ac6e68, group=MODP_1024_BIT)
+         at crypto/crypto_factory.c:358
+    #6  0x48375884 in create_dh (this=<optimized out>, group=<optimized out>)
+         at sa/keymat.c:132
+    #7  0x483843b8 in process_payloads (this=0x51400a78, message=<optimized
+    out>)
+         at sa/tasks/ike_init.c:200
+    #8  0x483844d0 in process_r (this=0x51400a78, message=0x51500778)
+         at sa/tasks/ike_init.c:319
+    #9  0x48374c9c in process_request (message=0x51500778, this=0x51400d20)
+         at sa/task_manager.c:870
+    #10 process_message (this=0x51400d20, msg=0x51500778) at
+    sa/task_manager.c:925
+    #11 0x4836c378 in process_message (this=0x514005f0, message=0x51500778)
+         at sa/ike_sa.c:1317
+    #12 0x48362270 in execute (this=0x515008d0)
+         at processing/jobs/process_message_job.c:74 
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c | 8 +++++++-
+ src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h | 4 +++-
+ src/libstrongswan/plugins/openssl/openssl_plugin.c         | 1 +
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
+index ff33824..bd21446 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
++++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
+@@ -142,7 +142,7 @@ METHOD(diffie_hellman_t, destroy, void,
+ /*
+  * Described in header.
+  */
+-openssl_diffie_hellman_t *openssl_diffie_hellman_create(
++openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
+ 							diffie_hellman_group_t group, chunk_t g, chunk_t p)
+ {
+ 	private_openssl_diffie_hellman_t *this;
+@@ -197,5 +197,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
+ 
+ 	return &this->public;
+ }
++openssl_diffie_hellman_t *openssl_diffie_hellman_create( diffie_hellman_group_t group)
++{
++	chunk_t g;
++	chunk_t p;
++	openssl_diffie_hellman_create_custom(group, g, p);
++}
+ 
+ #endif /* OPENSSL_NO_DH */
+diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
+index 53dc59c..eb69eaa 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
++++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
+@@ -44,8 +44,10 @@ struct openssl_diffie_hellman_t {
+  * @param p				custom prime, if MODP_CUSTOM
+  * @return				openssl_diffie_hellman_t object, NULL if not supported
+  */
+-openssl_diffie_hellman_t *openssl_diffie_hellman_create(
++openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
+ 							diffie_hellman_group_t group, chunk_t g, chunk_t p);
++openssl_diffie_hellman_t *openssl_diffie_hellman_create(
++							diffie_hellman_group_t group);
+ 
+ #endif /** OPENSSL_DIFFIE_HELLMAN_H_ @}*/
+ 
+diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
+index ff25086..c76873d 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
++++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
+@@ -388,6 +388,7 @@ METHOD(plugin_t, get_features, int,
+ 			PLUGIN_PROVIDE(DH, MODP_1024_BIT),
+ 			PLUGIN_PROVIDE(DH, MODP_1024_160),
+ 			PLUGIN_PROVIDE(DH, MODP_768_BIT),
++		PLUGIN_REGISTER(DH, openssl_diffie_hellman_create_custom),
+ 			PLUGIN_PROVIDE(DH, MODP_CUSTOM),
+ #endif
+ #ifndef OPENSSL_NO_RSA
+-- 
+1.8.3
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
deleted file mode 100644
index eb49494..0000000
--- a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
-Linux operating system."
-HOMEPAGE = "http://www.strongswan.org"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gmp openssl flex-native flex bison-native"
-PR = "r5"
-
-SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c8b861305def7c0abae04f7bbefec212"
-SRC_URI[sha256sum] = "efc13c86e715b5e596d9d8535640c830f83e977fe521afd2c70d68926c4b573e"
-
-EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
-        --enable-gmp --disable-mysql --disable-sqlite \
-        --enable-openssl"
-
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-
-inherit autotools systemd
-
-RRECOMMENDS_${PN} = "kernel-module-ipsec"
-
-PACKAGES += "${PN}-plugins"
-FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
-FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
-FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
-FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libexecdir}/ipsec/.debug"
-FILES_${PN}-plugins += "${libdir}/ipsec/plugins/*"
-
-INSANE_SKIP_${PN}-plugins = "staticdev"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
new file mode 100644
index 0000000..47047cd
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
+Linux operating system."
+SUMMARY = "strongSwan is an OpenSource IPsec implementation"
+HOMEPAGE = "http://www.strongswan.org"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "gmp openssl flex-native flex bison-native"
+
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+        file://fix-funtion-parameter.patch \
+"
+
+SRC_URI[md5sum] = "e3af3d493d22286be3cd794533a8966a"
+SRC_URI[sha256sum] = "fbf2a668221fc4a36a34bdeac2dfeda25b96f572d551df022585177953622406"
+
+EXTRA_OECONF = "--enable-gmp \
+        --enable-openssl \
+        --without-lib-prefix \
+"
+
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+
+PACKAGECONFIG ??= "sqlite3 curl \
+        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
+PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
+
+inherit autotools systemd
+
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+RDEPENDS_${PN} = "${PN}-plugins"
+
+PACKAGES += "${PN}-plugins"
+
+FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
+FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
+FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-plugins += "${libdir}/ipsec/plugins/*"
+
+INSANE_SKIP_${PN}-plugins = "staticdev"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
-- 
1.7.9.5


