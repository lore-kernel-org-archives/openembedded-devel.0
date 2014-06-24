Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBA165D42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 18:26:34 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h18so5064860igc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 11:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m4KiNw0DAB2BbhkTwlxlZm/+w8KKzWyDe8olhmInvQA=;
	b=V01I307T7uHgfxSAYKWfnmxeTGkI4cvmYZfBvC1czat0md+S9qW13fmug08Vml30cO
	DEaNfxLt51dQJH8sdkiDJWdnRcTRK8cCFcC5o2qnl84EL/PVdDiqyVPctbTpl876pFXH
	RY1itHG+hIqk3nZSU/ixlm4Bx3mWYM+b1Xkm0SegnJTI5KXaKF/wAwSS+5Wa/EhrZ6bO
	a6LsxdLjRn40lhQT3C3SmLNn3tLwBM0BtYosJqQcUmnfH2yk8b3F87oLfIXvj66vvqLB
	jFhobEfWU7pSvM9SzSundlT7kl7VCWj3LNfkmPeBVShJ58uDVZl4oNXlT0SRJdQFeizE
	nZJQ==
X-Gm-Message-State: ALoCoQmlQrDSueLyBPbpdxJnJIAufIsMphHUKiW/n3gT/IQ5v0W5BKwc6RYaqgOGnvBZYU0JIuPy
X-Received: by 10.50.66.208 with SMTP id h16mr4019733igt.19.1403634394407;
	Tue, 24 Jun 2014 11:26:34 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id k5sm44212338igf.5.2014.06.24.11.26.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 11:26:33 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jun 2014 14:26:03 -0400
Message-Id: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 2.0.0.5.gbce14aa
Cc: patches@linaro.org
Subject: [meta-oe][MASTER][PATCH] lxdm: add libpam DEPENDS
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
X-List-Received-Date: Tue, 24 Jun 2014 18:26:41 -0000

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index dc40fb2..d0eb516 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -16,7 +16,7 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
 PV = "0.5.0+git${SRCPV}"
 PE = "1"
 
-DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
+DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes libpam"
 DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 
 # combine oe-core way with angstrom DISTRO_TYPE
-- 
2.0.0.5.gbce14aa


