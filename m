Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLe-000286-Gk
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:26 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1925828wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=kPoK9yuPhgMSVZ97PyPX7iKCj2Sjj2tiRjM6/VVa040=;
	b=z93pXDbzjPBrsPxnPk+pbaLuOvPg5fkMBY6hmDNGkw7T30yz//LllXxMma65WoqK4C
	OpDKEmQxlAeXKJjfjvfjIMNtl3vzBRTdt6mm3NkAL8xePIxRCgSj2ZXEaAfUg9x0XV8c
	C1Ndv9HWfH++p+a2cRfZHUPxjeaq6zcL72afG1KKevpdx6cNp3RYw8MEwKUBnAHTiyF1
	6yyFLB5TEhJXsKhsc/5x43e80AybnYVYVlfreb2Nhk4VwXvABzIoYIO0s0SC/LluzNhE
	PqzQWqyVdN/ETNZyBeByYWbhQE2adL4Tujvki2gEjKEWRm6iDB3GybUbHENiXYoGrDTP
	EN/Q==
Received: by 10.216.213.79 with SMTP id z57mr5029577weo.27.1338639126604;
	Sat, 02 Jun 2012 05:12:06 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.12.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:12:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:16:00 +0200
Message-Id: <1338639361-23775-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 14/15] xfce4-mixer: initial add 4.8.0
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb  |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
new file mode 100644
index 0000000..23a8ba5
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A volume control application based on GStreamer"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf"
+
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "3fa3a9973e18c04da26709a654e242ff"
+SRC_URI[sha256sum] = "9f9f48fdd0d3f6b1e46694b93a44d15b800db72a96d831b5111d9ac976970fab"
+
+RDEPENDS_${PN} = "gst-meta-audio"
-- 
1.7.4.4



