Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoKB-0007DW-1h
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:54:11 +0200
Received: by gxk3 with SMTP id 3so1570056gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=RQl3nsZM6CBvIiYTSBtpjyZlOxWNQSj33Y9G9VRcygE=;
	b=xO4wqqQEgfKLE/Wu8rb2yTyO4nuG8OlChzPDIfz+KxfXmdRSJ+3aExY/zn882iqkST
	Imu/jePp0rPJvxSb+3fgRNU+WzVa3LM3SnIUQMM1Afc7V4iSuMy4FACWwJfUuD6mnGwM
	o5dO23O2XUYiJHzX7TB7T2ZCofmG81rT0iK3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ksKFcA+rXzd88+HlnTMf8mapg5joaOCzb1TKMuYLQ1x5Pu9eUou63/BkjCCvNH3OU/
	fH8bygi0GE2KOn3+OCa7YGQUNMN4o2Q4ZYAqLQalA0SYQ+8uh7iPGCiBfWv5I1NZ07U5
	HzMANEsInf331fdi+qDiri/a7ECesWx/l7z0E=
Received: by 10.236.189.2 with SMTP id b2mr9529983yhn.388.1305039081551;
	Tue, 10 May 2011 07:51:21 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l73sm3147845yhn.98.2011.05.10.07.51.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:51:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:03 +0000
Message-Id: <1305039065-1326-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
References: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 2/4] p910nd: drop unused init script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 14:54:11 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/p910nd/files/p910nd.init |   31 ----------------------
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb    |   12 +-------
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init

diff --git a/meta-oe/recipes-support/p910nd/files/p910nd.init b/meta-oe/recipes-support/p910nd/files/p910nd.init
deleted file mode 100755
index a19c09e..0000000
--- a/meta-oe/recipes-support/p910nd/files/p910nd.init
+++ /dev/null
@@ -1,31 +0,0 @@
-#! /bin/sh
-
-test -f /usr/sbin/p910nd || exit 0
-
-test -d /var/spool/p910nd || mkdir -p /var/spool/p910nd
-
-case "$1" in
-  start)
-    echo -n "Starting p910nd printer daemon: p910nd"
-    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping p910nd printer daemon: p910nd"
-    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
-   echo "."
-    ;;
-  restart)
-    echo -n "Stopping p910nd printer daemon: p910nd"
-    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
-    sleep 2
-    echo -n " ... Starting p910nd printer daemon: p910nd " 
-    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/p910nd {start|stop|restart}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
index ee43a59..2905147 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
@@ -4,15 +4,9 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
-inherit update-rc.d
-
-INITSCRIPT_NAME = "p910nd"
-INITSCRIPT_PARAMS = "defaults 60 "
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
-           file://p910nd.init"
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
 SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
@@ -21,9 +15,7 @@ do_compile () {
 	${CC} ${LDFLAGS} -o p910nd p910nd.c
 }
 
-# The avahi stuff makes it work with bonjour printing
 do_install () {
 	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
 	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
-	install -D -m 0755 ${WORKDIR}/p910nd.init ${D}${sysconfdir}/init.d/p910nd
 }
-- 
1.7.2.5



