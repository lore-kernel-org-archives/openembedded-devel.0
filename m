Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1QqPqE-0000bA-Sl
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 15:26:03 +0200
Received: by fxg11 with SMTP id 11so4702319fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5P5Vnado3XnOOp5vUCYAzdfmPVWCaPQPBJ+G+7wg2NM=;
	b=YkFwlrMeX20SXoyWxL6RMXE474h7WRQOX5he8BRFOOa+P0AGRdP5f3Uq1c+BkscLMA
	I+3UoACoeoISj5JTx7tx0NvGFsVUEDCgZJ9p2jUFaLpOyhg+lusc/YkNJzbyYUjKtXTQ
	7r3tPfbMvSSXf2acCwDvGW49bbh8KP/hCsVk4=
Received: by 10.223.68.136 with SMTP id v8mr113419fai.54.1312809694744;
	Mon, 08 Aug 2011 06:21:34 -0700 (PDT)
Received: from localhost.localdomain (pD957CD5C.dip.t-dialin.net
	[217.87.205.92])
	by mx.google.com with ESMTPS id i16sm185086faa.21.2011.08.08.06.21.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Aug 2011 06:21:32 -0700 (PDT)
From: Josua Mayer <josua.mayer97@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Aug 2011 15:21:22 +0200
Message-Id: <1312809682-11362-1-git-send-email-josua.mayer97@googlemail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH v2] mokomaze: Update Project URLs
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
X-List-Received-Date: Mon, 08 Aug 2011 13:26:03 -0000

* Mokomaze moved to sourceforge
  Homepage and download link were changed accordingly
  SOURCEFORGE_MIRROR cannot be used because the source is not located at http://sourceforge.net/projects/mokomaze/files/ but inside http://mokomaze.sourceforge.net/files/

Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
---
v2: tried to use SOURCEFORGE_MIRROR unsucccessfully
v2: commit summary now starts with a capital letter
---
 recipes/mokomaze/mokomaze_0.5.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/mokomaze/mokomaze_0.5.5.bb b/recipes/mokomaze/mokomaze_0.5.5.bb
index 9ef8771..d4c2541 100644
--- a/recipes/mokomaze/mokomaze_0.5.5.bb
+++ b/recipes/mokomaze/mokomaze_0.5.5.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Classic game where you control a steel ball by tilting a wooden labyrinth"
-HOMEPAGE = "http://mokomaze.projects.openmoko.org/"
+HOMEPAGE = "http://mokomaze.sourceforge.net/"
 SECTION = "x11/games"
 PRIORITY = "optional"
 LICENSE = "GPLv3"
@@ -9,7 +9,7 @@ RRECOMMENDS_${PN}_shr = "fsoraw"
 PV = "0.5.5+git8"
 PR = "r7"
 
-SRC_URI = "http://mokomaze.projects.openmoko.org/files/${PN}-${PV}.tar.gz"
+SRC_URI = "http://mokomaze.sourceforge.net/files/${PN}-${PV}.tar.gz"
 SRC_URI_append_shr = " file://fsoraw.patch"
 SRC_URI_append_shr = " file://0001-Fix-accelerometers-with-2.6.34-kernels.patch"
 SRC_URI_append_shr = " file://0001-Fix-vibration-on-gta02-with-2.6.34-kernel.patch"
-- 
1.7.5.3



