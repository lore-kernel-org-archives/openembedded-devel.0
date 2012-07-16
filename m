Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SqhjE-0007In-Qi
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 11:36:32 +0200
Received: by bkcik5 with SMTP id ik5so3347036bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YXBisCqvPhZo3jVH6ogg5NnJS7xNCBmHMo15C1HW7qE=;
	b=kieHlY3Vrgk1LjSnC3xjm6yQ1x+OAmvs2DCeZ8Uc8x0RjE5TpW3Q+zvM8Hh8sYMFzc
	20F5yYo0d4q9gIzRyCh9imFiDhkBhaxjX06T/Csg5iuB0G5TOk1r7X0I+XDjcDqx0IWv
	OK1y0Lb1EmXj3wSGLuNRCZn3Fx1l5XoVu80+/K95QSnPUdbgj/sux58EuWIdNnWWnbOU
	+ccW58LBI/F/dZxKvcpaA48845/vPgiU7gcEotMI3KlwZ5wbdkXdOIRFdiMLm9NFF9MH
	BfSav2aujZnY83M5bauaT+c01R/g9BBeQBm+w4tUuuogxsuezTkftPz4OzWlRiJMx1N+
	Jytg==
Received: by 10.205.128.3 with SMTP id hc3mr4510886bkc.29.1342430714950;
	Mon, 16 Jul 2012 02:25:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gq2sm7568706bkc.13.2012.07.16.02.25.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 02:25:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 11:25:20 +0200
Message-Id: <1342430720-4501-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] recipes: svn SRC_URI s/proto=/protocol=/g
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
X-List-Received-Date: Mon, 16 Jul 2012 09:36:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-bsp/ezx/ezx-gpiotool_svn.bb |    2 +-
 recipes-bsp/ezx/ezxd_svn.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ezx/ezx-gpiotool_svn.bb b/recipes-bsp/ezx/ezx-gpiotool_svn.bb
index 2d403de..ed733a2 100644
--- a/recipes-bsp/ezx/ezx-gpiotool_svn.bb
+++ b/recipes-bsp/ezx/ezx-gpiotool_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "1877"
 PV = "${SRCPV}"
 PR = "r1"
 
-SRC_URI = "svn://svn.openezx.org/trunk/src/userspace;module=gpiotool;proto=http"
+SRC_URI = "svn://svn.openezx.org/trunk/src/userspace;module=gpiotool;protocol=http"
 S = "${WORKDIR}/gpiotool"
 
 do_compile() {
diff --git a/recipes-bsp/ezx/ezxd_svn.bb b/recipes-bsp/ezx/ezxd_svn.bb
index f738b5f..6dbcd0f 100644
--- a/recipes-bsp/ezx/ezxd_svn.bb
+++ b/recipes-bsp/ezx/ezxd_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "2513"
 PV = "0.0+svnr${SRCPV}"
 PR = "r4"
 
-SRC_URI = "svn://svn.openezx.org/trunk/src/userspace/;module=ezxd;proto=http \
+SRC_URI = "svn://svn.openezx.org/trunk/src/userspace/;module=ezxd;protocol=http \
            file://ezxd.init \
           "
 
-- 
1.7.8.6



