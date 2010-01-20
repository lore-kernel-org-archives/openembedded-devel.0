Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZhj-0002W6-EM
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:38 +0100
Received: by fg-out-1718.google.com with SMTP id 22so123339fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=DoqCKwkJXdiXz+Mw8EAgjk7fVfNgijZUt+e56NXytN0=;
	b=sWox5Himxg1Su9PPSmKtgN19nfJqdTz40sbNgx8a/ZZxK/31/v0Bb61/GWYnqR4PbX
	jD4E51j0jB6heOHyGZOTKvpZNdgGrxSsVs2+VccNtTRai7fClgXoCocWcHXicGDBOK2k
	evtAFsjdeTUM5XRhWaI8q7X/3rWYYPoFbDwxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qwyeJc0d4nOwhUMNxjIofRAh1ORJUwwX9Qa50nSNON8YqDf8WfNQNr/R9Cx+E07Jkk
	Y8m8gEWjb6KY7uVOiKBRtXaB662IRl4JjoviBLwm66ZX/wfrqOW4H8c8Zg1ALVev/yCU
	LWSbDLorld3+2agrr4SSKw5IR1WVN9dPw7VMc=
Received: by 10.87.69.33 with SMTP id w33mr62138fgk.29.1263990501698;
	Wed, 20 Jan 2010 04:28:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm3632346fxm.6.2010.01.20.04.28.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:54 +0100
Message-Id: <1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/6] libpixman: move all to obsolete directory (replaced with pixman recipes)
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/libpixman/libpixman-native_0.12.0.bb       |    6 ------
 recipes/libpixman/libpixman_0.1.5.bb               |   12 ------------
 recipes/libpixman/libpixman_0.1.6.bb               |   12 ------------
 recipes/libpixman/libpixman_0.10.0.bb              |   13 -------------
 recipes/libpixman/libpixman_0.9.6.bb               |   13 -------------
 recipes/libpixman/libpixman_cvs.bb                 |   16 ----------------
 .../obsolete/libpixman/libpixman-native_0.12.0.bb  |    6 ++++++
 recipes/obsolete/libpixman/libpixman_0.1.5.bb      |   12 ++++++++++++
 recipes/obsolete/libpixman/libpixman_0.1.6.bb      |   12 ++++++++++++
 recipes/obsolete/libpixman/libpixman_0.10.0.bb     |   13 +++++++++++++
 recipes/obsolete/libpixman/libpixman_0.9.6.bb      |   13 +++++++++++++
 recipes/obsolete/libpixman/libpixman_cvs.bb        |   16 ++++++++++++++++
 12 files changed, 72 insertions(+), 72 deletions(-)
 delete mode 100644 recipes/libpixman/libpixman-native_0.12.0.bb
 delete mode 100644 recipes/libpixman/libpixman_0.1.5.bb
 delete mode 100644 recipes/libpixman/libpixman_0.1.6.bb
 delete mode 100644 recipes/libpixman/libpixman_0.10.0.bb
 delete mode 100644 recipes/libpixman/libpixman_0.9.6.bb
 delete mode 100644 recipes/libpixman/libpixman_cvs.bb
 create mode 100644 recipes/obsolete/libpixman/libpixman-native_0.12.0.bb
 create mode 100644 recipes/obsolete/libpixman/libpixman_0.1.5.bb
 create mode 100644 recipes/obsolete/libpixman/libpixman_0.1.6.bb
 create mode 100644 recipes/obsolete/libpixman/libpixman_0.10.0.bb
 create mode 100644 recipes/obsolete/libpixman/libpixman_0.9.6.bb
 create mode 100644 recipes/obsolete/libpixman/libpixman_cvs.bb

