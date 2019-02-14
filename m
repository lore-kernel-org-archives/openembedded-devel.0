Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id BB4E77C490
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:35:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t18so5700017wrx.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VarsP26HlNVxcGosSEsWuLdTGolIYRCR1l54VVkNjvA=;
	b=Soz7e2iaDPxC44OI28AsrDTHBl3rfnaPKDRyHjuAyQAzT/kbt6jiDNqnd887gLG23E
	0PwG6Y8npsCVXbiRhqrzgDcHR++WI/Ogh8jLzeH+6Yh9ql6Kpt46VKNPWV3CO1dTaohO
	ONeqIrauiYe34bEP4lOy4IwYCyAAMU2DhzcKvSsdmf10hNM7yL3K/h7loKhORdOCxffT
	yVYFZJwfm5MVjuxYn7vMNowMcddP/iMypAljzEsocZ6/sCYy/TikN8zJB/o3gB9zha/9
	L3Fjyst1KctHtMXY4m0NV2mYOzUkhaR3EBIAOf5v+azWY+QwOAxjsjQXPwi1dRo1nv/l
	10hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VarsP26HlNVxcGosSEsWuLdTGolIYRCR1l54VVkNjvA=;
	b=I41zsILz9E/cfh2lTavD30X5hXZmz0vUWJD+tnZOo47xNzPVYy5rBa2L2pqN6PSLMN
	wfh/k0IYnFEkeOulqnMLAfrscIGLW5xUow+C5fZOeegco4x3tRagFD4Zlerw716Eh5LF
	i74oGz6v8j3ETFnI4LaMcvgW+2qXTEuCPXMoyjjABtW9wIO83h+++8zhMs7hE7BkIM4r
	DDrC5zl5zMvnHETO1AcstLrP5dQs+uszFFrBWXYL+ef+PELHojUvRcFq1nWJ2OLzrlrI
	gX7kgVQ4oS7BWG7Z04Uqm8pwjpBb1USjr2A3KMy9HH5xhp9NeKBCyEav+PQTHaMU9VGO
	8wfw==
X-Gm-Message-State: AHQUAuZTwF81eqRyfVHzg+MkDZYv8JP+AuBu0jLTkASgv7Cz2xOzCmjS
	oCBl7nvXb2ex8v0HlVnDu5v+l57A
X-Google-Smtp-Source: AHgI3IZxmF5XNnNRhLAtZLL647IjQgfFUUrRL0blZB9QgjbsXhFnVkjUpkkOMe1bdnRTDYJhq6mTfA==
X-Received: by 2002:adf:ba12:: with SMTP id o18mr2184459wrg.326.1550136950138; 
	Thu, 14 Feb 2019 01:35:50 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id e6sm1258232wrt.14.2019.02.14.01.35.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 01:35:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2019 10:35:32 +0100
Message-Id: <20190214093534.10835-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214093534.10835-1-schnitzeltony@gmail.com>
References: <20190214093534.10835-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] fontforge: Fix multilib / lib32 packaging
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
X-List-Received-Date: Thu, 14 Feb 2019 09:35:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
index 947d36eb9..661b5e8c5 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
@@ -54,7 +54,7 @@ FILES_${PN} += " \
     ${datadir}/icons \
 "
 
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${PN}/python"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${BPN}/python"
 RDEPENDS_${PN}-python = "python"
 
 # for e.g kde's oxygen-fonts
-- 
2.20.1


