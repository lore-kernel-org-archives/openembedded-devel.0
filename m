Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 94D2273C48
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:47:57 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.128.72]) by mail.gmx.com (mrgmx101)
	with ESMTPSA (Nemesis) id 0Ls8Qd-1ZHobh0vKp-013zWL;
	Wed, 29 Apr 2015 11:42:54 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Apr 2015 11:42:43 +0200
Message-Id: <1430300563-20254-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.3.6
MIME-Version: 1.0
X-Provags-ID: V03:K0:qKGZbPxuFSUeD4I6cjPaa8UjUG958H8wlLkELY1FquEzVLBBofR
	lInsOdqbFnPkHmmERiSC/Xw80SB0QIuTaTcMesWnQKQ76q5/d/twKiZOJwYGALkzqoX1L4l
	x55JANfO1xX5cFIkbIRGEy64BD7ElvzmpErTRn7IqPebgqfTVesWv6RQRM/hM0L/yZ9Ir+C
	PrBwNrA4yZHTxptZx2MPw==
X-UI-Out-Filterresults: notjunk:1;
Subject: [meta-oe][fido][PATCH] fio: add missing build dependency on zlib
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
X-List-Received-Date: Wed, 29 Apr 2015 09:47:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes:
| WARNING: QA Issue: fio rdepends on zlib, but it isn't a build dependency? [build-deps]

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index 016b1f2..13534cc 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -10,7 +10,7 @@ SECTION = "console/tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "libaio"
+DEPENDS = "libaio zlib"
 
 # rev for v2.2.6
 SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
-- 
2.3.6


