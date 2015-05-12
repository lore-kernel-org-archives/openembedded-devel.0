Return-Path: <picmaster@mail.bg>
X-Greylist: delayed 462 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 May 2015 19:33:27 UTC
Received: from mx2.mail.bg (mx2.mail.bg [193.201.172.118])
	by mail.openembedded.org (Postfix) with ESMTP id D800F73FF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 19:33:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [93.152.143.60])
	by mx2.mail.bg (Postfix) with ESMTPA id 2F87F6000BBF;
	Tue, 12 May 2015 22:25:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1431458744; bh=URfeDndN6Lb8HmOc5vWdszCrP3NH25aVLHvotlzeLkY=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=i54g8PcTY590XcJWpCCQ4Xv62cFhw93J3B0Vq47METM1VXRxxfJFBVA7KiQzMjbIg
	iQKQKDiczhWK8vbpECKGwx7lUrYL9ka4OmFCiwIUsQjQeoyYz/gZ7Z58Zn+vqeQuWh
	hLGXVMwcz6mo94ocHzV1A1bOqp3SBN69ZzUBmY4k=
From: Nikolay Dimitrov <picmaster@mail.bg>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2015 22:25:43 +0300
Message-Id: <1431458743-25856-1-git-send-email-picmaster@mail.bg>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-browser][PATCH] chromium: Use bitbake variable instead of shell variable
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
X-List-Received-Date: Tue, 12 May 2015 19:33:30 -0000

Change CHROMIUM_BUILD_TYPE to Bitbake variable, otherwise Chromium files are
not installed in the holding area, and Chromium fails to start on the target.

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 recipes-browser/chromium/chromium.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index a9e9b8a..72a649d 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-export CHROMIUM_BUILD_TYPE="Release"
+CHROMIUM_BUILD_TYPE = "Release"
 
 inherit gettext
 
-- 
1.7.10.4


