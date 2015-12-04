Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id D472C6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 03:22:14 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so66153318obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Dec 2015 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9D34CdtzqxfUIcaUhCSwyp69stBekArJgNnsq4NjHTM=;
	b=DAyjS/f0qJjYn0D2NSswSEeMKJh2TEVAuBQGuY3sZh4yGESqqoOhU6sMeCuehvyyMl
	PDdPm+vHDa9dxK3KOjSuhaO7V15lOvaMKGV5srrPzqIc+IPm6CDe5jRONUyGR7V+iScM
	1M4lD8VRNTnpTzOJ2f9vuJEwcsAOmDeAAg3AX7zy776/vsQP/mZH8GFFwHwTERN65ZL+
	gihfWxv+NyY75ymNPZ+ptYHMV0kqlVvqIhw0tMOMKsikAhod3V+JkBG/NGsgBOpB3630
	cBoHe8PuqvKTpQFacaTo+vDoozJJkm+BCxrrH8cThX+qxvsgw+ZTgLbnrDluBGO4maS9
	xslg==
X-Received: by 10.60.227.104 with SMTP id rz8mr11040110oec.26.1449199335553;
	Thu, 03 Dec 2015 19:22:15 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ct9sm3533633oec.15.2015.12.03.19.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 19:22:14 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:21:55 -0800
Message-Id: <1449199316-14048-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-multimedia][PATCH 3/4] mpg123: drop unnecessary dependency on tslib
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
X-List-Received-Date: Fri, 04 Dec 2015 03:22:15 -0000

The mpg123 sources don't contain any references to tslib or -lts and
there are no obvious build issues or QA warnings after the tslib
dependency is removed.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index 0625634..4048404 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
-DEPENDS = "tslib audiofile"
+DEPENDS = "audiofile"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
 
-- 
1.9.1


