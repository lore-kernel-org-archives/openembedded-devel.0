Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHUGG-0007dW-JX
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 08:09:04 +0200
Received: by wera1 with SMTP id a1so2986736wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fM43VOMVDrG24wKTCcknKHaT+1JyT9Tlluj86o/Pe0o=;
	b=UVc1Nl3JrV/1rmqf1g6Vo53uksFVaA2+VxfQUoSeCKicZ1WX7cxw8Dj1npBuUfV3h8
	CFlDjsXPKpJWAc8xJVYLMA6XqB8Uq//5vAcw1vEMMn5xhgi46XCORGRpLVhOBqjUQJKf
	FcRFjnw+5yA8sopbzZHxknxjFQAdE6ryUCqdkPoqGZnSeikNOVh9OcONI0uAH2W5AwwR
	g2ozXki3MNsOEvfaFXy2Cx9UsolEV7qhCySphdxN+w6nTlfPNq8SjvAyivs4ecfdmN98
	ot5QDSavji6BfnWqxtVJV1i/CdE5xRqz6EYSryCMJtUYjkEWLY4QkySLrWNcguxpu/Oa
	2PIA==
Received: by 10.216.200.90 with SMTP id y68mr5394924wen.49.1334037587453;
	Mon, 09 Apr 2012 22:59:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm57522402wiw.1.2012.04.09.22.59.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 22:59:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2012 07:59:38 +0200
Message-Id: <447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1334037469.git.Martin.Jansa@gmail.com>
References: <cover.1334037469.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] xserver-nodm-init: use /etc/X11/Xserver from service file instead of Xorg directly
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
X-List-Received-Date: Tue, 10 Apr 2012 06:09:04 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

* /etc/X11/Xserver is provided by xserver-common and sets correct DPI
  before starting Xorg (or other xserver)

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init-2.0/xserver-nodm.service     |    2 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
index b781c7d..a35d70e 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
@@ -2,7 +2,7 @@
 Description=Xserver startup with a display manager
 
 [Service]
-ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /usr/bin/Xorg
+ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /etc/X11/Xserver
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 98025d3..36d9bfc 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
-- 
1.7.8.5



