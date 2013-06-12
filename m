Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BF4996A967
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 08:16:01 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 10so8619151pdc.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7j0HJRYx7pvdFR3/zffUS5KlWMr1c28fpgLBQloWawg=;
	b=bPMctZr4imZTy4Y6G0AXkr3VCzaHtkM38A+1lbw2n8eSL+nylU32zH5LqLI/nVmgdq
	zEWS1MwHmU2GOLMyr3N4u07h9/oQMmNNmJXvSiptUuBhgvJ6BFv/+R6cp8Ky2RuEiz9o
	zWsbOVdYXpXjaZzyU1uVv9mQ4mPlHLnsJMgclMoxzB0DSur5Aczq1NIBP6PhL8tFWyG2
	JcCibjMWQ5JLA+IvnhCZjNElJ7EE7P4DCKUW2iMmATPzGOGI9eaRmxvbCi3vKO/ECTNJ
	N3lmY49z3orbCRTrMwz7pnUiSNJTXYTou2EulpmO2hAt8tTBqM1RWArNGKRBaG0UdvGT
	eAXw==
X-Received: by 10.68.160.226 with SMTP id xn2mr18457653pbb.174.1371024962783; 
	Wed, 12 Jun 2013 01:16:02 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id jb2sm695630pbc.8.2013.06.12.01.16.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 01:16:01 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jun 2013 18:30:15 +1000
Message-Id: <1371025815-2776-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] xserver-nodm-init: do not execute Xsession twice
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
X-List-Received-Date: Wed, 12 Jun 2013 08:16:01 -0000

The /etc/X11/Xserver script runs xinit /etc/X11/Xsession already so
there is no need to do /usr/bin/xinit /etc/X11/Xsession --
/etc/X11/Xserver. Having xinit nested will result in Xsession being
executed twice. To resolve this, just execute /etc/X11/Xserver directly
instead of going through xinit.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
index 53e61d7..94d221e 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
@@ -3,7 +3,7 @@ Description=Xserver startup with a display manager
 
 [Service]
 EnvironmentFile=/etc/default/xserver-nodm
-ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /etc/X11/Xserver
+ExecStart=/etc/X11/Xserver
 
 [Install]
 Alias=display-manager.service
-- 
1.8.3