diff --git a/recipes/libpixman/libpixman-native_0.12.0.bb b/recipes/libpixman/libpixman-native_0.12.0.bb
deleted file mode 100644
index 808cc86..0000000
--- a/recipes/libpixman/libpixman-native_0.12.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpixman_0.10.0.bb
-
-inherit native
-
-PROVIDES = "libpixman-native"
-
diff --git a/recipes/libpixman/libpixman_0.1.5.bb b/recipes/libpixman/libpixman_0.1.5.bb
deleted file mode 100644
index bf23947..0000000
--- a/recipes/libpixman/libpixman_0.1.5.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "virtual/libx11"
-DESCRIPTION = "Cairo support library"
-LICENSE = "X11"
-SRC_URI = "http://cairographics.org/snapshots/libpixman-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/libpixman/libpixman_0.1.6.bb b/recipes/libpixman/libpixman_0.1.6.bb
deleted file mode 100644
index bf23947..0000000
--- a/recipes/libpixman/libpixman_0.1.6.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "virtual/libx11"
-DESCRIPTION = "Cairo support library"
-LICENSE = "X11"
-SRC_URI = "http://cairographics.org/snapshots/libpixman-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/libpixman/libpixman_0.10.0.bb b/recipes/libpixman/libpixman_0.10.0.bb
deleted file mode 100644
index fba7dc9..0000000
--- a/recipes/libpixman/libpixman_0.10.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SECTION = "libs"
-PRIORITY = "optional"
-DESCRIPTION = "Low-level pixel manipulation library."
-LICENSE = "X11"
-SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz"
-S = "${WORKDIR}/pixman-${PV}"
-
-inherit autotools pkgconfig
-
-do_stage () {
- 	autotools_stage_all
-}
-
diff --git a/recipes/libpixman/libpixman_0.9.6.bb b/recipes/libpixman/libpixman_0.9.6.bb
deleted file mode 100644
index fba7dc9..0000000
--- a/recipes/libpixman/libpixman_0.9.6.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SECTION = "libs"
-PRIORITY = "optional"
-DESCRIPTION = "Low-level pixel manipulation library."
-LICENSE = "X11"
-SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz"
-S = "${WORKDIR}/pixman-${PV}"
-
-inherit autotools pkgconfig
-
-do_stage () {
- 	autotools_stage_all
-}
-
diff --git a/recipes/libpixman/libpixman_cvs.bb b/recipes/libpixman/libpixman_cvs.bb
deleted file mode 100644
index a75a284..0000000
--- a/recipes/libpixman/libpixman_cvs.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-PV = "0.0+cvs${SRCDATE}"
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "virtual/libx11"
-DESCRIPTION = "Cairo support library"
-LICENSE = "X11"
-SRC_URI = "cvs://anoncvs:anoncvs@cvs.cairographics.org/cvs/cairo;module=libpixman"
-S = "${WORKDIR}/libpixman"
-
-DEFAULT_PREFERENCE = "-1"
-
-inherit autotools pkgconfig
-
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/obsolete/libpixman/libpixman-native_0.12.0.bb b/recipes/obsolete/libpixman/libpixman-native_0.12.0.bb
new file mode 100644
index 0000000..808cc86
--- /dev/null
+++ b/recipes/obsolete/libpixman/libpixman-native_0.12.0.bb
@@ -0,0 +1,6 @@
+require libpixman_0.10.0.bb
+
+inherit native
+
+PROVIDES = "libpixman-native"
+
diff --git a/recipes/obsolete/libpixman/libpixman_0.1.5.bb b/recipes/obsolete/libpixman/libpixman_0.1.5.bb
new file mode 100644
index 0000000..bf23947
--- /dev/null
+++ b/recipes/obsolete/libpixman/libpixman_0.1.5.bb
@@ -0,0 +1,12 @@
+SECTION = "libs"
+PRIORITY = "optional"
+DEPENDS = "virtual/libx11"
+DESCRIPTION = "Cairo support library"
+LICENSE = "X11"
+SRC_URI = "http://cairographics.org/snapshots/libpixman-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+do_stage () {
+	autotools_stage_all
+}
diff --git a/recipes/obsolete/libpixman/libpixman_0.1.6.bb b/recipes/obsolete/libpixman/libpixman_0.1.6.bb
new file mode 100644
index 0000000..bf23947
--- /dev/null
+++ b/recipes/obsolete/libpixman/libpixman_0.1.6.bb
@@ -0,0 +1,12 @@
+SECTION = "libs"
+PRIORITY = "optional"
+DEPENDS = "virtual/libx11"
+DESCRIPTION = "Cairo support library"
+LICENSE = "X11"
+SRC_URI = "http://cairographics.org/snapshots/libpixman-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+do_stage () {
+	autotools_stage_all
+}
diff --git a/recipes/obsolete/libpixman/libpixman_0.10.0.bb b/recipes/obsolete/libpixman/libpixman_0.10.0.bb
new file mode 100644
index 0000000..fba7dc9
--- /dev/null
+++ b/recipes/obsolete/libpixman/libpixman_0.10.0.bb
@@ -0,0 +1,13 @@
+SECTION = "libs"
+PRIORITY = "optional"
+DESCRIPTION = "Low-level pixel manipulation library."
+LICENSE = "X11"
+SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz"
+S = "${WORKDIR}/pixman-${PV}"
+
+inherit autotools pkgconfig
+
+do_stage () {
+ 	autotools_stage_all
+}
+
diff --git a/recipes/obsolete/libpixman/libpixman_0.9.6.bb b/recipes/obsolete/libpixman/libpixman_0.9.6.bb
new file mode 100644
index 0000000..fba7dc9
--- /dev/null
+++ b/recipes/obsolete/libpixman/libpixman_0.9.6.bb
@@ -0,0 +1,13 @@
+SECTION = "libs"
+PRIORITY = "optional"
+DESCRIPTION = "Low-level pixel manipulation library."
+LICENSE = "X11"
+SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz"
+S = "${WORKDIR}/pixman-${PV}"
+
+inherit autotools pkgconfig
+
+do_stage () {
+ 	autotools_stage_all
+}
+
diff --git a/recipes/obsolete/libpixman/libpixman_cvs.bb b/recipes/obsolete/libpixman/libpixman_cvs.bb
new file mode 100644
index 0000000..a75a284
--- /dev/null
+++ b/recipes/obsolete/libpixman/libpixman_cvs.bb
@@ -0,0 +1,16 @@
+PV = "0.0+cvs${SRCDATE}"
+SECTION = "libs"
+PRIORITY = "optional"
+DEPENDS = "virtual/libx11"
+DESCRIPTION = "Cairo support library"
+LICENSE = "X11"
+SRC_URI = "cvs://anoncvs:anoncvs@cvs.cairographics.org/cvs/cairo;module=libpixman"
+S = "${WORKDIR}/libpixman"
+
+DEFAULT_PREFERENCE = "-1"
+
+inherit autotools pkgconfig
+
+do_stage () {
+	autotools_stage_all
+}
-- 
1.6.6



