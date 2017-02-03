Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9BE6076F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 23:01:01 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 52EBD20BBE; Sat,  4 Feb 2017 00:01:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 2A65220BAC;
	Sat,  4 Feb 2017 00:00:50 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2017 00:00:48 +0100
Message-Id: <20170203230048.11568-1-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.11.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2][meta-webserver] nginx: handle systemd service file
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
X-List-Received-Date: Fri, 03 Feb 2017 23:01:03 -0000

Inherit the systemd class so the service file is properly handled.
Note that by default, the service file will be installed but not enabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Changes in v2:
 - let nginx be started automatically by default

 meta-webserver/recipes-httpd/nginx/nginx.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 36f2ac6d71e8..e4e5f63100c2 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -20,7 +20,9 @@ SRC_URI = " \
     file://nginx.service \
 "
 
-inherit update-rc.d useradd
+inherit update-rc.d useradd systemd
+
+SYSTEMD_SERVICE_${PN} = "nginx.service"
 
 CFLAGS_append = " -fPIE -pie"
 CXXFLAGS_append = " -fPIE -pie"
-- 
2.11.0


