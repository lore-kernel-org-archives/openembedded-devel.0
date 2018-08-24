Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD9B746D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 03:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O3eEul024049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 20:40:14 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 23 Aug 2018 20:40:13 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 11:40:11 +0800
Message-ID: <1535082011-30825-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-webserver][PATCH] apache2: set files layout to debian style
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
X-List-Received-Date: Fri, 24 Aug 2018 03:40:13 -0000
Content-Type: text/plain

The default layout installs log files to /var/apache2/logs. But we
assume the log directory is /var/log/apache2 in volatile.conf. Specify
the layout to debian style to set the correct the log directory.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
index 6642f2b..a92ec54 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
@@ -58,10 +58,12 @@ EXTRA_OECONF = "--enable-ssl \
     --libexecdir=${libdir}/${BPN}/modules \
     ap_cv_void_ptr_lt_long=no \
     --enable-mpms-shared \
-    ac_cv_have_threadsafe_pollset=no"
+    ac_cv_have_threadsafe_pollset=no \
+    --enable-layout=Debian \
+    --prefix=${base_prefix}/"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-PACKAGECONFIG[selinux] = "--enable-selinux --enable-layout=Debian --prefix=${base_prefix}/,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
 PACKAGECONFIG[zlib] = "--enable-deflate --with-z=${STAGING_LIBDIR},,zlib,zlib"
 
-- 
2.7.4


