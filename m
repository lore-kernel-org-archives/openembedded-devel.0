Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC0A260746
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 16:48:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9RGmiqj004228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 09:48:44 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 27 Oct 2016 09:48:43 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Oct 2016 09:48:43 -0700
Message-ID: <1477586923-32487-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-openembedded][PATCH 1/1] apache2: cve-2016-5387
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
X-List-Received-Date: Thu, 27 Oct 2016 16:48:48 -0000
Content-Type: text/plain

Handle HTTP_PROXY envirnoment variable.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../apache2/apache2/cve-2016-5387.patch            |   25 ++++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.23.bb        |    1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch b/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
new file mode 100644
index 0000000..dbcdfc6
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
@@ -0,0 +1,25 @@
+This patch has been copied from https://www.apache.org/security/asf-httpoxy-response.txt
+as a mitigation of CVE-2016-5387.
+
+Upstream-Status: Backport - fixed in 2.4.24
+
+Signed-off-by: Joe Slater<jslater@windriver.com>
+
+
+--- a/server/util_script.c	(revision 1752426)
++++ b/server/util_script.c	(working copy)
+@@ -186,6 +186,14 @@ AP_DECLARE(void) ap_add_common_vars(request_rec *r
+         else if (!strcasecmp(hdrs[i].key, "Content-length")) {
+             apr_table_addn(e, "CONTENT_LENGTH", hdrs[i].val);
+         }
++        /* HTTP_PROXY collides with a popular envvar used to configure
++         * proxies, don't let clients set/override it.  But, if you must...
++         */
++#ifndef SECURITY_HOLE_PASS_PROXY
++        else if (!strcasecmp(hdrs[i].key, "Proxy")) {
++            ;
++        }
++#endif
+         /*
+          * You really don't want to disable this check, since it leaves you
+          * wide open to CGIs stealing passwords and people viewing them
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index be24998..7656595 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
            file://configure-allow-to-disable-selinux-support.patch \
+           file://cve-2016-5387.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
-- 
1.7.9.5


