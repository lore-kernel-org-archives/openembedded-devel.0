Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA5874A3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 13:39:15 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p11-v6so5179610wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OwnJkOCADaeh8Q6Rmh2/oTlbWkgQTqYjof8TbJ7sBAU=;
	b=Xrq6n2Xh7YXzAMf9M5+VrdwD3DPTPftImsQVOBPHrAVbv+gWQcOR1xsWSmAUDc1Bcz
	muRJQBM4uc2ec7O7Mm7kkpa11zSzmbOluicHtlk5tOU+I9ad1NHPSY8eIqMXwjch7lhd
	kHg6LKHeLhBt0SgejRIkUKlXtDkn9hQrUJH0mhJJRLL/3cjOn4euDK2C30xayP0oLBnI
	Arb43bJmsqBbpgOaMWGvsdUjjmxO2JyEnXgFco3eu5GC0vCXtGXOcTOuvlAK6HrHobrq
	UD/FVmUeaS938sunlGWKLqZ1XdiAAjGEihDBkqreJbpv5gtTprTlsFV8c+8Bg99nahGM
	Ssog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OwnJkOCADaeh8Q6Rmh2/oTlbWkgQTqYjof8TbJ7sBAU=;
	b=QQ/tUSASgAnggQHVANf31cTQF6E4vlTpWQ+AsHkoIA0CHsL2t8OWPYqJhwPCUMZvC/
	780vxqwDgodwgYThRhmQpfN8uDR0UgaD83EwBVSuaqZjvtWInVY3u8adcia2tqNi7cDY
	WXJ7uS6HASGs9KBJeapOGQkS8kSckZyURiNsAcoofb8rUQ/MIhlJ1Pu0TqrosjDh04/j
	y5A7v/aROUr6d01F9N3k71kg5+zGYMp/BDl7PpotT8TrLS7AiICNZeYnXpc4d0fzH9kE
	/BzjQjBZ5EufGDfWft4uGSvxfislNphGNHwBTKHwOnRtWJ5mcYED7n10OYMVlNGmcIkG
	vuiw==
X-Gm-Message-State: ALKqPwelSx4PTyJS74M70cQnzBBuNlBpT30fORfwzsHYpK/k5ZWX4b8v
	U8DpMZZl1D62eQFi2NjtR6gR2Q==
X-Google-Smtp-Source: ADUXVKIpHzdfWLavz7mKKZfcl71gtq8cejmRbgKeS411emSIstbrinWmrbh3uyavpitgqtRFDk14Zw==
X-Received: by 2002:a50:a802:: with SMTP id
	j2-v6mr28834060edc.138.1528205955595; 
	Tue, 05 Jun 2018 06:39:15 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e46-v6sm8614067edd.80.2018.06.05.06.39.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 06:39:15 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jun 2018 14:39:08 +0100
Message-Id: <20180605133909.11319-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [PATCH 1/2] mosquitto: add default configuration file
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
X-List-Received-Date: Tue, 05 Jun 2018 13:39:15 -0000

From: Nicola Lunghi <nicola.lunghi@jci.com>

the mosquitto recipe doesn't add a mosquitto configuration file
add it from the mosquitto.conf.example file

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.4.15.bb      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
index 939bad54ea..c71f1e467f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
@@ -47,6 +47,10 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/mosquitto.service ${D}${systemd_unitdir}/system/
 
+    install -d ${D}${sysconfdir}/mosquitto
+    install -m 0644 ${D}${sysconfdir}/mosquitto/mosquitto.conf.example \
+                    ${D}${sysconfdir}/mosquitto/mosquitto.conf
+
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
     sed -i -e 's,@SBINDIR@,${sbindir},g' \
@@ -65,6 +69,8 @@ FILES_${PN} = "${sbindir}/mosquitto \
                ${systemd_unitdir}/system/mosquitto.service \
 "
 
+CONFFILES_${PN} += "${sysconfdir}/mosquitto/mosquitto.conf"
+
 FILES_libmosquitto1 = "${libdir}/libmosquitto.so.1"
 
 FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.1"
-- 
2.17.0


