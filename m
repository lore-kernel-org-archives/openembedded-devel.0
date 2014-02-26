Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 20D116F398
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 05:38:17 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rp16so494471pbb.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 21:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wND6sZTAuRkYFzLgudrwJfOI92g+Ss7OPrTA17bQk0Y=;
	b=pzvbesUR1HOy+EWslKWkRfehoMSkW9gvMXsVHGCxsdpzKBt1gbiMpicfhWSn3U+O3A
	/gMPBVhRVxOINrSvwfMtyxp8ocTnLcgXsGsjwaHtA1m0juEOvjAgXfYhe/2Gs/msVUv8
	8M7sAr8HT1Bvr44+Zb6QkzosmgRR7H2kYXmKCqiGLENZT5SwqW5SJRq/RG5YcCUA2cOA
	/sfbcA6Ce94RgLBTQEi0Gha6MgutLCOzvD7kDr2+d8+9NItiTFc0oFZmGsAAXHPZ7dfH
	qLUwGDrzB+sV1Nne86YoFbos6hJaTs3ZjzMMfPK9QgodPuj7K1S1/ydzUbxseiWt1W7j
	vZqw==
X-Received: by 10.66.166.175 with SMTP id zh15mr6422725pab.36.1393393098984;
	Tue, 25 Feb 2014 21:38:18 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	vx10sm158944384pac.17.2014.02.25.21.38.16 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 21:38:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 21:39:56 -0800
Message-Id: <1393393197-23806-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
References: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-multimedia][PATCH v2 2/3] live555: update to 2013.04.30
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
X-List-Received-Date: Wed, 26 Feb 2014 05:38:18 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555_20110314.bb | 10 ----------
 meta-oe/recipes-multimedia/live555/live555_20130430.bb |  7 +++++++
 2 files changed, 7 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/live555/live555_20110314.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130430.bb

diff --git a/meta-oe/recipes-multimedia/live555/live555_20110314.bb b/meta-oe/recipes-multimedia/live555/live555_20110314.bb
deleted file mode 100644
index b1dbad2..0000000
--- a/meta-oe/recipes-multimedia/live555/live555_20110314.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require live555.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ff65b2c598e970b4b6c8219a1811de00"
-SRC_URI[sha256sum] = "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753b2d5db1139caaf6738"
-
-
diff --git a/meta-oe/recipes-multimedia/live555/live555_20130430.bb b/meta-oe/recipes-multimedia/live555/live555_20130430.bb
new file mode 100644
index 0000000..f83285c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555_20130430.bb
@@ -0,0 +1,7 @@
+require live555.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
+
+SRC_URI[md5sum] = "95533d91bd196e42fd748076dc244b09"
+SRC_URI[sha256sum] = "e549af608c9961d85cb647bc3b99804fec0fbaf5338c1b72d057558ae5cd2aea"
+
-- 
1.8.3.2


