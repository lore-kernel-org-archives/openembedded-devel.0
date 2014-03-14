Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 855276F86A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:07:55 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so1752893eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Koxp1656QnUrjAQ2bP0ZwuQw3wsYNH3QGKiwqy0OOg=;
	b=tLZZVxp6saXfYPlHq7K6hF5WwEv5jccrM0w8w+dXyzL/gIAB43nspFFC4TJ3N/EIvo
	ufYeB5KxeFs9ftmjJxGlXRdkbVz7ABBExQr9kUQKcYxgm6NvAETGZoG9j0X2vcnVXk0i
	lzUR17ym1yxfo8kv5SAkOzvBXCK7ue95yyunoPOVVjsmZ34P3p6iGImc9pS8N3v5P9PG
	mGzIjOzxJsTFXnqgMXf12nvZo4Th8sGUjg/F+MWrB18TNamM5UvqZGHAFNIYYi1mgQ8T
	sd2INxjnpsqSLb0GKHNwBZqiP1iFxF5x6mbKiz+9bz4aclf1W8yXCGFTcz/+L0NRKpAq
	8fhw==
X-Received: by 10.14.94.3 with SMTP id m3mr9940073eef.54.1394824076757;
	Fri, 14 Mar 2014 12:07:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm6760609eef.26.2014.03.14.12.07.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 12:07:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Mar 2014 20:08:08 +0100
Message-Id: <1394824088-20009-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394824088-20009-1-git-send-email-Martin.Jansa@gmail.com>
References: <1394824088-20009-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/2] util-linux: Rename .bbappend to match any version from oe-core and remove uuidd.socket
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 19:07:56 -0000

* oe-core recipe has uuidd.service in ${PN}-uuidd
  SYSTEMD_PACKAGES = "${PN}-uuidd"
  SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.service"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../oe-core/recipes-core/util-linux/util-linux_%.bbappend      |  3 +++
 .../oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend | 10 ----------
 2 files changed, 3 insertions(+), 10 deletions(-)
 create mode 100644 meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend

diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
new file mode 100644
index 0000000..f006b3f
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
@@ -0,0 +1,3 @@
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
deleted file mode 100644
index c6a97ca..0000000
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit systemd
-
-SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
-SYSTEMD_SERVICE_${PN} = "uuidd.socket"
-- 
1.9.0


