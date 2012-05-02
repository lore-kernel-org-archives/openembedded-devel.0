Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPWHW-0007Xj-AM
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:55:34 +0200
Received: by wgbdr1 with SMTP id dr1so330147wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cNlaw3mps8IkmZWSMYQagQ3IOmB+Su/0yGGJ9nvLthY=;
	b=g14cSdVyx65IpRLQWzxuaZBCCQ9wyMwYqvcRqzXHMJ1X0WVuDHGW98R+XVwiQUDdCT
	BG1lGUHk773vWPKNrmm0ioKyxvGakHbwhd9c3HrzNf/1mR+MPdm8OoDEjnNgZkzivFLO
	sTxTIB8EfuRZeKyhhv2LE2IT8EzRLGQRFE/pfSQ94zmQpRfcq5y9eiBXwxG2ZQGWH25w
	nC7WdfpEdGBcgcZ/NFrY0IPBTEz7ErimLi5eSHInG56NgTU86OmIl4SY2FQvuFO3SP46
	OYrY1DhvOLKtOZr+y6tG4vDq++FDS8nAETgLQKeqUKs+BdzifznSuxyF6Pd90XNwae+m
	ZNBg==
Received: by 10.216.132.202 with SMTP id o52mr5600768wei.106.1335951950056;
	Wed, 02 May 2012 02:45:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id u9sm43135554wix.0.2012.05.02.02.45.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:45:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:45:27 +0200
Message-Id: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlVsJAWJI4MjCYDAOv6JsGv3Zf2wBn/j4mpWcXl5I/iZTCtyQP8iYHiY2wnH+6KxXIrZ+yS
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe/denzil][PATCH 1/6] yavta: update to latest git
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
X-List-Received-Date: Wed, 02 May 2012 09:55:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index 705bf7d..054912d 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -3,9 +3,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://git.ideasonboard.org/yavta.git;protocol=git"
-SRCREV = "d62cb9d7435525660fd5c97941c7cf57921370b3"
+SRCREV = "82ff2efdb9787737b9f21b6f4759f077c827b238"
 
 PV = "0.0"
+PR = "r1"
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
1.7.10



