Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002bF-EP
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id E2E4DEA04E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:33 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A4972605E6; Thu, 19 Jul 2012 19:20:40 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:33 +0200
Message-Id: <1f3c43e5b305a106390f4ef83cd2a5e11a3e7246.1342677799.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 2/9] mirrors.bbclass: add new KERNELORG_MIRROR
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
X-List-Received-Date: Thu, 19 Jul 2012 17:32:02 -0000

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
1.7.10.4



