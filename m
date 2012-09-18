Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylq-0001l8-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:26 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=yNK52mVSBVq6qJC9KxQQq33MXGESy6NlZCRXVbtNr+w=;
	b=HGUlGRA5HJqf/+G1vLr+6TYagA17WPfsPVq45vH9wKTh2XyRhGboPmvhlHPhdCbc8T
	aQ36TcHfYmb/nh31JrwFPNf0fnEobLd8uazW/Cfi3xA70824LnGQXRwl1aUdn7c2BQlK
	Tb6X+HJsTtAw9SCxiMCVv0A0OaPlzExlEfvXtxIFrw5RPkccWVPVSLN85qrocclkdGlt
	VXg6INtCXcCR/D78AGC5x+4cQvKnEyR9gfO8DGrtAbUpUWGPlNyw9nPGE6JRQxHXDedC
	j3reeS4iG+CA00coLP2DlNBixMUu4Y94j3M4uRYkKTVl9Jk0PakHZknroaPbCYC/gad6
	cISA==
Received: by 10.204.154.151 with SMTP id o23mr164635bkw.77.1347977688553;
	Tue, 18 Sep 2012 07:14:48 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:04 +0200
Message-Id: <1347977601-28665-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 23/40] ristretto: update to 0.6.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:33:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LIC_FILES_CHKSUM: Free Software Foundation address changed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{ristretto_0.3.5.bb => ristretto_0.6.3.bb}     |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.5.bb => ristretto_0.6.3.bb} (55%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
similarity index 55%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
index fec5c46..959dcad 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
@@ -2,13 +2,12 @@ DESCRIPTION = "Tiny image-viewer"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
 DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
 
 inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "3bfdf129926236a45c58d7afdbb703b7"
-SRC_URI[sha256sum] = "96dc519c2e930955f97027d7b9bb7542b01a6ad0ca53a16f9af58f7c851eb8f2"
+SRC_URI[md5sum] = "6b8c9a5d7ed319e4c84a9fefaa18792c"
+SRC_URI[sha256sum] = "2b6816de298e9a0d9b95662664690713c4123a9ac813a27bdde4727a03472d79"
-- 
1.7.6.5



