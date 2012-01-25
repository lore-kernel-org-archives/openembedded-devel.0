Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0si-0004Q6-Dt
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:19:12 +0100
Received: by mail-bk0-f47.google.com with SMTP id q10so4070568bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=3LWQSihZ1FqFReG9BYUYr+iwCHOVn/6ylhWHHuNxJ/E=;
	b=knThoyScwIBSglLYH+U3cjoGw3xpsPD6+Og0QjWs6HcL8HYdyjGPNN0uftf5sJggFX
	yIVDxagrIwsGOPNWi5+pZc8x2uQTX76GXWAiDlFBaksdoM5qcI1bkHabNH2JIJgkRElF
	zRpQZUIApxxf/RB2TXx14s8qHhebErH7YNpCI=
Received: by 10.204.156.204 with SMTP id y12mr5274017bkw.113.1327489888268;
	Wed, 25 Jan 2012 03:11:28 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id iu2sm309749bkb.0.2012.01.25.03.11.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 03:11:27 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0lC-0007am-R7; Wed, 25 Jan 2012 14:11:26 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 14:11:25 +0300
Message-Id: <1327489885-29156-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH 10/10] Add recipe for pure-ftpd 1.0.35
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
X-List-Received-Date: Wed, 25 Jan 2012 11:19:12 -0000

Add pure-ftpd FTP server.

Recipe for this package has been taken from Openembedded-classic project.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 ...coded-usr-local-includes-from-configure.a.patch |   36 ++++++++++++++++++++
 .../pure-ftpd/pure-ftpd_1.0.35.bb                  |   20 +++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/pure-ftpd/pure-ftpd-1.0.35/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
 create mode 100644 meta/recipes-connectivity/pure-ftpd/pure-ftpd_1.0.35.bb

diff --git a/meta/recipes-connectivity/pure-ftpd/pure-ftpd-1.0.35/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta/recipes-connectivity/pure-ftpd/pure-ftpd-1.0.35/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
new file mode 100644
index 0000000..202cee9
--- /dev/null
+++ b/meta/recipes-connectivity/pure-ftpd/pure-ftpd-1.0.35/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -0,0 +1,36 @@
+From cffca7cb7c055f82ced316ddee90bb701b85b92d Mon Sep 17 00:00:00 2001
+From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+Date: Tue, 10 Jan 2012 19:15:25 +0300
+Subject: [PATCH] Remove hardcoded /usr/local includes from configure.ac
+
+Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+---
+ configure.ac |   12 ------------
+ 1 files changed, 0 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ae00c08..9ba6d8d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,18 +67,6 @@ AC_ARG_VAR(PYTHON,local path to the python interpreter)
+ python_possible_path="/usr/bin:/usr/local/bin:/bin:/opt/python/bin:/opt/python/usr/bin:/opt/python/usr/local/bin"
+ AC_PATH_PROG(PYTHON,python,/usr/bin/env python,$python_possible_path)
+ 
+-if test -d /usr/local/include; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-fi
+-
+-if test -d /usr/kerberos/include; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/kerberos/include"
+-fi
+-
+-if test -d /usr/local/lib; then
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+-
+ if uname | fgrep SunOS > /dev/null 2> /dev/null ; then
+   CPPFLAGS="$CPPFLAGS -D_XPG4_2=1"
+ fi
+-- 
+1.7.7.3
+
diff --git a/meta/recipes-connectivity/pure-ftpd/pure-ftpd_1.0.35.bb b/meta/recipes-connectivity/pure-ftpd/pure-ftpd_1.0.35.bb
new file mode 100644
index 0000000..5308b1e
--- /dev/null
+++ b/meta/recipes-connectivity/pure-ftpd/pure-ftpd_1.0.35.bb
@@ -0,0 +1,20 @@
+HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
+DESCRIPTION = "Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=00c16e0df3fae485c1b5b7fb2030b5df"
+
+DEPENDS = "libcap"
+
+PR = "r0"
+
+SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.tar.gz \
+            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
+            "
+SRC_URI[md5sum] = "fa53507ff8e9fdca0197917ec8d106a3"
+SRC_URI[sha256sum] = "eac26c7601b81433211f2b9d6c3e49b832f0274ed077b8d061b5c533b4e63beb"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-minimal"
+
+
-- 
1.7.6.4



