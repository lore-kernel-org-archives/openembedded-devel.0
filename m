Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLa-000286-Gy
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:22 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1925828wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nzzMpkM5Gv0yqb5YJ6U0tYjKWxrVFFxGqBw5akjIlEI=;
	b=dYbrvHIH3x25+1OM8cZx+7u+vpA1F0kd0g/CtNREs0gtKSFKHvvFzZbMa2T0rNttqo
	75p1TlP8qgLmqI2Y6GRYlgCg8iGXAvRCERt7u3+sUN1+zpEKCD0uNLSxAHL+L243dfD8
	SrGy/asKstrqtngeNHK5EW3FUk/UXX/rzV5dkpO3LHKau1pP+eMv/gOVwUOZnCHIcw56
	PSs8Q5UDx1EnqJsDgKuuE8NApp3QX8eQfCHzuqXgfS9+UtusPYUh9E4aw/hYp1CjqN/e
	1LvcQa19pu3q4U0IHyLfrZoCa5QaFQd/XuFBim5l1TtsIIHZiehVUey7J/Z1mXTK5No0
	CFDw==
Received: by 10.216.143.147 with SMTP id l19mr1253343wej.59.1338639122556;
	Sat, 02 Jun 2012 05:12:02 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.12.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:12:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:57 +0200
Message-Id: <1338639361-23775-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 11/15] xfce4-time-out-plugin: initial add 1.0.1
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../time-out/xfce4-time-out-plugin_1.0.1.bb        |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
new file mode 100644
index 0000000..9763dee
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "This plugin makes it possible to take periodical breaks."
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "b6e4a3145d31c341e2506fb17b014587"
+SRC_URI[sha256sum] = "e342f73315fa8176ac4fc321680a3959aa2e06fafed1ac78031fae64713a3db8"
-- 
1.7.4.4



