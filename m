Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 473BD7248C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 10:42:58 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XxvmM-0007Fn-Td from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2014 02:42:59 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Mon, 8 Dec 2014 10:42:56 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Dec 2014 15:42:51 +0500
Message-ID: <1418035371-3544-2-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>
References: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
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
X-List-Received-Date: Mon, 08 Dec 2014 10:42:58 -0000
Content-Type: text/plain

The mplayer "make install" phase leaves an empty
/usr/lib directory seemingly regardless of the setting
of libdir.  Remove it to avoid a packaging warning.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 6b3d120..a68a2ba 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -141,4 +141,5 @@ do_install() {
     install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
+    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
 }
-- 
1.7.9.5


