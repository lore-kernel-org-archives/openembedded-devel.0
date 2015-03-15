Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4F47391D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:03 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so27056217wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=dxwijRc2ef4ze55BpUAr0BZ3sGzBM+KVwZZIB57Q7Hk=;
	b=SunNgRUuYdI/6XupM2+Au4VBURgrB01OCrwODZT9N4dcrLDMEhE1W23bZxXgUskDiS
	HDh+TWz3zhtls4hd/9S6bmiIt3jtXfmIlwIvII9zgeIc5YIcusmopkY//y16q6mRNuN7
	EEqZGORWMF79ApFOGLGXO7kiRbiPiWdlFH9bQQSPUfgTaWc58qFi8ubkiHlAvkOs4+FS
	FAPovDnXvGzW52DHVh2jds9047l/21mnn7cfmHcJ+FCsleVcTViljCOz7g9oyJDjDz3K
	0wQxqO1bHeBxDHj7O4MGvtYXld8oQrEaxg/4UYTxwhg5rhA+ZaFp7n3XosT/neqACr2Q
	ET6g==
X-Received: by 10.194.191.228 with SMTP id hb4mr119725597wjc.116.1426462444509;
	Sun, 15 Mar 2015 16:34:04 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:17 +0100
Message-Id: <1426462419-10173-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 08/30] xfce4-panel: update to 4.12.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-panel/{xfce4-panel_4.10.1.bb => xfce4-panel_4.12.0.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.10.1.bb => xfce4-panel_4.12.0.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
index 08703e7..9ac99a8 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
 
-inherit xfce
+inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "8a1f8371fc725ba00f4594c5c0f81c59"
-SRC_URI[sha256sum] = "573052ed1b65e247415f92df120c8a78f9e4152c2636d38c923f82e32b8475d6"
+SRC_URI[md5sum] = "5a333af704e386c90ad829b6baf1a758"
+SRC_URI[sha256sum] = "30920fc2e2fc26279a82b5261a155c2cc15ab2aa1ced2275684a6ff8261b97b0"
 
 python populate_packages_prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
@@ -23,7 +23,7 @@ python populate_packages_prepend() {
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
-                ${libdir}/xfce4/panel/wrapper"
+                ${libdir}/xfce4/panel/wrapper-1.0"
 
 FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 "
-- 
1.9.3


