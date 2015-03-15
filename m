Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9556AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:02 +0000 (UTC)
Received: by wifj2 with SMTP id j2so29393613wif.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=M+7e6IQflXnpu6ILy4c6rVTFYq/uYEjSMmNRmplhpFU=;
	b=KvN29h5rIljWuebW8LXbJlAmPejrsyCTtwnXT/W9KG1xyV8UdK20ptO5gw+r8UZVnv
	yggKKZYCyVwX4PyA01h1zW4GKNIBlGZvGXenrmw6D151eC9n6NeJvyOcDAcQsenvcB9j
	UpPR/gkVnQ6ELy3c6tB2yK8c+DpB5Nm81nVLzKpNtBeBKeYEqRN31o4s0awgMiHgVrh5
	tdjmXtf+9HKiwy0e0RiNrHIjHdRWb2WkxjcH2I18qguOpOyNVaH+2ZW2OQZsCvbVhOhe
	M/jMHzv8H4Rjw7zHA9hljzJfTCYyBVMRQsN0aTwoE4R50rg983bV4d3nVTWkxyGmJVKR
	iEBA==
X-Received: by 10.180.205.233 with SMTP id lj9mr36237530wic.74.1426462443129; 
	Sun, 15 Mar 2015 16:34:03 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:16 +0100
Message-Id: <1426462419-10173-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 07/30] xfwm4: update to 4.12.2
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_git.bb => xfwm4_4.12.2.bb}  | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_git.bb => xfwm4_4.12.2.bb} (71%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.2.bb
similarity index 71%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.2.bb
index f8cd4b2..8239f39 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.2.bb
@@ -4,18 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification exo-native"
 
-inherit xfce xfce-git update-alternatives
+inherit xfce update-alternatives
 
-SRC_URI = " \
-    git://git.xfce.org/xfce/xfwm4;protocol=git \
-    file://0001-don-t-block-display-events-when-time-is-set-backward.patch \
-"
-
-SRCREV = "bce3062d0879ab8504c446f99ad57c9fd76c5097"
-S = "${WORKDIR}/git"
-PV = "4.10.1+git${SRCPV}"
-
-EXTRA_OECONF += "--enable-maintainer-mode"
+SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
+SRC_URI[md5sum] = "3728768dd9ea0de624cd3efc5dcccbca"
+SRC_URI[sha256sum] = "5bb5f72b41060d10bd3823f8b69abcd462bbd8853fdf9c82041450ae68e7d75a"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
1.9.3


