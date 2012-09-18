Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym3-0001l8-2o
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:39 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=dMeQugcxTouIIhwlvKH+0n5nnCkm/gWoUJgX8GJpb/4=;
	b=lixq3ywcVNYnGkVWLd3QU9Y4IGNOcN6B9s6JD/mWVDANxcQuJcX5H/Qn6MfOQ8jh7s
	MBCMbLnXBwZ5mq/tk13gHbjAYcbmRBEtES0zsqJrFpYSpJ+9uAL1YEfQ79LOJAWtB0wq
	XcziLR3RIJ5wqIHM8nZ0cDG7XBCye8HArOKmgrkSEJHNOqcS/AQumAGk8YK82lEBHfW0
	54HHjP6PaebYtxAshkrZuaoCmA6EEOTbU1EpGdMQA2QXclVKqLz103k3YRKRNzhtmA50
	mw+HG/mYhAKaGksTCUgFCuXxd0LCKhK4WUeYpzls+VwwLfiu0JyUp4GcQ6Fy+CyqtE8y
	hEcA==
Received: by 10.205.135.146 with SMTP id ig18mr156763bkc.80.1347977701360;
	Tue, 18 Sep 2012 07:15:01 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:13 +0200
Message-Id: <1347977601-28665-33-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 32/40] xfce4-battery-plugin: initial add 1.0.5
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../battery/xfce4-battery-plugin_1.0.5.bb          |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
new file mode 100644
index 0000000..97ffd52
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "ca2d394e411a20442a519efa0d14f8ec"
+SRC_URI[sha256sum] = "f659b1af40ab72c93448affaa693ab551827a5600ce9b97a799b7c2419bdeb11"
-- 
1.7.6.5



