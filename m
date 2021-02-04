Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.6520.1612437608102236023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 03:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=Ko9P+aIp;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1881B5C01C4;
	Thu,  4 Feb 2021 06:20:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 04 Feb 2021 06:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=KvdFQoU0EMQ+21J5nPlYd4N0+X
	3KDLXdJlf7geeHV8w=; b=Ko9P+aIp72OFKYds69Rp9NCkJUQDnX9yWJdWThCZtU
	or98VVFeek0tiy9wO10bK+xG21iSLy7pQYZLudeTkihRUKpwJ/ESLGRuEzxJ20pZ
	JMQfSQYxfoERmakAe9HEIhTERXYBAXaGJeqCpQbSFJCUm78PmxmNDkPgZSSj06La
	zNJDs30rCCdImvBBeCpbAsttaz3hwj9aJNVO2Z7gNeRN7n/rJs+JJGl3zQesea3f
	9ilcihoN6KSh33nZ37j2QgmBrA238sDLAxU5qHzlmcy6vsYk3zsIsCVqTalq9Te4
	VnU2H+ZxLJBkeMAcpOATfK8KaVySSix/ItAiuXr0YHTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KvdFQoU0EMQ+21J5n
	PlYd4N0+X3KDLXdJlf7geeHV8w=; b=Mq/cq2fDc718PLVxNJSGjMuUTSe+6W6zf
	KO4c2kve/O9Cs970w4o0UPNRvFjZsfV9Pi7JgMIDtxiTnQcaZPn0B8GanJK+7HDH
	1NEulj6tN6Jw6YsMKoSi/wiuapApmKZhjrPTUJbBjurjOtNsSDP1IEfxFexUoui/
	/wWWhtfAm6ktE3PLstoosoEtrkeMzh69qEoF2p9jSKvIGxYOvXg0vt38CL7B0pOp
	vDkKAszZ+KKYyVJq9T3HCAQfp58v7HXCE7v6XCOIccD6vWcOk1ofqCU1/NYgHW7U
	ysP1GRDESFB1HdbBaGVDXMjytmJ9O1PqAcbl8yXI/nEmpa8csx5JQ==
X-ME-Sender: <xms:ZtgbYI9N9N-tmWJ7lr9wlLDu68QfARzZwDrNpk8SOlq9Zq1sPeVspw>
    <xme:ZtgbYAoB_cKl2Fjj-4oP9E5yi8ErP-HyuS-_vQEOW-q8hr_2UG6Al3yEfj0Ewei6b
    SujFahBGNY1k0vuSpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeggddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprghnughrvghisehg
    hhgvrhiirghnrdgtohhmnecuggftrfgrthhtvghrnhepjeehfffhhedvjeduudelhfevje
    eguddvhfeiudegveetieeuudffheefleehfeehnecuffhomhgrihhnpegtohhnfhdrihhn
    pdhsvghrvhhitggvrdhinhenucfkphepuddtledrudehtddrleeirddvtdefnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehg
    hhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ZtgbYK5iBZcBcQaIA5PtBCPPqP9K-ls0Xi2vy5A8ju22G_4QQ-NMoA>
    <xmx:ZtgbYANFBsLU4rWVLBoLrxhpGPs4GX0lFTm5oDKxK7CamEAZZ7NBtQ>
    <xmx:ZtgbYMMdb4ZMaiAFKfYZKlkspEThzOP_Hdag9HX7dQe854bbtJp7Jg>
    <xmx:Z9gbYB12WYRU46wP2kbyD_-9Cm45U8FEkaM1bhcNVWxU42hVfq0-iA>
Received: from qwirkle.internal (host109-150-96-203.range109-150.btcentralplus.com [109.150.96.203])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7B64E1080063;
	Thu,  4 Feb 2021 06:20:04 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH] gateone: Cleanup assets for removed recipe
Date: Thu,  4 Feb 2021 11:19:56 +0000
Message-Id: <20210204111956.35015-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

We removed this recipe in 809de9b0572b8ea234af6141f73deaf2010bc54e but
the recipe related files (for example configuration) were left behind.
This patch cleans that up.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../gateone/gateone/80oe.conf.in              | 24 ----------
 .../gateone/gateone/gateone-avahi.service     | 10 ----
 .../gateone/gateone/gateone-init.in           | 47 -------------------
 .../gateone/gateone/gateone.service.in        | 10 ----
 4 files changed, 91 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/gateone.service.in

diff --git a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
deleted file mode 100644
index 4503da422..000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
+++ /dev/null
@@ -1,24 +0,0 @@
-// Some custom Gate One settings for OpenEmbedded
-{
-    "*": {
-        "gateone": { // These settings apply to all of Gate One
-            "log_file_prefix": "@localstate@/log/gateone.log", // default would be /var/log/gateone/gateone.log
-            "log_file_max_size": 5242880, // 5 megabyte logs for OE by default (default would normally be 100Mb)
-            "log_file_num_backups": 2, // Default is normally 10
-            "origins": ["*"], // Every device has a unique origin
-            "logging": "info",
-            "pid_file": "/run/gateone.pid",
-            "session_dir": "/tmp/gateone",
-            "user_dir": "@localstate@/lib/gateone/users"
-        },
-        "terminal": {
-            // Disabling session logging for embedded devices is a good idea (limited/slow storage)
-            "session_logging": false,
-            "syslog_session_logging": false
-//             "commands": {
-//                 // For some reason this doesn't work (never asks for the password)
-//                 "login": "setsid /bin/login" // Normally this would emulate logging into the host console
-//             }
-        }
-    }
-}
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service b/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
deleted file mode 100644
index 0f613d18e..000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
+++ /dev/null
@@ -1,10 +0,0 @@
-<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
-<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
-
-<service-group>
-  <name replace-wildcards="yes">GateOne on %h</name>
-  <service>
-    <type>_https._tcp</type>
-    <port>443</port>
-  </service>
-</service-group>
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in b/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
deleted file mode 100644
index 86d655c94..000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/bin/sh -e
-### BEGIN INIT INFO
-# Provides:          gateone
-# Required-Start:    networking
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: Gateone HTML5 ssh client
-# Description:       Gateone HTML5 terminal emulator and SSH client.
-### END INIT INFO
-
-. /etc/init.d/functions
-
-NAME=gateone
-DAEMON=@bindir@/gateone
-PIDFILE=/run/gateone.pid
-WORKDIR=@localstate@/lib/gateone
-
-do_start() {
-    cd $WORKDIR
-    @bindir@/python $DAEMON > /dev/null 2>&1 &
-    cd $OLDPWD
-}
-
-do_stop() {
-    kill -TERM `cat $PIDFILE`
-}
-
-case "$1" in
-    start)
-        echo "Starting gateone"
-        do_start
-        ;;
-    stop)
-        echo "Stopping gateone"
-        do_stop
-        ;;
-    restart|force-reload)
-        echo "Restart gateone"
-        do_stop
-        sleep 1
-        do_start
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-        exit 1
-        ;;
-esac
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in b/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
deleted file mode 100644
index 44667275a..000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=GateOne daemon
-ConditionPathExists=|@localstate@/lib/gateone
-
-[Service]
-WorkingDirectory=@localstate@/lib/gateone
-ExecStart=@bindir@/python @bindir@/gateone
-
-[Install]
-WantedBy=multi-user.target
-- 
2.30.0

