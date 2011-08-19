Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QuSk2-0002VY-2H
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 19:20:22 +0200
Received: by fxg11 with SMTP id 11so2308322fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=7075HaibBf98wjCRWr97ihmgpGMqkE1NXbH0whuFq1g=;
	b=G+GDk6zw0WtqhIzl8hXqy8yDG0M4GnEdxaDyEvMx87RiJKxlfwLYIR05nci/KXGQ4p
	Xw1NlUGXoJ5bTq71RsZQdi+Lo2jjZzPdxCWv6znZiNYlnA4QqkX7quFrdg70UYFBM1DJ
	kMYRRVdiWZFSEL4hvH2S7fsWLm5pLL64wk7Vw=
Received: by 10.223.16.194 with SMTP id p2mr3208622faa.58.1313774141396;
	Fri, 19 Aug 2011 10:15:41 -0700 (PDT)
Received: from Hellboy (qrc29-1-82-245-206-103.fbx.proxad.net [82.245.206.103])
	by mx.google.com with ESMTPS id i16sm2717927faa.45.2011.08.19.10.15.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 10:15:40 -0700 (PDT)
Received: by Hellboy (sSMTP sendmail emulation);
	Fri, 19 Aug 2011 19:15:37 +0200
From: =?UTF-8?q?Sylvain=20=27GarthPS=27=20Par=C3=A9?= <sylvain.pare@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2011 19:15:35 +0200
Message-Id: <1313774135-24525-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] shr : initscripts-shr, changed mountdevsubfs.sh init level from 04 to 05 S to fix issue for machines using udev
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
X-List-Received-Date: Fri, 19 Aug 2011 17:20:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * since this commit http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=974dfb87778a26b80983b44c94922d0acb257e33 machines using udev and mountdevsubfs.sh had issue of pts not mounted
 because both were at init level S04 despite mountdevsubfs.sh was depending on udev..

Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com>
---
 recipes/shr/initscripts-shr_0.0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/shr/initscripts-shr_0.0.1.bb b/recipes/shr/initscripts-shr_0.0.1.bb
index 02e2205..803bcdf 100644
--- a/recipes/shr/initscripts-shr_0.0.1.bb
+++ b/recipes/shr/initscripts-shr_0.0.1.bb
@@ -97,7 +97,7 @@ do_install () {
 	ln -sf		../init.d/mountkernfs.sh	${D}${sysconfdir}/rcS.d/S01mountkernfs.sh
 	ln -sf		../init.d/hostname.sh		${D}${sysconfdir}/rcS.d/S02hostname.sh
 	ln -sf		../init.d/checkroot.sh		${D}${sysconfdir}/rcS.d/S02checkroot.sh
-	ln -sf		../init.d/mountdevsubfs.sh	${D}${sysconfdir}/rcS.d/S04mountdevsubfs.sh
+	ln -sf		../init.d/mountdevsubfs.sh	${D}${sysconfdir}/rcS.d/S05mountdevsubfs.sh
 	ln -sf		../init.d/alignment.sh		${D}${sysconfdir}/rcS.d/S06alignment.sh
 	ln -sf		../init.d/mountall.sh		${D}${sysconfdir}/rcS.d/S35mountall.sh
 	ln -sf		../init.d/populate-volatile.sh	${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
-- 
1.7.4.1



