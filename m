Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CC6E776BF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:31:25 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so48704362wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rzjJqVsY52uAwi7m0Ca8c+6HqiDjiWzwkTjgKjPr1PQ=;
	b=EKOStWStBa1fKE/ZnM2eUeMHn75GqVLvLxvPJvajuyKx5KF/uq3d1hRV4E9gYzCVfF
	3baTCtH9edT8FBrTCZnItBPOTVODqj02bCxcgzA61OGn43eS2xUEykR/BYPOBBDRP3dU
	kw7FW6MXXAupDRUywQlUKoGdmy1i3eIzN7S6LdY9ns/HlUvrfqmYEm5NxaoBAGCGdbBd
	+R3xlQ8JeTIqMZ6K9wOSTKJBtQn0XVLLLEeP8NpBFLfVthtm0yWOl18D8wWmqy/lrdrx
	HGFkSXkhkFv6xmZzy9jYSrAc1kDYECZgyIz6g8PjpvJgB/eQPzOES9MtCoxbHXYaKZ2g
	gFwg==
X-Received: by 10.180.86.163 with SMTP id q3mr29262760wiz.75.1440419485091;
	Mon, 24 Aug 2015 05:31:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bq7sm22963494wjc.31.2015.08.24.05.31.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:31:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 14:31:26 +0200
Message-Id: <1440419486-29461-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440419486-29461-1-git-send-email-Martin.Jansa@gmail.com>
References: <1440419486-29461-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] gupnp-igd: fix missing dependencies
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
X-List-Received-Date: Mon, 24 Aug 2015 12:31:28 -0000

* add gobject-introspection-stub-native to fix:
  | doc/Makefile.am:70: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
  | libgupnp-igd/Makefile.am:65: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
* add sqlite3 to fix:
  WARNING: QA Issue: gupnp-igd rdepends on libsqlite3, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
index 112bc4b..667f7ef 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"
 
-DEPENDS = "glib-2.0 gupnp"
+DEPENDS = "glib-2.0 gupnp gobject-introspection-stub-native sqlite3"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "f881323304185c02634034e3bda714ba"
-- 
2.5.0


