Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 249ED7FA49
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n9so13048098wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=X0XPTFQSGXroYuh5TU+uajysIKLSJmjLi1gJCRJyDiU=;
	b=ogm/bdo4FDXTMPRSONWEzjlFmCQw54HJj6LQyGIZ6F5xD9/vdlhrxZcOO84Ktnqih9
	gbo+xNlFmBzGmJB2cZpZh0cuU+vM13vVwPN9h9uBGKwfyPWx9DRp35fIZk04dtu3jE5g
	5ZSP3y4U2w31xz/CLWGe0TzU0EbaAY3QJn4uFnPn5cM6wbot9duQ7m5hd4OUdnJ3X09h
	136VZ1uwXGuMcRMnbnp2yhpjXuGSjB06vF8ujQeFQ0bnRRChWm/s4Qh9IdAB9WedLJri
	7D/FrHsz3QYV+ZBB/Jhjg6tV3DSG9eDndc09otT93ol4AypB10BbXrfW/FWuVgDDzkhj
	hBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X0XPTFQSGXroYuh5TU+uajysIKLSJmjLi1gJCRJyDiU=;
	b=bMyBzjfB0h6Efl98s/BYkKRk0JZtoqpmhLV7Zx0xK0E1oNN4zGqieLt/SxjIMJ/ECR
	TLmzO6L2Qzqh0gEupu6xP83xjjoZNd8Niddwk/EAIk2hx67RWlJ/Xz41DNGei8fMbpZi
	8eqM6OvDYxHlTvXuZ2JlQSF4DO+JzGhA6eQQLox6ZZQs4D3cYVaRlSW5YOU/LhoP8tl6
	Xt1oVF2NQGJgZ/KrAMThFvJKcPeo9+KiDdyyaX+1WV6JN4La1ivCx7uWCukfgmU2wnXZ
	V2tH2PceeZUaXBunkNbfRQKcE3lctlsB3M/gABYvXMffFJf3zP1Y8FPJdEPjGFp6dfYT
	0byw==
X-Gm-Message-State: APjAAAW953Xzw8glVD0bxGPAiOyl9wAzTd9f5Zg5wMFJ3+A9r0/LwuY9
	tb2hhuwmjOh72fEFLzFZvbjYh/Eo
X-Google-Smtp-Source: APXvYqy6k7kgn92dQeOaWUJCNSLD0EblCpkN07Z1CipQ0+XqzOP7wXlNeWsCjKu7qxnQ6kCuZSTTAg==
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr22795642wmh.30.1575851943473; 
	Sun, 08 Dec 2019 16:39:03 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:23 +0100
Message-Id: <20191209003840.3383-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/29] gvfs: upgrade 1.41.2 -> 1.42.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:03 -0000
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


