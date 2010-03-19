Received: from server3.tinynetworks.co.uk ([89.16.176.161]
	helo=mx.tinynetworks.co.uk) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn@welchs.me.uk>) id 1NslHB-0001gR-AP
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Mar 2010 00:06:51 +0100
Received: from mx.tinynetworks.co.uk (localhost.localdomain [127.0.0.1])
	by mx.tinynetworks.co.uk (Postfix) with ESMTP id E88776361A8;
	Fri, 19 Mar 2010 22:54:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=tinynetworks.co.uk; h=from
	:subject:to:cc:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=postfix; bh=w3abb5zmkYcDx6NZj53We7
	IwDxE=; b=EU1mQ0L7ThzFuDhQvkB6bAC7TJ9U43QTCJMc0dyCjB/sDxOwN3uV8d
	e2h9o3uCxV502NAvqWi9g09DszpmgOHrNEY9hD/20GgKCx7iF98rtFRyU627+fAY
	hl+6GUT1xJQbWJF5UIT0vMudtg2DFZq3y/Z2iLjEI6cDiYdb1vRts=
Received: from [127.0.1.1] (unknown [82.152.154.75])
	by mx.tinynetworks.co.uk (Postfix) with ESMTPA id 9A5DE636057;
	Fri, 19 Mar 2010 22:54:10 +0000 (GMT)
From: Martyn Welch <martyn@welchs.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 22:54:08 +0000
Message-ID: <20100319225408.8511.74339.stgit@icarus>
User-Agent: StGIT/0.14.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 89.16.176.161
X-SA-Exim-Mail-From: martyn@welchs.me.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: koen@openembedded.org
Subject: [PATCH] gypsy: Add version 0.7, remove broken svn recipe
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
X-List-Received-Date: Fri, 19 Mar 2010 23:06:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Svn package no longer provided at o-hand. Remove it and replace with
version 0.7 from the projects website.

Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
---

 recipes/gypsy/gypsy_0.7.bb |   10 ++++++++++
 recipes/gypsy/gypsy_svn.bb |   10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 recipes/gypsy/gypsy_0.7.bb
 delete mode 100644 recipes/gypsy/gypsy_svn.bb

diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
new file mode 100644
index 0000000..9c1fb41
--- /dev/null
+++ b/recipes/gypsy/gypsy_0.7.bb
@@ -0,0 +1,10 @@
+require gypsy.inc
+
+SRC_URI = "http://gypsy.freedesktop.org/gypsy-releases/gypsy-0.7.tar.gz;name=gypsy \
+           file://docs-reference-am.patch;patch=1 \
+           file://remove-werror.patch;patch=1 \
+"
+
+SRC_URI[gypsy.md5sum] = "cde52c121693014efa75d9098fd7de22"
+SRC_URI[gypsy.sha256sum] = "60d9f9ada77c832899df4a164718895addc5015fa48f45fd58dc4bc8a983f205"
+
diff --git a/recipes/gypsy/gypsy_svn.bb b/recipes/gypsy/gypsy_svn.bb
deleted file mode 100644
index 0245a95..0000000
--- a/recipes/gypsy/gypsy_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gypsy.inc
-
-SRC_URI = "svn://svn.o-hand.com/repos/${PN}/trunk;module=${PN};proto=http \
-           file://fixups.patch;patch=1;maxrev=107 \
-           file://docs-reference-am.patch;patch=1;minrev=134 \
-           file://remove-werror.patch;patch=1"
-S = "${WORKDIR}/${PN}"
-
-PV = "0.0+svnr${SRCPV}"
-PR = "r1"



