Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C702961888
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 16:41:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r17so4236916wrj.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Fvgm2dsBB3UMST2Plcldsca2AFAcfYgX8DtnJVRUR4=;
	b=buEZgtLvdwA05EC5rcdnU4ESChHZh50h4GNe2xotk7j0XYMcRqMR3ggBHVRClayb1C
	2XVNFu+qL1rZqigGDxanY4O31YCMcDZg8gu7ngnwuEHUpmQQU9zO431nbGl6rA2uuR3p
	8irwwh4JYv9qxCURPSxkO1V4hjwQtPT7CW7bPlaeygwgg/uFvWy2die1+QJrcHMorIux
	XbftovjtwKOsjqqxqnBaxplS8oWssk9VTbm2gi1YLgFemq9nxwQbWod+U0gWN1+8whs+
	S2eZbzsk9n1LEy+wzdYUv40aMIjJDkIoL9tOiO3y3ZxuAcbiTOxSihM0xRAVkhmA7elh
	hBRQ==
X-Gm-Message-State: APjAAAWCPtTn4m2AmGrXoFo5F0lAVMbTNVU+eiQLsihN9vSDEYqa8HP1
	hq8vA1G4oNjLmDx17YVKlVvJHTyvCZw=
X-Google-Smtp-Source: APXvYqwRm9kRp3ghpCKWQ9vcBWc5+GXreYHbeDFxi4skY7qvzx0JxiA2k+g86t5KuUl9kuUGkLm3cQ==
X-Received: by 2002:a5d:4f89:: with SMTP id d9mr5643293wru.391.1582821704144; 
	Thu, 27 Feb 2020 08:41:44 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b82sm8177259wmb.16.2020.02.27.08.41.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 08:41:43 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 16:41:43 +0000
Message-Id: <20200227164143.24022-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] meta-multimedia: s|${COREBASE}/meta/files/common-licenses|${COMMON_LICENSE_DIR}
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
X-List-Received-Date: Thu, 27 Feb 2020 16:41:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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


