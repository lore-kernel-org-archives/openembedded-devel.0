Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 643867E42E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j187so4507606wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nBrMcUSpNQLb+wRgtlMg8N8WG2gaRk1fS2hc21pdvBM=;
	b=YZ2o9TRpqi0Na0FTQMTftyjn8PVF5S5L7le6oTCTmXavjYk7rDLemEetX8bfU2CVot
	zycbi7Y9Wp3qyhw2GuEKkK53zqRJqhLwSmjbyhtZ1/AyXNyJJdoN0eLjPc1nYZavasjp
	cm3oyIjCUcXXV9+9IQR3miKpsPpRsCnjGS3OWYE1UMMMHcdXoa9+2tMILyHjhQoQI8ga
	UCOiFGa8qfHwiafEsqkUqNXRr8TGTy0dyaATJcv9SjB1mu5W8RQ4ufjCk7iJMefjs0IN
	BwbAjpeC1tAVDRENW7ePQpRTXdpULII9cspL1colWteSOPbjmTY1o4nl7H6kDB/s+juV
	JwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nBrMcUSpNQLb+wRgtlMg8N8WG2gaRk1fS2hc21pdvBM=;
	b=LQtaQ0H/Pgj0wwJP/NJqeq7WMMjNWaW6fyDdOHaJBXv8bUYcGrreTo1+dMKrLWx4Cv
	4zRkRoXac7RtEORsvHej4PwlkNPBynd85bLDTVLUDCzruGGuJgLquhNT8FTGpiZmZnDL
	IWXim2REIQtjzQJV0Mt0Tp6jUgiFFgBleFbTOVbE4KWtF3ydIPTA4KsNQQY98o3LpwqD
	Rl2zI8l6OH+NOxqMFANU7F/vPVZWUIQ376bCXsFTquuUUWP4csOBJshSccTv5AK804m2
	Y7fYm+Bgjv4bctXB4k3M+E3a6V6rXVFCYhtI7wpQdhBIWKIUjyVgJveKROsp+x3mna92
	FAUw==
X-Gm-Message-State: APjAAAX1c98bf3u78l2MXnK48fBF6fS3D9jXZApW1GwK/lBCE6O/EFKa
	zDVoVvWAoitESkjXZblxjtASqzL7bzg=
X-Google-Smtp-Source: APXvYqye28v3VLTw1wRN0hjJbAO/vx44y+c5ojAX3sPOdFHvkBDtzxQs0xb42kCpRft1kx9H0ZeQ1w==
X-Received: by 2002:a1c:9eca:: with SMTP id
	h193mr10103842wme.125.1558594167993; 
	Wed, 22 May 2019 23:49:27 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:41 +0200
Message-Id: <20190523064859.24336-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/41] tracker: initial add 2.2.2
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
X-List-Received-Date: Thu, 23 May 2019 06:49:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a dependenccy for upcoming nautilus 3.32

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/tracker/tracker_2.2.2.bb    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker_2.2.2.bb

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.2.2.bb b/meta-gnome/recipes-gnome/tracker/tracker_2.2.2.bb
new file mode 100644
index 000000000..4c9083fd5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker_2.2.2.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Tracker is a file search engine"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
+    file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = " \
+    libxml2-native \
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
+SRC_URI[archive.md5sum] = "2ec18c6f9e877abdfe1f50bac0e9eade"
+SRC_URI[archive.sha256sum] = "c6a73462f9aa9c32efa139003d2abd2ac5f70f8af6ce744729954975a661e2e6"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+CFLAGS += "-lstemmer"
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
2.20.1


