Return-Path: <rah@fern.h.settrans.net>
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCB76FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:30:51 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1aL81L-00056X-TU for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2016 11:30:51 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>) id 1aL81L-0002YB-8C
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2016 11:30:51 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id 3CA7EB40E59; Mon, 18 Jan 2016 11:30:51 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 11:30:51 +0000
Message-Id: <1453116651-11714-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-python][PATCH] python-dateutil: mark as having broken "make clean"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jan 2016 11:30:58 -0000

Set CLEANBROKEN as the Makefile has no "clean" target.

Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 meta-python/recipes-devtools/python/python-dateutil_1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-dateutil_1.5.bb b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
index 37f19a8..61d992d 100644
--- a/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
+++ b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
@@ -8,6 +8,8 @@ SRCNAME = "${BPN}"
 SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+CLEANBROKEN = "1"
+
 inherit setuptools
 
 PACKAGES =+ "${PN}-zoneinfo"
-- 
2.1.4


