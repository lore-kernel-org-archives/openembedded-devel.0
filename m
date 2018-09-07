Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id E4A54744E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 10:21:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w11-v6so14430613wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Hdyf94FHo/73IRfyvhz8YToQ5VZdWWDFfnQ9GuMRokE=;
	b=VTTr/plb/B+xWWsIFYEqVzI2tNzqkyNIVDuxUUAA+s9FdAcoqvTQQNM/11Jh2gfzeg
	rq75TiGZqG1iGcWzDraORsnnTiEJqDc/FT0y8xpTKEEXCttltHavxQdlVJg+5coNi0be
	7p77cAVL4lhaI/W5UXmfWL5bZmnwz9FfenApwWZEM0gCnFfuj9YNEuJKKI4C9NoWWpzt
	XqPEj79GMgWW92jJJSNIhfpIVZCiJP++6W+FOps1u8CbmQRmHC5G8OS6QooYRO9wOKrk
	0GDznbp6ZcHOyi9e1d8Ftv9af3vGdbxzBVcfav56G048kwY4ze3qntpGUYo7H1p0Kk2W
	6z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hdyf94FHo/73IRfyvhz8YToQ5VZdWWDFfnQ9GuMRokE=;
	b=kDLANIQolI/8SidA0bJyV6GTFt10dxtkJEqPxQMtaHpmaM80ZuaQuLN55MJN4jOyrY
	N0FFR+8ngzYxZ6DJFuqAixt/aMpqLRMcdqZgJQ/v7IqQQw3XRL0nBiMD/Xhz8iAE3Dl3
	w/4Gey1iSkip4a6QN1IcWHwNOhUSqISBf8pFwPkFGZX7sPNVPNRvs7OE9A1h6NMMbJgD
	/XX3PWmsTqAbtSJyMnU5zLhIjO0Oonkkk4G0Nc44qANov8r/MoZ7VxetZJzXPJa5bdjH
	Ht4E3KgkYEVy1HxeHruNdVXLRlZl40dI1VCxYORCLEi99vAP5r7Yjz55556AobbCzpqW
	IRWQ==
X-Gm-Message-State: APzg51B6bkCeG8EpJia8YXMOn5X8zATK+QOctJML3TeiUDWMudZk/bOu
	YqagfEpql/CJz8/gprQJnHDzamSTAJY=
X-Google-Smtp-Source: ANB0VdZiq5LVByJFvPmuriR2aloVC9+80iGahf9gGQk2oY/XEo7/sryeQAxKMbsvDdbmgOJTTZ2dpA==
X-Received: by 2002:adf:f648:: with SMTP id
	x8-v6mr5783245wrp.144.1536315695233; 
	Fri, 07 Sep 2018 03:21:35 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local
	(AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
	by smtp.gmail.com with ESMTPSA id
	m68-v6sm13653275wmb.10.2018.09.07.03.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 03:21:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri,  7 Sep 2018 12:21:27 +0200
Message-Id: <20180907102127.16144-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2] networkd-dispatcher: new package
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
X-List-Received-Date: Fri, 07 Sep 2018 10:21:35 -0000

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for networkd-dispatcher.

It's a simple package containing a python script that needs to be
installed together with a systemd service and an example config
file. There's nothing to build.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- skip the package if systemd is not in DISTRO_FEATURES
- use -D in install for new directories
- use deltask instead of an empty do_compile() function
- define PV in the recipe as <version>+git${SRCPV}

 .../networkd-dispatcher.bb                    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
new file mode 100644
index 000000000..7bb2347a8
--- /dev/null
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
@@ -0,0 +1,33 @@
+python __anonymous() {
+    features = d.getVar('DISTRO_FEATURES')
+    if not features or 'systemd' not in features:
+        raise bb.parse.SkipPackage('networkd-dispatcher needs systemd in DISTRO_FEATURES')
+}
+
+SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
+DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
+more limited in the types of events it supports due to the limited nature of \
+systemd-networkd(8)."
+AUTHOR = "Clayton Craft and others"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
+
+SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
+SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
+PV = "1.7+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# Nothing to build, just a python script to install
+deltask do_compile
+
+do_install() {
+    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
+    install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
+    install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
+}
+
+FILES_${PN} += "${systemd_system_unitdir}/networkd-dispatcher.service"
-- 
2.18.0


