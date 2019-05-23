Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 319807E438
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f8so4899505wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5oixjeauqc0SwlfXecydz1lrRzF5gOdR5n9pMTU4iic=;
	b=eonqFuYcM4+YtjGkhzN4KTEJt7IGilFpszla6Cvl3694I5Z4zxQEIJ2RI9x+LzlOiN
	uQ2GMGSlGdJo8seWo3vGCCJi/29vxj5fFPXPbDC4t8IGM3d3asr6ALAYCDxKyqcnkXko
	6cCED0iPzQFRQcFqHGPx8Ug72wiRNno1dY3ZRal8CtAx9zMbK4hs0KBVunNUxouPFowI
	NjyVMWfXWglwx/oJOb3/XHm5KhNOu3zbrs6rR9SsRIdQTEOrxEk9rsTcU8LfXQ1j81+6
	8ClfsgZOVpAz3DSCILfgBTuaJv1M+9EO0dGrnZAW0oLyOog1XKF4d62tinJybEsMbAJv
	Co3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5oixjeauqc0SwlfXecydz1lrRzF5gOdR5n9pMTU4iic=;
	b=QFJJVoB/i2TBYoE4q5W8O98G9asthWPi7Bu7u4x79cfFya0oN6UkqA7gOn1ybwUFjT
	f3dX0d0Nlwe53wBzSGJw4fb5XkGxq/+jVrMl28BMa4J5eir3gvNe7ZLJ9LN9OIxRA6ic
	dnqD30vN8CYZzW4Z4QHA1j9Bq41udFmDwYdp9euCa1Qlh1eqNPOVc6gpGR755yVjPmIA
	emxFCfy8fs5rc0gIQv5CfyVZeiMDvuzHw23PjU9DzAYqRJ3zbKubbs/LYtjOjNrpYVp5
	LMkZBTnFDOjvBqEo5vtzRAWJmbJwPya2XKF0p9LdLoi4ajcSc9D8Or1NbTrvDMRPxeuZ
	NKow==
X-Gm-Message-State: APjAAAXpBToYhzUkV/tDCitjc8VRO8g5/oVDmGEtn51kzyp8L8nQz1Sf
	/9Cmnv14Yh3YRJLdEHXa0aMzZ78pd/M=
X-Google-Smtp-Source: APXvYqwOn22doj00+qrpAU35OM6tbMimv8GMjbP8GmcdVp+4ol22IF7YjfuQJnaxjggDaoGfR2OMPg==
X-Received: by 2002:adf:81a2:: with SMTP id 31mr56469226wra.165.1558594176732; 
	Wed, 22 May 2019 23:49:36 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:51 +0200
Message-Id: <20190523064859.24336-34-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 33/41] libgweather: initial add 3.32.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gnome-settings-daemon

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgweather/libgweather_3.32.1.bb         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgweather/libgweather_3.32.1.bb

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.32.1.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_3.32.1.bb
new file mode 100644
index 000000000..b9aa4ef7e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_3.32.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A library to access weather information from online services"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gettext gtk-doc vala distro_features_check
+
+SRC_URI[archive.md5sum] = "048de183cbeaf7353a875cb5ebd9b4f9"
+SRC_URI[archive.sha256sum] = "1c2218ed71230dd2c550ca4fd3dab53e2f2831d38982c213575f34e48d68e980"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+DEPENDS = " \
+    gtk+3 \
+    json-glib \
+    libsoup-2.4 \
+    geocode-glib \
+"
-- 
2.20.1


