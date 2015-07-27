Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9A276385
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:37:09 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so127006123wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=coFaJR3mXhjZFn9xtIUyOX9eeMTCh2bpcLr7/15CCNI=;
	b=lwR3+XnTrDqtVDk7fbPe0OiM5aeboAdEIU53wialZZjqTZrtQyXmLyGY0gL/7oFtlW
	m4L0wdBi5uA3WmaP6CBdGYlmMsn2g7D8sCebUentUc+9vsqgI3T+r0646o8zXIEGpy0m
	ZBllarA6zvTuZN2+OsIOOjByY7N9v4y0jUf2FGYlKCYpXD4rEzsgirLd1qFK1ToXYtlw
	0Fr/XDwJwraivG8CPPIWpiYvt710JxSFnUqWKcSrp2mNvdMItFz+HHNL6Hd9rhzkoAWy
	Mjy5NiLNEQItabQTWgcC4R+AD3QHvS/Ike8sqBo+h3cJvv66GS7dhdvQXgJZID7UuA58
	Av0A==
X-Received: by 10.180.81.106 with SMTP id z10mr25711721wix.22.1438025829593;
	Mon, 27 Jul 2015 12:37:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k12sm23016995wjw.4.2015.07.27.12.37.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 12:37:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 21:36:52 +0200
Message-Id: <1438025815-31315-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
References: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] libwnck3: update to 3.14
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
X-List-Received-Date: Mon, 27 Jul 2015 19:37:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libwnck/{libwnck3_3.0.2.bb => libwnck3_3.14.0.bb}              | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.0.2.bb => libwnck3_3.14.0.bb} (70%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb
index fd0ecd9..35e07cb 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb
@@ -7,11 +7,10 @@ BPN = "libwnck"
 SECTION = "x11/libs"
 DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
 
-PR = "r1"
-
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 inherit gnomebase
-SRC_URI[archive.md5sum] = "e4ea87320dd0600a81c50186e3804aae"
-SRC_URI[archive.sha256sum] = "4946b612c22d53238810d431f1b05c21f073f201edfd247ff74e2fa228618083"
+GNOME_COMPRESS_TYPE = "xz"
+SRC_URI[archive.md5sum] = "4538672e0d775fadedf10abeb8020047"
+SRC_URI[archive.sha256sum] = "f5080076346609b4c36394b879f3a86b92ced3b90a37cb54c8e9a14f00e7921c"
-- 
2.1.0


