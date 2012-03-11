Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@gmail.com>) id 1S6hbH-0004cE-9a
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 13:10:11 +0100
Received: by wera1 with SMTP id a1so2401210wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=5GOUrj1AnagKcUXdLGDgtLsvzIqXJK71YGcPsFbbl+I=;
	b=ly4T5H5L13kGOY1CRpv6X1/ZuIdC7UWi+u+l3edk9AJBVXN9m0La5RQN1y8fmLhvP9
	2tIclYsvBOZwx+2Xbc6ybuIrswSM2KmiQoY95tTmX1r1SM/HR7xZ79iULWODQvGNzyI0
	RbcBIprjOUS5bKoIlJ7HsVsJUhV7cK+UiiVQC7bro9gJvuJLD+YU+EOGKaQVCOSwSF3q
	zy2z4Dxrg/cqEwmN5d7CjkWYTLTTG7/GY1c0+NjxIKA9PVojeozEghBGFhYVUeKUIbg5
	WCoMz8FpFrvufJSP3CX/g2w3ZpTHSdfhvG5AabI08jkFfStAMgq9KQ1kq1D3gv/UdQrR
	SRbg==
Received: by 10.180.78.225 with SMTP id e1mr19085416wix.0.1331467289448;
	Sun, 11 Mar 2012 05:01:29 -0700 (PDT)
Received: from localhost.localdomain
	(cpc9-live20-0-0-cust612.know.cable.virginmedia.com. [82.42.142.101])
	by mx.google.com with ESMTPS id fl2sm41380799wib.4.2012.03.11.05.01.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Mar 2012 05:01:28 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: ajlennon@dynamicdevices.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2012 12:01:17 +0000
Message-Id: <1331467277-7665-1-git-send-email-ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.7.5.4
Cc: Alex J Lennon <ajlennon@gmail.com>
Subject: [PATCH] Backported libgdiplus 2.10 from meta-mono
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
X-List-Received-Date: Sun, 11 Mar 2012 12:10:11 -0000

From: Alex J Lennon <ajlennon@gmail.com>

Signed-off-by: Alex J Lennon <ajlennon@gmail.com>
---
 recipes/libgdiplus/files/cairo/configure.in.diff |   31 ++++++++++++++++++++++
 recipes/libgdiplus/libgdiplus_2.10.bb            |   28 +++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libgdiplus/files/cairo/configure.in.diff
 create mode 100644 recipes/libgdiplus/libgdiplus_2.10.bb

diff --git a/recipes/libgdiplus/files/cairo/configure.in.diff b/recipes/libgdiplus/files/cairo/configure.in.diff
new file mode 100644
index 0000000..3465bf4
--- /dev/null
+++ b/recipes/libgdiplus/files/cairo/configure.in.diff
@@ -0,0 +1,31 @@
+--- libgdiplus-2.10.orig/cairo/configure.in	2012-01-23 15:09:19.198498003 -0500
++++ libgdiplus-2.10/cairo/configure.in	2012-01-23 15:08:24.922498003 -0500
+@@ -26,23 +26,23 @@
+ # libtool shared library version
+ 
+ # Increment if the interface has additions, changes, removals.
+-LT_CURRENT=19
++m4_define(lt_current, 19)
+ 
+ # Increment any time the source changes; set to
+ # 0 if you increment CURRENT
+-LT_REVISION=5
++m4_define(lt_revision, 5)
+ 
+ # Increment if any interfaces have been added; set to 0
+ # if any interfaces have been removed. removal has
+ # precedence over adding, so set to 0 if both happened.
+-LT_AGE=17
++m4_define(lt_age, 17)
+ 
+ dnl ===========================================================================
+ 
+-VERSION_INFO="$LT_CURRENT:$LT_REVISION:$LT_AGE"
++VERSION_INFO="lt_current:lt_revision:lt_age"
+ AC_SUBST(VERSION_INFO)
+ 
+-LT_CURRENT_MINUS_AGE=`expr $LT_CURRENT - $LT_AGE`
++LT_CURRENT_MINUS_AGE=`expr lt_current - lt_age`
+ AC_SUBST(LT_CURRENT_MINUS_AGE)
+ 
+ CAIRO_VERSION_MAJOR=cairo_version_major()
diff --git a/recipes/libgdiplus/libgdiplus_2.10.bb b/recipes/libgdiplus/libgdiplus_2.10.bb
new file mode 100644
index 0000000..c24f551
--- /dev/null
+++ b/recipes/libgdiplus/libgdiplus_2.10.bb
@@ -0,0 +1,28 @@
+SUMMARY = "An Open Source implementation of the GDI+ API"
+DESCRIPTION = "This is part of the Mono project - http://mono-project.com"
+HOMEPAGE = "http://mono-project.com"
+BUGTRACKER = "http://bugzilla.xamarin.com/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fe7364dfce9f3689eb6995e7cdd56879"
+
+SRC_URI = "http://download.mono-project.com/sources/libgdiplus/libgdiplus-${PV}.tar.bz2 \
+           file://cairo/configure.in.diff"
+
+inherit autotools pkgconfig
+
+DEPENDS =+ "cairo freetype fontconfig libxft libpng"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "451966e8f637e3a1f02d1d30f900255d"
+SRC_URI[sha256sum] = "2d9e0397ef5583ed855eaafcdac8cabbe1d58463ed1e4b545be6dde5b63712a4"
+
+
+FILES_${PN} += "${libdir}/libgdiplus.so"
+INSANE_SKIP_${PN} += "dev-so"
+
+do_install_append() {
+  # fix pkgconfig .pc file
+  sed -i -e s#I${STAGING_DIR_HOST}#I#g ${D}${libdir}/pkgconfig/*.pc
+}
-- 
1.7.5.4



