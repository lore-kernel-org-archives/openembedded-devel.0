Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id EA15F6D783
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 64so5034790pfr.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mHiAG9CxsqowSFOCE5ex5ByQVhsGhGzVc0ExMRiXV0k=;
	b=b+3C53KZgB5hqhOcsg31jbmwU5dvbfJoMZ2JVvpDDjCwklBr+BLkhzjPXpoX3JAWOe
	wtDzp4hHWwT5I5o2zUrQlDC3M6ChpIk9Ybh0JtRkXIG18nY1Uf2RURE2nr9+ldti3kKS
	W1M0XRquqeG/2M1NW+sj0GWv7Hb0LDFTiSk8WERQz9FDKj0pBnsfCPeOLAqHNXfj4chL
	8kBFtyK6D/APM+KlaRBc1TZHifdUuBZYVUpdyrZlW4LLY3sWExTLWVUuJywP4Gthl9vx
	2lIS5ZVgS0ZXuMkEvHjEmMMI0pCmDZ7XPKH4Gav1eXgI4BUB406iNmlawZqtBA2yaEZy
	jgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mHiAG9CxsqowSFOCE5ex5ByQVhsGhGzVc0ExMRiXV0k=;
	b=UrEL2lw3vZiIYnE9CLFfWmKKeVarPXG2PvXQzCeqFnEOKzKZuPeg42GzdQESBOGftS
	u+4hYOW2BO2i2y/fxgp5SOqVea3HE1aDvCYadDHeHaWLPrdcRRlGSlMcVCkopjp/P4w8
	E74PezKDaPohdT8Sonu69b03hvq62EkEbclh+f/W5E0MqNXPsb896Zs4rkNmgPJsI8BU
	lQ6Au5GtCF8c1xOCK//jxD2Hy5bJdmZyUaDHJaIdT1glU2eTpGGYiFjUDIRPgOkx1v0Z
	R/8esyIeyFlvkO//MSVUlekX8mYrEBLu5pj5ITRjoS1Zutl077FeGiV59AXMB4tNSPSo
	ovtg==
X-Gm-Message-State: AA+aEWY5CQGGYCqK38qDAPX14cHJ+gRmiF/hbUIkkCLsmL3165XEq+/I
	vm6GGKhfwU0fnA/3pm6ZdpiVpciUkUo=
X-Google-Smtp-Source: AFSGD/U23hot+Ku8BzXo6F5mOcQWHYDITrn7f95+A2jfx8o7On+OxD89otEvelB+WGsd9NZvfRx2wg==
X-Received: by 2002:a62:9fd9:: with SMTP id v86mr10860317pfk.191.1545600975542;
	Sun, 23 Dec 2018 13:36:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:46 -0800
Message-Id: <20181223213557.7834-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/18] ttf-droid: Delete from staging install area instead of sources
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:15 -0000
Content-Transfer-Encoding: 8bit

* This leaves the sourcedir unmodified
* Add -f option to rm to not fail if file is not there

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index e62badf778..8dba7ee6fa 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -12,8 +12,12 @@ SRC_URI = "git://github.com/android/platform_frameworks_base.git;branch=master"
 
 S = "${WORKDIR}/git/data/fonts"
 
-do_install_prepend() {
-    rm ${S}/Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf Clockopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf DroidSansFallbackLegacy.ttf # we're not packaging it
+do_install_append() {
+    for f in Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf \
+             Clockopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf \
+             DroidSansFallbackLegacy.ttf; do
+        rm -f ${D}${datadir}/fonts/truetype/$f
+    done
 }
 
 PACKAGES = "ttf-droid-sans ttf-droid-sans-mono \
-- 
2.20.1


