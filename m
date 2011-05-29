Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlY3-0007aA-HD
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:15 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so2753022bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=6hB0iNnmAoFIUr8lnHAS2qqk0QGYXo8Rw1IUFKulbno=;
	b=WaVcjiwcTwO2Fs1UIdBQSxYMp/Uzqot/eJ07YJCUeBvUP9Sdy0Z76FAK4TJ7r6N270
	ucyWLzWbHDMqLGuyddDrW6E57QcHm/BmGjq4fAByQRzAE3ijO4PEOx0Vk4npUAJeO8P0
	XWUoDHTw52o6rwhXSXGwjEm5qQBhIT0oNLM9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mARXa9SyYIL+wjGfZOe/CdF6OtGgrA12n18I2YtFKo55c6F86JkkXz2DKYOaGqjA+u
	3HFteu5SQk/mFU59EVT7cI6W4W4sH/TK5f61WKD/z0Gmb28Lh5dAJdQ4g6kbDTKyfI2n
	SKxjgBG8UEymsXa5oYfTwpOz4JULZJIDkyyK0=
Received: by 10.204.233.15 with SMTP id jw15mr1741821bkb.48.1306696681709;
	Sun, 29 May 2011 12:18:01 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm339912fak.3.2011.05.29.12.18.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:17 +0200
Message-Id: <ef5ab6f3d19ef468f63e358f6750bc40b8f8a6a9.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/16] foxtrotgps: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb

diff --git a/meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb b/meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb
new file mode 100644
index 0000000..8b685ac
--- /dev/null
+++ b/meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "FoxtrotGPS is a map and GPS application using OpenStreetMap"
+AUTHOR = "Joshua Judson Rosen <rozzin@geekspace.com>"
+HOMEPAGE = "http://www.foxtrotgps.org/"
+SECTION = "x11/applications"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+PRIORITY = "optional"
+DEPENDS = "curl gtk+ gconf libglade sqlite3 libexif gpsd"
+
+SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
+SRC_URI[md5sum] = "982d14cdb0439cc4d6aa6cefc232124d"
+SRC_URI[sha256sum] = "059158fd8e61137e2e6d6e01685add7fb85cce8483faa99efb01187f2ba50841"
+
+inherit autotools pkgconfig
+
+RRECOMMENDS_${PN} = "gpsd"
-- 
1.7.5.rc3



