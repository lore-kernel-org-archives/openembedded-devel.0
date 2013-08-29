Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 765DA6BD6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:52 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so338869eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=5hiN4MvB+LQQh1fK4JA6FS1KTyDC+V9VA9bN+7h8To0=;
	b=B4Xv90Sm2QUD8m3j+Y4jNkMKbsKrgIwUnGGdpKUtsC03wLgfl1lEwkwsBKPzs94Zwr
	oKoUCKSzv8byEo9ithr4alXbbW3Fc0jFjQBqGoMb+INb7+eC3gLS+GDsu8XiTj+ByDdi
	eTn4BJ0heJ7KNe5yDTp9ZcdWGj+Oz/b/O+GmiNVqSaOJ6G+XlhkqgPZv/17QUo9/Qtbi
	SJ1Qh3KTHirV9zuQnF5XMTHia6ya29Rgk8AhKXCsN3ELsFdF2FyfKwQXxES7yoZ2+Ftd
	YqDsgUPuo4gTn47ic50Z+Ijzl6/wxVmtUiFDGesWeHjX7FUtgZa+7gP1S5N5ly9XQXyP
	FRIg==
X-Received: by 10.15.48.67 with SMTP id g43mr5424271eew.17.1377791452800;
	Thu, 29 Aug 2013 08:50:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm47198720eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:50:56 +0200
Message-Id: <ccfade4a210cb7611f7278ed8d3a391b9a92b4c2.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 03/66] gnome-desktop: Add startup-notification dependency
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:54 -0000

* configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb | 2 +-
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
index 4aacd5f..96f3d14 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
@@ -12,7 +12,7 @@ inherit gnome pkgconfig
 SRC_URI[archive.md5sum] = "e2fd9d545d4d7ff66525f10364ab671e"
 SRC_URI[archive.sha256sum] = "0ac9b4a358c6d92d20283cf56a9817262ff3ce038013cbb5d98e4ab97aa2c9a3"
 
-DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common"
+DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
 
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 333f8cb..4c01d46 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -11,7 +11,7 @@ inherit gnome pkgconfig
 SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
 SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
 
-DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils"
+DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
 
-- 
1.8.3.2


