Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B9D2A7F8DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g206so5985319wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=X0XPTFQSGXroYuh5TU+uajysIKLSJmjLi1gJCRJyDiU=;
	b=HrG0syLhsTlJFGMCIZXOSWLNqOz4sCeMCcWS52Rz9c0FdupA+Lc51lAzEcHwvTCGB0
	Ma+ac+dD569uLGmqjFJyX3RgrRt1d2OuLtOmglGQbBrMA+YMGsTYEyapi15GqVd1nTBK
	KlewPCEioWNOOFj0t7/okN1ABHS0TGUGVRoXqyGx8N4S4qBWvS+ooxBrkXUpWMjYVNie
	1aqyKBMDs3TS5AkRJFnD1hTdnYzgfz4jIsw13EnRwtCA+swRpQr+hAlSgWysEj0wc5KA
	p6VSFD8rts0e+PA88jZlqjnIKwEW55sLxU74mEKS4sf8BxbA7QXCTjacKdKKbZYaKqkt
	Ffyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X0XPTFQSGXroYuh5TU+uajysIKLSJmjLi1gJCRJyDiU=;
	b=aFo6UMU258rReq9NJ3wlSn2GyCP7z5yW9SRNDEwgyURwzc/Tt0LJvZdXfMHRR0KokH
	Haln5RoukNlwHsqf1W1J6wB100WzfdbE2SqNwpssGrnuA1RB3knU7uOud0yCBiCBfjRK
	xUGUNTaTc0CBNQBttNpPD9OGWq6OtLnsWy15sVtopcbdNOET1vG1ilPBl3COOPeTaeKx
	va/5bZRVdYbqUrZBcEj8aT2hv/gm1LIppYEoWIR+K0/EArv0XzTIukMamtBecjG9u9P0
	I5Yd5DodsS7DRsFdeuMRjS2P+AYi+bdcfFRchlObRe8XadwaHPPP4OYEkvt9jtKNIWHB
	tqiQ==
X-Gm-Message-State: APjAAAXHd8lJX0YJDTCdazdMA8aL6ZMFRLu217jheDbmc7zwCDeZcmR4
	3GZDPNjSUtAJ/xvmyHT5cd2uHsqr
X-Google-Smtp-Source: APXvYqzktngNULYAmwQMmFnAPDnBZIkRBE8XuDAO7BJAymF1LG2IA5AEkmxOtMR+4nyhJiXF0lyzlg==
X-Received: by 2002:a05:600c:257:: with SMTP id
	23mr7440910wmj.123.1575590976460; 
	Thu, 05 Dec 2019 16:09:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:03 +0100
Message-Id: <20191206000912.19841-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/21] gvfs: upgrade 1.41.2 -> 1.42.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 1.42.1 is latest stable release (and I don't understand how 1.41.2 got through upstream-version-is-even)
* @world builders: x11 in DISTRO_FEATURES is requred with gsettings-desktop-schemas added to DEPENDS
* gconf support was removed ages ago

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb}           | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
index 27e3f92cc..6888eff8c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
@@ -3,15 +3,16 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase bash-completion gettext upstream-version-is-even
+inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check
 
-DEPENDS += "libsecret glib-2.0 glib-2.0-native gconf libgudev shadow-native"
+DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
+SRC_URI[archive.md5sum] = "93592535508322548d44fa036b635a0a"
+SRC_URI[archive.sha256sum] = "9d06071b4a1d83671f76d0e3c32b66631671669d330fe21702f60a8611c37730"
 
-SRC_URI[archive.md5sum] = "9a9a97a63bb9e87258d48086a6bdacaa"
-SRC_URI[archive.sha256sum] = "f311b7c5f855ebe259960c00c7d03c812e040928ecb0ec093b50a4f16b3bcf26"
-
+# depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OEMESON = " \
     -Dbluray=false \
-- 
2.21.0


