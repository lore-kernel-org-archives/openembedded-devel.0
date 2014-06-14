Return-Path: <eduardo@monkey.io>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id CBFF26FE02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 14:40:52 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jz11so4537597veb.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 07:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SC/7FoKdmyhj2wKD7NJxFY5jLlUnHyBmnRDbjqQVmVY=;
	b=IsuSB9eTRXzC97XVkngUmG6nTypKtRjUGs3i4EMnPWnysi7xgale3AfUKqEf7HUc4e
	9HqggzI0OcocBr+wO9jFYTWDn5PjMcF1Y/3KZBOkTwcAwqlE2cZqQLjvbRQfZc274OpW
	3P8CwZB9j6RwsTFgEChc6Nr7jGwQiPXJnJVHo3/ZFrWfQIrQOSc6DyZdH+0mjkl+O+sd
	xKJCYEdxKfIbEy1UuBeAZtFPyB7xZo3eSGgc7dwx/qHDT7WSafVeXTcgSfALU15drOjO
	SviEV66PlW2k4xeqg/mUZHmnQPhbocjylmwUb/oURplGLebadYYY6B5ZoCSy9gkR/2yX
	Mtug==
X-Gm-Message-State: ALoCoQk1ZBFkKZRxhyn+j189ABmhlrCyVWzEyxzd2RJ6iSYY92lA1Vpl8P9awPv/M92OsvGiy2uZ
X-Received: by 10.58.46.141 with SMTP id v13mr7097669vem.18.1402756852837;
	Sat, 14 Jun 2014 07:40:52 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id 6sm13502136vdd.13.2014.06.14.07.40.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Jun 2014 07:40:51 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jun 2014 08:40:40 -0600
Message-Id: <1402756840-30533-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] monkey: new v1.5.1 release.
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
X-List-Received-Date: Sat, 14 Jun 2014 14:40:55 -0000

This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
some problems when switching user when started as root.

monkey/yocto: 7a702d00c5e48d1e03d8bbd2c7bd93a0d26f701e

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/monkey_1.5.1.bb           | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
new file mode 100644
index 0000000..172d4f7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
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
+SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
+SRC_URI[sha256sum] = "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
+
+EXTRA_OECONF = " \
+             --plugdir=${libdir}/monkey/ \
+             --logdir=${localstatedir}/log/monkey/ \
+             --pidfile=${localstatedir}/run/monkey.pid \
+             --default-user=www-data \
+             --datadir= ${localstatedir}/www/monkey/ \
+             --sysconfdir=${sysconfdir}/monkey/ \
+             --enable-plugins=* \
+             --disable-plugins=polarssl \
+             --debug \
+             --malloc-libc \
+"
+
+inherit autotools-brokensep pkgconfig update-rc.d systemd
+
+INITSCRIPT_NAME = "monkey"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "monkey.service"
+
+FILES_${PN} += "${localstatedir}/www/monkey/"
+
+CONFFILES_${PN} = "${sysconfdir}/monkey/"
-- 
1.9.1


