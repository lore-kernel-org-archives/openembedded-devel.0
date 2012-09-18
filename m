Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDymA-0001lE-GD
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:46 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LDWQrJnj2Zbf1kbFqDNVABSW0vKfcR7TULIQoj1xkRc=;
	b=Y7fJhc4IKPtE52WOsOZ0eeMxdkU+PpYgoQU9GMtS1d3Lh3Im+jTI+E0mVVhTrvHEXU
	HgP05Rp99tByGyQYwMDU/x+o8sgwPukZVuSOhhNaSm1adGErfNcjmCCNlvEspReOeQoh
	JUp7fYV/mtyrlCVhTmF5sPJy/w62KuXGEu91NRPvhhlG2H503etR+XVZyM2BftkvBskL
	LR34MspxfyV3yfl50aUtcJP3BTADEKKig5rjicTaYsoubda58zbR3wNYsdyfVlETr82G
	c4TTz4v76SZs7hfOAC6Z4Y3nTn3mMZIDNexUwKex+QGqR5BQZLd9TyaLY9yRwVgbkKGs
	OOww==
Received: by 10.204.148.82 with SMTP id o18mr3214bkv.41.1347977708781;
	Tue, 18 Sep 2012 07:15:08 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:18 +0200
Message-Id: <1347977601-28665-38-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 37/40] xfce4-mpc-plugin: initial add 0.4.4
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
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb     |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
new file mode 100644
index 0000000..a4a4c3e
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
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
+# for now we recommend our own mpd-server
+RRECOMMENDS_${PN} = "mpd"
+
+SRC_URI[md5sum] = "1c126ca71d6db1ac6a0cc6720554e7bd"
+SRC_URI[sha256sum] = "4f0ce6146aa2680a4c1ca7bad1be30187a8a179e8c4355a8fe13d1fc38dac5c5"
-- 
1.7.6.5



