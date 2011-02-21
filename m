Received: from p3plsmtpa06-08.prod.phx3.secureserver.net ([173.201.192.109])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PrbKP-0006ek-IJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:21:51 +0100
Received: (qmail 19745 invoked from network); 21 Feb 2011 19:13:49 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa06-08.prod.phx3.secureserver.net (173.201.192.109) with
	ESMTP; 21 Feb 2011 19:13:49 -0000
Message-ID: <4D62B96F.3010908@mwester.net>
Date: Mon, 21 Feb 2011 13:13:51 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] squid: fix references to host headers and libs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Feb 2011 19:21:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This patch changes hard-coded references to /usr and /opt in the various
squid config.test scripts to point to the correct sysroot paths.
This version accommodates the strange staging dir layout used by micro.

Signed-off-by: Mike Westerhof <mike@mwester.net>
---
diff --git a/recipes/squid/squid_3.1.9.bb b/recipes/squid/squid_3.1.9.bb
index 713b1ea..ecd6fdc 100644
--- a/recipes/squid/squid_3.1.9.bb
+++ b/recipes/squid/squid_3.1.9.bb
@@ -1,4 +1,4 @@
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"

 include squid.inc

@@ -18,6 +18,11 @@ do_configure_prepend() {
        export ac_cv_epoll_ctl=yes
        export ac_cv_epoll_works=yes
        export ac_cv_func_setresuid=yes
+       # Patch up the various config scripts to refer to sysroot
+       for i in `find ${S} -name config.test`; do
+           sed -i -e 's|/usr|${STAGING_DIR_HOST}${exec_prefix}|g' \
+                  -e 's|/opt|${STAGING_DIR_HOST}/opt|g' "$i"
+       done
 }

 do_install_append() {



