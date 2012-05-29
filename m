Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SZOCY-0003dt-2M
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 17:19:14 +0200
Received: by bkcjm2 with SMTP id jm2so3273773bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2012 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=x0/gYRhXs3Rsu4kL8m4WyAFB+2ZQNBxHs7gK+kWtwpQ=;
	b=xgP7R6IwoJKz28FF7c1VG/AS/1JWEX9tU5KewDS+3zHvIZ31rmwpcIpTpjsL698UGs
	3qjHjD77JObaljocYVbKsF5eC2BsQSNFTvFsLxY5tP1ffmAymHMYHlvGxi4yUxpzlJQT
	5S58D4X6WUxQcOui/oW8tBaLVrnRNTnVeUyeU9TRugFvsE530zyQQhcRyevyuagnSQHQ
	etQ3DzkWjvFhkA93wXUqWP8zEGGkgQ8HAUNcRfRo4liH+FcIqAx4+UgUdJwL2oXP4ELE
	Il7szXe4h/MOsSP/KgG70SPo0tOkkR8ngjZ1oQjpySbXO1394xej5MQvQFL52JgpbG2+
	4w1g==
Received: by 10.204.128.149 with SMTP id k21mr6207044bks.42.1338304136640;
	Tue, 29 May 2012 08:08:56 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm18404591bkc.4.2012.05.29.08.08.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 08:08:55 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 May 2012 17:08:45 +0200
Message-Id: <1338304125-5922-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-kde] [RFC] [PATCH] qt4-x11-free_4.8.0.bbappend: Fix Plasma Active by adding undocumented configure flag (--reduce-exports)
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
X-List-Received-Date: Tue, 29 May 2012 15:19:14 -0000

No more "Declarative scriptengine not found" errors

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 recipes-misc-support/qt4-x11-free_4.8.0.bbappend |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
index 4895893..beeb49f 100644
--- a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
+++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
@@ -1,3 +1,6 @@
+QT_CONFIG_FLAGS_append = " --reduce-exports"
+
+# Build OpenGL/ES support if available
 QT_GLFLAGS_omap3 = "-opengl es2 "
 DEPENDS_append_omap3 = " libgles-omap3"
 DEPENDS_append_ti33x = " libgles-omap3"
@@ -5,4 +8,4 @@ DEPENDS_append_ti33x = " libgles-omap3"
 # Needed by kdelibs
 QT_DISTRO_FLAGS = "-accessibility -sm"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
-- 
1.7.5.4



