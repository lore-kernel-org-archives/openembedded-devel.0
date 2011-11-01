Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9nf-0008GO-Qx
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:34:28 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LgsWS1SPNkcF3zg2sExn8LRZyTNg3q6yTsk5rZLlfyU=;
	b=Cgj73NDPu+5KangZNlsAJPbpeGjCh9UjmbRmUeUmamDjkUS8cbPcklOQ0kHeWODjuB
	kJpr5pWhZBH+w4H8q6qeEWFX97UDDJ7TPc2q76ZJO3JIdXsJ+nB8iihoC1hFjwspKPS4
	5qFVbnAJx6ZafacGwDDKz6wzsokch0+28bDBU=
Received: by 10.223.77.71 with SMTP id f7mr35420033fak.33.1320136104325;
	Tue, 01 Nov 2011 01:28:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm43328321fae.16.2011.11.01.01.28.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:28:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:38 +0100
Message-Id: <2aaced3b1efc3c1735e104c23817f3fba38052ee.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 04/15] xserver-nodm-init: set USER and HOME
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
X-List-Received-Date: Tue, 01 Nov 2011 08:34:28 -0000

* when it's executed from init then HOME is set to '/'
* shadow/agetty set HOME fine and Xinit is doing the same, but for xinit Xsession it didn't work

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init-2.0/xserver-nodm             |    7 +++++++
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
index 39ce890..d2e2f86 100755
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
@@ -17,6 +17,13 @@ case "$1" in
     if [ "$2" != "background" ]; then
       $0 $1 background &
     else
+       # work around from /etc/X11/Xinit
+       export USER=root
+       export HOME=/home/root
+       if [ ! -d $HOME ] && [ -d /root ]; then
+         HOME=/root
+       fi
+
        . /etc/profile
 
        echo "Starting Xserver"
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 17fe4d8..496b342 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
-- 
1.7.7.1



