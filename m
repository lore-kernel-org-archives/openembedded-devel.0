Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PGFXI-0002an-RH
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 19:36:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 136848ED526
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 13:35:47 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03499-07 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 10 Nov 2010 13:35:47 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id D36888DB48D; Wed, 10 Nov 2010 13:35:46 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 95BEB8EE2ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 13:35:44 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 6EDFE5001F7; Wed, 10 Nov 2010 13:35:44 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Nov 2010 13:35:43 -0500
Message-Id: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libsdl-x11: configure with --disable-rpath
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
X-List-Received-Date: Wed, 10 Nov 2010 18:36:46 -0000

Otherwise libtool and ld try to link against ${libdir}/libdl.so.2 on the
host system.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/libsdl/libsdl-x11_1.2.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libsdl/libsdl-x11_1.2.14.bb b/recipes/libsdl/libsdl-x11_1.2.14.bb
index 4c84d99..37799c3 100644
--- a/recipes/libsdl/libsdl-x11_1.2.14.bb
+++ b/recipes/libsdl/libsdl-x11_1.2.14.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL"
 DEPENDS = "alsa-lib virtual/libgl virtual/libx11 libxext tslib"
 DEPENDS_avr32 = "alsa-lib virtual/libx11 libxext tslib"
 PROVIDES = "virtual/libsdl"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = " \
   http://www.libsdl.org/release/SDL-${PV}.tar.gz \
@@ -30,7 +30,7 @@ EXTRA_OECONF = " \
   --disable-video-xbios --disable-video-gem --disable-video-dummy \
   --enable-video-opengl --enable-input-events --enable-pthreads \
   --disable-video-picogui --disable-video-qtopia --enable-dlopen \
-  --enable-input-tslib --disable-video-ps3 \
+  --enable-input-tslib --disable-video-ps3 --disable-rpath \
 "
 
 do_configure() { 
-- 
1.7.0.4



