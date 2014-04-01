Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7879F6F9FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:03 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so7793147wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=RxxhrpqDl53FyZXCC7gNmzq73AiggGaFt2y7mGsxy8A=;
	b=HCpHRJFbPf8MqlrNvHEuReGUWfu4ALtRngeYLJd5oOvW4YVwa/50ZQW6c3yfXIVKAh
	qV/FQx1heWfZzxwRtFY0jFbS4G7FEO9C6W9tmVt9FRjjW22j6vv+Tki4TZ2EbHHB4nMi
	EI2my1ibTE5gOOgU3THRYZS9YXRyIWq5LK3dDWLSvQtXi/NMskQQCmBuwjSgddE5PV2t
	1Eggg/dRP4k9YS3Xjs5GmWu6hLgYu2cpvtnMtN9BF7kOSagWIqHPipkZSA/u5KFqhI23
	gqyrzH+e/gJ7+FgWgNY7FLXzjuvi2W0pCiXi1ooQ1Q/AKiCe8XPcYMaOdi7x5Wa1CrwS
	Mh1A==
X-Received: by 10.180.75.49 with SMTP id z17mr20934113wiv.1.1396365724507;
	Tue, 01 Apr 2014 08:22:04 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:42 +0200
Message-Id: <1396365706-14220-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 06/10] xfce4-closebutton-plugin: fix configue by inheriting xfce-git.bbclass
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../closebutton/xfce4-closebutton-plugin_git.bb                     | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index e095899..f96009e 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -3,7 +3,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
-inherit xfce-panel-plugin gtk-icon-cache perlnative
+inherit xfce-panel-plugin xfce-git gtk-icon-cache perlnative
 
 DEPENDS += "exo-native libwnck xfconf"
 
@@ -15,8 +15,4 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
 
-do_configure_prepend() {
-    NOCONFIGURE=yes ./autogen.sh
-}
-
 FILES_${PN} += "${datadir}/xfce4/closebutton/themes"
-- 
1.8.3.1


