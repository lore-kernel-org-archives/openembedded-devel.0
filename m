Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B774C786BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 12:47:10 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id c13so12978529qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 04:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=aryZnq/KWYvFEtxw5uePPfCOb9x3CszUdGv9jJscgYg=;
	b=OdNgL+Wv6dcUN/lLWNeo+BUC0cPUmm3ursEIydx/KRuiTpyYAPNDy+HZ5XleTjGG8M
	dBfT1fHT1s7RuzptRDwB63ZhL7fpn0z4Az4tq3R3sQUaySer/CrZ7wTb9AOl9xIfH5rF
	ZLvmc/6aerlHslMMw7I0qdomR+fdyrWDLo0xSeElAfnR0CU3+0LhmzaNHvn9WXwjCqP+
	uYwmF7PISOd9FQbmuCet0c48Gka8ToORlZHJuQIxV/wGsLG9E4TpmP9ZW+JBQGCmINpN
	uhEfTeEIVW7jYbCVuqj4DSmSejj2gyarThJVO8+y0sh0jIeW9wrdNDBPbTjXijl3UioX
	Owzg==
X-Gm-Message-State: AKGB3mJKKIsgSX/rJAUXKiXaYNlwACJ3qmV7tSgeZQD3pHtilxPInFff
	E/ADVWAAw5VKzMdu0LRCfhilUg==
X-Google-Smtp-Source: AGs4zMbeqEQdDw8lxo1/fFULELantJE7038YCAdKipJPkZ+Bzbb0o0Hjh6jd6Mmh0QEJ7pQRvs3wiQ==
X-Received: by 10.55.217.85 with SMTP id u82mr6975138qki.257.1512132431855;
	Fri, 01 Dec 2017 04:47:11 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d198sm4396310qkg.16.2017.12.01.04.47.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 04:47:10 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 10:47:05 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Dec 2017 10:46:58 -0200
Message-Id: <20171201124658.19036-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171201124658.19036-1-otavio@ossystems.com.br>
References: <20171201124658.19036-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 2/2] haveged: Add sysvinit support
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
X-List-Received-Date: Fri, 01 Dec 2017 12:47:11 -0000

The haveged daemon is also useful on sysvinit-based systems, so we add
a init script for this use-case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
2.15.0


