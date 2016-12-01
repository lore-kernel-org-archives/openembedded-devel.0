Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 80E4F71B4D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 18:45:45 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id kp2so27492856wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 10:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lDpwn+GeQBr+2B8FPAtJfeAgaZumtBfqrdj5Pv9Nhx8=;
	b=dVwrqIM+M25GYhdWnG+Mcj0ALDpKhmT++wLsgyLC+KUG0SZ4gPNyCrg2jUXIrZwCyd
	C3ru6kWTQeJAqECDVlCzGzqoUUO884+/4pcj4yKQU2rvZBecUCmX2i0dc8Ix2peGR+db
	/qhxZbp/lt1HFIsP8+bmgyyN0TyEh8kJZmf0NdAE7RI3uf2u+wg55470fjAqWe9iabdf
	60jpO2YikmyC7AM0Fr1sHbo7KMlMhj/SZgRIA5aXbEIiN+7fPg421YOCNAnsbFnOU97O
	XgRMlp/hiLcK2kIU7jNkHiBCh+lYA1v8AEqIR8Lg7SNqvpb+Jt+dOM7ICHpn9xS87zbV
	Lw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lDpwn+GeQBr+2B8FPAtJfeAgaZumtBfqrdj5Pv9Nhx8=;
	b=N0WN9Hukz6GF7RZ0bOhrHPyTNVUIipn9Mg63ECFeliyRVjG4lvvlMOsZEiuOJNUeH3
	s7BmcclPnsRNNmHZMN3zxa78Pfv853YoHpDudyirTghOTczfdGAMJxp8WpTyH4m9wnVR
	dNKte59EPjToOIH4O9H+4FvseZfZ9ae2P2NudK/jS6j9aoCa1oOlEPkJCQV+aYoF3b55
	pRXZ0XwUfKr86P5E0thfAcbHrRz0wS43C9FeokTLOXe9dLbt4bpTS+23DjcBgEjZ+ncg
	GyNEIc4VavPJRmKvJkm8FsLSWqxS+kUXVK6Cm4tzuo63B0SdTDISsRfmxEWkIWpZofN2
	ilFQ==
X-Gm-Message-State: AKaTC00DL5SCkqp60ifD3vqviQ0ghiuAODiEeDdUcQl1t4mC0VD++U58fb/AwW+9Y6ISMA==
X-Received: by 10.194.98.208 with SMTP id ek16mr40596324wjb.94.1480617946717; 
	Thu, 01 Dec 2016 10:45:46 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF34510078AFC66E4F3A2DFD.dip0.t-ipconnect.de.
	[2003:71:ef34:5100:78af:c66e:4f3a:2dfd])
	by smtp.gmail.com with ESMTPSA id w79sm2284746wmw.0.2016.12.01.10.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 10:45:46 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 19:45:26 +0100
Message-Id: <1480617927-26478-5-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
References: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv3 4/5] redis: do not run as root
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
X-List-Received-Date: Thu, 01 Dec 2016 18:45:46 -0000

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
index 98132d7..9395b33 100644
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
 
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_system_unitdir}
-- 
2.7.4


