Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9Mz7-00088C-Iv
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 21:45:49 +0100
Received: by wera1 with SMTP id a1so5400109wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uEW8bruceVMswtc6U1PITcN7bz0QSo97Q2IKhCgZeH0=;
	b=h0pwQZUoxieZBWAXuqYfYuKVG6GCQzM/O/B15M21vm+1ex6EtAnXeUk52OnkCZ2MqQ
	rOYvy/+UBbP/YY0uQ6+7EU/sYYQORIH9d4ODTnx8XdhECUWLAs1zmk9NXAlr4wzEwH5S
	8t2mSttAsoq/En7XFRXbCr4ZXeF+yy9sLC5mTPC/HvGXpn5RK5tzO26XNBBm6GkVkkLb
	eF5Q8aS2tn89sWTfF+XuuOSfIT8SUxGYPp5LtieLD5vSnbHfS1CJKjMw4d6Zc3LnQPQs
	5f4RVDW8k0iGUU8IOONebP4ZsiYGqDlo6FI9j+rsQeeHBd6QM//xpZEMi8EheWt6fnSS
	lKZA==
Received: by 10.180.104.65 with SMTP id gc1mr14415249wib.13.1332103019377;
	Sun, 18 Mar 2012 13:36:59 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id l5sm19761891wia.11.2012.03.18.13.36.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:36:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:40:52 +0100
Message-Id: <1332103254-3729-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 4/6] xfce4-mpc-plugin: initial add 0.4.2
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
X-List-Received-Date: Sun, 18 Mar 2012 20:45:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mpc/xfce4-mpc-plugin_0.4.2.bb                  |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/mpc/xfce4-mpc-plugin_0.4.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/mpc/xfce4-mpc-plugin_0.4.2.bb b/meta-xfce/recipes-panel-plugins/mpc/xfce4-mpc-plugin_0.4.2.bb
new file mode 100644
index 0000000..734f19e
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/mpc/xfce4-mpc-plugin_0.4.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Simple client plugin for Music Player Daemon"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
+SECTION = "x11/application"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3604d987e6dfdfc672c754d08953b0e0"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "libmpd"
+
+# for now we reccomend our own mpd-server
+RRECOMMENDS_${PN} = "mpd"
+
+SRC_URI[md5sum] = "45cfce0f9c4de5a3f51b006ef8caa515"
+SRC_URI[sha256sum] = "5fa2e8c1217d80c2777d92650ba054cabf916e1452635a118005282886271714"
-- 
1.7.4.4



