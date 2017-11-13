Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1673678558
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:29:17 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n3so2416967qkn.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=C7utze6WlN5henqUBGK+a0CRCNfmC95OijXkdTVDPI8=;
	b=HoMgJMJriw+EY6l5kqUOajX2qmb6hsGeFvF/XAZI1kTkUERnLyq09+1DrAdN/mRLWo
	tS8IXsVw9Z1IclzCTJ2JSkKq6P5hi0DZymPKDSUwe7fJouJ01kCkDv/Ihb5IlSMlu2/K
	boUTqiUu1X1VQ2H1K89xvE748Kj4Cp0aYpl389CHx8Z1lE3U195/HNfcOb2PIXTGczIp
	GEhCB/gCj5z7+QeJYl3xm9pIP34NdQfq2m09DkK2rfsUYTUt1gwMSphEYS+Vs2eTw3RR
	BDoGSlD8tevjPg+EW0kKxJ5BwKP22nCA/ipsBZHTJYYzafRFgN+1oS3ZGZ++SKRu73tw
	PBxQ==
X-Gm-Message-State: AJaThX4M8p4QDBAcX9VUwKtJp4JiAjT8VrPKhoHFQrG7vUhRn6VmA4uB
	Coa1ZgyXivpze+05+yFzCjnr6w==
X-Google-Smtp-Source: AGs4zMZrHm/uRs68mjQCZ5RLDZX0OIuqWRk4fsYxXYpC3emddM6qQbXaTHKsYTJcNSWY4EkCIQlRBQ==
X-Received: by 10.55.94.129 with SMTP id s123mr15438485qkb.21.1510601358564;
	Mon, 13 Nov 2017 11:29:18 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	v89sm11322857qkv.80.2017.11.13.11.29.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 11:29:15 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 13 Nov 2017 17:29:08 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Nov 2017 17:29:07 -0200
Message-Id: <20171113192907.27387-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] haveged: Add sysvinit support
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
X-List-Received-Date: Mon, 13 Nov 2017 19:29:18 -0000

The haveged daemon is also useful on sysvinit-based systems, so we add
a init script for this use-case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
2.15.0


