Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 551B06AD3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:47 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so3320067eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=y6Ws3l36ejcpyKY2Wj2NtLePSPw7znI4I4M6xj8Onec=;
	b=SQLgE7/rxPATtxMlawqh4OGywhuflyweUDbEuRoICbiSDq4uSaIHjiSWERD6GwAHco
	g/6LWSiuqwP4DWwQoOrtIAea5KA1xf+RQVRM0QRbBFzn87xc1/meCFc+IWfd6Xuc5DTU
	SSWAonX5Gbuce5eYBrqoyMpdicheWag8D/CjWYOGVkNHosGEtR3r7sX0RTFWXEZlVniu
	+2LcT/MRhQPhOjxMMdSb2FOXUf3+l93WrccgVwncCT3tWl1/wZloXsXGy7sDvgL+faFz
	jJkS1uKAS8bhjsm7gUGLxwAJY62qxlWhdNmrWZ1oX+h7wbLeeINkzA+u8p309emMTuKt
	iE+Q==
X-Received: by 10.14.199.134 with SMTP id x6mr3580405een.114.1371662987959;
	Wed, 19 Jun 2013 10:29:47 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:12 +0200
Message-Id: <1371662967-31734-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 05/20] xfce4-xkb-plugin: update to 0.7.0 tarball
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
index a1f1a2f..d27e4cd 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
@@ -6,17 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "libxklavier libwnck librsvg garcon"
-
-PV = "0.5.4.3+gitr${SRCPV}"
+SRC_URI[md5sum] = "7fbc3d8c84d6662d819dd1803f0fee34"
+SRC_URI[sha256sum] = "28367c309863581ae4de529b35bdedf5a1c918096a9a2e6e771554cba7bf5a6a"
 
-SRC_URI = "git://git.xfce.org/panel-plugins/xfce4-xkb-plugin;protocol=git;branch=master"
-SRCREV = "b98b82d8522842e38a6355f9144f8348a6ab2aeb"
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-    NOCONFIGURE=yes ./autogen.sh
-}
+DEPENDS += "libxklavier libwnck librsvg garcon"
 
 FILES_${PN} += "${datadir}/xfce4/xkb"
 
-- 
1.7.4.4


