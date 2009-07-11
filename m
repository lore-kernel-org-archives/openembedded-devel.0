Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MPQnF-0000PG-0b
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 02:50:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id ED766505B4B;
	Fri, 10 Jul 2009 20:37:25 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28754-10; Fri, 10 Jul 2009 20:37:25 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id CCD28505C1D; Fri, 10 Jul 2009 20:37:25 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 835894F76AC;
	Fri, 10 Jul 2009 20:37:24 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 7E934A26460; Fri, 10 Jul 2009 20:37:24 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2009 20:37:01 -0400
Message-Id: <1247272621-26730-4-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247272621-26730-3-git-send-email-msmith@cbnco.com>
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
	<1247272621-26730-2-git-send-email-msmith@cbnco.com>
	<1247272621-26730-3-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 4/4] xf86-video-intel: add 2.6.3
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
X-List-Received-Date: Sat, 11 Jul 2009 00:50:21 -0000

Fixes build with xserver-xorg 1.6.1.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 conf/checksums.ini                                 |    4 ++++
 ...deo-i810_1.7.4.bb => xf86-video-intel_2.6.3.bb} |    0
 2 files changed, 4 insertions(+), 0 deletions(-)
 copy recipes/xorg-driver/{xf86-video-i810_1.7.4.bb => xf86-video-intel_2.6.3.bb} (100%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 23d36e2..a14c64f 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -26134,6 +26134,10 @@ sha256=d976c5f5e9c84f3817aba6ad22855446f1c2b9bfa0d53bd11c37c62cfdefa60a
 md5=5cd6b3ed57c7e78ab51e9d9266e73fb6
 sha256=5afdc91e93ffed09ea5258c6fde210c729ea2b44d83f98acfd92c3da7e99e64b
 
+[http://xorg.freedesktop.org/releases/individual/driver/xf86-video-intel-2.6.3.tar.bz2]
+md5=440c014bbd3072b5d379fe1bdb861918
+sha256=b35a142aeba034ad06b8d9b477c243f82ce9f82ad65a0ee4408630f228e90258
+
 [http://xorg.freedesktop.org/releases/individual/driver/xf86-video-mach64-6.8.0.tar.bz2]
 md5=6081b8fa50c689d51f85c2fbaf93867e
 sha256=fba616f88d351759e00a90965e38a0d82608698ae36fc2a18df4036cd384e1a1
diff --git a/recipes/xorg-driver/xf86-video-i810_1.7.4.bb b/recipes/xorg-driver/xf86-video-intel_2.6.3.bb
similarity index 100%
copy from recipes/xorg-driver/xf86-video-i810_1.7.4.bb
copy to recipes/xorg-driver/xf86-video-intel_2.6.3.bb
-- 
1.6.3



