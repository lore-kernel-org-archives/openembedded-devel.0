Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3DEC601D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:34:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3P9Ytug005167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 02:34:55 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 25 Apr 2016 02:34:54 -0700
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Apr 2016 17:34:56 +0800
Message-ID: <1461576896-18147-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5-CVE-2016-3119.patch
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
X-List-Received-Date: Mon, 25 Apr 2016 09:34:56 -0000
Content-Type: text/plain

Backport <commit 08c642c09c38a9c6454ab43a9b53b2a89b9eef99> from krb5
upstream <https://github.com/krb5/krb5> to fix CVE-2016-3119

avoid remote authenticated users to cause a denial of service (NULL pointer
dereference and daemon crash) via a crafted request to modify a principal.

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 .../krb5/krb5/krb5-CVE-2016-3119.patch             | 36 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE-2016-3119.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE-2016-3119.patch b/meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE-2016-3119.patch
new file mode 100644
index 0000000..67fefed
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE-2016-3119.patch
@@ -0,0 +1,36 @@
+Subject: kerb: Fix LDAP null deref on empty arg [CVE-2016-3119]
+From: Greg Hudson
+
+In the LDAP KDB module's process_db_args(), strtok_r() may return NULL
+if there is an empty string in the db_args array.  Check for this case
+and avoid dereferencing a null pointer.
+
+CVE-2016-3119:
+
+In MIT krb5 1.6 and later, an authenticated attacker with permission
+to modify a principal entry can cause kadmind to dereference a null
+pointer by supplying an empty DB argument to the modify_principal
+command, if kadmind is configured to use the LDAP KDB module.
+
+    CVSSv2 Vector: AV:N/AC:H/Au:S/C:N/I:N/A:C/E:H/RL:OF/RC:ND
+
+ticket: 8383 (new)
+target_version: 1.14-next
+target_version: 1.13-next
+tags: pullup
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: krb5-1.13.2/src/plugins/kdb/ldap/libkdb_ldap/ldap_principal2.c
+===================================================================
+--- krb5-1.13.2.orig/src/plugins/kdb/ldap/libkdb_ldap/ldap_principal2.c	2015-05-09 07:27:02.000000000 +0800
++++ krb5-1.13.2/src/plugins/kdb/ldap/libkdb_ldap/ldap_principal2.c	2016-04-11 15:17:12.874140518 +0800
+@@ -267,6 +267,7 @@
+     if (db_args) {
+         for (i=0; db_args[i]; ++i) {
+             arg = strtok_r(db_args[i], "=", &arg_val);
++            arg = (arg != NULL) ? arg : "";
+             if (strcmp(arg, TKTPOLICY_ARG) == 0) {
+                 dptr = &xargs->tktpolicydn;
+             } else {
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 65013b5..f679b8b 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
            file://etc/init.d/krb5-admin-server \
            file://etc/default/krb5-kdc \
            file://etc/default/krb5-admin-server \
+           file://krb5-CVE-2016-3119.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "f7ebfa6c99c10b16979ebf9a98343189"
 SRC_URI[sha256sum] = "e528c30b0209c741f6f320cb83122ded92f291802b6a1a1dc1a01dcdb3ff6de1"
-- 
1.9.1


