Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3AE6B7B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 11:54:43 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id 17so1057732iea.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 04:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0zSFCAYHoe1WfjWa2TeuK6oiOlTdzF6ZBIjtBZF4cAc=;
	b=Q1smXWALe/fvookm8+YsMtNSaruvqnqlv/asIC4ZsZGo26hfJD2uYhRegrdf1XiaLe
	7WR4Q1FYw/tjDicESVBfDzexcJJmQbqG1ykPsi44bM4E9HhxmYmFxyJ9N4Nv6Osqj6o2
	w6ZvnUQKXlEG+OgKsJvjytliOe4KQDBtnJx6c7g5yciA5rIrzajoGyxqN67QJyKuvvMY
	ytqtYmSnPuDffNVnpHHfwiPP/C67bPaOPNzshVdx5kvx2QVxoedpR9iof1ZtwKSZDdfK
	uXWAooE1hzbVR1Ukg5mdUmHyOhDqHURRuLgLF8bPvem8VEAvkZ+kTQ+EVBqRa5unyTrb
	KrEA==
X-Gm-Message-State: ALoCoQnWPUCYLHltK6wMWyNE90LPNcqqellI/vLC98PLom2qvXypflUt0qg3+zDudhvNDx7Ccw6V
X-Received: by 10.50.73.41 with SMTP id i9mr1475534igv.30.1376567683864;
	Thu, 15 Aug 2013 04:54:43 -0700 (PDT)
Received: from burninator.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id ka5sm3359128igb.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 04:54:43 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 07:54:36 -0400
Message-Id: <1376567676-6641-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] meta-networking: update BBFILE_COLLECTIONS to networking-layer
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
X-List-Received-Date: Thu, 15 Aug 2013 11:54:43 -0000

Adopting the common convention of naming BBFILE_COLLECTIONS to be
<layername>-layer.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/conf/layer.conf |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 14eb048..39c2ceb 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -5,14 +5,14 @@ BBPATH .= ":${LAYERDIR}"
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
             ${LAYERDIR}/recipes-*/*/*.bbappend"
 
-BBFILE_COLLECTIONS += "networking"
-BBFILE_PATTERN_networking := "^${LAYERDIR}/"
-BBFILE_PRIORITY_networking = "5"
+BBFILE_COLLECTIONS += "networking-layer"
+BBFILE_PATTERN_networking-layer := "^${LAYERDIR}/"
+BBFILE_PRIORITY_networking-layer = "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_networking = "1"
+LAYERVERSION_networking-layer = "1"
 
-LAYERDEPENDS_networking = "core"
+LAYERDEPENDS_networking-layer = "core"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
1.7.10.4


