Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwneI-0001Mo-Vb
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 03:22:47 +0200
Received: by qyk30 with SMTP id 30so632182qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BYfb0hxn/kY9uv2T4oy6nOnADYPNe/Vc25y5XtqjW/U=;
	b=SUEHH7e6W8+1RLU1GUYKJZMmP17XjPC31Jb4QaXXysNY3PJMeZvC+zIc+yEpwUM39L
	6ehU4bCjgyhj1QvQlXoxFFpfyviDDfXsK13BTLi8ezHXrlN5Yu7n4cRqSygGVFgRU0OI
	Uiz26iNTOViBjc2VF7g5sFOGtY2zXYAuqjSE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=aVgL6Nwf4KxNVdK9JwHXj2d8gAjwy/PJqk4rRpGvgSCN9LNtWrKorivupK6sahfs9n
	nQd2vSObtYViOUo2szRMlnvw3mf3P3Jfb4R2mSUMJARmsbeI8Bx4n6VG1uS9NYYkQXSk
	fcWzmsOANduGYR7BavOyl9B4xTvvR6bQLF/Ys=
Received: by 10.220.98.197 with SMTP id r5mr846761vcn.69.1240449490075;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1780226ywc.51.2009.04.22.18.18.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 18:18:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 70B4761006E; Wed, 22 Apr 2009 22:17:54 -0300 (BRT)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:17:39 -0300
Message-Id: <1240449461-26116-5-git-send-email-otavio@debian.org>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1240449461-26116-4-git-send-email-otavio@debian.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-2-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/6] qt4-tools-native: add qdbusxml2cpp
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
X-List-Received-Date: Thu, 23 Apr 2009 01:22:47 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/qt4/qt4-tools-native.inc      |    4 +++-
 recipes/qt4/qt4-tools-native_4.4.3.bb |    2 +-
 recipes/qt4/qt4-tools-native_4.5.0.bb |    2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index df5afd3..ead27c1 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -37,6 +37,7 @@ TOBUILD = "\
   src/tools/moc \
   src/corelib \
   src/sql \
+  src/dbus \
   src/qt3support \
   src/xml \
   src/tools/uic \
@@ -46,6 +47,7 @@ TOBUILD = "\
   src/tools/uic3 \
   tools/linguist/lrelease \
   tools/linguist/lupdate \
+  tools/qdbus \
 "
 
 do_compile() {
@@ -57,7 +59,7 @@ do_compile() {
 do_stage() {
 	install -d ${STAGING_BINDIR_NATIVE}/
     install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate; do
+    for i in moc uic uic3 rcc lrelease lupdate qdbusxml2cpp; do
         install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
     done
     
diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tools-native_4.4.3.bb
index ef86db4..e8fc316 100644
--- a/recipes/qt4/qt4-tools-native_4.4.3.bb
+++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
@@ -1,2 +1,2 @@
 require qt4-tools-native.inc
-PR = "r3"
+PR = "r4"
diff --git a/recipes/qt4/qt4-tools-native_4.5.0.bb b/recipes/qt4/qt4-tools-native_4.5.0.bb
index ab63314..158a4dd 100644
--- a/recipes/qt4/qt4-tools-native_4.5.0.bb
+++ b/recipes/qt4/qt4-tools-native_4.5.0.bb
@@ -1,5 +1,5 @@
 require qt4-tools-native.inc
-PR = "r1"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-- 
1.6.2.1.303.g63699



