Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylk-0001lE-GJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:20 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=FrlGP3macDKByxGq8rqvFIJzflVSeHG02elaGr06rA8=;
	b=foVmj2KowGmvX36YN68l9xe+pnDCmhhzE2TMyHanPRtV5quX6VjEPNO5oKHI1oJwqo
	qaNCuWnkUBDqYTgSvtHfOvHA9pJa1iNPDLmSLDV8Kf9lJC3YLjYQpuXDEuHgbbsQsFF3
	FD5sT9cQeVoz3i6RVXzArdH2GHWFcf2j4SHbuTNVTfqzMi7wSWNbZsQM29UyIMNqmNrV
	tbeoMBOQBWEw5zwmzZr4RADGCT4guQ4BW8A5a9D1iV+YTZ/PGq2tk6TNcZIWgtwL7pE9
	wd/jeIl1m5g1jkeafwm2gnLGwErc6aWwsbZ5CzmPJvBoQ2sM/3QZnIj5ZS97+BY9RBu9
	URvQ==
Received: by 10.204.133.194 with SMTP id g2mr23180bkt.13.1347977682644;
	Tue, 18 Sep 2012 07:14:42 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:00 +0200
Message-Id: <1347977601-28665-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 19/40] xfce4-appfinder: update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-appfinder/xfce4-appfinder_4.10.0.bb      |   10 ++++++++++
 .../xfce4-appfinder/xfce4-appfinder_4.8.0.bb       |   12 ------------
 2 files changed, 10 insertions(+), 12 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb
new file mode 100644
index 0000000..25c2515
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION="Xfce4 Application Finder"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS="glib-2.0 gtk+ libxfce4util libxfce4ui garcon dbus-glib xfconf"
+
+inherit xfce
+
+SRC_URI[md5sum] = "799f70a9ad67b450da67810a5107e623"
+SRC_URI[sha256sum] = "042aae7e366428a6a92b6353b3f2727d64823076a7752b8e0a15f1f8f3645439"
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb
deleted file mode 100644
index 9187041..0000000
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION="Xfce4 Application Finder"
-SECTION = "x11"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS="gtk+ libxfce4util libxfce4ui garcon xfconf"
-
-PR = "r0"
-
-inherit xfce
-
-SRC_URI[md5sum] = "fb4797ef91b90d111b989e98c3e000e0"
-SRC_URI[sha256sum] = "fd74184355e45f8a16cc3cdd32b012b6787a453deb3a8b96af90494c7a8ac77f"
-- 
1.7.6.5



