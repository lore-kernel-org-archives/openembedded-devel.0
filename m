Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE08746B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g14so6761579pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KNwWAk20jAzNUFaiHyN3c3H12GJxFxLo/A4Q7p9slfE=;
	b=maMmJH5wgcPNbyQCWOACIPQG36t+tHCy7jCmcPc6TfXof0XPlbXE5sYOZvvPt41BVW
	3U+4ybOVn3C7gbKKgTU00a8hlCz2HjeqfrFcPa+EJT9qs88oUtL6rT+MV1YJwAmshFV1
	H+TDKqkRZo4J4i6atmrCkwzLpU4jtgrrKnB1D4Zrfojjk94Q2rqi+hUYHiKxb95rVnhv
	ORMJw1VxcNoy8atVTJZe/9pTQE/bhJKaHlzvEqIvs7mNdURk2YODi5JTbzETDg7VN5RA
	zyMB62TcYFgS5O7IG+SzWwgKqP6UuSo2yrEnqVjn6be2UoAkIAhasBVyawR5/kTakxNT
	anpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KNwWAk20jAzNUFaiHyN3c3H12GJxFxLo/A4Q7p9slfE=;
	b=WakD2lqbrO49ckAz+KC9ugQXg1XBk05/2REC8CffF2rnGtKDZLyJ8p9iooCOEufXpU
	lXkz7aETxwXynqKoirYYK5C2LQUvmt/IiGOeZvUIxi2QLzRQsYZSzhV84/D3rzlBanE1
	sGZfKhz2lyh4+x50+qf4QEcBP+/rjPt30aVecVVR9F8vragAgjsLYjHZ5nVU9RpFzNcH
	eDMWu56JpwJf6Z1/L/adatsfb4Te7y4LlizUYC+v1fLsp2N5SNv3Qa3xXbsv7UAuO/W6
	P4wq7HbG92R0FHyTwr5DB1XBC76lCe571IuMjHShk+e2G1GzTNiOhZsPRLk94cJUAQKH
	TMVA==
X-Gm-Message-State: ALQs6tAfs3FHGaxVJSJhYx66ROOp2DBS+HS/8CMQ5Yr9jWiOao1ElkQB
	piX/u8/916hkb9GjEimWr4Lspw==
X-Google-Smtp-Source: AIpwx48D5BoFCFyFbtkYYxfoCwFwrTpSGBh1XLMS0EFTP576vXmOBcyL+SzJe0TXaYDFxgBhFRbW5w==
X-Received: by 10.98.189.14 with SMTP id a14mr866113pff.30.1523319766143;
	Mon, 09 Apr 2018 17:22:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:34 -0700
Message-Id: <1523319756-8431-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 08/10] menulibre: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:45 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
index cc7b291..d1f3471 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
@@ -9,7 +9,9 @@ DEPENDS = " \
     intltool-native \
 "
 
-inherit distutils3 gtk-icon-cache
+inherit distutils3 gtk-icon-cache distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://launchpad.net/menulibre/2.1/${PV}/+download/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "efc7edb49bb0e5fea49e158b40573334"
-- 
2.7.4


