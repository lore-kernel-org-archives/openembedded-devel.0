Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 452B173C4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 22:29:55 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B3B8CF811D7; Fri, 27 Mar 2015 16:29:56 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4704FF811D7;
	Fri, 27 Mar 2015 16:29:56 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2015 16:29:58 -0600
Message-Id: <1427495398-13403-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH] mplayer2: Needs python3 to compile
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
X-List-Received-Date: Fri, 27 Mar 2015 22:29:56 -0000

Inherit python3native as the compile step requires it:
  | ./TOOLS/file2string.py etc/input.conf >input/input.conf.h
  | /usr/bin/env: python3: No such file or directory

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 8c5f4eb..5b0e1de 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -40,7 +40,7 @@ CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
                     /usr/etc/mplayer/codecs.conf \
 "
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig python3native
 
 EXTRA_OECONF = " \
     --prefix=/usr \
-- 
1.9.1


