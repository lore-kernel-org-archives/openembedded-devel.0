Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NZEIH-0004Zt-Bn
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 03:03:12 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWS00BQS5KJWH76@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 20:00:25 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 30A0814AF55; Sun,
	24 Jan 2010 21:00:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 20:59:43 -0500
Message-id: <1264384785-30439-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
In-reply-to: <20100125015636.GA9855@denix.org>
References: <20100125015636.GA9855@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 0/2] simplify switch to new SRC_URI-based checksums
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
X-List-Received-Date: Mon, 25 Jan 2010 02:03:13 -0000

The first patch adds the code to pre-generate SRC_URI-based checksums in
TMPDIR, allowing easy addition of those checksums in the recipe with
minimal editing.

The second patch removes the old code to generate missing checksums.ini
entries - can be applied later, once the switch to the new method is
complete and proven.

Denys Dmytriyenko (2):
  base.bbclass: pre-create SRC_URI checksums to include in the recipe
  base.bbclass: don't pre-generate checksums.ini entries any longer

 classes/base.bbclass |   23 ++++++++++++++---------
 1 files changed, 14 insertions(+), 9 deletions(-)



