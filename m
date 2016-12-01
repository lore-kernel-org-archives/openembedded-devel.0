Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E785371B3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 18:45:42 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id xy5so27487221wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 10:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FizX4iDhb97QJNGpR3I1WRW2kUU2+8O3A9wP/YQBAIY=;
	b=YnN9lvulsjU0HEpE8QOjXV1sbkLWiOP2xTIvzwoXkAZIn+cYh/X7oojB4JOPmGY+ui
	MCUvU15Ila1qSGjEMCfWKd1VrxYFyIWlMGU8sV6KmpCVyyRQbo1y+GnYcGoE51Lj/uNT
	lQ9YSCm5XamlkF30TirbflRl3jSGFe4pr9d8NoYj0zF+Cs4NVN7ovwB0mmmxDBMmply3
	G4+mtF6QTJkdPPooctAbuAImTFOOlE9qLeuxHxpM0Gs5wefNZlUf3KbZWugr4YYGyFHr
	MiNjD3fKi+6sx3XrxGt5uoYq6wg3hhZFSKZRuIlARe6jCcEuZWH6W+B9GUe6oWI7sBWq
	OPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FizX4iDhb97QJNGpR3I1WRW2kUU2+8O3A9wP/YQBAIY=;
	b=kOTarHuo0qAYwvGr4m1BoInaD81OTW7dVNPumk89rSaGifRxNN+Uhiizy33mQ9T/Mj
	WUrHFAHhD5BDIpUj+zc61pahg+d7MICo4bn0PbfNLgkiHjDSRvC04kNR410IeXma85m+
	1FV9jadlEmB/X8CPRyzD8O3SrJBRitdIhYOOE3K8oUIMeMrA5RZ7zLtmWw4J32eCosX1
	wLDvH1t0ZopjXJ4E1OE6bMiY3yrNwQtuUaNDNUwJd4llmUmlIRDxC9p9pcrbE0X6meq6
	k/OtFRcIRR7p7VMQpyXGfbx2qcSeWGUt6FIcHbovfplUrULE7lwcHxaOybNcmxxHaLBi
	L8XQ==
X-Gm-Message-State: AKaTC02oR+M6I0g81k4/ebvQpNt9x0O99DJZ9meqQVQI797jJAXinuWVJpPzB2n35ttpSw==
X-Received: by 10.195.11.229 with SMTP id el5mr41645770wjd.64.1480617943440;
	Thu, 01 Dec 2016 10:45:43 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF34510078AFC66E4F3A2DFD.dip0.t-ipconnect.de.
	[2003:71:ef34:5100:78af:c66e:4f3a:2dfd])
	by smtp.gmail.com with ESMTPSA id w79sm2284746wmw.0.2016.12.01.10.45.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 10:45:42 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 19:45:23 +0100
Message-Id: <1480617927-26478-2-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
References: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv3 1/5] redis: add a systemd service file
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
X-List-Received-Date: Thu, 01 Dec 2016 18:45:44 -0000

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
index 2e4b760..98132d7 100644
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
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_system_unitdir}
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_system_unitdir}/redis.service
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


