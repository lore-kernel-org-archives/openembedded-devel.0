Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4846AB73
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2013 15:08:31 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so10182472eaj.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2013 07:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kd3BioVgfvdgfxnI28lvQUMbsPsNOKEev7kW7+X+PJk=;
	b=fv2dmPa/lD8jj5zdWdV9oWDcSUQyXql3ZK734ojGlGDViEws6O49VvRod4FvhFrvi8
	CtfUCb5mab8dHT2UFGz5tcLC/31Zs0gAy8aeqMg112VEVwKpNNP0NafRRy4axb8wdC+f
	qOSVlxsqiItmxpS6Ql604r6HZ3oIChP0TLWnF/SU/cdY+7BooANWoUjLMguBUTqw3iJ+
	Cz7rCR4c8sLA0y+bJGKhYb2ziDUS91DHamJjMd8T4ky5oKMXVph/TDmmmDj+VanpJvxF
	CgzULum3R3PA9G/7jeS2IHDOPSWsB4fJH42DS/cN6A+uQ0y6syJf19F7eE/RrKiqRNPR
	dqyA==
X-Received: by 10.15.34.5 with SMTP id d5mr58051902eev.20.1385824110799;
	Sat, 30 Nov 2013 07:08:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm51672256eeh.8.2013.11.30.07.08.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Nov 2013 07:08:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2013 16:08:33 +0100
Message-Id: <1385824113-4414-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][PATCH] xserver-common: Rename Xsession.d files to end with .sh extension
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
X-List-Received-Date: Sat, 30 Nov 2013 15:08:31 -0000

* oe-core version of xinput-calibrator installs
  30xinput_calibrate.sh and ls -X used in Xsession script sorts it as
  last (not respecting the numbers) and xinput-calibrator is executed
  too late (after 90xXWindowManager)
* don't forget to update all your components installing Xsession.d
  files as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 481e438..5bc37b0 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -28,6 +28,13 @@ SRC_URI_append = " \
 
 do_install_append() {
     sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:' ${D}/etc/X11/xserver-common
+    # Rename all Xsession files not ending with .sh
+    # Unfortunatelly when xinput-calibrator was moved to oe-core
+    # its Xsession file got name 30xinput_calibrate.sh and ls -X sorts it
+    # last, not respecting numbers for sorting them
+    for i in ${D}/${sysconfdir}/X11/Xsession.d/*; do
+        echo $i | grep '.sh$' || mv $i $i.sh
+    done
 }
 
 inherit allarch
-- 
1.8.4.3


