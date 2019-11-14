Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E8D157F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i10so8026338wrs.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Him4DGc083CprC7ieTmSOGXumx99ne82QdcTOTvZx/M=;
	b=YNEswXLjrxYzUUeaH9sNF38fLk7Muo3sxUAMeNbh858o7MIUlPDzh4Ux6H4JE8P3MN
	qI55aMuXuNHsi+VORytD20Ik6hNa/N3ra1BAvXufbyRnnhLJoU66uVR+ANB5KhWmWWhV
	HhqQHzqL3rFc+dw9zxHLqRt/Tm2cRzmjQERT3curDsFBjv0N7jRmirY9UnUNOxE3cJoW
	6iwRaBrPjIHnhzZkloF+QOIeqHO8SxSaQO+cfM2GP7M3LIJs6wdqKMvC7PEh03Nd7C3b
	QjpyreEZy4o7tYXxenEUw6dpsIN2FRFUU4/UsflPCmQY6Ysw6J0/r0HgIk6DqGsdqTWm
	+bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Him4DGc083CprC7ieTmSOGXumx99ne82QdcTOTvZx/M=;
	b=ZDa3p2HmwuQfW6wPUU/+LptvxZajy/lDQgD9Pr8pL32hTKEdPzAi6723GDxx6Ov9jo
	yqPYrL4zKvsOztsYJ1n1ch+Hd4yA/fqfeFKRONH1AVOsMWdd1ydYiuGSrqxdYlQ0o7x9
	CZEtA2oVskU2K1L3adELh4dmw0LgI7xwMc5NbFVGMiuIbbVC7pBCffx1lD8cP4bj6K8k
	VrKdBk2jRzHFpGdGdqkMHYy5JFF/EwjHrukf6LY5ctFE6AP03r5TIhGfMApCTM1qW2we
	+ualOwdSTBkhKeJXMOhgGS9AF5ZLYs2mMEOZmDeeMSwwXkZ2XtZLRz8cMnH1s29G3WJk
	7yeQ==
X-Gm-Message-State: APjAAAXr9KTjHUTk0/ns7GJhExSdUYQU+XCOWBmNBF2Fix8Clb+HbQfy
	Oy+WZ6S8eIl6jTyxxtMiGa1Oxk5s
X-Google-Smtp-Source: APXvYqxednxR7yWw0ZKVqBiVDv1wUkt4NHPt4MPIND7wK8ojihVf2aF+IcnZ70U1fGMd+8WeIJ919A==
X-Received: by 2002:adf:e803:: with SMTP id o3mr10366183wrm.326.1573760989519; 
	Thu, 14 Nov 2019 11:49:49 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:25 +0100
Message-Id: <20191114194930.2786-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/16] tracker: initial add 2.3.1
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a dependenccy for upcoming nautilus 3.34

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/tracker/tracker_2.3.1.bb    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
new file mode 100644
index 000000000..ad65630c1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Tracker is a file search engine"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
+    file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = " \
+    libxml2-native \
+    dbus-native \
+    glib-2.0 \
+    sqlite3 \
+    libarchive \
+    dbus \
+    icu \
+    json-glib \
+    libsoup-2.4 \
+    libstemmer \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection vala gtk-doc manpages bash-completion distro_features_check
+
+SRC_URI[archive.md5sum] = "5e75b611b190c4cebf53e3de15266429"
+SRC_URI[archive.sha256sum] = "b6748726e465ad2f4d991560634b1fd0df8841f3d981b3b837c4162abedf08a1"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+PACKAGECONFIG ??= "fts"
+PACKAGECONFIG[networkmanager] = "-Dnetwork_manager=enabled,-Dnetwork_manager=disabled,networkmanger"
+# full text search requires sqlite3 build with PACKAGECONFIG[fts5] set
+PACKAGECONFIG[fts] = "-Dfts=true,-Dfts=false"
+
+# set required cross property sqlite3_has_fts5
+do_write_config[vardeps] += "PACKAGECONFIG"
+do_write_config_append() {
+    echo "[properties]" > ${WORKDIR}/meson-tracker.cross
+    echo "sqlite3_has_fts5 = '${@bb.utils.contains('PACKAGECONFIG', 'fts', 'true', 'false', d)}'" >> ${WORKDIR}/meson-tracker.cross
+}
+
+EXTRA_OEMESON = "--cross-file ${WORKDIR}/meson-tracker.cross"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${libdir}/tracker-2.0 \
+    ${systemd_user_unitdir} \
+"
-- 
2.21.0


