Return-Path: <danismostlikely@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1CC601DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 20:29:25 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so21261544igd.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 12:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bV9p352olWTyAnr6/cc0a9wkwEtC/TFE2ZEoZ7goNQ8=;
	b=cBTkNAlDZ7p/+fWgVSyTmLVYWiD2WHixxPT7qsE/iNqv+ZEaSEYA3cq04O+hP7bapv
	SXZyLL0pmb3PFrRs8pduPe8tSP2/ArS//am8/jeDMqvxOZoaP/9/ELnQhRr32eDRWzoi
	BYTsO3DgpTNH5O5EECU0ml+l4sw/o/V2DwAhphyc0eyIgm0FX6v6n9EONJZLhh9IxSnh
	fLKr1kaNHHkL9P+LiCzJG5K+KFM/7Y0ROu9BMDVGtgmcP5/YEMXDjWexlzk7tBVGZqz2
	n7x/umtNEa/uHgXQ5L5atWCmNfJr5xaxw41B8f1WXLP5JLlEnMFeWk75F0kTGxNvspuD
	CLOg==
X-Received: by 10.50.142.99 with SMTP id rv3mr26626121igb.11.1423081766929;
	Wed, 04 Feb 2015 12:29:26 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id 16sm1382580ion.23.2015.02.04.12.29.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 12:29:26 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:29:19 -0600
Message-Id: <1423081763-2905-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-oe][PATCH 1/5] xserver-nodm-init: only enable for runlevel 5
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
X-List-Received-Date: Wed, 04 Feb 2015 20:29:30 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Runlevel 5 is traditionally graphical. If it starts in runlevel 2
or 3 systemd gets confused and adds it as a dependency of the
multi-user target, not just the graphical target.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm         | 9 +++++++++
 .../recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb  | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
index d2e2f86..5d7e8a2 100755
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
@@ -1,4 +1,13 @@
 #!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: xserver
+# Required-Start: $local_fs $remote_fs dbus
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
+### END INIT INFO
+
 
 . /etc/init.d/functions
 
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 47470fb..f9bf007 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -15,8 +15,8 @@ S = "${WORKDIR}"
 inherit allarch update-rc.d systemd
 
 INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
-INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
+INITSCRIPT_PARAMS = "start 01 5 . stop 01 0 1 2 3 6 ."
+INITSCRIPT_PARAMS_shr = "start 90 5 . stop 90 0 1 2 3 6 ."
 
 do_install() {
     install -d ${D}${sysconfdir}/init.d
-- 
2.1.0


