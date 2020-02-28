Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA076196B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:36:26 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r17so2967104wrj.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 05:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kcg6MNn7fNP2R7Bs2cabVWgHgl2GvL6DFxs8kfIvA38=;
	b=kJA3KIFH00QwXY0sOQ7G1/W3XHFcSnVS1hijz/348MkOb4SKqRQT6s4vTkY+GK3hhX
	ok/xJrUgQmzvgai4rJv6PjImmFL97kLeMoSR7REEmfM40uu7rqlhR0M6d6D4glsubuGb
	Mf2BF+gqHXE3oOguwZW41t2r8vKO4mtTeMjj+PhoqgopQ/1Wh0JecAnmiQ3Q4gjehcSC
	qcH+leZD6JpIsIJ5AdLhcsJc99qQnoscCH3qVqeqxWzK6C0AHiDzb0XRGf67dQQCwm2L
	Z/zPcrbLfZ8JVP4Q7wx/EpebQSgQiujlazRD/HnQCgL+0+Eroby5AXU+Bihok5DH0xc+
	gI5A==
X-Gm-Message-State: APjAAAURTJ51fHDpezWpG0eguD4FUVjJqk/T8rfFSaKDObS5Pq/7zOW6
	D5L5jt91Db45y3rDSYK68kFAbDJH
X-Google-Smtp-Source: APXvYqyJvCFgcKpcfzocguaOlD0G4bPKC7miqsODVGzDz1X1fDcUk/BNGKJzCxuGi3cfu4lN/DOu6g==
X-Received: by 2002:a05:6000:1206:: with SMTP id
	e6mr5158856wrx.410.1582896987434; 
	Fri, 28 Feb 2020 05:36:27 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	y185sm2356713wmg.2.2020.02.28.05.36.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 05:36:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 13:36:26 +0000
Message-Id: <20200228133626.39374-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] meta-multimedia: use COMMON_LICENSE_DIR for license file location
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
X-List-Received-Date: Fri, 28 Feb 2020 13:36:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

COMMON_LICENSE_DIR is the official location for license files

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
 .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 +-
 .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 +-
 .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index cee386c2a..70eb6e4be 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Big Buck Bunny movie - 1080P"
 LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "http://themazzone.com/big_buck_bunny_1080p_surround.avi"
 SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index d395b9206..df2368996 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Big Buck Bunny movie - 480P"
 LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_480p_surround-fix.avi"
 SRC_URI[md5sum] = "ed7ed01e9aefba8ddd77c13332cec120"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 20d562749..cb8ece0cb 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Big Buck Bunny movie - 720P"
 LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_720p_surround.avi"
 SRC_URI[md5sum] = "0da8fe124595f5b206d64cb1400bbefc"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
index 0582a4856..04cbd2e34 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tears of Steel movie - 1080P"
 LICENSE = "CC-BY-3.0"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/ToS-4k-1920.mov"
 SRC_URI[md5sum] = "e3fee55b1779c553e37b1d3988e6fad6"
-- 
2.23.0.rc1


