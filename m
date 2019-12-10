Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id C79827C131
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 20:35:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f129so4688086wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=PjAXF8ajBDzmyKsOtRdcVCV8BXgUpNsWjaAtdAKOT6c=;
	b=k6RTsgNzCsg0Ts4Zu5YabzjSD21h8n5gv7DlPbAgHELtFyKR8sfh6aHBpMHL9bqvaQ
	uRnYIRUgoaLpI+qiGpSiHYmU9uughJ0PRfQj7nukQkVTeH4lHtvl++YwZgoaXF0keCuG
	tSn6dIdEuQHBcsqbpi7S++DqCYBWIEeW88tzdPLhLg0E/kZpJmQFvAhD0r4gyqXyq6Hi
	OB/1WTaPjwa8nriLyo2ZMBhCQ6p3uhw3HCqg6j15CcSJP8QJenItclLRbMCLfYdqXPFb
	Ptugp/x9Pq1vBo+ZJsn1NLsEjS1klUI4klhw8orwyd1YeiLzKD4rnl9p16eilVzM5Z36
	Tvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=PjAXF8ajBDzmyKsOtRdcVCV8BXgUpNsWjaAtdAKOT6c=;
	b=CsQqgHt1jV1apZVmUn86x/EhVgP9NRNbJh+7RGFCfodBjOHc9Gn0eHAlqIyPzSuf3O
	b1Clrx4vMnIXD6q6S3HXmsK38EFYZZOWExSC+7wX6kPPpVU79tvSNtUZjfSy9XPzjmNX
	gGJgfdVO2GoIvpDrOc4sisoWNd9GQN5q/Ugwtx9rEk89OfjdrYqeci9XdNP7+ZEVxl9O
	o52Oe3kU9lzj/90vxatAREsW7hEF37kfVfhW5V5x9fwpiIehZiW/AmqVBHEoPpZMX5Wr
	D7tv7hUH5lhNjOegUfIuMFrHPpGgugwF6wZZaFnQhtrtThc4CwlCknznQ+yvo2NYyg1M
	6J5w==
X-Gm-Message-State: APjAAAWau6OEwM3z2ce7ym4AWMtuYDXFYAvWLcKNkkhrdGpsw+1bHm71
	NNn7A8bmtu9zgpDVqRzftlQ+cu/pu30=
X-Google-Smtp-Source: APXvYqy7mdY6ytpgVC0Yj9zABU3G95lyEU1T7iaPJMhhON+LHD4Now+lrtle/t3k0aNa5xaLfNXcLA==
X-Received: by 2002:a05:600c:1003:: with SMTP id
	c3mr4840609wmc.120.1576010134412; 
	Tue, 10 Dec 2019 12:35:34 -0800 (PST)
Received: from localhost.localdomain (90-64-90-180.dynamic.orange.sk.
	[90.64.90.180]) by smtp.gmail.com with ESMTPSA id
	s65sm4503860wmf.48.2019.12.10.12.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Dec 2019 12:35:33 -0800 (PST)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 21:35:26 +0100
Message-Id: <1576010126-10738-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Jake Withecombe <jake@ruggednetworks.co.uk>,
	Marek Belisko <marek.belisko@open-nandra.com>
Subject: [PATCH] multimedia: janus-gateway: Added new recipe
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
X-List-Received-Date: Tue, 10 Dec 2019 20:35:36 -0000

Added recipe for janus-gateway


Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Jake Withecombe <jake@ruggednetworks.co.uk>
---
 .../janus-gateway/files/janus-gateway.service      | 14 +++++++
 .../janus-gateway/janus-gateway_0.7.4.bb           | 48 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
 create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb

diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
new file mode 100644
index 0000000..5b4d4f2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Janus WebRTC Server
+After=network.target network-online.target
+Wants=network-online.target
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/janus -o
+Restart=always
+RestartSec=60
+LimitNOFILE=65536
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
new file mode 100644
index 0000000..bca716f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
@@ -0,0 +1,48 @@
+DESCRIPTION = "Janus is an open source, general purpose, WebRTC server designed and developed by Meetecho"
+HOMEPAGE = "https://janus.conf.meetecho.com/"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9e0a79f2244c2f79cda22ea5fed9135"
+
+SRC_URI = "https://github.com/meetecho/janus-gateway/archive/v${PV}.tar.gz \
+	   file://janus-gateway.service \
+"
+
+SRC_URI[md5sum] = "b068ac2b40ae800d83f471b8189bc87c"
+SRC_URI[sha256sum] = "01ddaf204203a1219dd46a5ce70b548bab75bc494c9ba05429f8fb1e786b2995"
+
+inherit autotools-brokensep pkgconfig systemd
+
+DEPENDS = "libsrtp jansson libconfig libnice openssl glib-2.0 gengetopt-native"
+
+PACKAGECONFIG ?= "rest_api rest"
+#PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
+#PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
+#PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
+PACKAGECONFIG[rest_api] = "--enable-turn-rest-api,--disable-turn-rest-api,curl"
+PACKAGECONFIG[rest] = "--enable-rest,--disable-rest,libmicrohttpd"
+PACKAGECONFIG[unix_sockets] = "--enable-unix-sockets,--disable-unix-sockets,"
+PACKAGECONFIG[post_processing] = "--enable-post-processing,--disable-post-processing,"
+PACKAGECONFIG[plugin_echo] = "--enable-plugin-echotest,--disable-plugin-echotest,"
+PACKAGECONFIG[plugin_videocall] = "--enable-plugin-videocall,--disable-plugin-videocall,"
+PACKAGECONFIG[plugin_nosip] = "--enable-plugin-nosip,--disable-plugin-nosip,"
+PACKAGECONFIG[plugin_videoroom] = "--enable-plugin-videoroom,--disable-plugin-videoroom,"
+PACKAGECONFIG[plugin_voicemail] = "--enable-plugin-voicemail,--disable-plugin-voicemail,"
+PACKAGECONFIG[plugin_recordplay] = "--enable-plugin-recordplay,--disable-plugin-recordplay,"
+PACKAGECONFIG[plugin_textroom] = "--enable-plugin-textroom,--disable-plugin-textroom,"
+
+FILES_${PN}_append = " ${libdir}/janus/plugins/* ${libdir}/janus/transports/* ${libdir}/janus/events"
+FILES_${PN}-demo = "${datadir}/janus/*"
+
+PACKAGES_append = " ${PN}-demo"
+
+INSANE_SKIP_${PN} = "dev-so"
+
+SYSTEMD_SERVICE_${PN} = "janus-gateway.service"
+
+do_install_append() {
+	# Install the systemd service so we can kick start on boot
+	install -d ${D}${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/janus-gateway.service ${D}${systemd_unitdir}/system/
+}
-- 
2.7.4


