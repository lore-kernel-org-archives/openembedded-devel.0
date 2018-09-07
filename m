Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8847F797B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 10:55:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id s14-v6so5541022wrw.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZJELj2ZnzPNs8VQKE7iGpkM0YGwx6KzybJBPFVdvDRM=;
	b=i+I2hjC7AEI66KuPa9C2CqPfL151whT+brgmo+poNLbrzlOhlOzgQadv5H/VW2S9PV
	likjM6oKy3/LmQcHscePEvvVP/0wGRijkPn7f/6kf1T6uHo4SK4n+SK2/9MSpfF0hedp
	4FnYeN4kykJheQXoTWqI34jv9gebf5YFHuAMTKjLFt9XiYBIPWTl8AwHcv+OLbYeSB8C
	L9rKlb7r2MNzZ0RELU7kP5ZGBGSUG2m93g41T+NIt7/Ly7HIFuu80Pgg3SR4GhLH3D/n
	IuH8KNZdro42W4ugTPwDB13pP61OcR6LnQImFlRHq8W02BdNC56qm98O29djROlpctG4
	iXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZJELj2ZnzPNs8VQKE7iGpkM0YGwx6KzybJBPFVdvDRM=;
	b=FOtyG90elqZb8OdhP0soogdBrtcIF6F/2ozsnR+FVauIP7KEqzdkFhE5l9A9MjA/Z2
	D0cmA9VtPIJkcu7W02/8jLL9I/o9D4gRJg0+tSCKmVGZfErKF0Mcnkju3BhU8CaLOLs/
	ql+rXMDn50cN4Unovm/tgX46qoSNsmGOGRQVFhYKScVbxFORJIEv733FyH5BNzeX8/kG
	00lYz8Bw9zUZvY7IqgMkh3Qy/wPAiaYkWlWX0HZCHiiqW8UAuDm+WtMXRlhDpMScP6Bl
	PU7I8n2xP01kXfxwuPofWw8UShloUD3NGZDvxEjKbSdlV4o8sJXLXDXsUDDtS1rwU7pJ
	jJ/w==
X-Gm-Message-State: APzg51AkxH7VYq96giAy1LWNx8Zu3kpkRV47xvrKDrVFm7GLJ6cBlNcZ
	wAJJOKr9UBVq7gAcHwQ+bHpJ+Pgb3f0=
X-Google-Smtp-Source: ANB0VdZO7/oA38ZjdgwC+aFydb4WV8TGwftDtxT85wAXyO2OaNOxbAJ8mzWgSh0LXXGO69/vzMD7bA==
X-Received: by 2002:adf:de85:: with SMTP id
	w5-v6mr6182423wrl.270.1536317717991; 
	Fri, 07 Sep 2018 03:55:17 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local
	(AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
	by smtp.gmail.com with ESMTPSA id
	r66-v6sm13463643wmb.37.2018.09.07.03.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 03:55:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri,  7 Sep 2018 12:55:15 +0200
Message-Id: <20180907105515.18840-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH v2] networkd-dispatcher: new package
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
X-List-Received-Date: Fri, 07 Sep 2018 10:55:17 -0000

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for networkd-dispatcher.

It's a simple package containing a python script that needs to be
installed together with a systemd service and an example config
file. There's nothing to build.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
NOTE: resending with a proper tag

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


