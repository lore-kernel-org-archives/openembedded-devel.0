Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdObY-0005KC-Uq
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 18:05:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4828389eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0pCKLHxqcTRDqJSlPBCZf4egXsgpemOHP6JuVd3f8r8=;
	b=NCWjXfKKUXwRUA7ScuZdoYOK6lCEXnRLgvyGSLx08V6NDbRKrtsq2xqabB4h7dr0Ma
	SlTRaC4J2VBYvZG7nkVEpu9/qH8Q6dkZy4UaiFhyYT/k+QXSpCw0XnxOWAsrrZT9XG6C
	S251wVhpc+X1Ltjb5KoaFfIEu8Ep4cZNOSBTuReiHr2q6F7VpHKkLjhJ+upi4/FAjlZ6
	cqRZAVqvozK6q4WezcOGE8aEhOZ5bOrHDEQBX/ZXfBGHHrr0KzikRJyDCzlfm9K80qv4
	TiT+F/CREJOB/TKX8jqOtA/uRZv3x+iNytxF04Ff4qT9vJ1YZYyn5VcsZrRT7eAuTDEg
	Itqw==
Received: by 10.14.199.134 with SMTP id x6mr60000373een.31.1354035101977;
	Tue, 27 Nov 2012 08:51:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm41683050eeo.7.2012.11.27.08.51.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:51:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 17:51:13 +0100
Message-Id: <62a71128176f2fb43cd33fc58e0818f92b7b15b9.1354034673.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] xserver-nodm-init: replace 'WantedBy=graphical.target' by 'Alias=display-manager.service'
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
X-List-Received-Date: Tue, 27 Nov 2012 17:05:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init/xserver-nodm-init/xserver-nodm.service            | 2 +-
 .../recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
index c15a772..53e61d7 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
@@ -6,4 +6,4 @@ EnvironmentFile=/etc/default/xserver-nodm
 ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /etc/X11/Xserver
 
 [Install]
-WantedBy=multi-user.target
+Alias=display-manager.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
index 5538805..b6b77c9 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.8.0



