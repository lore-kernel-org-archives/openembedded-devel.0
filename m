Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6GR-000710-KO
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:35:47 +0200
Received: by bkbzv3 with SMTP id zv3so1025353bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LgsWS1SPNkcF3zg2sExn8LRZyTNg3q6yTsk5rZLlfyU=;
	b=vVUmTtMfXsF2i4DL0xMTD0ON8nbV6BiHeNvltOIcnfT0vecjzcf2vVrU4joxUpKTOU
	6fjpmidAkIR73KTBP1R4chgtZII9TgVlvxCg6Uaax5Il1cMTkIHymzIaYSZyurkKIfWh
	Lz8XkEwVWUD4Ewa0d4dNB990BQowj8x+mPpzc=
Received: by 10.204.15.208 with SMTP id l16mr5087911bka.18.1319884182349;
	Sat, 29 Oct 2011 03:29:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k13sm8009357fah.0.2011.10.29.03.29.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:29:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:00 +0200
Message-Id: <ddd917f569080cd9a65033e1e81b1efc15bddd04.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 04/12] xserver-nodm-init: set USER and HOME
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
X-List-Received-Date: Sat, 29 Oct 2011 10:35:47 -0000

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



