Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id A75DB7036F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:22 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so6611279wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ndJcgUwAGBXAKyr2TzXzVa84eBIfHITTGJ1XvGgLxfs=;
	b=OAWLx/H21jJ/N4cnDl99JUhcc5cxHFMaFnpkgUZt2cYh3xOHWaG9xhvmZmokp8B6Ak
	sXFuwkJ0qGXFFSsvo6AkmtQHlFeyaetNZWmskb5K1TjKbMWUeO179vWn8ZJ0QbgLxEBc
	6KTMnF2vkML/nHr42TcSml8QM9Y1ZWCo8I7lMtxxU5/ZPnUqYl/jclymIwbnK85FPXkj
	ewVeM6iY5T0KsNWD49zOoayF0tDpC0qUmHO0mO0T+hvz4wGrnMmdt4DuvsnHXvtTonLX
	BULB8lAqESnylzo5XLmCUpwzIU1MpY09tQkKM4ZrTgmVLzwHw7A9FgESt06dQu2e9B5M
	WVvg==
X-Received: by 10.194.62.140 with SMTP id y12mr31982692wjr.27.1404729924066;
	Mon, 07 Jul 2014 03:45:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u10sm88598450wjz.43.2014.07.07.03.45.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:14 +0200
Message-Id: <1404729919-2903-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/7] clutter-box2d: blacklist because of B!=S
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
index 4bac59b..b19110a 100644
--- a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -2,6 +2,11 @@ require clutter-box2d.inc
 
 LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
 
+# 0.12.1+gitAUTOINC+de5452e56b-r1/git/clutter-box2d/clutter-box2d.h:226:47:
+#  fatal error: clutter-box2d/clutter-box2d-child.h: No such file or directory
+# |  #include <clutter-box2d/clutter-box2d-child.h>
+PNBLACKLIST[clutter-box2d] = "BROKEN: doesn't build with B!=S"
+
 SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
 PV = "0.12.1+git${SRCPV}"
 PR = "r1"
-- 
2.0.0


