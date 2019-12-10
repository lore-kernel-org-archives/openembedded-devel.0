Return-Path: <marek.belisko@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10DEA7F95D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 18:24:39 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v28so16797284edw.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 10:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=bvCCIlBkIRJxqr2Ft0KR6ZFbehsXs8t3pA7gFFZXc/A=;
	b=P744O7dCBx+pVK71ThJn6v940BOSHXYsRXzJM1ZPxLZahQ/iwxrmXMpJodr8Slx4yM
	wCBkrn5PVt4qaQaZrUkVuwgVehWKcLujAfg0DF6dxJWB3NV2E+Gor+G9Kscbde0u9chP
	wANOC2iabhRsohA7iEuovvTRvZuf9rxsMLTDA+MZAB3bDWtPF3iAbyQR6Wt2ewsko3yC
	sJEnlph0w8ZTT35ADmp0G8gpfFM8tzP+avMkJrDQkTYweAQXMEY8SaDTZKW8DQK9lU2H
	kEWtwzgQ6vNCH7bIXbmlIz2MEAD8E3MVRxO1+BcXtR7D+Hxp6j+zyvUQfigLibv9Vf4V
	WWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=bvCCIlBkIRJxqr2Ft0KR6ZFbehsXs8t3pA7gFFZXc/A=;
	b=V9Mrq0G5jOvMUlAvZKrje2xcZnz65TXVgA7xHNs3U7cC1Yzc175gNoiy9fl3Unw0sH
	RX0mGFslscjdGGzTGqSA4n2y7WuI2PHOeqQk6WLCbRZ/iV+82kEbAxgeO5u5GJ1JcizY
	g63OdG9b0jI9vV+QdON/31RbblNy4HFiSfi0r2F7nHIkSMWJuqc1+XHXyxda8zEulREu
	vYB7BFl6qOtIo+pg1KLIwzJsZ0nRLGalggVXDOjOZGUSZYncSs1mhywwbL/AvT945uck
	QkT2+yn3maWispdmMim/C2jgfOK82/zFHkDvfo2yh24zGMBWpbKeOH6itV+Akgi8kmCT
	PIGg==
X-Gm-Message-State: APjAAAXsFPx/8yQiA7QkUI2/ErkSHjtQF9snj7rCXoWoL35C0DN1ClU+
	fdTiDdS7JQ2xSMYVghP6Q+VOvjANmU6mQoImxXQxWXxb
X-Google-Smtp-Source: APXvYqy4eCX1O5hjyRNaTDXKKjfF+6C5wcP8y6E6cA93GqJEVhSOchMshyQ6KjfivIV8pX1DzwzB2zw/p/gOUgxBBEQ=
X-Received: by 2002:a50:ac06:: with SMTP id v6mr39910487edc.4.1576002280258;
	Tue, 10 Dec 2019 10:24:40 -0800 (PST)
MIME-Version: 1.0
References: <1574350178-22957-1-git-send-email-marek.belisko@open-nandra.com>
In-Reply-To: <1574350178-22957-1-git-send-email-marek.belisko@open-nandra.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 10 Dec 2019 19:24:29 +0100
Message-ID: <CAAfyv36j-iyxtdvjFL0kLpJ-KhpEFXfxiJri54=snjSm2xjRrg@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] multimedia: janus-gateway: Added new recipe
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
X-List-Received-Date: Tue, 10 Dec 2019 18:24:40 -0000
Content-Type: text/plain; charset="UTF-8"

Forwarded to correct ML.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Jake Withecombe <jake@ruggednetworks.co.uk>
---
 .../janus-gateway/files/janus-gateway.service      | 14 +++++++
 .../janus-gateway/janus-gateway_0.7.4.bb           | 48 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644
meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
 create mode 100644
meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb

diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
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
diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
new file mode 100644
index 0000000..bca716f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
@@ -0,0 +1,48 @@
+DESCRIPTION = "Janus is an open source, general purpose, WebRTC
server designed and developed by Meetecho"
+HOMEPAGE = "https://janus.conf.meetecho.com/"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9e0a79f2244c2f79cda22ea5fed9135"
+
+SRC_URI = "https://github.com/meetecho/janus-gateway/archive/v${PV}.tar.gz \
+          file://janus-gateway.service \
+"
+
+SRC_URI[md5sum] = "b068ac2b40ae800d83f471b8189bc87c"
+SRC_URI[sha256sum] =
"01ddaf204203a1219dd46a5ce70b548bab75bc494c9ba05429f8fb1e786b2995"
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
+PACKAGECONFIG[post_processing] =
"--enable-post-processing,--disable-post-processing,"
+PACKAGECONFIG[plugin_echo] =
"--enable-plugin-echotest,--disable-plugin-echotest,"
+PACKAGECONFIG[plugin_videocall] =
"--enable-plugin-videocall,--disable-plugin-videocall,"
+PACKAGECONFIG[plugin_nosip] = "--enable-plugin-nosip,--disable-plugin-nosip,"
+PACKAGECONFIG[plugin_videoroom] =
"--enable-plugin-videoroom,--disable-plugin-videoroom,"
+PACKAGECONFIG[plugin_voicemail] =
"--enable-plugin-voicemail,--disable-plugin-voicemail,"
+PACKAGECONFIG[plugin_recordplay] =
"--enable-plugin-recordplay,--disable-plugin-recordplay,"
+PACKAGECONFIG[plugin_textroom] =
"--enable-plugin-textroom,--disable-plugin-textroom,"
+
+FILES_${PN}_append = " ${libdir}/janus/plugins/*
${libdir}/janus/transports/* ${libdir}/janus/events"
+FILES_${PN}-demo = "${datadir}/janus/*"
+
+PACKAGES_append = " ${PN}-demo"
+
+INSANE_SKIP_${PN} = "dev-so"
+
+SYSTEMD_SERVICE_${PN} = "janus-gateway.service"
+
+do_install_append() {
+       # Install the systemd service so we can kick start on boot
+       install -d ${D}${systemd_unitdir}/system
+       install -m 644 ${WORKDIR}/janus-gateway.service
${D}${systemd_unitdir}/system/
+}
--
2.7.4

