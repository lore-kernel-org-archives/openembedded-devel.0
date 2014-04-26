Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 883E465D94
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:51 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id lf10so4371483pab.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IEtDsDRNVxa2UMCjnGrEx/PpHYmnyJSUPYQXSUexyAM=;
	b=rMjkdh3+zui/wsXTomPM0CeblfUx6yCJG3HOJLPSsYI+bi5MjUeyP9MuRrfxusl3tm
	+kSoejqFFBD0lnlq4F46e+jLoef40vdl7u0PN20Dnly7NiwS+H6NJ1P5o6H7LxPX452x
	UpUWULon09paUJvNBLTvyYMRWDXOL5qQSiOIahIukHsu7EtGg2Bu/svTImIIK5XVomLT
	tw7aeekiRfoFYN3erSNWiPpk3Ent5/K/oUUnkojRknW03UHRzrFF1m9uWycCc25v5L9Q
	QCyGcgYkOO4MBzHxzqcb1e+O+RwwKf9xcI3AsKhahj6HHvO1bP+HBo/o4yTlALw+2fFk
	rBPQ==
X-Received: by 10.66.102.39 with SMTP id fl7mr15923779pab.43.1398544372535;
	Sat, 26 Apr 2014 13:32:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:37 -0700
Message-Id: <1398544484-27299-14-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 14/21] gnome-settings-daemon: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb            |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 34c9197..9e3bf17 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--disable-esd \
 "
 
 do_configure_prepend() {
-    sed -i -e 's:-L$libdir::g' -e 's:-I$includedir::g' configure.ac
+    sed -i -e 's:-L$libdir::g' -e 's:-I$includedir::g' ${S}/configure.ac
 }
 
 FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-settings-daemon-2.0/*plugin \
-- 
1.7.10.4


