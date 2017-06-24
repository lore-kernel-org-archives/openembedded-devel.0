Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2033E71A88
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jun 2017 09:06:58 +0000 (UTC)
Received: from localhost.localdomain (p5DDC6AAA.dip0.t-ipconnect.de
	[93.220.106.170])
	by mail.bugwerft.de (Postfix) with ESMTPSA id EEA5D28007D;
	Sat, 24 Jun 2017 09:05:55 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jun 2017 11:06:35 +0200
Message-Id: <20170624090635.19682-1-daniel@zonque.org>
X-Mailer: git-send-email 2.9.4
Subject: [meta-qt5][PATCH] qtwebengine: add PACKAGECONFIG for webrtc
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
X-List-Received-Date: Sat, 24 Jun 2017 09:06:59 -0000

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 74bbddf..5211e93 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -40,6 +40,7 @@ PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
 PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
 PACKAGECONFIG[nss] = "WEBENGINE_CONFIG+=use_nss,,nss"
+PACKAGECONFIG[webrtc] = "WEBENGINE_CONFIG+=use_webrtc,,libvpx"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-- 
2.9.4


