Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4857963D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:09:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v17-v6so969973wrr.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AFjRK3vlaveHmDGXehT3vyjBomRojgDGdalgTdIRo40=;
	b=iEUivWlhdvlw2M998y73+q+tY11OX6cxBZuvVFJ4vQ+m8Ik5hdtGD8vEJEvz54sj3y
	IcrVHrat8SnEGxgDXCxJHnmnzWujCs+mQn/By3a3jin9UTU8sHaG8n1+jJqAHpYVDVoO
	k+sxLjYGPvNKl/cI5vR+/RnuQm5N8F6fyWsPOAaRWC/gUmvjHShfQ/BGYXdKOK4Jcwy8
	NgsfEXklY9amZNI/V65fbedQzBA1jU9OzaCCyH3wz2FOwVntE/DkRUNXVvvFHJX+ubX9
	3GFyyf/iZ4Z1nQvc90HTdpVrH81zXPcaCDIbTYbiq3AraVpCnMtwZ6Fs/5MQ5ve+wk7y
	cLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AFjRK3vlaveHmDGXehT3vyjBomRojgDGdalgTdIRo40=;
	b=B3V+SzLBQnklj40syph5I6yFgCZ8DUZqv1fCpeOhCyxQjzr9rzYf+IZlYsKLz0Us7K
	Yl2BAvW4EpXDbxiouZA9zV18huY9u8cdyDXTC2oQd787jHnia2MxjCaxbL5S1gxhZO0e
	gwLrqnva2Givg9mxC0R4zvK4ePa6fz/+veMy/SR4+a+mwKAitx5eR6tqQSROUfVm7Ar6
	hVZnnkVHwG5xUmyTIj8OiURuUtrQ40YyGeXBtsgofTSsFbuhurJxPG8QmoghMmJ5n1CM
	1GgSVVlZ0okaX4edYEZgpF8gYX3wGoBHQRfUtFwmEcasxpAa8YUE8QkBNqYlVIZVy5Ue
	gHhA==
X-Gm-Message-State: APzg51AGI0Ei2aRe44dOdwO48kkvjHDPyWZv4W+GsuHop8IS1BqoDTv4
	cGILSciako0WvNgB+kmrr30goo/2gz0=
X-Google-Smtp-Source: ANB0VdaBlMns0n42Iw4rIYXzn+cfMJMqphoqCSgWxaImI8oQ/7K4NhrrD1KQnsosdYLPm9NjskS60w==
X-Received: by 2002:adf:f687:: with SMTP id v7-v6mr561048wrp.201.1536739758528;
	Wed, 12 Sep 2018 01:09:18 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm695325wmt.30.2018.09.12.01.09.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 01:09:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Date: Wed, 12 Sep 2018 10:09:13 +0200
Message-Id: <20180912080913.12819-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH v3] networkd-dispatcher: new package
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
X-List-Received-Date: Wed, 12 Sep 2018 08:09:18 -0000

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for networkd-dispatcher.

It's a simple package containing a python script that needs to be
installed together with a systemd service and an example config
file. There's nothing to build.

Tested with current poky & meta-openembedded master branches.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- skip the package if systemd is not in DISTRO_FEATURES
- use -D in install for new directories
- use deltask instead of an empty do_compile() function
- define PV in the recipe as <version>+git${SRCPV}

v2 -> v3:
- used 'do_compile[noexec] = "1"' instead of 'deltask do_compile'
- added do_configure[noexec] = "1"

 .../networkd-dispatcher.bb                    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
new file mode 100644
index 000000000..050a93824
--- /dev/null
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
@@ -0,0 +1,34 @@
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
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
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


