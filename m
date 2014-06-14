Return-Path: <sledz@dresearch-fe.de>
X-Greylist: delayed 520 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Jun 2014 19:53:01 UTC
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id C53C26FD1A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 19:53:01 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 657ECE0161;
	Sat, 14 Jun 2014 21:44:21 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 3E46C700D38; Sat, 14 Jun 2014 21:44:19 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jun 2014 21:44:09 +0200
Message-Id: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Sat, 14 Jun 2014 19:53:06 -0000

live.2013.04.30.tar.gz is no longer available at original live555 url
and the url of the FreeBSD mirror has changed according to[1].

[1] <http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/README.txt>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta-oe/recipes-multimedia/live555/live555.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index a36177d..0c8208a 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -7,13 +7,13 @@ HOMEPAGE = "http://live.com/"
 LICENSE = "LGPLv3"
 SECTION = "devel"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 URLV = "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVar('PV',1)[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
-MIRRORS += "http://www.live555.com/liveMedia/public/ http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/ \n"
+MIRRORS += "http://www.live555.com/liveMedia/public/ http://distcache.FreeBSD.org/ports-distfiles/ \n"
 
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.3


