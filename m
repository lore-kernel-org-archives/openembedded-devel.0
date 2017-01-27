Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 337 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jan 2017 19:11:48 UTC
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 33F02773C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 19:11:48 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 8DFF920DE5; Fri, 27 Jan 2017 20:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 692BF20CC9;
	Fri, 27 Jan 2017 20:06:15 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jan 2017 20:06:06 +0100
Message-Id: <20170127190606.9365-1-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][meta-webserver] nginx: handle systemd service file
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
X-List-Received-Date: Fri, 27 Jan 2017 19:11:50 -0000

Inherit the systemd class so the service file is properly handled.
Note that by default, the service file will be installed but not enabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 36f2ac6d71e8..fe943d7c290c 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -20,7 +20,10 @@ SRC_URI = " \
     file://nginx.service \
 "
 
-inherit update-rc.d useradd
+inherit update-rc.d useradd systemd
+
+SYSTEMD_SERVICE_${PN} = "nginx.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 CFLAGS_append = " -fPIE -pie"
 CXXFLAGS_append = " -fPIE -pie"
-- 
2.11.0


