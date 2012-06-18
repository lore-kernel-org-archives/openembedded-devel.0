Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sglkn-0002ZK-It
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 01:53:05 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 86A8DEA040;
	Tue, 19 Jun 2012 01:50:12 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 40CA8604DE; Tue, 19 Jun 2012 01:42:23 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org, Martin Jansa <martin.jansa@gmail.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Date: Tue, 19 Jun 2012 01:42:09 +0200
Message-Id: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH 0/1] gtk+: Regenerate no-demos.patch and update recipe
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
X-List-Received-Date: Mon, 18 Jun 2012 23:53:05 -0000

Hello,

This fix regenerates the gtk+-2.20.1/no-demos.patch file because the
targeted Makefile.am file changed since gtk+-2.10.1.
The gtk+_2.20.1.bb recipe is also updated to fix an issue where
no-demos.patch was not taken into account during the do_patch() stage.

Apelete Seketeli (1):
 gtk+: Regenerate no-demos.patch and update recipe

 gtk+-2.20.1/no-demos.patch |    7 ++++---
 gtk+_2.20.1.bb             |    3 +--
 2 files changed, 5 insertions(+), 5 deletions(-)



