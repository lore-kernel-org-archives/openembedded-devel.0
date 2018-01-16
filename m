Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC4D71B57
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 06:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E950F20B82;
	Tue, 16 Jan 2018 06:43:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Nbr2zAbuKHhQ; Tue, 16 Jan 2018 06:43:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8C7720B77;
	Tue, 16 Jan 2018 06:43:36 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5576C163266;
	Tue, 16 Jan 2018 01:43:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jan 2018 01:43:35 -0500
Message-Id: <1516085015-89929-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-networking][PATCH] ndisc6: need to set USE_NLS="yes" to use gettext.h
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
X-List-Received-Date: Tue, 16 Jan 2018 06:43:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Otherwise we can get gettext-minimal-native dependency instead, which does not
provide gettext.h header.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index 48a83b8..58f1230 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -22,6 +22,8 @@ EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
 LDFLAGS += "-fuse-ld=gold"
 TOOLCHAIN = "gcc"
 
+USE_NLS = "yes"
+
 do_configure_prepend() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/gettext.h ${S}/include
     ${S}/autogen.sh
-- 
2.7.4


