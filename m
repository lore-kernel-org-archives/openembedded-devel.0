Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFD060024
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:23:44 +0000 (UTC)
Received: by padjw17 with SMTP id jw17so35376450pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iNFkcT3g2IuCKKEtUzkIS3Lt170wuN0PvB3nhTt5rCE=;
	b=RAoS4B34ell8bVR8wIp3KhrqKDeXcDNxGvXut7BOXPkVARVFZeOO5gWJ01M+5dwM4g
	YvLVzyZ9L0GODpWZQOPx/vmq9j25kHBGwbVAfdkowcPPRbX+5AAKoBWaQ8OcVsq4volh
	JabWDInxIZimF3EoQDtOSiD2zBckD/qqLA8R6oNF25aS3rcFjEUmzp3EtAEAJWUuToM4
	mAn1P5KjVc1SOuSWEODDD4pX2vT3Xce7Nc50LRHV+kGk9wRrU1IVkHkprsYu8BBmyE8e
	5RS8DFUJknO8XSCjoLbzOHI60+BbIYxkYkSwidBfF9kCckhbG8hJ/l6lymMZqedlYwkc
	pInA==
X-Received: by 10.68.69.79 with SMTP id c15mr33945193pbu.25.1433445825379;
	Thu, 04 Jun 2015 12:23:45 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id i15sm4498857pbq.60.2015.06.04.12.23.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:23:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:23:36 -0700
Message-Id: <1433445816-7267-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtwebengine: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:23:44 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 4933c13..9b561ac 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -15,7 +15,7 @@ DEPENDS += " \
 "
 
 COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
-- 
1.9.1


