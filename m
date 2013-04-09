Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UPSyq-0002Ar-DM
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 09:28:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r397B8Kp018377
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Apr 2013 00:11:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 00:11:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2013 15:11:04 +0800
Message-ID: <cac11e1cfa9488c1813cc7a73ce9c979d31478cc.1365489405.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1365489405.git.jackie.huang@windriver.com>
References: <cover.1365489405.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-webserver][PATCH 1/2] modphp: revert pthread-check.patch and add one against threads.m4
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
X-List-Received-Date: Tue, 09 Apr 2013 07:29:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

revert pthread-check.patch which hacks the old configure,
instead, add one against threads.m4 to enable pthread support
when cross-compiling.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../modphp/files/pthread-check-threads-m4.patch    |   30 +++++++++
 .../recipes-php/modphp/files/pthread-check.patch   |   64 --------------------
 meta-webserver/recipes-php/modphp/modphp5.inc      |    2 +-
 3 files changed, 31 insertions(+), 65 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check.patch

diff --git a/meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch b/meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
new file mode 100644
index 0000000..0c564cd
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
@@ -0,0 +1,30 @@
+From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 8 Apr 2013 14:29:51 +0800
+Subject: [PATCH] pthread-check
+
+Enable pthreads support when cross-compiling
+
+Upstream-Status: Inapproprate [config]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ TSRM/threads.m4 |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
+index 38494ce..15d9454 100644
+--- a/TSRM/threads.m4
++++ b/TSRM/threads.m4
+@@ -86,7 +86,7 @@ int main() {
+   pthreads_working=no
+   ], [
+   dnl For cross compiling running this test is of no use. NetWare supports pthreads
+-  pthreads_working=no
++  pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+-- 
+1.7.4.1
+
diff --git a/meta-webserver/recipes-php/modphp/files/pthread-check.patch b/meta-webserver/recipes-php/modphp/files/pthread-check.patch
deleted file mode 100644
index 1388b2b..0000000
--- a/meta-webserver/recipes-php/modphp/files/pthread-check.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Hack configure script so it does not disable pthread support when cross-compiling
-
-Upstream-Status: Inapproprate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/configure b/configure
-index 03d8f95..6794d45 100755
---- a/configure
-+++ b/configure
-@@ -3506,7 +3506,7 @@ fi
-   
- if test "$cross_compiling" = yes; then
-   
--    pthreads_working=no
-+    pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
-@@ -3566,7 +3566,7 @@ else
-       
- if test "$cross_compiling" = yes; then
-   
--    pthreads_working=no
-+    pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
-@@ -3636,7 +3636,7 @@ if test "$pthreads_working" != "yes"; then
-     
- if test "$cross_compiling" = yes; then
-   
--    pthreads_working=no
-+    pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
-@@ -106833,7 +106833,7 @@ fi
-   
- if test "$cross_compiling" = yes; then
-   
--    pthreads_working=no
-+    pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
-@@ -106893,7 +106893,7 @@ else
-       
- if test "$cross_compiling" = yes; then
-   
--    pthreads_working=no
-+    pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
-@@ -106963,7 +106963,7 @@ if test "$pthreads_working" != "yes"; then
-     
- if test "$cross_compiling" = yes; then
-   
--    pthreads_working=no
-+    pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 33dbe89..0d84ba4 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -5,7 +5,7 @@ DEPENDS = "apache2-native apache2 zlib bzip2"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://configure.patch \
-           file://pthread-check.patch \
+           file://pthread-check-threads-m4.patch \
            file://70_mod_php5.conf \
            "
 
-- 
1.7.4.1



