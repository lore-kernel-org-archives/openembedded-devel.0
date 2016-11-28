Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB43E71B6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:59:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so20012611wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Bc8MJpaU+JGXMT0IS9LonpZyyvp1rF4BkXTmmCDFrM=;
	b=07KhaYOJlEppJQw+76bfTrNW9OuaZGN4RSMWeKkOKolmml0RwPA4DiO/PZGDTPcm73
	Lv52yZoxiEKbtt+GkCGVer97m22fnGsR+IEFKYWqwOBJAfzNgZR+Acz/v70mdhtqIfYf
	y6W6Z0/Qr4ybTo8oiSDlcum8A1z1X6+NzncQNZBayGs/LoX2qdhpIkQFimP9JaBuhgic
	9emLAQsn7JFte+x1JaacloUyOMUQdKQerXvHCVLtZBbJJHaJFBXiv76f9rJ18b/4/Ott
	IY16dAj84VZfVSsks7RJ21tC+tWi2sn9uYOtMn718Sz/NQErXSSjUKNNeQfk9kYsSiN0
	TFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Bc8MJpaU+JGXMT0IS9LonpZyyvp1rF4BkXTmmCDFrM=;
	b=KZ8t+SxIAhOtzAiQDH2wNuh9u82yv23pwtujrAUKwzpY16lBveOR3DImBIAtS3AfFG
	eZsGiJcwABdKFic1+36haVdtjHrWmNxWQYxSaM+8ytjo5I0hWw8gKq8vo/xfRvdkNgE6
	tLtXB8C6qg+zSgMlYdWCuRu3yHfLUxvnrPtOof6s1m+XnVxjBxFvX/xBnGZVNiezPR0g
	cTssp8i+rI+2BfhnXFHt5hkD9h5S0JR1HN9QNfEI1jAhuiuO3lcdKDqJfrEtq2e2glks
	3EDRv8xeQ9EQEmsF06VQ2lmyPKLThs62HxIJ3XfhFcDsE2jngJSYUPcS7VWiM4AANFB+
	51BA==
X-Gm-Message-State: AKaTC01zQHYIFLkv/QkiVYODhbVP2Vuj/+Mfdb7HsP9/jZWOYYWJGGFOTUk1r08C+Qaa+g==
X-Received: by 10.28.26.80 with SMTP id a77mr18959144wma.31.1480352395841;
	Mon, 28 Nov 2016 08:59:55 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF27C90038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef27:c900:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	k11sm29756805wmb.18.2016.11.28.08.59.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:59:55 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 17:59:47 +0100
Message-Id: <1480352388-7733-5-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH 4/5] Do not run redis as root
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
X-List-Received-Date: Mon, 28 Nov 2016 16:59:55 -0000

Running a network facing daemon written in C as root is not
a good idea. Introduce a redis system user/group for that.

A drawback is that now redis can no longer increase the
number of open fds to 10000 (MaxClients). If this is needed
the ulimit needs to be tweaked in the init script or systemd
unit file.

This only affects systemd based systems.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/redis/redis/redis.service | 4 ++--
 meta-oe/recipes-extended/redis/redis_3.0.2.bb      | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis/redis.service b/meta-oe/recipes-extended/redis/redis/redis.service
index e2dc6a7..577bb14 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.service
+++ b/meta-oe/recipes-extended/redis/redis/redis.service
@@ -3,8 +3,8 @@ Description=Redis In-Memory Data Store
 After=network.target
 
 [Service]
-User=root
-Group=root
+User=redis
+Group=redis
 ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
 ExecStop=/usr/bin/redis-cli shutdown
 Restart=always
diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
index 89b79d4..a8242b2 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -19,7 +19,12 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
 SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
 
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN}  = "--system --home-dir /var/lib/redis -g redis --shell /bin/false redis"
+GROUPADD_PARAM_${PN} = "--system redis"
+
 
 REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
 
@@ -31,6 +36,7 @@ do_install() {
     install -d ${D}/${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
     install -d ${D}/var/lib/redis/
+    chown redis.redis ${D}/var/lib/redis/
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_unitdir}/system
-- 
2.7.4


