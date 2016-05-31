Return-Path: <chaac@moomba.re-solutions.fi>
X-Greylist: delayed 501 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 May 2016 12:46:58 UTC
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net
	[83.102.40.152])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE727713E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 12:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 537F2ED90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 15:38:36 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 1.401
X-Spam-Level: *
X-Spam-Status: No, score=1.401 tagged_above=-9999 required=6
	tests=[DKIM_ADSP_CUSTOM_MED=0.001, FREEMAIL_FORGED_FROMDOMAIN=0.198,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	NML_ADSP_CUSTOM_MED=1.2] autolearn=disabled
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10040) with ESMTP id eIk9sfT8ckV0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 15:38:35 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net
	[83.102.40.52])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id E7A46BB23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 15:38:35 +0300 (EEST)
Received: from moomba.re-solutions.fi (87-100-245-190.bb.dnainternet.fi
	[87.100.245.190])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id DD1BD80
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 15:38:34 +0300 (EEST)
Received: by moomba.re-solutions.fi (Postfix, from userid 1000)
	id BCF7F13F505; Tue, 31 May 2016 15:38:34 +0300 (EEST)
From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2016 15:38:34 +0300
Message-Id: <1464698314-127414-1-git-send-email-dachaac@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Fix nano's license to GPLv3.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2016 12:46:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nano recipe has incorrectly stated GPLv2 license where actually it is GPLv3.

Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
---
 meta-oe/recipes-support/nano/nano.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index bdefe9b..3fad029 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "GNU nano (Nano's ANOther editor, or \
 Not ANOther editor) is an enhanced clone of the \
 Pico text editor."
 HOMEPAGE = "http://www.nano-editor.org/"
-LICENSE = "GPLv2"
+LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
-- 
1.9.1


