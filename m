Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 54D7073198
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:07:42 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l126so62375603wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=mO4yFBaSoWDn5r8wqh/zAXSyhbu7jTra+yyFQCW3o2A=;
	b=Vzcb9bUcHxJQRrxo/3gqf6+UtAoZlPI6xay1Ul+snl9ggwRieE1xU6ioG1RPMa2iyu
	y5Zg7NUav8gjhiH+X3VdHE2fdYjY1g2u8QOuNTv2wfPRyhYDDdMsw+3b+z7Hqjfyh9VO
	2LeBg6Jg9yVKRVSGEH62DpDOQZrOrEzVSaNOIJzl2sOJKMbA+5+wlpRqg57dIPQVFRp5
	8dje61owurtEI+ygcTXSqy1CYwQSrOZD/wdDR+1I2vFjR129Id6i4KbkFe5dm5n//GBn
	wmYS6Tbo6uLxfkx3baQWITPvNFxYH4RiCw9l5s3rm2cmSGU0XKSy/siUayQ7TEE3q0kf
	LAPg==
X-Received: by 10.28.187.197 with SMTP id l188mr2924027wmf.102.1450440463187; 
	Fri, 18 Dec 2015 04:07:43 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	z127sm6459974wmz.19.2015.12.18.04.07.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 04:07:41 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 13:07:37 +0100
Message-Id: <1450440457-6295-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH] VLC: PACKAGECONFIG for new dependency on libvncserver
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
X-List-Received-Date: Fri, 18 Dec 2015 12:07:43 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index ce3601d..a5b214d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -72,6 +72,7 @@ PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
+PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


