Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CDF206007A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:58:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t16so10257689wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Qu8rpUM20zs9dF0aokqzfyazj88xmWFE28rdSDk+9WI=;
	b=XAQu0T4ILv42/sxrovhlpXJ5GqXPXdMqmFkMNPHDWRazi6tCXHYld+fVtcoRTRiuf9
	AYtLWrDInmWW9xFY7S9Fgcz2y8gFyvqzFkP1ox0BwA2Y09bnTUkxb1Du4FNuIV9P8Am4
	dI1nh/67Rm06mBq3f1y11OhkEEAaOvAQlAwUCLnLuPSojDoL5MvCLef0I4uUqJjzIYn+
	Z+1n9Mav7xV7yYpU7lzTLi9Ab7ihacZRGgAvMStefS0VV0pkEednTtfCdfqGWD20hpLq
	B4XhV9EFClBd17FJ8RqGgv/Ht074uZ2/DjcCxi8D6IQXOQ/l3IaA2tVUL7XEQ7O6BgWj
	Os9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Qu8rpUM20zs9dF0aokqzfyazj88xmWFE28rdSDk+9WI=;
	b=r5yJyliqIqhPOOaTxZBFUvvb5fHdLoFIgrb0NKJEa+OjyzlUN66ssK3olepVk59hZI
	QljjocZj/z9+VL3ZYyptEbz/St8nWIHqkdIAOs5NRaq1C1dqYzQGxS4PCRRx5ghcnjpx
	15NtiCha/LA7gFFs5BE0B5fi7xYcpQxfz5BRL+MU0uiapzB4jfhPjy2D8qUU9mGIyC4Z
	assBXxcs3In1C3Nokdl8yZsfrS6sOq45uGZO1/teUt/6Z69ZDLBwRe9AH0xl4ZYRuswB
	KVs7svrSmmDBC52tASPcOu/sJREwwAn8eqvJ3hZo/GRgNq3a0nlY7BkuzhBpZYyPy35n
	wCWA==
X-Gm-Message-State: APjAAAWGG/B6/G04py6BiOjHT8DHH/F6PoCBCvf1f0THqc0DVNPO2qui
	ikFGLcdGoKZC+Y1WzE26FAw8rjFR
X-Google-Smtp-Source: APXvYqzoY7jgiQA5CDazOxjXXCbbKdvIa+8tXf/FjULf5QFzwC9KvlLBLUtnTHYpOCzLtBpQRT1/EQ==
X-Received: by 2002:adf:f686:: with SMTP id v6mr16449619wrp.141.1572274707028; 
	Mon, 28 Oct 2019 07:58:27 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	c14sm10996436wru.24.2019.10.28.07.58.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:58:26 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:58:20 +0000
Message-Id: <20191028145823.7462-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025191221.17914-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 1/4] dbus-broker: 19 -> 21
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
X-List-Received-Date: Mon, 28 Oct 2019 14:58:27 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Add /lib/systemd/catalog to the package, as snippets for the journal are
now shipped.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: add md5sum
v3: fix md5sum, because git add is difficult

 .../dbus/{dbus-broker_19.bb => dbus-broker_21.bb}             | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} (74%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_19.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
similarity index 74%
rename from meta-oe/recipes-core/dbus/dbus-broker_19.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_21.bb
index 82d8b8ba6..9cb59e336 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_19.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -7,7 +7,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1648227f5a347d4f38d8a29bb9295a73a25c3feb4f3e79e3f04cc847343da3ed"
+SRC_URI[md5sum] = "a17886a92ab1e0bc2e4b1a274339e388"
+SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
 inherit meson pkgconfig systemd distro_features_check
 
@@ -19,3 +20,4 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
+FILES_${PN} += "${libdir}/systemd/catalog"
-- 
2.20.1


