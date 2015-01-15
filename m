Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABE972858
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 14:49:18 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so35646921wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 06:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ysdveo1mkG/VDeFv+ZpfZIrvGB0mqIedewxJhfSNZwE=;
	b=Fy5p0+bMauYxHLrF0/Sj962P9Vd0d+uKYVmdchC65WNhtRtd0IT8n3h9gF5rxTvIGs
	VDSbAcHTE8AONEdiApf1SkTAqW+ghz5o++5RQ+C/zfrts1Wc+d/5A00MQaJ/EyBQZuwd
	pFJJGYk7UV1xIuS6Nep1BRmN0HpF0bOSfcwg+bBQtR5BzOIgQRpgECTWHiiRGHtTTygl
	YXVi7UJUpj7KfBRu6sAYNxJ0Udz9aLvOL47Si1S61+lCe52Ki0GgDEnANo+at854a3Zq
	sFAS2vt51nh/olsbl4omkw8WFaX7u8K7l5ZATa6otmKBwicZezR2UTv+23tZaEsKsyhe
	uYmg==
X-Gm-Message-State: ALoCoQn4gOnz5+BRakqNZsqwRPQkkyqysQHt23asuivD1XXR0EtklKjKT8A9M23uxPlxOHdY3bq6
X-Received: by 10.194.8.232 with SMTP id u8mr18421580wja.47.1421333358860;
	Thu, 15 Jan 2015 06:49:18 -0800 (PST)
Received: from ursaminorbeta.office.pelagicore.net ([83.218.80.242])
	by mx.google.com with ESMTPSA id s9sm7760161wiz.12.2015.01.15.06.49.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jan 2015 06:49:18 -0800 (PST)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 15:48:39 +0100
Message-Id: <1421333319-9856-1-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] recipes-qt/qt5/qt3d_git.bb: change to 'dev' branch
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
X-List-Received-Date: Thu, 15 Jan 2015 14:49:26 -0000

The master branch of qt3d has been removed by the Qt project, and
the commit pointed to by the SRCREV is now in the 'dev' branch.
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 71aa858..c6f970e 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "master"
+QT_MODULE_BRANCH = "dev"
 
 # last tag before this SRCREV is 5.0.0-beta1, but version says 5.3.0 already
 SRCREV = "8a9723d7420829a2ba0141a9f7d8dc8cd11d8331"
-- 
2.1.4


