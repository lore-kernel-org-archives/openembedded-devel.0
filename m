Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B2D696FC5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 23:41:43 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id il7so1499545vcb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 16:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RuKMQaXtPFbJAHOqfXIalQQDrpxTvw1dwUgLr2hmc/A=;
	b=bXBNxHpM//MEIVJc4MZUNS6ZW9WX9BFewTeS9frjSc3q3jUhYAdhIV9flxSH6tgT2z
	KWK6dg2jTxVGLyMVZUcQH8xhcZyzYIIbwl+PFhjZHik6m1VlRH9V3BzRRFSciEZxOk/Y
	Mi2T6aRs0L4bSlou0wuz0QXV68Ce1GRRXyE3+DBgpS0x5hcc6LAkZLx8kWzTUx+vQqHU
	5GwXgQ3xtqRwWkBZOkegf3RrGqHQ0qmFpSNBD/iUze2ZJ4ACtosPXVUNdVzkWJhKPgKG
	YpdP5RQlCOojcKF6IFjq2JFCPWn41PihJl308pmuj6aMKTTl7UOZwn7LCxEIhuAUoO9G
	lKlQ==
X-Gm-Message-State: ALoCoQmVS6upixQsgndtP3rHcZq9kkkVxSy3RKEJKZ2fB9J7StINcLEzCKy4AzlhIQkTDAF42TS8
X-Received: by 10.52.101.168 with SMTP id fh8mr660490vdb.34.1403134904454;
	Wed, 18 Jun 2014 16:41:44 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id y10sm3825787vem.12.2014.06.18.16.41.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jun 2014 16:41:43 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jun 2014 17:41:10 -0600
Message-Id: <1403134870-29746-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Wed, 18 Jun 2014 23:41:45 -0000

This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
some problems when switching user when started as root.

monkey/yocto: 3163d01492ea3d85268dc3773419e94db57ee8df

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb} (83%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
similarity index 83%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
index 6fa1b77..2ea18f5 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
@@ -8,15 +8,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SECTION = "net"
 
 SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
-SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
-SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
+SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
+SRC_URI[sha256sum] = "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
 
 EXTRA_OECONF = " \
              --plugdir=${libdir}/monkey/ \
              --logdir=${localstatedir}/log/monkey/ \
              --pidfile=${localstatedir}/run/monkey.pid \
              --default-user=www-data \
-             --datadir= ${localstatedir}/www/monkey/ \
+             --datadir=${localstatedir}/www/monkey/ \
              --sysconfdir=${sysconfdir}/monkey/ \
              --enable-plugins=* \
              --disable-plugins=polarssl \
-- 
1.9.1


