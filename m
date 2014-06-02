Return-Path: <eduardo@monkey.io>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id E6E436B678
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:35:53 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id sa20so6015010veb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 13:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ASPstg0LpZu9ZQ/I6F3XtnFKDbUOBFFniRwOcEI885Y=;
	b=Y0VnZRJVKUvkZQwwDj7zinFb6E/Jquuz7AlLbwQdrUConf8uKcWXqSqlnwpV8rQp2j
	4TI81/YcBAIv2wg+17whuCZqkJxTTTBD/dzPBrTJGXBHTkRP7EzeLiLFGjfXTpJyHEEF
	qQ4COUxOGa/ysdFX2C4lbAWXsom0nUKq704UKZ/Mjcps6ihLqiTTL8ZNBYUD2IuJqNri
	3H9BmKFsnKZkVS4Q5UGuqnhxZxhAnf48JKFZZUcRHx3HY0Wj1o6sIbSsd5arLLEN5ah3
	MjdzrXdiHITpukUaBqbjYQOn3cB70Z0tTOqNJHDwEZScFtV8O8Tsxq9OSPl3Hx9tYUTy
	htiA==
X-Gm-Message-State: ALoCoQnsevJHZRlIwH8fKFMs2yIFkLB9INmu5kfs4t+mTFl/ee1hKZzViFHHQkkp6upPjNZFrEIr
X-Received: by 10.52.138.14 with SMTP id qm14mr2442318vdb.49.1401741354078;
	Mon, 02 Jun 2014 13:35:54 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id zt10sm7927356vdb.1.2014.06.02.13.35.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jun 2014 13:35:53 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jun 2014 14:35:40 -0600
Message-Id: <1401741340-24934-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] [meta-webserver]: add Monkey HTTP Server
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
X-List-Received-Date: Mon, 02 Jun 2014 20:35:56 -0000

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/monkey_1.5.0.bb           | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
new file mode 100644
index 0000000..c6f1a76
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Fast and Lightweight HTTP Server for Linux"
+HOMEPAGE = "http://monkey-project.com"
+BUGTRACKER = "https://github.com/monkey/monkey/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+PR = "r1"
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


