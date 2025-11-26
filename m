Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A256D10386
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 07:10:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8055.1764141008135041045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 23:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PWhPHERD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764141008; x=1795677008;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8/hlRMjaKHMCN9PD1ITGkt5nPtS2UZeR5LQE5WvuWwI=;
  b=PWhPHERDhI+8nEevLR4/CxbEUNBYgwVpsYveBgeqxttqrbbrcrLahnfT
   x0A0Gzg8b6oc/xcosY9oOgMF+PzVimekQQi8x3KPsHnX+SFkqFwKO8kvc
   86gxRncImGOzQ7KXuBt+vqJUbauityxdbRg2afvWMkmD88Dsz1Kj9ha5R
   47GHiylmBBBfHjxvrVoj9s9+bXCEnSDi2/SkG6jX6nvxTqH4UVggdnJpE
   Wv420icYm33RKcKhfDRZ5eNm0MlqVlcqPrV2Er2r4tkXt8XsUV2xqwKTt
   G2ebckYNsixKZPG9RpDkBrh7Z26xZ2Y9KH8t/K33cNPRGctuCAuXrq8rx
   w==;
X-CSE-ConnectionGUID: KZIHbj1MSra/Uwi4sbSQsw==
X-CSE-MsgGUID: almuX5T7TP2nbK44BzVoiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="224279906"
X-IronPort-AV: E=Sophos;i="6.20,227,1758553200"; 
   d="scan'208";a="224279906"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:10:06 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 6B2B5820701
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:10:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 29BB28D2068
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:10:06 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2E2F51403DC3
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:10:03 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-perl][PATCH] rasdaemon: upgrade 0.8.3 -> 0.8.4
Date: Wed, 26 Nov 2025 15:09:59 +0800
Message-ID: <20251126070959.4885-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122071

1.Changelog:
https://github.com/mchehab/rasdaemon/commit/5a1efb8f324498df8cbaaa5adff0e9db96f648a9

2.Remove 0001-rasdaemon-fix-post-processing-options.patch as it was merged upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...asdaemon-fix-post-processing-options.patch | 83 -------------------
 ...{rasdaemon_0.8.3.bb => rasdaemon_0.8.4.bb} |  7 +-
 2 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.8.3.bb => rasdaemon_0.8.4.bb} (93%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch
deleted file mode 100644
index d999f288dc..0000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 64bc04705ea8606eed1b1e810904cc8296e99472 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Sat, 2 Aug 2025 15:43:11 +0800
-Subject: [PATCH] rasdaemon: fix post-processing options
-
-Some post-processing options require an argument, otherwise a segfault
-will occur:
-
-root@qemux86-64:~# rasdaemon  -p --status --ipid
-Segmentation fault    (core dumped) rasdaemon -p --status --ipid
-
-According to the specification of argp, when an option requires an
-argument, we should use the 'arg' parameter, which points to the
-argument string for that option. Therefore we set char* arg for these
-options in struct argp_option and use it in parse_opt_offline function
-instead of state->argv[state->next].
-
-Fix #220
-
-Upstream-Status: Backport
-[https://github.com/mchehab/rasdaemon/commit/64bc04705ea8606eed1b1e810904cc8296e99472]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
----
- rasdaemon.c | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/rasdaemon.c b/rasdaemon.c
-index be5c390..9368b12 100644
---- a/rasdaemon.c
-+++ b/rasdaemon.c
-@@ -98,22 +98,22 @@ static error_t parse_opt_offline(int key, char *arg,
- 		event.smca = true;
- 		break;
- 	case MODEL:
--		event.model = strtoul(state->argv[state->next], NULL, 0);
-+		event.model = strtoul(arg, NULL, 0);
- 		break;
- 	case FAMILY:
--		event.family = strtoul(state->argv[state->next], NULL, 0);
-+		event.family = strtoul(arg, NULL, 0);
- 		break;
- 	case BANK_NUM:
--		event.bank = atoi(state->argv[state->next]);
-+		event.bank = atoi(arg);
- 		break;
- 	case IPID_REG:
--		event.ipid = strtoull(state->argv[state->next], NULL, 0);
-+		event.ipid = strtoull(arg, NULL, 0);
- 		break;
- 	case STATUS_REG:
--		event.status = strtoull(state->argv[state->next], NULL, 0);
-+		event.status = strtoull(arg, NULL, 0);
- 		break;
- 	case SYNDROME_REG:
--		event.synd = strtoull(state->argv[state->next], NULL, 0);
-+		event.synd = strtoull(arg, NULL, 0);
- 		break;
- 	default:
- 		return ARGP_ERR_UNKNOWN;
-@@ -146,12 +146,12 @@ int main(int argc, char *argv[])
- #ifdef HAVE_MCE
- 	const struct argp_option offline_options[] = {
- 		{"smca", SMCA, 0, 0, "AMD SMCA Error Decoding"},
--		{"model", MODEL, 0, 0, "CPU Model"},
--		{"family", FAMILY, 0, 0, "CPU Family"},
--		{"bank", BANK_NUM, 0, 0, "Bank Number"},
--		{"ipid", IPID_REG, 0, 0, "IPID Register (for SMCA systems only)"},
--		{"status", STATUS_REG, 0, 0, "Status Register"},
--		{"synd", SYNDROME_REG, 0, 0, "Syndrome Register"},
-+		{"model", MODEL, "MODEL", 0, "CPU Model"},
-+		{"family", FAMILY, "FAMILY", 0, "CPU Family"},
-+		{"bank", BANK_NUM, "BANK_NUM", 0, "Bank Number"},
-+		{"ipid", IPID_REG, "IPID_REG", 0, "IPID Register (for SMCA systems only)"},
-+		{"status", STATUS_REG, "STATUS_REG", 0, "Status Register"},
-+		{"synd", SYNDROME_REG, "SYNDROME_REG", 0, "Syndrome Register"},
- 		{0, 0, 0, 0, 0, 0},
- 	};
- 
--- 
-2.43.0
-
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.4.bb
similarity index 93%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.4.bb
index 2cc2a26acb..0024729a91 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.4.bb
@@ -4,14 +4,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
 SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
-           file://0001-rasdaemon-fix-post-processing-options.patch \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "db0870edd2919f4f4d0101843136bcae92ab0743"
+SRCREV = "5a1efb8f324498df8cbaaa5adff0e9db96f648a9"
 
-
-DEPENDS = "libtraceevent"
+DEPENDS = "libtraceevent pciutils"
 RDEPENDS:${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
 	perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite-perl"
 
@@ -41,6 +39,7 @@ do_install:append() {
 
 FILES:${PN} += "${sbindir}/rasdaemon \
 		${sysconfdir}/init.d \
+		${datadir} \
 		${systemd_unitdir}/system/rasdaemon.service"
 
 SYSTEMD_SERVICE:${PN} = "rasdaemon.service"
-- 
2.43.0


