Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBRVd-0006s5-3K
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:32:18 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so272023eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=a4QdQbo5Q/N8qW6YPBDnxHDG1RxUCdKVxULD/BA0aZw=;
	b=CAdvlEBpByKOSRX4O8vu+u4/ZkijV8a2/rIp3eS7ocP6mYMHhuVLD1Rkl4azpCLSzm
	LQXVlRjKEXsLTs6730i4sW3vVUY18ZGJBeaD1gFvf2cgOo9Sk/UlqQRcc2/UsEV/i925
	T61SBDqyAJ/SJHQqxc3qiorHr5A994OcgBH7w8OkocmpOQ4VD2A0qpfG75+A6ZCLbBdF
	1aYTpDvy9OtfLWhs9FaAKdab4Glo7LHknTlmMOQgw9AcAUb4+eQg2oNpDgNdErGt86Dt
	mayXRqVfvOQB4uShpnBMA/JmyoFIjjkAKxK+/88GG+K1v9c+LnK7LkLGAoGMEG76IoRz
	UxuQ==
Received: by 10.204.157.18 with SMTP id z18mr4965930bkw.16.1347373184409;
	Tue, 11 Sep 2012 07:19:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm9797118bkv.14.2012.09.11.07.19.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 07:19:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:19:03 +0200
Message-Id: <85d9bb493173a0c534cd2753f38a7b06f3f03ae2.1347363666.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/5] mcnavi: add also target edje to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 14:32:18 -0000

* configure checks for that
  | configure:17465: error: Package requirements (ecore ecore-evas evas edje imlib2 libgps) were not met:
  |
  | No package 'edje' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
index 9c7f3f2..f4d594f 100644
--- a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
+++ b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Free GPS navigation for car and outdoor with OpenStreetMap maps"
 HOMEPAGE = "http://www.gps-routes.info/index.php?name=Content&pa=showpage&pid=1"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-DEPENDS = "ecore evas imlib2 gpsd edje-native mysql5"
+DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
 
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "acc07debcdb3ef448b95e6a6cfcf53d8"
-- 
1.7.12



