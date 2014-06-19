Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D89A66FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:59:56 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so9820198wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ljXQtDjupJ9+VZIAtDKi2sr4KakUMUbk1aq4iWc85sY=;
	b=clR13bdNwewDP6smghBLx9563OZwgAw4wSRcUZmYQXQW9T0iGsvQo5v4Hqf945ZZ6+
	O6vVzH3FfTpvZ/xyIb1XIVNo3BJnVkQA8ZNBm664JOcfRXSABMv1zztpmK/w56lhvH9T
	RZIMd4w0o7pZRTLCSbkn57zKR47hqi10j53ed+brpRnkAoKfjfZV4Lwv29OxNradF36a
	lsO6bqrNbpJvjK2ywpEaJiSYxCJF60qWHS5oYNm26g+0ReZ4yyH/DIb4OBzjwN8yMLPn
	6Mc4FF2zQbgjUt0rHUnrzUGobJUOK9F+6nYPBtXfPvD1nq8PVKgVv7s5K6cnUHR6qfl+
	OjyA==
X-Received: by 10.194.243.70 with SMTP id ww6mr3821292wjc.76.1403171997042;
	Thu, 19 Jun 2014 02:59:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ho2sm10065379wib.15.2014.06.19.02.59.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:59:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:31 +0200
Message-Id: <1403171993-26208-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 03/25] libsdl-ttf: Blacklist because of broken libsdl-ttf after freetype2-config was removed
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
X-List-Received-Date: Thu, 19 Jun 2014 09:59:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb | 2 ++
 meta-oe/recipes-support/maliit/maliit-framework_git.bb  | 2 ++
 meta-oe/recipes-support/maliit/maliit-plugins_git.bb    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index 0127b31..605e272 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PR = "r2"
 
+PNBLACKLIST[libsdl-ttf] = "BROKEN: needst to be updated to use freetype2 pkg-config not freetype2-config"
+
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
            file://configure.patch \
 "
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index b165e9f..f387ce2 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
 inherit autotools qt4x11 gtk-immodules-cache
 
+PNBLACKLIST[maliit-framework] = "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
+
 DEPENDS = "libxcomposite dbus gtk+3 gtk+"
 
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 903825a..0fa8ac2 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
 inherit autotools qt4x11
 
+PNBLACKLIST[maliit-plugins] = "BROKEN: depends on broken maliit-framework"
+
 DEPENDS = "maliit-framework"
 
 RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
-- 
2.0.0


