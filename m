Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.8789.1591098607186688977
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 04:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=P69vZoUl;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 1A631601F0;
	Tue,  2 Jun 2020 13:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591098605;
	bh=HLtRzS4xuAxJTAh/MeJT5II21LO2OOudNVhRvFEBBNo=;
	h=From:To:Cc:Subject:Date:From;
	b=P69vZoUlufz545Y4IPnka0iHPk2XClAFz9tT3xvClmjysqjB3Hv8oMlYehx/bpiiZ
	 WCRWt9BjlkjPJhg9PtI6tfjKnR3NZQ6gJSp1ihOOMjZIa1zBO3CNlsPNLPL3LevhoZ
	 oBSrtIpXYOu1Ew/rvOc+Q1tE3/uDXTV8AlPJTH4cOxB/JSzu8Pd0zOfV4asqILYoYQ
	 o1WAee3JS99hitB7Ka8ltV0FcclRQOqAPC7i1F3DTDuiB9GI+6sVU8Zlw0rf8g4x9a
	 J9QfRBhm++VMrBO8xIYT9d0JdmME8/4nL3YajrH2oSMo0YhUCl1gk2ZkCuuuhlF4LY
	 JZ2RVGuCGQucQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] hwdata: upgrade 0.333 -> 0.336
Date: Tue,  2 Jun 2020 13:50:02 +0200
Message-Id: <1591098602-19823-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index 5f3e3f6..035a11c 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.333"
-SRCREV = "2de52be0d00015fa6cde70bb845fa9b86cf6f420"
+PV = "0.336"
+SRCREV = "e0e15bc7930f6d7befa4e7060fd03cc4935f6190"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4

