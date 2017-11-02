Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1994D7822B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:52 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p96so4516396wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sMLyvZe/3n6yEqGjto479vNG81VEMFZx4grKDMhJ9aA=;
	b=SpqIUkvPJ/t1wUW6NYUkBPcpPPNxf2vRQ9/p1V89DYiMqFLGVofSoApGuMwWfDFtQI
	bKuldCzXC+tecD7M3CaWdou9qoewTYI0rVsfPWYvXWSW2msjaiXy7hV5S0VaY2vJS6Jx
	KgYB/l8n9onhs9qhM7l7j9EAi6sLNl2Mb3O6NhQ+e9MPO0Fb1p5d2/WfWUjM30xApLyi
	YkGT0ywcUhgPxatq0M6vTLzsQzoXj9lsRuFJveDflo8p4DGBGf7oDca7L62+ZBkOfsFo
	Ks6FiG0guUbq0sYxBTkvXLx7m4+oOPwGnIU8jXqbwqRMcnzgXA30PlLKSAtIo0vzs7AV
	wmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sMLyvZe/3n6yEqGjto479vNG81VEMFZx4grKDMhJ9aA=;
	b=GpKeV758uM/keFkaObK4EbXso2z/zwJO09XeRNOwKqB4qFlZ5o7mG1XZIoW6uiA3zj
	DY5pyyT6+HPUUClvywYGIbv0pYi/zeEGiA9KyRgHQc+83XsX1KkUjmygD7H6z+Wcodpf
	Ak6KPOUZ3zz5N7ncfPXiw0lAUWZHX7fQ4Fvn1Yn6VFXcHCLVUOMv0fC//snt93/CaNLD
	BS2Ux9/lGuzoeq7sYxXza3PLEbbQT7TqAfSEExCn9BECiPLMSc//4YtDmy0Q/H0wA3Gy
	WE3Tg1WJYTAG2ZudZrdJd/o0u9BfcFpVBjeWSc1niv2xwW2AUmRyT20bhYMoY7sSnmUe
	7c2g==
X-Gm-Message-State: AMCzsaXl4JfYTghY7vZLQBVXHgfABTt+3v1zdolwFB8Aatuk1PsByFwp
	czSmepHVP8JfqoMhm+ruUVkzRQ==
X-Google-Smtp-Source: ABhQp+QQSyjatzQ8OfrzeL0Z9+jLMigcCobBFJ9tL5yXJWJCV6rt0ysziuN06c+Ubli92mTEkJyCQg==
X-Received: by 10.223.170.154 with SMTP id h26mr2380251wrc.87.1509618713493;
	Thu, 02 Nov 2017 03:31:53 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:24 +0100
Message-Id: <20171102103129.3703-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] xfce4-notifyd: update 0.3.6 -> 0.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 10:31:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While at it rework dependencies.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-notifyd_0.3.6.bb => xfce4-notifyd_0.4.0.bb}   | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.6.bb => xfce4-notifyd_0.4.0.bb} (58%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
similarity index 58%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
index ac2360a..0ec6b63 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
@@ -2,14 +2,21 @@ SUMMARY = "Easily themable notification daemon with transparency effects"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify \
+DEPENDS = " \
+    dbus \
+    dbus-glib \
     dbus-glib-native \
+    libnotify \
+    libxfce4util \
+    libxfce4ui \
+    xfconf \
+    xfce4-panel \
 "
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "19e602fa5e33afaf7563f069261ae1db"
-SRC_URI[sha256sum] = "f4ca7c0dadd3d4cdf8cd3c8ae60ccea77b8cf409f8517161796364eb1d766cf9"
+SRC_URI[md5sum] = "c2de09c30b06eaf2d3faaf3e509d656a"
+SRC_URI[sha256sum] = "2771871f67effc0bb80f656cf4aa3cd71fe0ea0f4c04b5d8e97bb1752faf36c9"
 
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
@@ -17,7 +24,8 @@ do_compile_prepend() {
 
 FILES_${PN} += " \
     ${systemd_user_unitdir} \
-    ${libdir}/xfce4/notifyd \
+    ${datadir}/xfce4 \
     ${datadir}/themes \
     ${datadir}/dbus-1 \
+    ${libdir}/xfce4 \
 "
-- 
2.9.5


