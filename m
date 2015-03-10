Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABA1D73A86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 17:54:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2AHs4tf015824
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:54:04 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 10 Mar 2015 10:54:04 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Mar 2015 10:54:04 -0700
Message-ID: <1426010044-16355-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-oe][ 1/1] openldap: fix uninitialized ptr access problem
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
X-List-Received-Date: Tue, 10 Mar 2015 17:54:04 -0000
Content-Type: text/plain

To be safe, the ldap_pvt_thread_pool_getkey() function should
always set the data parameter.  If this is not done, slapd can
segfault during shutdown.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../openldap/openldap-2.4.39/thread_stub.patch     |   20 ++++++++++++++++++++
 .../recipes-support/openldap/openldap_2.4.39.bb    |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/thread_stub.patch

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/thread_stub.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/thread_stub.patch
new file mode 100644
index 0000000..540ba4a
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/thread_stub.patch
@@ -0,0 +1,20 @@
+openldap: set pointer
+
+When the function ldap_pvt_thread_pool_getkey() succeeds, it
+must set the value of *data since the caller may try to use it.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+
+--- a/libraries/libldap_r/thr_stub.c
++++ b/libraries/libldap_r/thr_stub.c
+@@ -217,6 +217,7 @@ ldap_pvt_thread_pool_unidle ( ldap_pvt_t
+ int ldap_pvt_thread_pool_getkey (
+ 	void *ctx, void *key, void **data, ldap_pvt_thread_pool_keyfree_t **kfree )
+ {
++	if (data) *data = NULL;  /* avoid problems with uninitialized *data */
+ 	return(0);
+ }
+ 
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
index e2c700f..0183d02 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
+    file://thread_stub.patch \
 "
 SRC_URI[md5sum] = "b0d5ee4b252c841dec6b332d679cf943"
 SRC_URI[sha256sum] = "8267c87347103fef56b783b24877c0feda1063d3cb85d070e503d076584bf8a7"
-- 
1.7.9.5


