Return-Path: <rah@fern.h.settrans.net>
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id EEB1F60621
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:20:29 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1aL7TG-0004gy-CV for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2016 10:55:38 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>) id 1aL7TF-0001GV-OC
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2016 10:55:37 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id B5122B40E59; Mon, 18 Jan 2016 10:55:37 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 10:55:37 +0000
Message-Id: <1453114537-10416-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-efl][PATCH] illume-keyboards-shr: mark as having broken "make clean"
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
X-List-Received-Date: Mon, 18 Jan 2016 11:20:30 -0000

Set CLEANBROKEN as the Makefile has no "clean" target.

Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
index 6f81b6b..6925c87 100644
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
+++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
@@ -12,6 +12,8 @@ PR = "r5"
 LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
+CLEANBROKEN = "1"
+
 PACKAGES = "\
 illume-keyboard-alpha \
 illume-keyboard-arabic \
-- 
2.1.4


