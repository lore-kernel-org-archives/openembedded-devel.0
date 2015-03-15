Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B884173919
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:13 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so27057804wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=WpsRusdOLiJB+jJtMOG3bwMRd1ugPOAuDCjM5PVzhMg=;
	b=YjZP+NltckJPiuKXo80rQeqDP731CsV+/wYXqgEf/GqUDvh8Qo2HTgwJ79NwI+n8zz
	+rcpwqhyYfoHd2la0ym5Ft7AHVYtrBX3J0i697PtRc1nPGRk7RPr+GKZEZ1cUknkniyH
	mOtmWWsmMULONxh1WiIZ7ru0V3Y2XchvlLEmrEapxHTk8xR43lLfvnQinz7wPvfnY41Y
	erC0bcGyoDWoHQ6FJ65tdZY7hgNUS6V1OE/6boWgIML1CHFgbvbXf8xBy0+lWVx/rLgJ
	hLmnz/ZesuczfeOec8XIr3toivhlXbcAeAjFtjqZmTMAJruPu7PTWQhCVfBcYN++GzzP
	yWVQ==
X-Received: by 10.194.122.232 with SMTP id lv8mr112720324wjb.146.1426462454544;
	Sun, 15 Mar 2015 16:34:14 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:24 +0100
Message-Id: <1426462419-10173-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 15/30] xfce4-power-manager: update to 1.4.3
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-power-manager_1.4.1.bb => xfce4-power-manager_1.4.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.1.bb => xfce4-power-manager_1.4.3.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.3.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.1.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.3.bb
index a4aaf66..496b3fd 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.3.bb
@@ -10,8 +10,8 @@ inherit xfce
 DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel"
 
-SRC_URI[md5sum] = "808a2630487d75e6eae915e464b7fda3"
-SRC_URI[sha256sum] = "16a9e9bf3e0f8480d05b248817fbdc59e701e9161d3d0c7e53f3de28ed491f58"
+SRC_URI[md5sum] = "caa17bfd96c0879e7bcc7432896fad52"
+SRC_URI[sha256sum] = "018e11dd315745f582d70108b6071d37fb94854fde70961e17325bc19c4e2011"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
1.9.3


