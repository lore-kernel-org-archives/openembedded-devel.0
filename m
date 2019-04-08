Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFCD7D47E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 22:43:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w10so18319766wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vigXa2NSSmegVkp6dlzQvII3ZC80rn6tKUsFFblo69E=;
	b=ekYRnKD5XDSaLX6UOkvIQARTUh9h4vx1ahkyUx1KeOJXajFKV2rr2yAQdO26NaduoV
	GkYr571gw3phcMY80mUfE9Abn3l5OTeXt8P0qNfFNoQmnUtrNyV6lc2e786YwmAxBcWX
	dC0kdeSiT4fI7Ec4vaVQDYB9aCBjv8r3nnS9G4xCypJulfqzj08o3NOVTDhjqSbFQvPf
	tpaopTexbgteiH2OoGLKQSS8p2Sl12uCYCJhlKT477fkW/lWTibFsnUFnIJhU6eArjt/
	A8fwaxMJfhYh5xjarZh5XwDXBYbLjaMJhBZpQ46mOpohO/EIB3g/oFXSQNyy+sLUIiFn
	uG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vigXa2NSSmegVkp6dlzQvII3ZC80rn6tKUsFFblo69E=;
	b=l4cXbwixF0bOF24nxIW/HWoNwnUXQwYBO6NRq5zZL79OEPeuLBNwIzfGTtl++ryfE7
	Fl74OuzKsmnJbyf7KBmFKW+fi7NcpAn22yzxVk1u5TWNoI+gl/J6O1HgfHxA9727dh/K
	ACX4W4e3Us74Js0aDC2Lyf7QIAl+94e1sXzM9cpCD5BKDRQSHCmCH4lQ7KRmNuedrGJy
	FIRDSERwv+AWpWHdjh46xPGTGbixmVQ5B/CifnFhfXS8pZqKJ94hFLNeQxJhpLDO/BY5
	Aj7ZMkraQvYX459tLsF50oKBalOweYmm8KwyrZRSh+8y+BXFmBfzqVLdgGTcUcFEVxxv
	H8Xg==
X-Gm-Message-State: APjAAAX2r7EcLv217Dpax3V/ucBtRQ/EImlLwvtVm/kCfsUCw9RETfaN
	Xp0QUQAMss6JQRclZsJiFmLl2VZs
X-Google-Smtp-Source: APXvYqzpp3MBYnLaHmK73gDU8no4jJF4AGqJt4mSWzyoYWdzERq5QusC+XjeDy3KA5+XQFbEcWms4Q==
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr14686839wrn.21.1554763392742; 
	Mon, 08 Apr 2019 15:43:12 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F03E65465DDF607A3E693C2.dip0.t-ipconnect.de.
	[2003:f0:7f03:e654:65dd:f607:a3e6:93c2])
	by smtp.gmail.com with ESMTPSA id
	k4sm42824144wro.33.2019.04.08.15.43.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Apr 2019 15:43:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:42:56 +0200
Message-Id: <20190408224258.1744-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190408224258.1744-1-schnitzeltony@gmail.com>
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] parole: replace gstreamer1.0-plugins-good by gstreamer1.0-meta-video in RDEPENDS
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
X-List-Received-Date: Mon, 08 Apr 2019 22:43:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
index a286a5adb..a3763a0dc 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
@@ -22,7 +22,7 @@ DEPENDS += " \
 SRC_URI[md5sum] = "cd22ab579470c5728db0aa6c0b9d4c7d"
 SRC_URI[sha256sum] = "bff0fc846d0d7b8f435ac5514976f1cd1d82b62dbf1b7d470e253a5b439407da"
 
-RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
+RDEPENDS_${PN} += "gstreamer1.0-meta-video"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.20.1


