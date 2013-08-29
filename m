Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 601DB6BE19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:38 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so338406ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9IS2nigASXh1sXhra5wYUMPcooPNJpLVqHKBXjI4tgc=;
	b=uiMtL9o6sbaA1nbPK7SJcz8o2Ij9QH89aCiu1uUn6WRs6HZBwICHGP2G8jaVnsypWl
	EDvrmDD0HcXkM1GzCGqcVmi4yvY8YCrfn0P4kS0DEWckNGt7VsUGNLvSJ0+YR0uyK+nZ
	kJaq7OdDX7aZ1KAH8Eb3kFI8C+EEq8opasTx434WaKp9stiFMDhARycge2ogZGFmoBgk
	QZcolDB/orNiONZqO8F7BIbN36IUAzA9NfWDHKAYiFH/GDWYX9TvlwKBm7UlCojh8Udg
	0UzRRN2d1ee8fhnKFGBWUTBL07sADt5oSpapEUkML10yamiVypUE3XCJJ9wQgnnvi0fQ
	lKzg==
X-Received: by 10.14.103.69 with SMTP id e45mr5363343eeg.51.1377791498824;
	Thu, 29 Aug 2013 08:51:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm47165647eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:30 +0200
Message-Id: <86e6781f369555f00fd89014bd3e9e1e750f2421.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 37/66] gammu: Add dependency on glib-2.0
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index 095a77c..071b105 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNU All Mobile Managment Utilities"
 SECTION = "console/network"
-DEPENDS = "cmake-native virtual/libiconv libdbi mysql5"
+DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 HOMEPAGE = "http://www.gammu.org/"
-- 
1.8.3.2


