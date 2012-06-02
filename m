Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLZ-000286-0W
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:21 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1925828wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lTVmI18BRy+3wE7fQ0nJy2SW8RSFpotowvwhLKclkQY=;
	b=xIYN/oH/ao08MKVnAoeJbuzmC2yBhQxHlU2muskzn/8/q86NF20K8yxT56+2R9TR7m
	FPWOHD0t/B9C8FjBrEHxC217iOoUb72xxQ2MdaTiVDeOvU/v9U55Vd6dd9G8ZyOsjF2O
	ZeyptFFRH+TbnVpWF1r26pRLrzs7aotrE+zeQzHI7ws3jcXWyuu0naFUwKEm5oY+dVWE
	XjVembZOiO6QbUbX1pQCDStsXy7eWl970WspU6cU07lc/i7lya8WcDo4Dh60DiZijIUD
	2Mojw7B8zJQHOiHXyzo5Bn8OtemuOgdy6zD5zADs2KYZXIiCiase8jmNmxXWBxyQFqqD
	wrLQ==
Received: by 10.216.212.234 with SMTP id y84mr5086626weo.81.1338639121069;
	Sat, 02 Jun 2012 05:12:01 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:12:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:56 +0200
Message-Id: <1338639361-23775-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 10/15] xfce4-systemload-plugin: initial add 1.1.0
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../systemload/xfce4-systemload-plugin_1.1.0.bb    |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb
new file mode 100644
index 0000000..367599e
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin displaying current CPU load, the memory in use, the swap space and the system uptime"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-systemload-plugin"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9acb172a93ff6c43cce2aff790a8aef8"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "upower"
+
+SRC_URI[md5sum] = "130ad7befddd8705ca09a98e9cee5c3e"
+SRC_URI[sha256sum] = "bc4ca8a7f66acb598d3f11bf0ee1fa650b869b3483176d708905d4ce9b1889f3"
-- 
1.7.4.4



