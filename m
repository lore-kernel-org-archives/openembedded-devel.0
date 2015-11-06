Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E01CF60124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:27:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2015 05:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844174482"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:27:01 -0800
Received: from avalluri-GigaByte.fi.intel.com (avalluri-gigabyte.fi.intel.com
	[10.237.68.36]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 877A52E055B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 05:25:57 -0800 (PST)
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 15:27:37 +0200
Message-Id: <1446816458-9536-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH 1/2] nginx: Add support for altering build configuration
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
X-List-Received-Date: Fri, 06 Nov 2015 13:27:02 -0000

Passing EXTRA_OECONF to ./configure, this allows to alter build
configure

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
index a251523..1c9bff7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
@@ -27,6 +27,8 @@ inherit update-rc.d useradd
 CFLAGS_append = " -fPIE -pie"
 CXXFLAGS_append = " -fPIE -pie"
 
+EXTRA_OECONF = ""
+
 do_configure () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
 		PTRSIZE=8
@@ -55,7 +57,8 @@ do_configure () {
 	--pid-path=/run/nginx/nginx.pid \
 	--prefix=${prefix} \
 	--with-http_ssl_module \
-	--with-http_gzip_static_module
+	--with-http_gzip_static_module \
+	${EXTRA_OECONF}
 }
 
 do_install () {
-- 
1.9.1

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


