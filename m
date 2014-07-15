Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id CA23370592
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:19:50 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so4301297wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+V0cNqefat2roxIMKRwPe20+GoOvUyaJO/2IpObwh84=;
	b=hN78ToOY3xXBeV93izeVLuTvTs3J7yILmJNpBZrPSKY2c6/TaYaGFi3DpTEaVruadL
	vwW7xXbfq6WaJnPHfDMFxhU+z1OhP4wQ8CUzCoknaB3NlKLANDgRu06Mu06lTmyOLxJ7
	xBHP0sibpEXzzaPXIB6e3e3aV/TdfDg4T444bsgmT13IP6Vl4SN+hmNsrJf1D8DMXJZV
	d0p1YJuLZMJUXSk271PBFedd+BoIIcoV72mNkbft5WVoGkuoq5ykKO2ZCBOTJwI8b7GX
	r9P4vBTJRgdmmj/Uds8TpJogGcb74V0GN8cEQ0SFs/lazeDOW4Gt1bmONvx9w/QZOYny
	Au6w==
X-Received: by 10.180.93.8 with SMTP id cq8mr5523362wib.17.1405430391200;
	Tue, 15 Jul 2014 06:19:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n2sm32597589wjf.40.2014.07.15.06.19.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 06:19:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 15:19:57 +0200
Message-Id: <1405430398-32283-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH 1/2] mcnavi: add missing dependency on intltool-native
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
X-List-Received-Date: Tue, 15 Jul 2014 13:19:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
index d07b143..9ad5d4f 100644
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Free GPS navigation for car and outdoor with OpenStreetMap maps"
 HOMEPAGE = "http://www.gps-routes.info/index.php?name=Content&pa=showpage&pid=1"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
+DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5 intltool-native"
 
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "6860cde5c02a9f93c829da4b10e5a226"
-- 
2.0.0


