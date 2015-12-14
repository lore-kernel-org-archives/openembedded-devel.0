Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id D80FF70057
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:25 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so105222418pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TS0w1YKJBm6zxpdbM+p2hbNl0z7PxqcmCHjUnLJhN7M=;
	b=fZaQ1TMPkNSCoHLdEPI1GHzPfqpKaG7U1ZbLDy06X55X5IpAS452kdQO99hoeowOVL
	E0nP6YYhuXX+y6nZdxPZWkODkoSh2+foRtmQDAT94ISq5LAvnOvX2jWmILcUVahEzR+c
	zl7PfOlMb5LikdIOvFps3NwdkxwkWeGc/7q+IPqWqGSdaw6HqjGIFRpWDegdWXNd09SS
	DwF2VsN0mN4qIIcUM2EwLyPIGdIq9wmtERjevAN5HLAnFSuAPYMYSP+3NgPbUXk5YcWU
	RS3M0PMGHi2J+xKL8PkMzGxxkv7uzGGZ7355pEr30N5Ha2Xp8SCADYPbkhEPze65iRVA
	QFPw==
X-Received: by 10.66.150.5 with SMTP id ue5mr45995477pab.42.1450107266533;
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	n16sm43279216pfa.53.2015.12.14.07.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:20 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 73361FCC83B; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:59 -0800
Message-Id: <c33de7f7223ad97e9647215f90e0a5aab8f3b0ac.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 06/14] opensaf: remove unused service file
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:25 -0000

From: Li Xin <lixin.fnst@cn.fujitsu.com>

Upstream ships systemd service file plmcboot.service and plmcd.service now,
so we don't need this anymore.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-daemons/opensaf/opensaf/plmcboot.service      | 13 -------------
 .../recipes-daemons/opensaf/opensaf/plmcd.service         | 15 ---------------
 meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb  |  6 +-----
 3 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service b/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
deleted file mode 100644
index 76ec73a..0000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=PLMCBOOT Program
-After=network.target
-ConditionPathExists=@SYSCONFDIR@/plmcd.conf
-
-[Service]
-Type=oneshot
-ExecStart=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -s
-ExecStop=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -x
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service b/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
deleted file mode 100644
index 1d48e77..0000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=Plmcd Daemon
-Requires=plmcboot.service
-After=network.target plmcboot.service
-ConditionPathExists=@SYSCONFDIR@/plmcd.conf
-
-[Service]
-Type=forking
-ExecStart=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf
-ExecStartPost=/bin/touch /var/lock/subsys/plmcd
-ExecStopPost=/bin/rm -rf /var/lock/subsys/plmcd
-PIDFile=/var/run/plmcd.pid
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
index 28f4c00..9084524 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
@@ -15,8 +15,6 @@ inherit autotools useradd systemd pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://install-samples-from-srcdir.patch \
-           file://plmcd.service \
-           file://plmcboot.service \
            file://0001-plmcd-error-fix.patch \
            file://Revert_imma_client_node_replyPending_to_unsigned_char.patch \
            file://Fix_GCC_5.1.0_compiler_warning.patch \
@@ -65,8 +63,6 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/plmc*.service ${D}/${systemd_unitdir}/system
-    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/plmc*.service
-    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/plmc*.service
+    install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
 
 }
-- 
1.9.1


