Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nkarc-0007tX-1O
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 11:22:40 +0100
Received: by fxm20 with SMTP id 20so5622712fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=yzBBXgblp0J/m+HjU6rfFhhPSdSHU3uFrPKh10O0XuI=;
	b=kGdqp7wl7x41nB2/zexJtOdUkeYQhBxAQeU6N/ebHCoSoAIgv6UXwZLOM0If3D5TSE
	SpxMp5r47m4PyYJQcFZz/Xf1/4ZHo4W26YqmtoODqFaKgwMuUfxBmYwoo14soUZmhgeF
	eebfM9sxNjwdgsyhAMVXu8ES1Q79QH1mchUcY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GryPGeS0bQDwaYJU7F5dIBaQ6EFuytmX4XJl83eL2RBu+vKHYFxrte42MNTJcY/Scz
	KYdGWGjwo97Tobt4I8cKqcRksTPJp3BSw7P7EZE1SSTbHV3rEEwxgG2VzrsysCYNrhBV
	+vCo1QAYcaSHOemFYRkZ7LBDftAosZYu7N+Q0=
Received: by 10.102.214.19 with SMTP id m19mr652589mug.96.1267093189868;
	Thu, 25 Feb 2010 02:19:49 -0800 (PST)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id y6sm13486165mug.20.2010.02.25.02.19.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Feb 2010 02:19:49 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2010 11:20:09 +0100
Message-Id: <1267093209-25115-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gdal: Move to new staging
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
X-List-Received-Date: Thu, 25 Feb 2010 10:22:40 -0000

---
 recipes/gdal/gdal_1.5.2.bb |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/recipes/gdal/gdal_1.5.2.bb b/recipes/gdal/gdal_1.5.2.bb
index a92e40f..f76ba57 100644
--- a/recipes/gdal/gdal_1.5.2.bb
+++ b/recipes/gdal/gdal_1.5.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GDAL is a translator library for raster geospatial data formats"
 HOMEPAGE = "http://www.gdal.org/"
 LICENSE = "MIT"
 DEPENDS = "proj-4 sqlite3 zlib jpeg libpng tiff giflib curl jasper expat"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.gdal.org/dl/${P}.tar.gz \
 	   file://gdal_config.patch;patch=1 \
@@ -33,8 +33,3 @@ FILES_${PN}-dev += "${datadir}"
 do_compile() {
         oe_runmake default
 }
-
-do_stage() {
-        autotools_stage_all
-}	
-
-- 
1.6.4.4



