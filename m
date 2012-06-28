Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SkLSi-0004Mh-1y
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 22:37:12 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 22125EA040
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 22:32:45 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 4CD9E64522; Thu, 28 Jun 2012 22:26:10 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 22:26:08 +0200
Message-Id: <1340915170-26873-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Subject: [meta-oe][PATCH 0/1] xcursor-transparent-theme_0.1.1: update SRC_URI
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
X-List-Received-Date: Thu, 28 Jun 2012 20:37:12 -0000

Hello,

The xcursor-transparent-theme_0.1.1 source package can not be fetch
anymore because the http://matchbox-project.org/ download repository
seems to be down. I updated the SRC_URI to fetch the package from the
projects.o-hand.com repository instead.

Please not that I submitted a similar patch to this one for the
oe-classic branch (fixing the same issue), because I couldn't rebase
the oe-classic recipe on the oe-core one. In fact, there is a feature
in the oe-core recipe that is not compatible with oe-classic and
bitbake-1.12.0. I got the follwing error when I tried:

ERROR: Error parsing /home/apelete/devel/openembedded/master/recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb: Could not inherit file classes/allarch.bbclass

For your information, the line causing the issue is the following one:

inherit autotools allarch

I hope I made the right choice when I consequently decided to submit a
patch for oe-core and oe-classic separately.

Anyway, the patch that comes as a follow-up of this message is what
it's all about, and it is targeting *oe-core*.

Apelete Seketeli (1):
  xcursor-transparent-theme_0.1.1: update SRC_URI

 .../xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10



