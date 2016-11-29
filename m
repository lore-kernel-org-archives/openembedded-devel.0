Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BB88B71ADC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:04:36 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id jb2so17418163wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Bc8MJpaU+JGXMT0IS9LonpZyyvp1rF4BkXTmmCDFrM=;
	b=m8hMCJR8jjcN0QddpYbamehege82rOW5FEFk0dMbVKngM2v56VRGQTRdybxLl8gvIS
	/wzMZ+KH4Z6VJN856Qghgrfb0E5AEZKcsE+A10lWKZnTak1h/N1RMVfaKddOTkCUugcM
	699USs+8/vqA49njSbyt1DgIv1Ovh36EWBcMGX3M3AsJrTO+o28GmkaaqVCpg7R8wIT5
	4ffno/8mnv607FO5iSGZc95viTujtQX0VakMtt2Bj1gPTRkH8R3T/C97PLPbNsa+XUGE
	7B9mSy3klXDwlShXHmiwvnvnuCVJsuXVhiajmFFf5q3PpQeviHKhUo4ONaD/k/ign6uZ
	h6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Bc8MJpaU+JGXMT0IS9LonpZyyvp1rF4BkXTmmCDFrM=;
	b=GGhyebazbKBaeoZxOWWdieoEHVMzyGan+SDCjAza3n5vmQXcTVZ+cf3Dk7iqVZUgM5
	4hHLl8dp20OdNTI09M/y82F4JwznxkBfDbTw9KWHVQNxNAaW7jvWBmh9IXu0STbJ24LU
	akODZYq8AyPmx/WDMv8oB8UFIfSNzv80qiYOvCj+1dzEEzBjlR63GwV80/oekD5y6NcX
	XOoR4Eba/QmovxcCxCpqhbcsVhofamdCfB4SgfNsVrfgDgQGXI30nATXliN/MCnLtXa2
	l+Z+/0j0JkIoiZpHMQ3sszVJA8y2JORKmeecit7zCIXp3Bm8HvxD473fYxohU1299FeG
	mLQQ==
X-Gm-Message-State: AKaTC02tLZ2e1G4FCAfdSbEXuAE578cFNqIKPOtbvEpt54tPLLMofhuboh30b8t2LcrbHA==
X-Received: by 10.194.205.73 with SMTP id le9mr23215788wjc.31.1480413877630;
	Tue, 29 Nov 2016 02:04:37 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF35F10038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef35:f100:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	e188sm1919656wma.21.2016.11.29.02.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 02:04:36 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:04:25 +0100
Message-Id: <1480413866-25885-5-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
References: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv2 4/5] redis: do not run as root
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
X-List-Received-Date: Tue, 29 Nov 2016 10:04:37 -0000

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


