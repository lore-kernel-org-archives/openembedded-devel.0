Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2686D606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 16:15:41 +0000 (UTC)
Received: by pablf10 with SMTP id lf10so21264808pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8FaEdNhVJNGrGnqnSaOADKCx1okGw171reCYrRHchTs=;
	b=tFHw38liLCfaSo9hMlcQkV8Jvm9CFUy5eamYi3dXfaAg2bBtNVkeHVuOfQPTP25fKU
	jG/uEZhlxykb2NN3csxLkqrM0OYt3ji1ExzUOMc4QGzPzIr3rv+Fxlqk45z4HLh3iHDT
	WSD231oVX2cqdLl8ZgR8Fj9uLns6VIxHjKFBXLz78DogC/G1Y9SFhLmM+W0IiXRd81i6
	pZSkBL9mFWZR+uLRN9kdO3XQq6ImtHQigyw2qN79rPJ9z5tztGzusBkjI2oaG25dfVvO
	kc1KAe6kJNNvWmvp6NPRMttdllisn5PPIiVuAMBEQ4N/WVrBW/3Votsvzr8pUwYMN0qL
	c+jw==
X-Received: by 10.66.66.7 with SMTP id b7mr12638930pat.9.1424621742998;
	Sun, 22 Feb 2015 08:15:42 -0800 (PST)
Received: from localhost.localdomain (104-37-60-13.dyn.novuscom.net.
	[104.37.60.13]) by mx.google.com with ESMTPSA id
	bs2sm16915749pbd.74.2015.02.22.08.15.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Feb 2015 08:15:42 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Feb 2015 08:15:42 -0800
Message-Id: <1424621742-17713-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] xfce4-session: Make package MACHINE specific
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
X-List-Received-Date: Sun, 22 Feb 2015 16:15:44 -0000

Because the xfce4-session recipe has a machine-specific pkg_postinst_,
the package itself must be considered machine specific.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
index 74289fb..f804487 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit xfce update-alternatives
 
 SRC_URI[md5sum] = "1757657c1d590aa6274b7b7cbba33352"
-- 
2.1.0


