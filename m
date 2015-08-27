Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 16A9473217
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 04:35:55 +0000 (UTC)
Received: by ykbi184 with SMTP id i184so8423262ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Q5kSu4FqYmFwA999CBbGJWlAGNXZyITFmYzoVUqQvVY=;
	b=T/RhQ2e9JESXilfIVOYIWvjoHwbiuBDwygXrkUJh3Fn+t8zrcnQaFr90pgtXWna8Ut
	ttGfgKO1ErXDE1dMsOJy/1tdqdML1Sp9ezZjkdjwrdk14I5qPKT7ZJdxqEnmnSAGU1Dd
	t3gEjeeRegOb2T4s6f8tkSz8D6Hm+um717+yP8139uf3uNb0UOFAZ8j59s2KmrliqQ7W
	CthCUANLlo0wdJUiimLM54dAhs2WLnNmfT3w4sBMFhvflmb8feEqFv+RyN4BepkiZ1Qp
	VcFkpZoPt9VnP0AFsd9R4045i7z96Ke/nkn7v+0fMn6tOpBf5X3cJoji1CVpDrepdiH1
	zZHQ==
X-Received: by 10.129.145.132 with SMTP id i126mr1114002ywg.133.1440650155337; 
	Wed, 26 Aug 2015 21:35:55 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id w68sm827649ywe.55.2015.08.26.21.35.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 21:35:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 21:35:32 -0700
Message-Id: <1440650132-10281-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] vlc: fix for libtool error
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
X-List-Received-Date: Thu, 27 Aug 2015 04:35:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch recommended by:
  Rafaël Carré funman@videolan.org

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index bf7ce0c..c4548c7 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -63,7 +63,7 @@ do_configure_prepend() {
 
 do_configure_append() {
     sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/include\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
-    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g ${B}/doltlibtool
+    sed -i -e s:'${top_builddir_slash}libtool':'${top_buildir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
 }
 
 # This recipe packages vlc as a library as well, so qt4 dependencies
-- 
2.1.0


