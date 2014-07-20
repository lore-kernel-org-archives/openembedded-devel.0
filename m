Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 207EB703E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 13:52:50 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so6420671wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Tn/QqRh0Gggoi9ZwAU+4abB0aZfO8lN3R4TD4zTYOmY=;
	b=sRQeulYLx/Ka7boXVNDh+zbh1OoVVGhgmXmRasGRyJ8N5KNTyS6Hp1Pt0291phX51N
	CL6CctnleNsvWtirCA8WIr/IfGx4hA7FED/fWfyicJLECGBrT+w6Q2/PKqADsMaalOVY
	VB0COOjXocUb6seINh0fa+pdWZcAUE23UtnuPSRRJBfASWJdC4ywcAEC7rsni7Es03Qd
	uSC91bKFoUqhJTA2qn/HO8l4S4EYTerQeJgkJHsBf2LVfu1Os6aeZhQJVVkdvEop0T8n
	eL2DIvqkGVCFk1/V2GSL5frRWeHoEDUeR0o2gI1Meld4Rq9cpC7NPSuZO2HYAP7JZ+uq
	kJcw==
X-Received: by 10.194.90.106 with SMTP id bv10mr13788085wjb.20.1405864371100; 
	Sun, 20 Jul 2014 06:52:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ko8sm3512885wjc.11.2014.07.20.06.52.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 06:52:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 15:53:02 +0200
Message-Id: <1405864382-16942-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH] ser2net: change file used in LIC_FILES_CHKSUM
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
X-List-Received-Date: Sun, 20 Jul 2014 13:52:54 -0000

* INSTALL file is automatically created by automake (now when it doesn't have
  implicit foreign) and it changed the md5 to d0697e131465c2bdd0af3b07a84d2878
  causing do_configure task to fail with:

  ERROR: ser2net: md5 data is not matching for file://INSTALL;md5=0659eb117294c490ae3853facd7a6ddd
  ERROR: ser2net: The new md5 checksum is d0697e131465c2bdd0af3b07a84d2878

  Use COPYING file which should be more stable.

* adding foreing automake flag is maybe more correct solution, I wonder
  how many projects were changed like this, but silently (this failed
  only thanks to INSTALL file being used in LIC_FILES_CHKSUM)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
index 9877190..8fe6a6f 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
@@ -3,7 +3,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/ser2net/"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://INSTALL;md5=0659eb117294c490ae3853facd7a6ddd"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-- 
2.0.0


