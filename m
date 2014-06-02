Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 22A616FA5E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:15:01 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id la4so5868215vcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 14:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9wbscVhxn+I2Cb8zX7t8p4c9lh0arJYJpfhoMjXeBhg=;
	b=DQvS81cVBopJswTUPsIxbrrTka3A5vpDv1TQnlFa7d3xIu4u/97PxTRwTASOkZ8v3i
	PUd8q9kuJRhTMgZag4aO7kIiXQYp3IiFNL3EhLXA+E/XfJr9PgfkiKyJ738TyAmJIjy1
	KdY/oB1OTYYxafhXA9cTcg+uVkoPW/0B4wpC/Ln8V54/zPykDhB3fwvhQlPA2QN88kWw
	xnBne7Tq0mR27VDtIBkXDiZvYhVPjYrXzKoPYPcmzKnjQcbQ3aXvZMlCZyIJvQAuR07I
	L5/YId+y0/iO2d7pMoMqE0W1+kainFauptpv+Ckxlj9AxEmiiar9dXnkcMKgE/ZGMvdI
	jk+Q==
X-Gm-Message-State: ALoCoQmIqBWG1zPqtToJvLrd5grTne1Tu7TR5YZka+YURyUS3ofUEXsgD+QnQ/fGzLO+zChAm+yN
X-Received: by 10.58.216.34 with SMTP id on2mr32931392vec.22.1401743702658;
	Mon, 02 Jun 2014 14:15:02 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id q5sm24748316vdc.12.2014.06.02.14.15.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jun 2014 14:15:01 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jun 2014 15:14:50 -0600
Message-Id: <1401743690-25537-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Mon, 02 Jun 2014 21:15:12 -0000

This patch add the initial recipe for Monkey HTTP Server v1.5.0.

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
new file mode 100644
index 0000000..25a9530
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Fast and Lightweight HTTP Server for Linux"
+HOMEPAGE = "http://monkey-project.com"
+BUGTRACKER = "https://github.com/monkey/monkey/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SECTION = "net"
+
+SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
+SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
+SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
+
+EXTRA_OECONF = " \
+             --plugdir=${libdir}/monkey/ \
+             --logdir=/var/log/monkey/ \
+             --pidfile=/var/run/monkey.pid \
+             --default-user=www-data \
+             --datadir=/var/www/monkey/ \
+             --sysconfdir=${sysconfdir}/monkey/ \
+             --enable-plugins=* \
+             --disable-plugins=polarssl \
+             --debug \
+             --malloc-libc \
+"
+
+inherit autotools pkgconfig update-rc.d systemd
+
+INITSCRIPT_NAME = "monkey"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "monkey.service"
+
+FILES_${PN} += "/www"
+
+CONFFILES_${PN} = "${sysconfdir}/monkey/"
-- 
1.9.1


