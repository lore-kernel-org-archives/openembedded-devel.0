Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLS-00028Z-E0
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:14 +0200
Received: by wgbdr1 with SMTP id dr1so2502442wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ChiTR5iFlFXekNpxpsZ8voesRf0T8cYcoP6uTBZX6Pg=;
	b=l7pE8Q7cHi7t/bQdvbdn+2O+RDWMWD1SY5wpscrRp0TY9nP/0R4B1B8SPgwAifae8g
	aV3l5o8mc9jsQ38mb+T4RvHtJ7qHsxYDEA8BFeyA82/JisJVGoLg6DQPV50fxmgv/AwV
	8QWoGuQkCR81hjA/plV7VQE5RwBDnCLdb82MIewyCH5bVjIe1vBE22oa84waXwXtYr+K
	pbl4Z9imKRuep2MVfzA7LPdvnD0gEK47v5TlD8JQoBR+dHXkqx2E+RJnOjPeYCP3NOYJ
	4gO3OtHD5v9EXVDncegn5E7TrR99McYvxdX8xlt54NSVrn/WyRiOLPsp349q2LxLHbKY
	Q1Pw==
Received: by 10.216.195.98 with SMTP id o76mr4860583wen.202.1338639112437;
	Sat, 02 Jun 2012 05:11:52 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:50 +0200
Message-Id: <1338639361-23775-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 04/15] xfce4-places-plugin: initial add 1.3.0
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../places/xfce4-places-plugin_1.3.0.bb            |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb
new file mode 100644
index 0000000..5310586
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents, and removable media"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "d075fffccf44bcf09a1bfcd4e0cd38a2"
+SRC_URI[sha256sum] = "0266e6bb9905b6af25f80cbb364d2710b6b95100382d2d540edf9f8408e09936"
-- 
1.7.4.4



