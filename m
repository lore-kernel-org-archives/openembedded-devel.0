Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f49.google.com (unknown [209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id B925765EB4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 18:42:33 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so7919318pbb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 11:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3zEIwAnZO1ykkDs7q2E900R713X/gfd2NSGQwVTTVBg=;
	b=ZdIQvIOyYnZJuCfXqvH16m/0JwCLkFwBmC9YUFLQeK1mHjITltH+dq0GDVHo0Aq7cy
	XB/AfTy1926v4VgVd9uTlTlLvpxVIXWMX340mayJ3hwIZg9mNa/I1oM1VuoN+w3pkKKD
	JmYA8zhfa2giG3YgMxeiGmLE1PBDVsPFGYXiYOjwYULxES2rtGo0/EBecK62Z8J0+gj0
	q1oz1jqOQHfNwswaqEAucT2O2nH6efbg6LZTSKgHZIdGl2Ub1xfGyGtVaAlaKUYjcTpB
	AFHWFIqu3QWgcfR9Lp5f/TNw8I9dk5cb1Nf89NPS8fxaL3tRKRZSMlE+T2wmqb1r0R2t
	+ayQ==
X-Received: by 10.66.141.165 with SMTP id rp5mr30435255pab.90.1401129754218;
	Mon, 26 May 2014 11:42:34 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	di3sm19452933pbc.11.2014.05.26.11.42.33 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 26 May 2014 11:42:33 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:45:11 -0700
Message-Id: <1401129911-16082-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] schroedinger: fix S!=B error, rename "files"
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
X-List-Received-Date: Mon, 26 May 2014 18:42:37 -0000

From: Tim Orling <TicoTimo@gmail.com>

Fixes:
 *** No rule to make target
 `[...]/schroedinger/1.0.11-r0/schroedinger-1.0.11/schroedinger/tmp-orc.c',
 needed by `tmp-orc.o'.  Stop.

Rename "files/" to "schroedinger/"

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../schroedinger/{files => schroedinger}/configure.ac.patch             | 0
 meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/schroedinger/{files => schroedinger}/configure.ac.patch (100%)

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch
rename to meta-multimedia/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index c338903..d38eb94 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -18,5 +18,5 @@ SRC_URI[sha256sum] = "1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8c
 
 EXTRA_OECONF += "STAGING_DIR=${STAGING_DIR_NATIVE}"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
-- 
1.8.3.2


