Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.24148.1628784021856217684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 09:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ED35AFF810;
	Thu, 12 Aug 2021 16:00:18 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-multimedia][PATCH] fix sample video URL
Date: Thu, 12 Aug 2021 18:00:08 +0200
Message-Id: <20210812160008.241447-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a link that's now broken.

The original download link on blender.org still works
(https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi)
but is still extremely slow.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index 7268c94ab..b848b820c 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
-SRC_URI = "http://themazzone.com/big_buck_bunny_1080p_surround.avi"
+SRC_URI = "https://www.mediaspip.net/IMG/avi/big_buck_bunny_1080p_surround.avi"
 SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
 SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c20c06ea"
 
-- 
2.25.1

