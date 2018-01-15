Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C195786C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 12:40:30 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d4so13952558qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 04:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=7mFKW9Kg+iNZdP49NrZ8aHlxJi9Tda8QgmLGAz7YpjM=;
	b=UmW1leV3i0+Q0iBydaGawskhZj24b9RDToONhfZkCjkff9q0jwpKem4LeHAKzv3SYZ
	51p1LeG3ASvbVi1oJ4D4JeLQ6n2JEqr+R3rjJhN+qz2P320XrRcxeyDLu1702FFvxKmg
	tIl16tww+EsZXLU8OxyeGs5mp1QYdQUTbWyquYMq3EbR6dZ1EKKA/Yl2dHO0vsV1P4NT
	R/V8WsphLD8sbdA+PSO+NxV/8PRqqBugtnqGPNo7aI8w9oKsMLzixXXuqrzR4rOBnvlx
	AzqPWzOWG+VdmB1VHo5BmN4OSv/3RUwd4Rfp8Zsw29AsBARN7rcGWp4h6ojvvXQM1Nn9
	bpPw==
X-Gm-Message-State: AKwxyte+qiyUei2lmEblzp4hxrKInInmJepvZFVElbY8mFAOnXiQzfT+
	KftULbB7+qOo5w9wPM6rq13toA==
X-Google-Smtp-Source: ACJfBotf2qPq9JVWAqWKj6ewyAKQbcnEYHC67y2Q7vPgnEuZ3c/Wo5D+rG3ESrpKYuB3PnL4lSyK1g==
X-Received: by 10.200.8.19 with SMTP id u19mr31860947qth.315.1516020031319;
	Mon, 15 Jan 2018 04:40:31 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j49sm8363200qtc.61.2018.01.15.04.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 04:40:30 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 15 Jan 2018 10:40:26 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:40:18 -0200
Message-Id: <20180115124018.26546-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115124018.26546-1-otavio@ossystems.com.br>
References: <20180115124018.26546-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] haveged: Add sysvinit support
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
X-List-Received-Date: Mon, 15 Jan 2018 12:40:30 -0000

The haveged daemon is also useful on sysvinit-based systems, so we add
a init script for this use-case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
 - rebase on top of master-next

Changes in v2:
 - rebase on top of master

 .../haveged/haveged/haveged.sysvinit               | 35 ++++++++++++++++++++++
 meta-oe/recipes-extended/haveged/haveged_1.9.1.bb  |  9 +++++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit

diff --git a/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit b/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit
new file mode 100755
index 000000000..98b8857e7
--- /dev/null
+++ b/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+
+pidfile=/var/run/haveged.pid
+
+# source function library
+. /etc/init.d/functions
+
+case "$1" in
+    start)
+    echo -n "Starting havege entropy daemon... "
+    start-stop-daemon --start --quiet --pidfile $pidfile --name haveged --startas haveged --  -w 1024 -v 0 && success || failure
+    echo
+    ;;
+    stop)
+    echo -n "Stopping havege entropy daemon... "
+    start-stop-daemon --stop --quiet --pidfile $pidfile --name haveged
+    success
+    echo
+    ;;
+    restart)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+    status)
+    status haveged
+    ;;
+    *)
+    echo "Usage: /etc/init.d/haveged {start|stop|restart|status}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
index bb44c4138..419c85f51 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
     file://remove-systemd-unit-503.patch \
+    file://haveged.sysvinit \
 "
 
 SRC_URI[md5sum] = "015ff58cd10607db0e0de60aeca2f5f8"
 SRC_URI[sha256sum] = "9c2363ed9542a6784ff08e247182137e71f2ddb79e8e6c1ac4ad50d21ced3715"
 
-inherit autotools systemd
+inherit autotools update-rc.d systemd
 
 EXTRA_OECONF = "\
     --enable-init=service.redhat \
@@ -21,10 +22,16 @@ EXTRA_OECONF = "\
     --enable-threads=no \
 "
 
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME = "haveged"
+INITSCRIPT_PARAMS_${PN} = "defaults 9"
+
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "haveged.service"
 
 do_install_append() {
+    install -D -m 755 ${WORKDIR}/haveged.sysvinit ${D}${sysconfdir}/init.d/haveged
+
     mkdir -p ${D}${systemd_unitdir}/system
     install -p -m644 ${B}/init.d/haveged.service ${D}${systemd_unitdir}/system
 }
-- 
2.15.1


