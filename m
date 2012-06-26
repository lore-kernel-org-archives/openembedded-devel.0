Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjdpL-0004AC-LI
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 00:01:39 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id C9761EA040;
	Tue, 26 Jun 2012 23:57:35 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id CCD6764496; Tue, 26 Jun 2012 23:50:47 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:50:46 +0200
Message-Id: <1340747447-17919-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/1] openssl_1.0.0e: fix build issue for hosts without ipv6
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
X-List-Received-Date: Tue, 26 Jun 2012 22:01:39 -0000

Hello,

The openssl.inc recipe modifies the bss_dgram.c source file to inject
some ipv6 specific code, which unfortunately breaks the build of
openssl_1.0.0e on hosts that doesn't support ipv6. I modified the
recipe to test for ipv6 support before modifying the bss_dgram.c
source file.

The patch that comes as a follow-up of this message is what it's all
about, and is targeting oe-classic.

Apelete Seketeli (1):
  openssl_1.0.0e: fix build issue for hosts without ipv6

 recipes/openssl/openssl.inc |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.10



