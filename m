Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8D175794
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:53:33 +0000 (UTC)
Received: by ykll84 with SMTP id l84so20143532ykl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=lAjVaMuEHi0Ba6mY+u4grsVP8zQlQrms4WRPzKnDGnM=;
	b=zQ2ylR3R9jvQvi4wBdib2SMR+uf6R39xpbqt244vskcNQSalo4lNnBEyrWDJI9xBgq
	xAT7o3UpTQ5P52/HVCJC3+hF5QOdo2e37UeIJxdJgZQYKSdysuxrBw5I1/+/oZpXLI5p
	zXsJ69fjeqhOox6K/0BBSjQ+uVRMxf0xugMDXiSVha+PnmLczHuhBD45+hSmFwcTR0Aw
	GudJjJDh63kD3vpyHPije2EccRafsHYI8CMtK3y38Botd+7yyb3wnhlUY1WCHy41H5Wv
	vSkz4xQRK2QHLruCtpfu/BSpLziWwzlIH0cGBfmPrh8pABrwaVOR5AaEWDyGUJ4bd0QD
	H57g==
X-Received: by 10.13.209.131 with SMTP id t125mr952789ywd.121.1440683614020;
	Thu, 27 Aug 2015 06:53:34 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	a126sm1821622ywc.13.2015.08.27.06.53.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 06:53:28 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 06:53:18 -0700
Message-Id: <1440683598-4642-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH v2] vlc: fix for libtool error
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
X-List-Received-Date: Thu, 27 Aug 2015 13:53:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v1:
  typo caught by Andreas Oberritter

Patch recommended by:
  Rafaël Carré funman@videolan.org

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index bf7ce0c..401bfa1 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -63,7 +63,7 @@ do_configure_prepend() {
 
 do_configure_append() {
     sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/include\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
-    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g ${B}/doltlibtool
+    sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
 }
 
 # This recipe packages vlc as a library as well, so qt4 dependencies
-- 
2.1.0


