Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4753C6F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:28 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so7942340wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9eX5X8A5EkQGnT/NO/2P/k+1LWN+r/J5iNk/kSwdvRI=;
	b=HaMizsTeEgPNsCRGUPanRn5oAnirWZqPTUTYWE8t0eWtTft1+J9yascqTH+abK4zDd
	PLlFmr73T8duqV8DxGTqA3e6HwXM4cZ0MV0BourqZz9pEi9JqBICzOeL6C+bWw92H7Sd
	Hza5dz4UzoL9tza9u1pCZfKMG4pRiKVAIRra8Bshnko9jxqGuY8cIGqDRYOAn8XTgFBa
	q6WyVm+ZScUchzKoQ4Y9izNJpJaGyJGHoV28n/7FmNLboNlDFErd002teotf6sLOFGCW
	dOowuo5sgRwLg9Q0bGoxoZjANu5LO1QL+KHUAYuCgTX+LfEwurhOOMwVw82lwD/4Gj4/
	TgXQ==
X-Received: by 10.180.79.73 with SMTP id h9mr21762552wix.3.1396372468956;
	Tue, 01 Apr 2014 10:14:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm41873351eeg.4.2014.04.01.10.14.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:23 +0200
Message-Id: <1396372434-10710-15-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/46] libwnck*: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb | 2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
index 1edd2ba..fd0ecd9 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
@@ -12,6 +12,6 @@ PR = "r1"
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
-inherit gnome
+inherit gnomebase
 SRC_URI[archive.md5sum] = "e4ea87320dd0600a81c50186e3804aae"
 SRC_URI[archive.sha256sum] = "4946b612c22d53238810d431f1b05c21f073f201edfd247ff74e2fa228618083"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
index 6f4722d..61836d2 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
@@ -10,6 +10,6 @@ DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native libxres"
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
-inherit gnome
+inherit gnomebase
 SRC_URI[archive.md5sum] = "4162d5b96151e6d24ec02ae3a822203c"
 SRC_URI[archive.sha256sum] = "56b6681e89cd45491bb640165d62276d81369a08974042b26645dc1e0e954cc1"
-- 
1.9.1


