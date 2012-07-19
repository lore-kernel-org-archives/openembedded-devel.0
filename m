Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002bD-Ew
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id D082DEA04B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:33 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 9218F604F3; Thu, 19 Jul 2012 19:20:40 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:32 +0200
Message-Id: <da0b2dae10b88615a53a3b1e5e758b74f0d4e2c3.1342677799.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 1/9] mirrors.bbclass: add new GNU_MIRROR
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

Add ftp://mirrors.usc.edu/pub/gnu as a new GNU_MIRROR because the
binutils_2.21 source package could not be found on any of the defined
GNU mirrors.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 classes/mirrors.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
index bb4f1ec..d4fc2a5 100644
--- a/classes/mirrors.bbclass
+++ b/classes/mirrors.bbclass
@@ -22,6 +22,7 @@ ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu
 ${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu
 ${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu
 ${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu
+${GNU_MIRROR}	ftp://mirrors.usc.edu/pub/gnu
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub
 ${KERNELORG_MIRROR}	ftp://ftp.us.kernel.org/pub
 ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub
-- 
1.7.10.4



