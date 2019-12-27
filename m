Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7825D7CB4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:43 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y17so27289591wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EWFNoJDRUmzLyzloKcYnwVY0GuV39KwnU8S2LtJ0RKs=;
	b=kpL8wToZ91+I6sHRvMHggN1e7Vf0NQVBbMRibbld/4nTJWq6cJMwp4UK363Zp2shxH
	hqyxHg/ukdvEjjcz8iAU4u98/UasFDYzjkhxjXGa3ytc14dwUHB7XIe2CSth0EPuv15a
	jsOrHHArWaOtqgaeX2VQ9db2wl16cM2ZmK62KS3HveHkERCyx39fxFvA/DwLGD4KeFRf
	sxHaK/R7n2iqNlgOfXcrkE5cP+t5Ef//Jp6deXnMPxx866LXosDuRQkoWwF82RvcCLIh
	cyVxXN+YpYYTKqAjjUHGYFZuveg45/zhcebFo5vzFr4kpARUwxoan2iJ+Y6tpmxCZiZV
	cY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EWFNoJDRUmzLyzloKcYnwVY0GuV39KwnU8S2LtJ0RKs=;
	b=gF78VMUG2TvHLBPwpczg+2n+VgY3wZboa+cYI2Rqs1gKNzcXlbMMo4uFPUCftCXMcK
	a+s6kEanhlS2OOYpRK1Cgc7i9jeXrCTJW/wa9GqmRiWuzNRllS6uy+gHY4+QKF8tDAnu
	8Z10KbaISZOW3UjldFiEKG/8kWRZy7r0RTb8bib1XJCjlYeREbHvmrmYVUGcDVJzzSnr
	h1Hi+ba4YXQYAcyp/FPNVHAW5Tcye6oS1OlEe0+V6AjUF8FWPRVUKvlh7amsu3h/TMO7
	L8D0uZ8jEpokHA/xiGBUFDTjA85rfD/WA1lWsiUAINQu4Okpb4EmuHblZM1IyaHWiQCt
	nHGw==
X-Gm-Message-State: APjAAAVg/XfaiY77MpCMx47kXS7CGN14BLgc6eSwx71tWorx4Ak7s7Zu
	cpNG+MSzprTChnstDRMIiihxAJhEGpk=
X-Google-Smtp-Source: APXvYqyyaUhiwXzzqhATZZ3RHXYgOff2kqSJn95i0wGbRn/wCKN4CineIxFQIjIeKdS/rlIk/NdntA==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr51515074wro.360.1577482304142;
	Fri, 27 Dec 2019 13:31:44 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:18 +0100
Message-Id: <20191227213120.3930-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/23] mutter: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

3.34.2
======
* Fix immediate screen blank after releasing inhibitor [Tim; #573]
* Respond to frame callbacks regardless of damage [Jonas Ã….; !839]
* Translate well-known selection atoms to mimetypes [Carlos; !842]
* Fix Night Light on wayland [Jonas Ã….; !840]
* Fix various copy+paste/DND regressions [Carlos; !848, #789, #842,
  #793, #845, #854]
* Don't emit focus event after desctruction [Marco; gnome-shell#1704, !860]
* Fix hang when opening not-responding dialog on Xorg [Carlos; !876]
* Fix frozen grabs on Xorg after weeks of inactivity [Jonas Ã….; !886]
* Fix triggering popups from stylus devices on wayland [Carlos; #886]
* Support shadow framebuffers for offscreen rendering [Olivier; !917]
* Fix hang after interacting with desktop icons on X11 [Marco; !909]
* Don't double scale when getting absolute surface coordinates [Xiang; !915]
* Kill window effects on destroy [Robert; !924]
* Use partial damage for dma-buf and EGLImage buffers on wayland [Robert; #947]
* Do not stack transients underneath their always-on-top parent [Florian; #587]
* Fix KMS freeze after pageflip [Pekka; !953]
* Fixed crashes [Robert, Jonas Ã…., Marco, Hans, Carlos, Tim; !856, !912, !895,
  !928, #591, !823, !960]
* Plugged memory leaks [Niels, Robert, Carlos; !847, !868, !873]
* Misc. bug fixes and cleanups [Daniel, Marco, Jonas Ã…., Georges, Cosimo,
  Florian, Hans, Robert, Jonas D.; !841, !764, !837, !846, !673, !811, !893,
  !925, !927, !940, !832]

Contributors:
  Marco Trevisan (TreviÃ±o), Cosimo Cecchi, Tim Crawford, Jonas DreÃŸler,
  Xiang Fan, Olivier Fourdan, Carlos Garnacho, Hans de Goede, Niels De Graef,
  Tim Klocke, Robert Mader, Florian MÃ¼llner, Georges Basile Stavracas Neto,
  Pekka Paalanen, Daniel van Vugt, Jonas Ã…dahl

Translators:
  Bruce Cowan [en_GB]

[1] http://ftp.gnome.org/pub/gnome/sources/mutter/3.34/mutter-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mutter/{mutter_3.34.1.bb => mutter_3.34.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.1.bb => mutter_3.34.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_3.34.2.bb
index 2d84bfc2f..992915bb7 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.2.bb
@@ -22,8 +22,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "4d7b67471fa4177e5ff0357e1f1736fb"
-SRC_URI[archive.sha256sum] = "ba1826cf88bdb81e63943cac014a8e8bcf35ec178c53264401f9c72fdeab758e"
+SRC_URI[archive.md5sum] = "4515ccdb762a243d65757f5ab073d206"
+SRC_URI[archive.sha256sum] = "2d6f7763193766d4652d43d0d0de2e49e60ca571eca0a7f1e6341fbd67f90b2d"
 SRC_URI += "file://0001-cogl-Fix-GLES2-fallback.patch"
 
 # x11 is still manadatory - see meson.build
-- 
2.21.0


