Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99DFE7C75A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 08:35:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2C8YRNA022504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 01:34:38 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 12 Mar 2019 01:34:17 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 12 Mar 2019 01:34:15 -0700
Message-ID: <20190312083415.87524-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190312083415.87524-1-mingli.yu@windriver.com>
References: <20190312083415.87524-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] krb5: Upgrade to 1.17
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
X-List-Received-Date: Tue, 12 Mar 2019 08:35:03 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

License-Update: Copyright year updated to 2019.

Remove one backported patch.

Fix below do_package issue:
ERROR: krb5-1.17-r0 do_package: QA Issue: krb5: Files/directories were installed but not shipped in any package:
  /usr/lib/krb5/plugins/preauth/spake.so

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ord-attributes-for-S4U2Self-requests.patch | 80 -------------------
 .../krb5/{krb5_1.16.2.bb => krb5_1.17.bb}     |  9 ++-
 2 files changed, 5 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Ignore-password-attributes-for-S4U2Self-requests.patch
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.16.2.bb => krb5_1.17.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Ignore-password-attributes-for-S4U2Self-requests.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Ignore-password-attributes-for-S4U2Self-requests.patch
deleted file mode 100644
index 8d1e14358..000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/0001-Ignore-password-attributes-for-S4U2Self-requests.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 6fad7d45701234c8e81300d50dd5b8037d846d11 Mon Sep 17 00:00:00 2001
-From: Isaac Boukris <iboukris@gmail.com>
-Date: Wed, 27 Feb 2019 23:59:59 -0800
-Subject: [PATCH] Ignore password attributes for S4U2Self requests
-
-For consistency with Windows KDCs, allow protocol transition to work
-even if the password has expired or needs changing.
-
-Also, when looking up an enterprise principal with an AS request,
-treat ERR_KEY_EXP as confirmation that the client is present in the
-realm.
-
-[ghudson@mit.edu: added comment in kdc_process_s4u2self_req(); edited
-commit message]
-
-ticket: 8763 (new)
-tags: pullup
-target_version: 1.17
-
-Upsteam-Status: Backport [https://github.com/krb5/krb5/commit/5e6d1796106df8ba6bc1973ee0917c170d929086]
-CVE: CVE-2018-20217
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- src/kdc/kdc_util.c           | 5 +++++
- src/lib/krb5/krb/s4u_creds.c | 2 +-
- src/tests/gssapi/t_s4u.py    | 8 ++++++++
- 3 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/src/kdc/kdc_util.c b/src/kdc/kdc_util.c
-index 754570c..034c979 100644
---- a/src/kdc/kdc_util.c
-+++ b/src/kdc/kdc_util.c
-@@ -1574,6 +1574,11 @@ kdc_process_s4u2self_req(kdc_realm_t *kdc_active_realm,
- 
-         memset(&no_server, 0, sizeof(no_server));
- 
-+        /* Ignore password expiration and needchange attributes (as Windows
-+         * does), since S4U2Self is not password authentication. */
-+        princ->pw_expiration = 0;
-+        clear(princ->attributes, KRB5_KDB_REQUIRES_PWCHANGE);
-+
-         code = validate_as_request(kdc_active_realm, request, *princ,
-                                    no_server, kdc_time, status, &e_data);
-         if (code) {
-diff --git a/src/lib/krb5/krb/s4u_creds.c b/src/lib/krb5/krb/s4u_creds.c
-index 91c02aa..2037984 100644
---- a/src/lib/krb5/krb/s4u_creds.c
-+++ b/src/lib/krb5/krb/s4u_creds.c
-@@ -117,7 +117,7 @@ s4u_identify_user(krb5_context context,
-     code = k5_get_init_creds(context, &creds, client, NULL, NULL, 0, NULL,
-                              opts, krb5_get_as_key_noop, &userid, &use_master,
-                              NULL);
--    if (code == 0 || code == KRB5_PREAUTH_FAILED) {
-+    if (!code || code == KRB5_PREAUTH_FAILED || code == KRB5KDC_ERR_KEY_EXP) {
-         *canon_user = userid.user;
-         userid.user = NULL;
-         code = 0;
-diff --git a/src/tests/gssapi/t_s4u.py b/src/tests/gssapi/t_s4u.py
-index 3da6544..ba0469e 100755
---- a/src/tests/gssapi/t_s4u.py
-+++ b/src/tests/gssapi/t_s4u.py
-@@ -20,6 +20,14 @@ pservice2 = 'p:' + service2
- # Get forwardable creds for service1 in the default cache.
- realm.kinit(service1, None, ['-f', '-k'])
- 
-+# Try S4U2Self for user with a restricted password.
-+realm.run([kadminl, 'modprinc', '+needchange', realm.user_princ])
-+realm.run(['./t_s4u', 'e:user', '-'])
-+realm.run([kadminl, 'modprinc', '-needchange',
-+          '-pwexpire', '1/1/2000', realm.user_princ])
-+realm.run(['./t_s4u', 'e:user', '-'])
-+realm.run([kadminl, 'modprinc', '-pwexpire', 'never', realm.user_princ])
-+
- # Try krb5 -> S4U2Proxy with forwardable user creds.  This should fail
- # at the S4U2Proxy step since the DB2 back end currently has no
- # support for allowing it.
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
index 1d3ef8a34..e29c52783 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=7f95bc3d8d0351aa481d56d5e9de20c3"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=aff541e7261f1926ac6a2a9a7bbab839"
 DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
@@ -30,10 +30,9 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
-           file://0001-Ignore-password-attributes-for-S4U2Self-requests.patch;striplevel=2 \
 "
-SRC_URI[md5sum] = "ffd52595e969fb700d37313606e4dc3d"
-SRC_URI[sha256sum] = "9f721e1fe593c219174740c71de514c7228a97d23eb7be7597b2ae14e487f027"
+SRC_URI[md5sum] = "3b729d89eb441150e146780c4138481b"
+SRC_URI[sha256sum] = "5a6e2284a53de5702d3dc2be3b9339c963f9b5397d3fbbc53beb249380a781f5"
 
 CVE_PRODUCT = "kerberos"
 
@@ -105,6 +104,7 @@ PACKAGES =+ "${PN}-admin-server \
              ${PN}-kpropd \
              ${PN}-otp \
              ${PN}-pkinit \
+             ${PN}-spake \
              ${PN}-user \
              libgssapi-krb5 \
              libgssrpc \
@@ -151,6 +151,7 @@ FILES_${PN}-kdc-ldap = "${libdir}/krb5/libkdb_ldap${SOLIBS} \
 FILES_${PN}-kpropd = "${sbindir}/kpropd"
 FILES_${PN}-otp = "${libdir}/krb5/plugins/preauth/otp.so"
 FILES_${PN}-pkinit = "${libdir}/krb5/plugins/preauth/pkinit.so"
+FILES_${PN}-spake = "${libdir}/krb5/plugins/preauth/spake.so"
 FILES_${PN}-user = "${bindir}/k*"
 
 FILES_libgssapi-krb5 = "${libdir}/libgssapi_krb5${SOLIBS}"
-- 
2.17.1


