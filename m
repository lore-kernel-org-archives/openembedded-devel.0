Return-Path: <k4230r6@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A133972C04
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 May 2015 04:22:30 +0000 (UTC)
Received: by wgso17 with SMTP id o17so138290575wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 May 2015 21:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yQs9Et1XFc1n5v3lcB6w9cFYbTGPhULbuwq3Njh9kHY=;
	b=D632eraBrFWJDEKaHgBUAEpRW7dRaeLlo+gR9227cpvSw5V6apE0pkzAKpuxTU/FIb
	Ng6tTnVi9bqplTqsPfozh+1gECW2GYfB+Jg3WsdViKNym3hsDQRE3hOvNkbR+6j3rJCN
	eeAWU1KVEwSX15qm4lmhZdi28p2aYiwQY6QF4JpDL9aS54+dMveXkhAmy7l5xMTF0qcx
	gLQMQKDoSQWoDrk9x1fM/wLMso0L5vs5Avp5eFiNthbqOi/d9hTIYdF8GyFfATmLgBIk
	wvd6lccJIUjhUg5MrJehN1h1V+L6WCKIKnA/VUu9gJnFzs73q3GMokTB1zSCUahsGYTQ
	29RQ==
X-Received: by 10.180.100.101 with SMTP id ex5mr16355124wib.13.1430713351896; 
	Sun, 03 May 2015 21:22:31 -0700 (PDT)
Received: from quadros.fritz.box
	(HSI-KBW-46-223-216-155.hsi.kabel-badenwuerttemberg.de.
	[46.223.216.155])
	by mx.google.com with ESMTPSA id di9sm9216004wib.16.2015.05.03.21.22.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 May 2015 21:22:31 -0700 (PDT)
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 May 2015 06:22:19 +0200
Message-Id: <1430713339-4879-1-git-send-email-k4230r6@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Fixed path of rng-tools default configuration file
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
X-List-Received-Date: Mon, 04 May 2015 04:22:34 -0000

The initscript expects the config file in the folder /etc/default/
but the recipe copied it to /etc. The recipe already created the folder
/etc/default/ put it there.

Signed-off-by: Christian Ege <k4230r6@gmail.com>
---
 meta-oe/recipes-support/rng-tools/rng-tools_4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
index b3d880f..34a3f95 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
@@ -28,7 +28,7 @@ do_install_append() {
             ${D}${sysconfdir}/init.d/rng-tools
 
         install -d "${D}${sysconfdir}/default"
-        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-tools
+        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
     fi
 }
 
-- 
2.1.4


