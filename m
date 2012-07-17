Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrGet-0002i4-KX
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 00:54:23 +0200
Received: by weyr6 with SMTP id r6so561965wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=79Y8FR0ewZJd9N31l/CvehcG/GhvtEYyF+jzwK6ik1w=;
	b=Uv8AskhtHpTnKPLTy4ebZwQaEywZFaCsN7eBECp0RxXLCQeRsj+s6LDYeYspObHSF9
	ylL3ng7AD3spSP4HIeyuIFGJzAdrdBA4jePYm+GVLmvAuE3eZv7yq86/6VPEMyirEqBb
	4edPzrgpOiCDRssYQuDnqC/CBy7WNyVxui/35uhC2V2Hxvm40B51qfd5HQbMr8LTlxBj
	yLNDopqvyBIbyXykwPHBPLLKXzPkJAsHO7WkVhpLOOkEktLNdLhSUWHMrqNIzJ3DsXLh
	iiXMNsZ4lx9siMe9ioz8ydCzCyP1YlvmYnoM/3CkJH2hc0Uh0q2q9kYzdY/6lwMjYqA9
	AUxw==
Received: by 10.216.132.135 with SMTP id o7mr352468wei.6.1342564983977;
	Tue, 17 Jul 2012 15:43:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y5sm29365469wiw.9.2012.07.17.15.43.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 15:43:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:43:11 +0200
Message-Id: <1342564992-18614-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 1/2] gnome-panel3: move as-needed.patch to gnome-panel dir
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
X-List-Received-Date: Tue, 17 Jul 2012 22:54:23 -0000

* there is BPN changed to gnome-panel and SRC_URI checksuming code cannot find it, causing this warning:
  WARNING: Unable to get checksum for gnome-panel3-native SRC_URI entry as-needed.patch: file could not be found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{gnome-panel3 => gnome-panel}/as-needed.patch  |    0
 .../gnome-panel/gnome-panel3_3.0.2.bb              |    1 +
 2 files changed, 1 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-panel/{gnome-panel3 => gnome-panel}/as-needed.patch (100%)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3/as-needed.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/as-needed.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome-panel/gnome-panel3/as-needed.patch
rename to meta-gnome/recipes-gnome/gnome-panel/gnome-panel/as-needed.patch
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index 37288e1..c7be8d0 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "GNOME panel"
 LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 
 BPN = "gnome-panel"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.8.6



