Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 599727706E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 06:25:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8E6PYDb012058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 23:25:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 23:25:33 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Sep 2016 02:25:32 -0400
Message-ID: <1473834332-210799-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openldap: fix CVE-2015-3276
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
X-List-Received-Date: Wed, 14 Sep 2016 06:25:35 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

the patch comes from:
https://bugzilla.redhat.com/show_bug.cgi?id=1238322
https://bugzilla.redhat.com/attachment.cgi?id=1055640

The nss_parse_ciphers function in libraries/libldap/tls_m.c in
OpenLDAP does not properly parse OpenSSL-style multi-keyword mode
cipher strings, which might cause a weaker than intended cipher to
be used and allow remote attackers to have unspecified impact via
unknown vectors.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../openldap/openldap/openldap-CVE-2015-3276.patch | 59 ++++++++++++++++++++++
 .../recipes-support/openldap/openldap_2.4.44.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
new file mode 100644
index 0000000..de9ca52
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
@@ -0,0 +1,59 @@
+openldap CVE-2015-3276
+
+the patch comes from:
+https://bugzilla.redhat.com/show_bug.cgi?id=1238322
+https://bugzilla.redhat.com/attachment.cgi?id=1055640
+
+The nss_parse_ciphers function in libraries/libldap/tls_m.c in
+OpenLDAP does not properly parse OpenSSL-style multi-keyword mode
+cipher strings, which might cause a weaker than intended cipher to
+be used and allow remote attackers to have unspecified impact via
+unknown vectors.
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ libraries/libldap/tls_m.c |   27 ++++++++++++++++-----------
+ 1 file changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/libraries/libldap/tls_m.c b/libraries/libldap/tls_m.c
+index 9b101f9..e6f3051 100644
+--- a/libraries/libldap/tls_m.c
++++ b/libraries/libldap/tls_m.c
+@@ -621,18 +621,23 @@ nss_parse_ciphers(const char *cipherstr, int cipher_list[ciphernum])
+ 			 */
+ 			if (mask || strength || protocol) {
+ 				for (i=0; i<ciphernum; i++) {
+-					if (((ciphers_def[i].attr & mask) ||
+-						 (ciphers_def[i].strength & strength) ||
+-						 (ciphers_def[i].version & protocol)) &&
+-						(cipher_list[i] != -1)) {
+-						/* Enable the NULL ciphers only if explicity
+-						 * requested */
+-						if (ciphers_def[i].attr & SSL_eNULL) {
+-							if (mask & SSL_eNULL)
+-								cipher_list[i] = action;
+-						} else
++					/* if more than one mask is provided
++					 * then AND logic applies (to match openssl)
++					 */
++					if ( cipher_list[i] == -1) )
++						continue;
++					if ( mask && ! (ciphers_def[i].attr & mask) )
++						continue;
++					if ( strength && ! (ciphers_def[i].strength & strength) )
++						continue;
++					if ( protocol && ! (ciphers_def[i].version & protocol) )
++						continue;
++					/* Enable the NULL ciphers only if explicity requested */
++					if (ciphers_def[i].attr & SSL_eNULL) {
++						if (mask & SSL_eNULL)
+ 							cipher_list[i] = action;
+-					}
++					} else
++						cipher_list[i] = action;
+ 				}
+ 			} else {
+ 				for (i=0; i<ciphernum; i++) {
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 48e9066..41f753e 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://initscript \
     file://slapd.service \
     file://thread_stub.patch \
+    file://openldap-CVE-2015-3276.patch \
 "
 
 SRC_URI[md5sum] = "693ac26de86231f8dcae2b4e9d768e51"
-- 
2.8.1


