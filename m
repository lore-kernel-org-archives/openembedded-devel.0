Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9B26F73949
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:30 +0000 (UTC)
Received: by wibg7 with SMTP id g7so25192619wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=QkhK+jPlIzKq0G4FyTZHxE5JYGVnly+FS7BDHh5yILc=;
	b=cRdNDoxAy20LV6+VUvzvvXN31vJzSO7sLyViwG5i8XETrp85mp2Xzw/1Ae+nBIx4Yy
	9VoSdxeQCNk0pToADuPGUbjaEXPdek5OhaxR9mdhc/XD/QzNd7ePdbklGbEn22UcGQpA
	PsOLmMYUXFSNDdrKbZ//C8CrnsFLV6eNqj2RxTnDkPfLvtir5xfnlIA8/hTiKTTx+gZ0
	ywQJqHDJF4yFdXvoxcp20VGi4QGjDBtqCa7kzcz0w9ndqMl0BrDPTjWswkOY4yxfr+ut
	NGwnXG7N82+DzmDBx33ktJNIDR9+zSzWo78XKm2bdpSAT8AlZrdMPos+sN9jafaiDZXO
	LZYA==
X-Received: by 10.194.122.232 with SMTP id lv8mr112721664wjb.146.1426462471991;
	Sun, 15 Mar 2015 16:34:31 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:35 +0100
Message-Id: <1426462419-10173-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 26/30] xfce4-mpc-plugin: update to 0.4.5
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-mpc-plugin_0.4.4.bb => xfce4-mpc-plugin_0.4.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.4.4.bb => xfce4-mpc-plugin_0.4.5.bb} (72%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.5.bb
similarity index 72%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.5.bb
index ebef2ba..964f5d3 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.5.bb
@@ -11,5 +11,5 @@ DEPENDS += "libmpd"
 # for now we recommend our own mpd-server
 RRECOMMENDS_${PN} = "mpd"
 
-SRC_URI[md5sum] = "1c126ca71d6db1ac6a0cc6720554e7bd"
-SRC_URI[sha256sum] = "4f0ce6146aa2680a4c1ca7bad1be30187a8a179e8c4355a8fe13d1fc38dac5c5"
+SRC_URI[md5sum] = "718e64748e46908a44cd0b96eacbda28"
+SRC_URI[sha256sum] = "e71f57a28915c57459d6ce0eeeee1d0934f523c0ed083158c3d3b3836fc06fcf"
-- 
1.9.3


