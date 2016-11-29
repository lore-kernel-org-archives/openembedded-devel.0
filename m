Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0365A719F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:04:33 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so17420688wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RiJZdUgHKiemEknBEqKwzf96oykl37pkte5U0UfxlXY=;
	b=unIGAFE8HfUOP+18y5ZVI4hi9v1FNxo6us46Q57RaELIsWX8z/19/Azj13J1BqMnCM
	Dz5xeMug/kGKBaHDrEckZRD2IYhoRv3PCd1iAOSvNKs/CtAiX7aLoN7fy7LRdEK6mwmD
	GSjnmVv0nQ+C1k+90SCxy1PIa2sQyjuqVTbHGKVjgbhUzwSPtc+xJu/72+iecJkskNKy
	0uMM9gSVGBVz4jS+pcHDUxDvrSKpWhK1JdJcdqTg6hxNmfb0ftIgbg6RVK1J9Ldwh8Ff
	7XQoXb3txUEUxPpKKrD5Im92MVOEFD4uMp5r1tqZrYOmIrDPdjDO5VKvCmKrSqYbPqqU
	fGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RiJZdUgHKiemEknBEqKwzf96oykl37pkte5U0UfxlXY=;
	b=UtWZrPjyCckPFLdF8MKB/qa6c6aj2KJy7in/ubhJOAHhM5RcH3+Z/m+ZjEvfVa/t6E
	f5yrVoyezj0nDH4ilmVhe23DT5MvdHLsbzcyRfQjMIzV3ej1gHGFKe6TY5BorWyH2p3V
	a3OilBV0cTiZRgxAcwW9gHK4QSZd3AFNGe0nSb7TugWe6GZiJEeihWCo4UBfXSOaexBS
	d9NXx1r6e8iKA24LaWO6gSTFqbhvhQFD4ON+Otcu/pQiynnEKwadtyqgfQFMPE8xrYip
	kRYEHRKpDdxZiNzZLme7rJE4/L8eTOC3oX0EPIzdrKxFoZfns3+8dc+hlE8aMa4XnpiI
	c8SA==
X-Gm-Message-State: AKaTC03T+UlsQck0qYQoi85IhyyuXC05k2FYwbaFufTUIZ5qu0n/yHSufylIZaJw5fAX8w==
X-Received: by 10.195.18.201 with SMTP id go9mr8830356wjd.200.1480413874684;
	Tue, 29 Nov 2016 02:04:34 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF35F10038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef35:f100:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	e188sm1919656wma.21.2016.11.29.02.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 02:04:34 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:04:22 +0100
Message-Id: <1480413866-25885-2-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
References: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv2 1/5] redis: add a systemd service file
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
X-List-Received-Date: Tue, 29 Nov 2016 10:04:34 -0000

The redis.conf is changed on the fly to not daemonize redis.
The reason for that is that with this appraoch we don't need
special permissions to write to /var/run/.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/redis/redis/redis.service | 14 ++++++++++++++
 meta-oe/recipes-extended/redis/redis_3.0.2.bb      | 15 ++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/redis.service

diff --git a/meta-oe/recipes-extended/redis/redis/redis.service b/meta-oe/recipes-extended/redis/redis/redis.service
new file mode 100644
index 0000000..e2dc6a7
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/redis.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Redis In-Memory Data Store
+After=network.target
+
+[Service]
+User=root
+Group=root
+ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
+ExecStop=/usr/bin/redis-cli shutdown
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
index 2e4b760..89b79d4 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -12,13 +12,16 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://oe-use-libc-malloc.patch \
            file://redis.conf \
            file://init-redis-server \
+           file://redis.service \
            file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch \
 "
 
 SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
 SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d systemd
+
+REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
 
 do_install() {
     export PREFIX=${D}/${prefix}
@@ -28,9 +31,19 @@ do_install() {
     install -d ${D}/${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
     install -d ${D}/var/lib/redis/
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_unitdir}/system
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/redis.service
+
+    if [ "${REDIS_ON_SYSTEMD}" = true ]; then
+        sed -i 's!daemonize yes!# daemonize yes!' ${D}/${sysconfdir}/redis/redis.conf
+    fi
 }
 
 CONFFILES_${PN} = "${sysconfdir}/redis/redis.conf"
 
 INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
+
+SYSTEMD_SERVICE_${PN} = "redis.service"
-- 
2.7.4


