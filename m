Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 54BA874C00
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:48:58 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id n10-v6so18736273plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Z5YQSIEWDckYWo04wUlUjpwDvdm0dCdpntcGzPuaMe4=;
	b=QBPbMraSLFNzxDE9/Ok56uq97I1gZc3wix8zl+g3/wtZqiXTwOermHl4D6WVCQgigQ
	q0zCjkdsXWTVB4pNoFInycy0w3tUfnLCVoI3/Y9dLMkaebu+CzC0YENjrRhp46WDuekS
	cPHRs7s6t3GjFErGTr4Zvkg3RMFVwL9OKmICa5/thlmBwvunhNNgByemDHlUfEStL2nX
	TsVWUogIpIuVU4+TjU2qkeB9ttKOK6s4q+yr5ITlmfAfHdFdFQm3xkuk2Iggde0Aq+xj
	iF24MBsvr/+hCEfN11Ay5Si8D6AILSqe8U+vIbADJRfMWgNozWky3MReGgBhbsHmXgxO
	taWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Z5YQSIEWDckYWo04wUlUjpwDvdm0dCdpntcGzPuaMe4=;
	b=tGweIjeU2MQTNsZCzcYCXGIQUWVZED1N7jMMp76oNVLxMYwGlcbExGj22iPiIpdVSU
	XRcbZyyryydZzcEyNjejgwRBJv92OpAzzszVX9dV01mDYeSb2XYWg9xg4TibSkAAyiw+
	0Ep90Dh+TSJwZx1rdv8nkOY1ZSjgTxbN53Qp9oKAXY+dh0lwK6C2/Y6Y80zz+hw/naqo
	Pboc5ymiI38ihVgWYGdyPgSH+D3Ef/d90SOS4u/y804EREO6lhnkGi6/CUbelNyMMkhD
	XB2u1EySl6gcO+2d+qr8U6v8zs42snGpzyFzroh5KP3a/JoJWSPatqAECHwaoBrvTTWM
	W/+Q==
X-Gm-Message-State: ALKqPwdBt+k9MgJtBDQAV/ar/1brR/6JkLnKLhzya5B0yTG1Gs1JJM+/
	ltnnh1CV3CVqdPV4fS4dBPPdtA==
X-Google-Smtp-Source: ADUXVKIJbv3ZTu+D8f54s2GJBJFvJ0sbhTviwD5acDKyLwNirt3y8Nzy0r5G9lJ7EtsT9DdraDk1Uw==
X-Received: by 2002:a17:902:4101:: with SMTP id
	e1-v6mr19976740pld.205.1528080539494; 
	Sun, 03 Jun 2018 19:48:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.48.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:48:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:37 -0700
Message-Id: <010e7ae6aabd94f566b8df5f52623efb3f6dac8f.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 03/15] opensaf: fix QA Issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jun 2018 02:48:58 -0000

From: "dengke.du@windriver.com" <dengke.du@windriver.com>

Move the do_sysvinit_install contents to do_install_append.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
index da9c105..6ceb225 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
@@ -53,6 +53,11 @@ do_install_append() {
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
+
+    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
+    fi
 }
 
 FILES_${PN} += "${localstatedir}/run ${systemd_unitdir}/system/*.service"
@@ -62,12 +67,3 @@ INSANE_SKIP_${PN} = "dev-so"
 
 RDEPENDS_${PN} += "bash python"
 
-do_sysvinit_install() {
-    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
-       install -d ${D}${sysconfdir}/init.d
-       install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
-    fi
-}
-
-addtask sysvinit_install after do_install before do_package
-
-- 
2.7.4


