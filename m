Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF516080B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 15:11:01 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id m16so4375997wrx.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 07:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kwgggvq9//XphMMFsE2yuuo+tQ8Khm0bx6gTm6yAB+s=;
	b=A5Z/mrUCHL9X1/ejsbe+UmS8Kymbqi91kDmcU0XtFtfkA+cNjKzmj/9TuNeHp0C9RB
	4sJScC0y5xEkJgHKtoS/yj1/Da17LqabSc96QhPH0b5uRS1Q/7z+fjALcR75nfy6Y5lK
	XaAb5/PdoeRXfhxTv5WCk0DZtp2Y3nJJZmlULlKN+9xegTnCTrSziE5L6z26oR+7gRPR
	ODH2qj1IoYn7aclVJ7IaU4YHO5zlVWSx9B7IvPPu2HSX5mKjM+oupnFLd2EWDw6Z34UF
	sK/V5IAXhpnd8PyEM3drdm9pGAdPddHxaFakxilFhZYZOPG5g2NnKMOAB5EhoR+k145N
	fPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kwgggvq9//XphMMFsE2yuuo+tQ8Khm0bx6gTm6yAB+s=;
	b=gEzUkhPj8uY4/wrqyy/BD1rhIyGLlwiVUeqi48ayg/+xEJXxjeI2BKEoHP4TTpQiot
	zjOsOJKQR/0YjwoFJzPeskGhNCiLp0CNlq3JBM+9dXbfCtyZvxG4ptE0KFcpKxrYEbOP
	yjnALFei+AWV+Dkq/2I0CGjWV8NMis+bKK4UmxY2Zvhu1692VDlkL11TIJ494El7y/GO
	x1zyduAcV5sjwJuxS0LFRBYnyo9OdCKKQ+9CCkNrzDVVqC0pvas9bWHLnHW9vsYuso7k
	96A2IZWbtIZAcotp7pIyfJRQsMUOXMcWC5c3p0NPGHdwZiXMLhORr8Z391VNKSFqdGTb
	GVRQ==
X-Gm-Message-State: APjAAAXpJYYIy6B8rnDjbSadDka3pZReq+dFk8a98kFs8gI5LYU4cEUr
	qMIMcXFt+dx6/eeAQM7dHyOeEpX5
X-Google-Smtp-Source: APXvYqyKY3omiCsyWN3rsnXUWXMWgEqTkvdEbBZx4q1XSlLFpAQ8M5a43iMO5+8+A3ZxiJIGLpkUpA==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr8429302wru.55.1581261061589;
	Sun, 09 Feb 2020 07:11:01 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	q10sm11429093wme.16.2020.02.09.07.11.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 07:11:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:10:47 +0100
Message-Id: <20200209151053.4277-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][v2 0/6] gimp upgrade
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
X-List-Received-Date: Sun, 09 Feb 2020 15:11:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: git format-patch -M1

Andreas Müller (6):
  babl: upgrade 0.1.62 -> 0.1.74
  gegl: upgrade 0.3.18 -> 0.4.20
  libmypaint: initial add 1.4.0
  mypaint-brushes: initial add 1.3.0
  gimp: upgrade 2.8.22 -> 2.10.14
  packagegroup-meta-oe: remove babl/gegl/gimp they moved to meta-gnome

 .../recipes-gimp/babl/babl_0.1.74.bb          | 18 +++--
 ...on.build-Give-note-if-sdl2-was-found.patch | 50 ++++++--------
 .../recipes-gimp/gegl/gegl_0.4.20.bb          | 69 +++++++++++++------
 .../recipes-gimp/gimp/gimp_2.10.14.bb         | 32 +++++----
 .../recipes-gimp/mypaint/libmypaint_git.bb    | 24 +++++++
 .../mypaint/mypaint-brushes-1.0_git.bb        | 12 ++++
 .../packagegroups/packagegroup-meta-oe.bb     |  4 +-
 .../gegl/gegl/pkgconfig.patch                 | 21 ------
 .../gimp/gimp/0003-Fix-use-of-gegl-API.patch  | 34 ---------
 .../gimp/gimp/bump_Babl-GEGL_versions.patch   | 53 --------------
 10 files changed, 139 insertions(+), 178 deletions(-)
 rename meta-oe/recipes-graphics/babl/babl_0.1.62.bb => meta-gnome/recipes-gimp/babl/babl_0.1.74.bb (31%)
 rename meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch => meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch (10%)
 rename meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb => meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb (24%)
 rename meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb => meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb (49%)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
 create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
 delete mode 100644 meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch

-- 
2.21.0


