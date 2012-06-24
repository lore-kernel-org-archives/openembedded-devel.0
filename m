Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SinRz-0004jf-CP
	for openembedded-devel@openembedded.org; Sun, 24 Jun 2012 16:06:03 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 87373EA040;
	Sun, 24 Jun 2012 16:02:20 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 7679E604DE; Sun, 24 Jun 2012 15:55:03 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Sun, 24 Jun 2012 15:55:02 +0200
Message-Id: <1340546103-17137-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/1] base-passwd: update recipe SRC_URI
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
X-List-Received-Date: Sun, 24 Jun 2012 14:06:03 -0000

Hello,

The base-passwd-3.5.20.bb SRC_URI was defined as a link relative to
the ${DEBIAN_MIRROR} variable. The resolution of the corresponding
absolute link leaded to the index page of snapshot.debian.org.

The patch that come as a follow-up of this message updates the SRC_URI
to fix this issue. It is targeting oe-classic.

Apelete Seketeli (1):
  base-passwd: update SRC_URI of base-passwd-3.5.20 recipe

 recipes/base-passwd/base-passwd_3.5.20.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10



