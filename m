Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1A19272488
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 10:42:57 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XxvmK-0007Ff-QM from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2014 02:42:57 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Mon, 8 Dec 2014 10:42:55 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Dec 2014 15:42:50 +0500
Message-ID: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/2] mplayer2: use autotools-brokensep (B = S)
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

The mplayer2 package does not support out of tree builds
and the do_configure step also tries to find the configure
script in the same build directory while the script lies in
the src directory.
This patch updates the builddir to point to the srcdir in
order to cope with the above issues.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 65fab1f..6b3d120 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -36,7 +36,7 @@ CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
                     /usr/etc/mplayer/codecs.conf \
 "
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = " \
     --prefix=/usr \
-- 
1.7.9.5


