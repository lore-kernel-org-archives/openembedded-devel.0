Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4730576953
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:10 +0000 (UTC)
Received: by wijp15 with SMTP id p15so165106042wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=qAqLdPVhqxhsVZT7ilW2xcIy0eA5Ot79Jl9pEQ6dMsY=;
	b=VI0a9KiEFd2/PGFcZfL4ZfLITGmA+GL6S+xXyHpcnu/3vMaHKPMP+Kl8WYbnTnHvll
	qkATwohiFXvKXeBA4ri3c4feqDLzukaOmIE/dVEyCpKdcNefvMVi1lMbGqZvZAdjB021
	zIApjz3XDpYLyo2WkzsllCSLP0vqacxUC+De/gSk7T9q7k7/rXyTKWVDZlSmkpMONtFv
	WeZC+m/XN0Vx/BrzcOwm+K6rUR/nbmLQC9Pd29gojr9aGaFoauVzCAN3Q0weHy7BQzEn
	Q6ZAiOE/ZqQ8EcTsoA45WE4Bbo/cGGj1rtAl0azrrKViacL4NooSqpfVKYdZoALy6AEZ
	CPqA==
X-Received: by 10.194.203.138 with SMTP id kq10mr56795172wjc.124.1439279890909;
	Tue, 11 Aug 2015 00:58:10 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:23 +0200
Message-Id: <1439279859-1815-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/17] xfce4-panel: build gtk3 libraries and ship them in an extra package
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xfce4-pulseaudio-plugin depends on gtk3 panel libs.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
index 9ac99a8..d41f9ca 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
@@ -2,13 +2,15 @@ SUMMARY = "Xfce4 Panel"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
-DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
+DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtual/libx11 libxml2 libwnck"
 
 inherit xfce gtk-doc
 
 SRC_URI[md5sum] = "5a333af704e386c90ad829b6baf1a758"
 SRC_URI[sha256sum] = "30920fc2e2fc26279a82b5261a155c2cc15ab2aa1ced2275684a6ff8261b97b0"
 
+EXTRA_OECONF += "--enable-gtk3"
+
 python populate_packages_prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
     plugin_name = d.expand('${PN}-plugin-%s')
@@ -22,8 +24,14 @@ python populate_packages_prepend() {
 
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
+PACKAGES =+ "${PN}-gtk3"
+
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
                 ${libdir}/xfce4/panel/wrapper-1.0"
 
+FILES_${PN}-gtk3 = " \
+    ${libdir}/libxfce4panel-2.0${SOLIBS} \
+    ${libdir}/xfce4/panel/wrapper-2.0 \
+"
 FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 "
-- 
2.1.0


