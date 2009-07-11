Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MPQn5-0000P0-7W
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 02:50:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4108E505C1D;
	Fri, 10 Jul 2009 20:37:11 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28754-09; Fri, 10 Jul 2009 20:37:11 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 1BA95505C54; Fri, 10 Jul 2009 20:37:10 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 56E264F76AC;
	Fri, 10 Jul 2009 20:37:10 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 51978A26460; Fri, 10 Jul 2009 20:37:10 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2009 20:36:59 -0400
Message-Id: <1247272621-26730-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/4] xf86-video-vesa: add 2.2.0
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
X-List-Received-Date: Sat, 11 Jul 2009 00:50:11 -0000

Fixes build with xserver-xorg 1.6.1.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 conf/checksums.ini                                 |    4 ++++
 ...ideo-vesa_2.0.0.bb => xf86-video-vesa_2.2.0.bb} |    0
 2 files changed, 4 insertions(+), 0 deletions(-)
 copy recipes/xorg-driver/{xf86-video-vesa_2.0.0.bb => xf86-video-vesa_2.2.0.bb} (100%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index b9a2d85..23d36e2 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -26562,6 +26562,10 @@ sha256=b96c80ae81f5123ecef344dac4c734b2e281143d3ab7a7e633d6bf04c893e203
 md5=433cf6f961eb4a2ab6fcb086def0b2b4
 sha256=f20b2e429657552eea207fb8bc4b47c8e293d99c229dcb4da11b7c5bfdc1e165
 
+[http://xorg.freedesktop.org/releases/individual/driver/xf86-video-vesa-2.2.0.tar.bz2]
+md5=9a86b683f73f3806f55d05cd804a6f4a
+sha256=8b3e077d2534722033d7b1c647aa7f31fc7fbb5014da096b7a53170005e80226
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/driver/xf86-video-vesa-X11R7.0-1.0.1.3.tar.bz2]
 md5=049ada4df1abb5aa2b6633ba90353e78
 sha256=c6601cd278ebc30a0d20b49b6284bc21b4910f8ef5d24d1c62daa1591a251452
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.0.0.bb b/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
similarity index 100%
copy from recipes/xorg-driver/xf86-video-vesa_2.0.0.bb
copy to recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
-- 
1.6.3



