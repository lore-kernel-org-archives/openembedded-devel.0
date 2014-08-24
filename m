Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id AB08C70FC5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:22:54 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hy4so14206466vcb.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WrSlQtPItKAvKQqXKbp5y67ReiWOOXXjxPJCn4sIE1o=;
	b=f2l3+yNesRb+WZ7OvXltRO9YhzcIru6Ssig0GZhZQMqhXOSdgDHNztsr/IKhDCnZfe
	JLAg6Buy6zneVY8LG4UxQjzJEOdUbJ1Zd501c4wnfGcM3OT6QZCAga0p+PAcNdt10J0H
	ccw51jPZQyXDcUuug6wk/yhj0ehmxg9Q0/OZe5eHITfwCNPpQtzF/w16PqVoFSHRC1xN
	H9VxAouN5fgfBWrkywAMl6jtaA96En3xjDPrcAiOQK6+1MsUIDJFpUdL81JsxAH0FuP0
	mHmHavM27JmkjJooJ/K1VHA099G45ow9Df77xY+3CYboMHF9zTDBoQn7P/n/krD38GXc
	Ftcw==
X-Gm-Message-State: ALoCoQnPwGAZf69kkGpOSnrxJYmuix/gz0Iv5K/GzxhHzdTSD0czo7EIqplR3/h6NMAF51eHn1F1
X-Received: by 10.52.246.198 with SMTP id xy6mr13020272vdc.7.1408922575494;
	Sun, 24 Aug 2014 16:22:55 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id
	pa15sm111940826vdb.14.2014.08.24.16.22.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Aug 2014 16:22:54 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Aug 2014 17:23:06 -0600
Message-Id: <1408922586-29697-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] monkey: new v1.5.3 release.
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
X-List-Received-Date: Sun, 24 Aug 2014 23:23:01 -0000

This patch add the new Monkey HTTP Server v1.5.3.

For more details about software changes please visit:

   http://monkey-project.com/Announcements/v1.5.3

=== Build Tests ==

This version have been tested on Yocto/Daisy being packaged and
deployed on images based on RPM successfully.

monkey-yocto/672eadb254e754b91efe691a6594985ee6d9a22e

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/{monkey_1.5.2.bb => monkey_1.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.2.bb => monkey_1.5.3.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.3.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.3.bb
index fcd40e0..06095ba 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[md5sum] = "c90ccba23a814265c7e0fd3a75f883fd"
-SRC_URI[sha256sum] = "2048d49662895f83df475e22d87c45ea8022c0b1565bba222bda2192fd02c349"
+SRC_URI[md5sum] = "1fa9ddbb4c0100b22f2fc4b8da56dbe9"
+SRC_URI[sha256sum] = "0ac300e04f052818bc26b7da0183c3c5cd13be8090aaabd3505838587be8c0ec"
 
 EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --logdir=${localstatedir}/log/monkey/ \
-- 
1.9.1


