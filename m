Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 20CE06FA78
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:27 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hm4so5585684wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cOMjFZeJYcVDYmQZf4xodkLla7M1R8fX1Re1rJenF7Q=;
	b=nGiiAeurVeKDn/EYV+ybsvKD8uRt3VxSsPvnBjqrc4JRzuQEpxBMYajYlD2QCnJZjt
	+rRLfAh697duG7tcuu+tbo9WWyaFGA9kjaqkD3ayEXtb8kzuPdaMVM4DE73rH7fvfK+d
	n/HgWpwoC7UDfShJWt+0QU3faqsgFFKlOnV/OjQrRyStciSPtaV5/QWgSVbqNiIQ2JT6
	goSQXEU7mOddLL7nw1uuguKO04itOMBo8cKHluWPeRRnikJskxWiawf5FEDODW4KXmt/
	4jM0WW+k1V3x9StcfGbRNLeOLChG75D1Y2AXFnFDUas3RDVuZGqACSVAEj4bKmKb94Ja
	X+AA==
X-Received: by 10.180.9.42 with SMTP id w10mr21576557wia.20.1396372528508;
	Tue, 01 Apr 2014 10:15:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm41869777eep.14.2014.04.01.10.15.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:47 +0200
Message-Id: <1396372434-10710-39-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 39/46] mousepad: add dbus and intltool-native dependency
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
index 26eec31..8e9ce59 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
@@ -2,7 +2,10 @@ SUMMARY = "A simple text editor for Xfce"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ dbus-glib gtksourceview2"
+
+# dbus to fix mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
+# intltool to provide intltool.m4 with AC_PROG_INTLTOOL
+DEPENDS = "gtk+ dbus-glib gtksourceview2 dbus intltool-native"
 
 inherit xfce-app
 
-- 
1.9.1


