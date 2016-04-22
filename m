Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 895BD6E667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:45:15 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id x7so41014068qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F1EwuGtdG+XWNzkGG/mIORQcvVlPcT8VaJHp2Y7rFn8=;
	b=TvZtTQLa/i/HIqSz11Dcoo4fIcG3Q7N3Y95fVz7TP3rYKfg9M/LKMWTW4x60KZEITn
	v4olvbJ6w5EvJ0b8S8mnbXHBEIixSwx4Ys7UErEQ6EHvtxpGohZNVx0RoA1sRutQldog
	ExERAya7QwpG0MQ7aMaUxnhdn7ZY1zWxae2Z7Kd5FeDShzVH5iT629tX4K+2ZzxH3I0C
	7gVqtYinp5jsSoyAkD7CuRS/tIka61VaAGYi9ZbwkxE6SgZz/V2hCpsRIWpxLWND0bvU
	1m3MzIu98bXBFakmpmzKlxXYYFK081P8N732U+5hyuznmR55phpdU1MCQBO3y8oJ5P8J
	DTmg==
X-Gm-Message-State: AOPr4FXS8n3EwD/Ox6r+Jrpre8BiN4D8wOmj+JU+EWmptMIR158l4VU9C4s2nhrhJEqcrg==
X-Received: by 10.55.171.206 with SMTP id u197mr5845412qke.114.1461347116485; 
	Fri, 22 Apr 2016 10:45:16 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id b1sm2695181qkg.10.2016.04.22.10.45.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 10:45:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 13:45:07 -0400
Message-Id: <1461347107-11039-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] log4cplus: update to version 1.2.0
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
X-List-Received-Date: Fri, 22 Apr 2016 17:45:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../log4cplus/{log4cplus_1.1.1.bb => log4cplus_1.2.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_1.1.1.bb => log4cplus_1.2.0.bb} (64%)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
similarity index 64%
rename from meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
rename to meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
index c9c5c67..c2f5ec0 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
 BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 
 LICENSE = "Apache-2.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=65053a46f707ee2b93f09ad22f692170"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cedaa287ececcb94f9f2880d9c4ef085"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "104bd6dd07ee71bc52ee9adca4d4d5fc"
-SRC_URI[sha256sum] = "96905e763fc6f1e3a854c3d1964c21e877de909bdddd0aed99806c62a68be838"
+SRC_URI[md5sum] = "e250f0f431c0723f8b625323e7b6465d"
+SRC_URI[sha256sum] = "ad5ec3b62f2f0bdc7f06fa398bde61091fd2493e91059e17315b5197420dcf04"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


