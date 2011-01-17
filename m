Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1Peuh0-00069J-O6
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 20:24:42 +0100
Received: by gwaa12 with SMTP id a12so2109887gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=EWGZeOXLGLFi7l+oDANArmjcMYmqArkKSgAbJAc/mOk=;
	b=jIcxKapN6SO3sxlTfl4frX9nWp/71jEIWD47zqYbuweXB3fXF5dubUOXsIipPckRIf
	5gvqlNWzOQGBhHvyVOsyJ39602pK3L9FO4uFlmYT0vW+bKP3SFasxrGXVvtELe6jpb60
	Bql5f2Vxv7a4sCd8x36RImjbcxwfS6GJPeORM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XzFu2j/z/UNVfnGXbLUzvJE+IXA62gFDp4wkaOs4nvun5sWx0iNVyhAdBKF9KekXsv
	3W3zG9tOXHSdiyEWrbK/o9Mdqp8vF43mYLmRyyLzplQ7KRLEAmt2ybj1oPPKTSvaXXDz
	mSNGZilBy1SXC1oMxzvu/AoRZmZ5idE1GS1/k=
Received: by 10.151.13.5 with SMTP id q5mr239189ybi.333.1295292231597;
	Mon, 17 Jan 2011 11:23:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v8sm2826457ybe.1.2011.01.17.11.23.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 11:23:50 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 13:22:33 -0600
Message-Id: <1295292153-8871-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-tui: Update SRCREV - makefile update
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
X-List-Received-Date: Mon, 17 Jan 2011 19:24:42 -0000

  * Updating the makefile to better support the release and debug versions used in CCSv5
  * Adding an install_debug option to the makefile
  * Updating the README file to go with the makefile updates

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/matrix-tui_1.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/matrix-tui_1.1.bb b/recipes/ti/matrix-tui_1.1.bb
index 519d183..9814d5f 100644
--- a/recipes/ti/matrix-tui_1.1.bb
+++ b/recipes/ti/matrix-tui_1.1.bb
@@ -1,4 +1,4 @@
 require matrix-tui.inc
 
-SRCREV = "35"
-PR = "${INC_PR}.3"
+SRCREV = "37"
+PR = "${INC_PR}.4"
-- 
1.6.3.3



