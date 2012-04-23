Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SMKMO-0003d2-Gv
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 16:35:24 +0200
Received: by wgbdr12 with SMTP id dr12so9975777wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 07:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=zKcLYxknguBMv6603qA11JsfFOywNmNHPNEDz6HE8MM=;
	b=NDziQsdjTw8SlT3YN274/f2U1++aMpTusPP1+HfbJhHIFW/As95O/bqmp4Ov8FK/iY
	85slTGub5E6cT+k1PDd8RUg5kktxMSx4a1KSk+wVoNRe6toA7QFsxp9A8vBGw1QnnnWT
	2r1NwjtdhGgJ8/xHQyIhmHlcOWecYTgNETitUIU5Nq4upR+yaW8iE36hKVQSZnnaP4DV
	udl/arywXkXYd9jh5UgeZm1XFqMlDFKNWbxv6mRG7R+KPVQp5yc/0hz67Yox9CKb+Igx
	dKiBa/6uY8YCYRHnAsHBrUmJHbdZOa+D7D83ejRf+h5YDniojktO1Y/lLGWhYzSYYvfn
	V1oQ==
Received: by 10.216.138.38 with SMTP id z38mr2564077wei.63.1335191151037;
	Mon, 23 Apr 2012 07:25:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm22917421wib.6.2012.04.23.07.25.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 07:25:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 16:25:35 +0200
Message-Id: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm+S+bus+QFE5cruzGZkIVss13Z2asw2wCa5IYUx2XYrs0vKJrZCtfOsyvVOyatYYJFsk6i
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-kde][PATCH] qt4-x11-free 4.8.0 bbappend: fix GLES configure switch and turn it on for AM335x SoCs as well
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
X-List-Received-Date: Mon, 23 Apr 2012 14:35:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc-support/qt4-x11-free_4.8.0.bbappend |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
index b5a3c16..4895893 100644
--- a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
+++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
@@ -1,7 +1,8 @@
-QT_GLFLAGS_omap3 = "-egl"
+QT_GLFLAGS_omap3 = "-opengl es2 "
 DEPENDS_append_omap3 = " libgles-omap3"
+DEPENDS_append_ti33x = " libgles-omap3"
 
 # Needed by kdelibs
 QT_DISTRO_FLAGS = "-accessibility -sm"
 
-PRINC := "${@int(PRINC) + 1}"
\ No newline at end of file
+PRINC := "${@int(PRINC) + 2}"
-- 
1.7.7.6



