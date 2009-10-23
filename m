Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N1Pas-0004Mc-C1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:14:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id AC8905A861A;
	Fri, 23 Oct 2009 15:13:32 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13671-06; Fri, 23 Oct 2009 15:13:32 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id AE3255A861C; Fri, 23 Oct 2009 15:13:30 -0400 (EDT)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 772885A860B;
	Fri, 23 Oct 2009 15:13:24 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 18F5F40AA2; Fri, 23 Oct 2009 15:13:24 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 15:13:22 -0400
Message-Id: <1256325202-8516-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1256325202-8516-1-git-send-email-msmith@cbnco.com>
References: <1256325202-8516-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] curl: support openssl in CURL_FEATURES.
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
X-List-Received-Date: Fri, 23 Oct 2009 19:14:37 -0000

Default is still gnutls.

Bump PR for curl-7.19.6.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/curl/curl-common.inc |    8 ++++++--
 recipes/curl/curl_7.19.6.bb  |    1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes/curl/curl-common.inc b/recipes/curl/curl-common.inc
index ce4f5f2..06d539f 100644
--- a/recipes/curl/curl-common.inc
+++ b/recipes/curl/curl-common.inc
@@ -7,7 +7,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 S = "${WORKDIR}/curl-${PV}"
 
 CURL_FEATURES ?= "zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
-# other allowed features: ipv6, ares
+# other allowed features: ipv6, ares, openssl
 
 inherit autotools pkgconfig binconfig
 
@@ -15,7 +15,6 @@ EXTRA_OECONF = " \
                 --without-libssh2 \
 		--with-random=/dev/urandom \
 		--without-libidn \
-                --without-ssl \
 		"
 
 python __anonymous() {
@@ -37,6 +36,11 @@ python __anonymous() {
                 deps.append("gnutls")
         else:
                 oeconf += " --without-gnutls"
+        if 'openssl' in f:
+                oeconf += " --with-ssl=${STAGING_LIBDIR}/../"
+                deps.append("openssl")
+        else:
+                oeconf += " --without-ssl"
         if 'ares' in f:
                 oeconf += " --enable-ares"
                 deps.append("c-ares")
diff --git a/recipes/curl/curl_7.19.6.bb b/recipes/curl/curl_7.19.6.bb
index d5ca1bb..f67dcdb 100644
--- a/recipes/curl/curl_7.19.6.bb
+++ b/recipes/curl/curl_7.19.6.bb
@@ -2,3 +2,4 @@ require curl-common.inc
 require curl-target.inc
 
 SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0"
+PR = "r1"
-- 
1.6.3



