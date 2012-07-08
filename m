Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1So0Yy-0000v3-Hk
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2012 01:06:48 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 5374FEA048;
	Mon,  9 Jul 2012 01:00:56 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 24A37604C9; Mon,  9 Jul 2012 00:55:35 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2012 00:55:35 +0200
Message-Id: <1341788135-14072-3-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1341788135-14072-1-git-send-email-apelete@seketeli.net>
References: <1341788135-14072-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 2/2] mirrors.bbclass: add new KERNELORG_MIRROR
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
X-List-Received-Date: Sun, 08 Jul 2012 23:06:48 -0000

Add http://mirror.sit.wisc.edu/pub as a new KERNELORG_MIRROR because
the libpam_1.1.1 source package could not be found on any of the
defined kernel.org mirrors.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 classes/mirrors.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
index d4fc2a5..5c6219b 100644
--- a/classes/mirrors.bbclass
+++ b/classes/mirrors.bbclass
@@ -23,6 +23,7 @@ ${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu
 ${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu
 ${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu
 ${GNU_MIRROR}	ftp://mirrors.usc.edu/pub/gnu
+${KERNELORG_MIRROR}/pub	http://mirror.sit.wisc.edu/pub
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub
 ${KERNELORG_MIRROR}	ftp://ftp.us.kernel.org/pub
 ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub
-- 
1.7.10



