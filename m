Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCcey-00012R-Je
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 18:25:11 +0100
Received: by ywh26 with SMTP id 26so4947676ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:23:40 -0800 (PST)
Received: by 10.100.245.22 with SMTP id s22mr457393anh.136.1258997020047;
	Mon, 23 Nov 2009 09:23:40 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 9sm1537045ywf.50.2009.11.23.09.23.38
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 09:23:39 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 14:17:15 -0300
Message-Id: <1258996635-20162-2-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1258996635-20162-1-git-send-email-ricardo.salveti@openbossa.org>
References: <1258996635-20162-1-git-send-email-ricardo.salveti@openbossa.org>
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] libxml, rpm, zope: avoid generating native packages
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
X-List-Received-Date: Mon, 23 Nov 2009 17:25:11 -0000

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 recipes/libxml/libxml2-native.inc |    2 +-
 recipes/rpm/rpm-native_4.4.2.3.bb |    5 ++---
 recipes/zope/zope-native_3.3.1.bb |    2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-native.inc
index 3f67152..395a3a9 100644
--- a/recipes/libxml/libxml2-native.inc
+++ b/recipes/libxml/libxml2-native.inc
@@ -5,7 +5,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libxml2-${PV}"
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz"
 S = "${WORKDIR}/libxml2-${PV}"
 
-inherit autotools native pkgconfig distutils-native-base
+inherit autotools pkgconfig distutils-native-base native
 
 do_configure_prepend () {
 	EXTRA_LIBXML2_OECONF="\
diff --git a/recipes/rpm/rpm-native_4.4.2.3.bb b/recipes/rpm/rpm-native_4.4.2.3.bb
index 3cfb43e..d27a392 100644
--- a/recipes/rpm/rpm-native_4.4.2.3.bb
+++ b/recipes/rpm/rpm-native_4.4.2.3.bb
@@ -1,8 +1,7 @@
-inherit native distutils-native-base
-
 require rpm-${PV}.inc
 
+inherit distutils-native-base native
+
 DEPENDS = "beecrypt-native gettext-native zlib-native file-native popt-native python-native"
-PACKAGES = ""
 
 export varprefix = "${localstatedir}"
diff --git a/recipes/zope/zope-native_3.3.1.bb b/recipes/zope/zope-native_3.3.1.bb
index cb0d690..a1c5eac 100644
--- a/recipes/zope/zope-native_3.3.1.bb
+++ b/recipes/zope/zope-native_3.3.1.bb
@@ -1,4 +1,4 @@
-inherit native distutils-native-base
+inherit distutils-native-base native
 
 require zope.inc
 
-- 
1.6.5



