Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id DB2786010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 21:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD1EC40C06;
	Tue, 10 Dec 2019 21:51:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HOB406Aj0Nsf; Tue, 10 Dec 2019 21:51:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5F1740BC4;
	Tue, 10 Dec 2019 21:51:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 762DE17434E;
	Tue, 10 Dec 2019 16:51:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 16:51:39 -0500
Message-Id: <1576014699-29663-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-networking][PATCH] netperf: add "intervals" and "histogram" PACKAGECONFIGs
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
X-List-Received-Date: Tue, 10 Dec 2019 21:51:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

From https://hewlettpackard.github.io/netperf/doc/netperf.html:

Other optional configure-time settings include --enable-intervals=yes to give
netperf the ability to “pace” its _STREAM tests and --enable-histogram=yes to
have netperf keep a histogram of interesting times.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-networking/recipes-support/netperf/netperf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 8921ea7..f1f62df 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -31,6 +31,8 @@ CFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', \
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
+PACKAGECONFIG[intervals] = "--enable-intervals,--disable-intervals,,"
+PACKAGECONFIG[histogram] = "--enable-histogram,--disable-histogram,,"
 
 # autotools.bbclass attends to include m4 files with path depth <= 2 by
 # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
-- 
2.7.4


