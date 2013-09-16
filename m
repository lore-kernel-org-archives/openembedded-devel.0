Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id BEED960E7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:40 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1878197eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=VAhSf+S4Lr19YlSg+3sD59RdOATnETJitADgYwsUb4s=;
	b=V2guwFY+exTaZp1hwd5OdGciWHgYeX5Cm1eP5zZfxnjHL5P1zMiRwuUNW+r6qccO7I
	HUgAFlBavFDzD4yRrSK1RJQh43lDRn/Fo6XxHq3mvAT0g3mPZwM28Erl+oMJXfwgkDv9
	GA4j+TvyUf+DjnEBuEnTsrujlQvL013OL6Q/m+KMmDN3hDH51U8uL1fNekQmuQUcls3J
	AQqNLjBI8ZZDrju4OJ/K2toAs7IRogmVkYuhw8BsHL9eCy22Yn1cjM0qLrHFxPNqH1Yn
	9ZdnAj3ZxqA9faDABayQRCSIFD7UzGSunrecxpuv0xYda19cb8tQ0rRUV/fBtvyBkMAy
	u95w==
X-Received: by 10.14.8.199 with SMTP id 47mr22508eer.101.1379322282026;
	Mon, 16 Sep 2013 02:04:42 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:18 +0200
Message-Id: <1379322259-3831-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 8/9] xfce4-equake-plugin: initial add 1.3.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 09:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../equake/xfce4-equake-plugin_1.3.3.bb            |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb
new file mode 100644
index 0000000..95d1d66
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Equake XFCE is a panel plugin for the XFCE panel which monitors earthquakes and displays an update each time a new earthquake occurs."
+HOMEPAGE = "http://freecode.com/projects/equake-xfce"
+SECTION = "x11/application"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit xfce-panel-plugin
+
+SRC_URI = "http://www.e-quake.org/wp-uploads/2013/09/xfce4-equake-plugin-${PV}.tar.gz"
+SRC_URI[md5sum] = "fa1e934f5b7e522efc4e30a99278f908"
+SRC_URI[sha256sum] = "ea37e691606dbcd705f98cecccabd69b870c7acd008f47faae6d0fee21fe14a2"
+
+FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
1.7.6.5


