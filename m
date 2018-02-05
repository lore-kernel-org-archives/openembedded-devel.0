Return-Path: <register@domestic-affairs.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.163])
	by mail.openembedded.org (Postfix) with ESMTP id EBC016E650
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 12:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1517835229;
	s=strato-dkim-0002; d=domestic-affairs.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH;
	bh=MUjoPnk7MMmeLwooHe0FEmGtsxq1o48zF6E7T9q9JyI=;
	b=h/zVfQp/gpDqmcxrQsPbbxbZO03t/SuO9quvEhRkigQtsXLm+DHKrCfpmnI5R3xbue
	mLKLNa4tqvCyX/ybew5BPpMpyafFSIpjx69t6qY5JiDngcRmZMkbwq4tEN16Z+rbI5M6
	ryQ/7ofs48oWOeC6zHBAsbBpXfQhDT2JlAe8fJHLFR2LG1pB4n6+Ui7vI8Ih8ccmr6nM
	akcuulrdTL5dujYPeHY852GIV8B744T/zz/3NP3PxtCU0AX15v2CqSlJzjM88OnFPvzd
	CVwoRUzFO3SrwRoYZSpWea8J1abUJIwyIcDnKup+q6zMqQsCjLE8e/s8V70j6ZT7f8bP
	sAgw==
X-RZG-AUTH: :PmkDfFO8fu0J0+3DXwoMkfFoqUwruXMtauFeJ6DAZkfLcl+OPO60AHCAMVVvSPxbJNNPEolOASlV25Sqr2mE
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain (p54AC5F3C.dip0.t-ipconnect.de
	[84.172.95.60]) by smtp.strato.de (RZmta 42.18 DYNA|AUTH)
	with ESMTPSA id 204c52u15CrmnJg
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Mon, 5 Feb 2018 13:53:48 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 7C51B24603A; Mon,  5 Feb 2018 13:53:22 +0100 (CET)
From: Pascal Huerst <pascal.huerst@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 13:53:19 +0100
Message-Id: <20180205125319.18132-1-pascal.huerst@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-qt5][PATCH] qtwebengine: add PACKAGECONFIG for proprietary_codecs
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
X-List-Received-Date: Mon, 05 Feb 2018 12:53:49 -0000

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index ecf4657..4d6c7b6 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -57,6 +57,7 @@ PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
 PACKAGECONFIG[webrtc] = "WEBENGINE_CONFIG+=use_webrtc,,libvpx"
 PACKAGECONFIG[nss] = "WEBENGINE_CONFIG+=use_nss,,nss"
+PACKAGECONFIG[proprietary_codecs] = "WEBENGINE_CONFIG+=use_proprietary_codecs,,"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-- 
2.14.3


