Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id E03546B478
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:46 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so1943785eaf.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eTkYCFcZWOnkGu+IMQUywF0JulCp8lDQuPw5Ecx7Was=;
	b=r2x/v8LMRUnyvnBb1QgZ0d+HbQq0BTf5/dAgEZOYfvFjEmHZ+HHb4CaSVUMvRZySLx
	QJT2bYQn9P6SmO3/hteGZKQGfM+lZETQPeForjiFPx/zWyZ4saVkNMA1HExixL2ERIq1
	ZV5jHSE4HhpILLLhIYpEvbTPw+ZlLAF2rVeRyLZjv0r2iD7uZuL1mLzuRQuAlBM/N5/E
	KRopyN2vT+eP2ZFOrOOOFmfCjMxQfmdUxYMqq6LEvsAVec3sE79ZdRDyr1z9sdEnnx5G
	RvmuRxd9qKXEhuPRBzcnVMNm83459KVZBdoN6FFeBgkWYmN1N89BtrnwLes0eqMIIwxd
	tbjw==
X-Received: by 10.15.41.205 with SMTP id s53mr12113678eev.63.1376038427071;
	Fri, 09 Aug 2013 01:53:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm26777734eeg.13.2013.08.09.01.53.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:20 +0200
Message-Id: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH 01/12] gnome-power-management: add gnome-doc-utils dependency
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:47 -0000

* configure: error: gnome-doc-utils >= 0.3.2 not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index aac6b6c..dabd5e7 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PR = "r4"
 
-DEPENDS = "glib-2.0 gtk+ gconf libgnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower"
+DEPENDS = "glib-2.0 gtk+ gconf libgnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower gnome-doc-utils"
 RRECOMMENDS_${PN} += "gnome-keyring"
 
 inherit gnome
-- 
1.8.3.2


