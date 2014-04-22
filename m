Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D261F609AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 15:12:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3MFCnHw028977
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 08:12:49 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 22 Apr 2014 08:12:49 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Apr 2014 23:12:31 +0800
Message-ID: <1398179551-12572-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-webserver][PATCH] apache: upgrade to 2.4.9
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
X-List-Received-Date: Tue, 22 Apr 2014 15:12:53 -0000
Content-Type: text/plain

Upgrade apache from 2.4.7 to 2.4.9.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../apache2/{apache2-native_2.4.7.bb => apache2-native_2.4.9.bb}      | 4 ++--
 .../recipes-httpd/apache2/{apache2_2.4.7.bb => apache2_2.4.9.bb}      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.7.bb => apache2-native_2.4.9.bb} (89%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.7.bb => apache2_2.4.9.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.7.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
similarity index 89%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.7.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
index bd935eb..aaa7e60 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.7.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "170d7fb6fe5f28b87d1878020a9ab94e"
-SRC_URI[sha256sum] = "64368d8301836815ae237f2b62d909711c896c1bd34573771e0ee5ad808ce71b"
+SRC_URI[md5sum] = "2ef4e65353497606b24fa9bb3e5a3c40"
+SRC_URI[sha256sum] = "f78cc90dfa47caf3d83ad18fd6b4e85f237777c1733fc9088594b70ce2847603"
 
 do_configure () {
     ./configure --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
index 3c038a9..33e197a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://apache2-volatile.conf"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "170d7fb6fe5f28b87d1878020a9ab94e"
-SRC_URI[sha256sum] = "64368d8301836815ae237f2b62d909711c896c1bd34573771e0ee5ad808ce71b"
+SRC_URI[md5sum] = "2ef4e65353497606b24fa9bb3e5a3c40"
+SRC_URI[sha256sum] = "f78cc90dfa47caf3d83ad18fd6b4e85f237777c1733fc9088594b70ce2847603"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.8.4


