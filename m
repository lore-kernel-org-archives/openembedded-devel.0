Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6A97465D93
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 16:47:59 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so2496937eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u+H9KDdvYPkR1s/X248HUPPSMmBdMzIfK09a+/ymFgo=;
	b=R23OBSrETlf6nNmQmFZZna1tYKz1KrDlF9qTrawxtH0z1ggF5IyqtxvJhg4yZVejC1
	9bCs1QrUPHJOKdosB29ISWirL1QNuT2qBiRLFtd38WQUuxTJucOrrp2dmWY7yV+jUypA
	lmsrT1c4mlYKVHgdXNhzVgEbHy/KyHYHq/138dSLO4fVETkIFRaRoQ92tI76evR5WAGw
	m7T6jmvDx+aguLvVWkVrn9HAWkYkG0796wrnrnI8aARQZI10QS2jkcqICXdj7Y0ICDXa
	f4F4JWqL60B1xm/z81EJ79wHbBtMer96ehckKbfnQhiorxnnTJusTRHd8lID1k5lm6CZ
	kYHQ==
X-Received: by 10.15.10.135 with SMTP id g7mr3098577eet.72.1397926080737;
	Sat, 19 Apr 2014 09:48:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm87029435eep.14.2014.04.19.09.47.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 09:47:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Apr 2014 18:47:50 +0200
Message-Id: <1397926070-7453-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
References: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] mousepad: Add xfce4-dev-tools-native dependency
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
X-List-Received-Date: Sat, 19 Apr 2014 16:48:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
index 8e9ce59..4947531 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
@@ -3,9 +3,10 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-# dbus to fix mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
 # intltool to provide intltool.m4 with AC_PROG_INTLTOOL
-DEPENDS = "gtk+ dbus-glib gtksourceview2 dbus intltool-native"
+# xfce4-dev-tools-native for XDT_I18N macro and more importantly XDT_CHECK_OPTIONAL_PACKAGE
+# which fixes mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
+DEPENDS = "gtk+ dbus dbus-glib gtksourceview2 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-- 
1.9.1


