Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3DF719CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:59:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so20090741wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RiJZdUgHKiemEknBEqKwzf96oykl37pkte5U0UfxlXY=;
	b=QY1cFGqKPAnRMlir7UG3OVZjql1uY+zIZQofgaXyiJjK/9h2x/GJtvGZFTQPQxVJCJ
	5UEDtVoX9/3W+jVeptKWCU6keqwLhV+v4ZDBPszVBYPPNXvVfZRYvZ51FDVntBaqzuid
	9We/gFOMXW8BspeuY8WEWXovmCWaonqV0IR5Qb9Hat3HIqG/HULILjYROUV87qoICrub
	9nGOBX9eoL7Qm2iw+qFdP2lUoFqxA8QceIgWlr9sHrKyu17fHmRXhGMgvlq9cV3d0kTp
	90Rq9c91qLlJXLck01OTBu6N4LUbtwqrwcFQK7bsoO87SsIqDwSrbyehlY6Dl5DoFHta
	g2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RiJZdUgHKiemEknBEqKwzf96oykl37pkte5U0UfxlXY=;
	b=hIYNz/HHdAXn7BIyUR3dMOomYfPvhfSGFo0HCINqlZhV1+XqzLMjzQR+a0HsO3Mqyh
	tCiYuLSOBqMqSOgHucD8NF95b/UwJ9iQV1GgLO6ayr/SXXY5IKykL1i7w95/FIVxg22W
	vlxZb79igSJHzKZajnjGtRsn2fA9E4X8EGI8elj3k35kgQx5+IyFM21o5HhZfXI7PlGh
	/+5NYjjuHWbvbT/Mmlatzzj87sZnYck9SzOVXAlRUVbaSEzCZtdUOfmoc8eRz6PS+2Fg
	iy+s6B+UQr0J2il1oCQcI0epnnjmAtG2KlJ8lxQGzuI5bu0JC5GVuAb5zyTroe4q3xgQ
	cAeQ==
X-Gm-Message-State: AKaTC03rsiq2ViD0oaF9sYtV0YbDFaO8+lGXFVRx1euQqYD6UsAgcB09FlDBc113RkdHRA==
X-Received: by 10.28.103.134 with SMTP id b128mr19329021wmc.54.1480352392479; 
	Mon, 28 Nov 2016 08:59:52 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF27C90038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef27:c900:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	k11sm29756805wmb.18.2016.11.28.08.59.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:59:51 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 17:59:44 +0100
Message-Id: <1480352388-7733-2-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH 1/5] Add a systemd service file for redis
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
X-List-Received-Date: Mon, 28 Nov 2016 16:59:52 -0000

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


