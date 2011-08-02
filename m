Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1QoJmO-0001No-Us
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 20:33:24 +0200
Received: by fxg11 with SMTP id 11so105531fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GhpNLk0Ns/n0I/d+5EqTsZesAgL8HsxWZ8G1SGktsQg=;
	b=xBUEXPLMmxdkuax9760tqxPkv3NGQboHbw3P5y06INfYmxgf/1AeuapCrpTZGIL3P4
	B3mZ0ufHN/BBV7EIJBn3uxtpBW4P6PNF/2NKUWaFz8nxjRYG0qAzi0AjlpFFI6C8VWTO
	nLPNyU35alxC0DPT8/JCA8LSnuyCappuQRLiA=
Received: by 10.223.24.92 with SMTP id u28mr8505598fab.148.1312309743567;
	Tue, 02 Aug 2011 11:29:03 -0700 (PDT)
Received: from localhost.localdomain (pD957CD12.dip.t-dialin.net
	[217.87.205.18])
	by mx.google.com with ESMTPS id j19sm16907faa.17.2011.08.02.11.29.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 11:29:02 -0700 (PDT)
From: Josua Mayer <josua.mayer97@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2011 20:28:55 +0200
Message-Id: <1312309735-1628-1-git-send-email-josua.mayer97@googlemail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH] mokomaze: fix project urls
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
X-List-Received-Date: Tue, 02 Aug 2011 18:33:25 -0000

* Mokomaze moved to sourceforge
  Homepage and download link were changed accordingly

Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
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



