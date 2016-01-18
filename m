Return-Path: <rah@fern.h.settrans.net>
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC9F6FFDA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:13:15 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1aL7kJ-00051H-SI for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2016 11:13:15 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>) id 1aL7kJ-000251-53
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2016 11:13:15 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id 24CF5B40E87; Mon, 18 Jan 2016 11:13:15 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 11:13:15 +0000
Message-Id: <7976283edf95befe5f83b6b26da47296e9aa5d81.1453115353.git.bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453115353.git.bob.ham@collabora.com>
References: <cover.1453115353.git.bob.ham@collabora.com>
In-Reply-To: <cover.1453115353.git.bob.ham@collabora.com>
References: <cover.1453115353.git.bob.ham@collabora.com>
Subject: [meta-oe][PATCH 3/3] wmiconfig: mark as having broken "make clean"
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
X-List-Received-Date: Mon, 18 Jan 2016 11:13:16 -0000

Set CLEANBROKEN as the Makefile has no "clean" target.

Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
index a114d2f..480939b 100644
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
@@ -9,6 +9,8 @@ PR = "r2"
 SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http"
 S = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig"
 
+CLEANBROKEN = "1"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-- 
2.1.4


