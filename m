Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id C9EA26AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:37 +0000 (UTC)
Received: by wizk4 with SMTP id k4so57994229wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=33l1mGtqdO1uEN0v2P8kLAstZXFmHtWyoIwksmhdj8c=;
	b=hT9+ugLIrUHbIzNLG4ohWV+RN/U5fB+FYxx7P0MkeDkWe1aJqBZrr1iaja0WJpwKjo
	/Tgsn1GELH2HBdxlTvjZKCCQ2kK23bPytOykJOMaW+iRcI+j+s+M4JJMm9hFXvijP9sE
	1pfjR/xJMhrgMx8NgVpc5lvxc9XKfZd7lY9NBqzACu10xoifuTu3qCWKil7RJ9V0CyQD
	ctCx/0oMcpybeMpd9CakdMx9D29diJ0GEt9D/ovD05Qd/C8FHg1fOrDVUlV+KWefDYkR
	h4lQ+vVQ/1v4aXkos4eBg7KY9PfPZcMmYobnTqdSnj+LaWtC0HAX5qmIMoV2yhEhrAcK
	AAZg==
X-Received: by 10.180.74.144 with SMTP id t16mr34153388wiv.33.1432588478426;
	Mon, 25 May 2015 14:14:38 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:05 +0200
Message-Id: <1432588449-31413-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] orage: update to 4.12.1
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
X-List-Received-Date: Mon, 25 May 2015 21:14:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/orage/{orage_4.10.0.bb => orage_4.12.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.10.0.bb => orage_4.12.1.bb} (53%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.10.0.bb b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
similarity index 53%
rename from meta-xfce/recipes-apps/orage/orage_4.10.0.bb
rename to meta-xfce/recipes-apps/orage/orage_4.12.1.bb
index 8164c3c..a2f2568 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.10.0.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
@@ -6,14 +6,14 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "b33fa272d92f539a224a7a40b1926dfc"
-SRC_URI[sha256sum] = "6cb854f3437e31bab23abfce97bd10afa1636a9a1480d80e14e26c85d06be7c0"
+SRC_URI[md5sum] = "2b7f5d38cb5c6edbcc65d0f52a742e46"
+SRC_URI[sha256sum] = "3cf9aa441ae83c8688865f82217025cdf3ebaa152cce4571777b8c2aa8dd9062"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
 
 PACKAGES =+ "xfce4-orageclock-plugin"
 FILES_${PN} += "${datadir}/dbus-1"
-FILES_${PN}-dbg += "${libdir}/orage/xfce4/panel-plugins/.debug"
-FILES_xfce4-orageclock-plugin = "${libdir}/orage/xfce4/panel-plugins/xfce4-orageclock-plugin ${datadir}/xfce4/panel-plugins"
+FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug"
+FILES_xfce4-orageclock-plugin = "${libdir}/xfce4/panel/plugins/*.so ${datadir}/xfce4/panel/plugins"
 
-- 
1.9.3


