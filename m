Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id CA55F7C89C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:37 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y17so27289424wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CV653Y4OL+UTv5H5xL5wAubs8G/p8/BSPj2GnBT5WJQ=;
	b=OZwiEgM92zsgLtUz1x694BSAI30lbcE8bfVX76JePsb8Ql+OQ0/pt61Ncljb0v9fZr
	CfMHObVxcajjvnFWMymzRKaeHxqucOFvVbrWn50GTPV+/j3LtDJhAzp3bc/g+74J0YBR
	kVzdb5K//p3BOsBUPxMFmaXRMQ96601+OrPsOa82D2yTT08wJR2KXU2oRMzKfa0cmO0n
	1abo4ioSfu7D5YrukJGb/cFs+PZC476eBgoBC6kCaoFF7IdmKpsYKO7uFt/Gxg71moLU
	m1acU+oVMt7PomWeHkzwXZaIwiyHnIJZNhpY3AIZTuHaRRJxRP5HBJKgoausacLhuD0k
	DeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CV653Y4OL+UTv5H5xL5wAubs8G/p8/BSPj2GnBT5WJQ=;
	b=EH01+XIiSUNP5MaZ5+k1KCptgK8DZyL6P33rTLAcp7fdnALxlhuYkpB1hBfmRHyob8
	I2MHy30U3QwrCDvDxRHocAkkvjLCtgTw/3mwXRRKQ2wG/MqhSNnxmA/qaMiooMd7CAeK
	VV+Q4ibTlSywu80ZE6Z5nctc6AmMuGhQMnn724O/Uxc4iI2yX6rGNiRat8xt7u+ox5qN
	8/7z70/nFYCBlAL+KpuvYyu5f/ATpIzHpN1masyCLO/inhHXJ3M55PZnukosgkNlnhSz
	klOW1DMKmlbl1ub4sPZ6lhHTZp2v5UNnaWMKJhnxh3/310jp4IxYfng2lxu6AMf5pC3n
	Fbyg==
X-Gm-Message-State: APjAAAXGexjz8hrF/Q9+1BkJmigNUz104krlYKpHKFbmK0KBfgX1qXdg
	tRO7y91PKMIJ4t8Ex/mgBlppMPKiIhQ=
X-Google-Smtp-Source: APXvYqzbeZ9h8mLVte7uCrYEQS/nTkNEK0DInq9i2b3Wg8jkuQygMbEZ4/G5pL7gyz3m9/pXuZj1BA==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr55337666wrv.269.1577482298392;
	Fri, 27 Dec 2019 13:31:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:11 +0100
Message-Id: <20191227213120.3930-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/23] gnome-flashback: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Version 3.34.2
==============
- Fix shape region for screenshot select area. (#26)
- Fix crash with external monitor. (#25)
- Fix crash in clipboard manager.
- Updated translations.

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-flashback/3.34/gnome-flashback-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-flashback_3.34.1.bb => gnome-flashback_3.34.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-flashback/{gnome-flashback_3.34.1.bb => gnome-flashback_3.34.2.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.2.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.2.bb
index 637f83715..3da8629c6 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.2.bb
@@ -16,8 +16,8 @@ DEPENDS += " \
     gnome-bluetooth \
 "
 
-SRC_URI[archive.md5sum] = "e328a51b69d97e291709458dfd8c0a1a"
-SRC_URI[archive.sha256sum] = "ddba0c9661ad93b58ccbde267f6ecbc02da2c15f9d38d87d5504f4670c2fbc77"
+SRC_URI[archive.md5sum] = "251b51bad322c41d34d06fdb8f1799d4"
+SRC_URI[archive.sha256sum] = "3be65388cd2c8f39741bcc05da87ef40035183a9a39502d67696242c2aeb469c"
 
 do_install_append() {
     # no oe-layer has compiz -> remove dead session
-- 
2.21.0


