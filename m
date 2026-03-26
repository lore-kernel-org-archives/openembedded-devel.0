Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E2910A1E83
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46400.1774526206205150620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WMPLK5VP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526208; x=1806062208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GMFCCvc9cfoi2zobaZ6lxwluhuFTxy1XM3GDuOiLdXM=;
  b=WMPLK5VPs66jrv3DmIUMRNATKI3rf1dqkcY/TbCmehGOHoK0xfSR+VQM
   S5Ha12dyuTFuZacCdq0SuzgVFehSuY5Bh1d6Nrd6Hy8gksJd1UxMNcEGd
   xRrR+PzbZ2VE/+vvF++a8Wtjrw7xMDRx63jpGSIJdVfIzC2g+xSKztbOh
   Lt0hxP8G4LUCHka8RBlmjEKluszgajWPJSqtXt2YVgwE89u2ygqwdoVoA
   l1SimJiiKwUzxBQ4S7x1oWStn4ONaL9uR07TOG6Jkx2e9f//D0a8MnXPT
   5sOnzsqpsxr5/kfOCMMDzDXktcPClV7XZibVEWVqZOXss5PzEkowENn/J
   A==;
X-CSE-ConnectionGUID: unvjMF2eSjyo0PyRtUsyYw==
X-CSE-MsgGUID: DA6xOpkeQd6LewP3tOzIMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717044"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717044"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:48 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 36270C0022D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:48 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E4D778D29C6
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 93FC21807148;
	Thu, 26 Mar 2026 11:56:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/63] bubblewrap: upgrade 0.11.0 -> 0.11.1
Date: Thu, 26 Mar 2026 19:55:35 +0800
Message-ID: <20260326115634.1199-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125660

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes:
=========
* Reset disposition of 'SIGCHLD', restoring normal subprocess management
  if bwrap was run from a process that was ignoring that signal,
  such as Erlang or volumeicon
* Don't ignore '--userns 0', '--userns2 0' or '--pidns 0' if used
  Note that using a fd number >= 3 for these purposes is still
  preferred, to avoid confusion with the stdin, stdout, stderr
  that will be inherited by the command inside the container.
* Fix grammar in an error message
* Fix a broken link in the documentation

Internal changes:
==================
* Enable user namespaces in Github Actions configuration, fixing a CI
  regression with newer Ubuntu
* Clarify comments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bubblewrap/{bubblewrap_0.11.0.bb => bubblewrap_0.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.11.0.bb => bubblewrap_0.11.1.bb} (90%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.0.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
similarity index 90%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.0.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
index e059d1593b..0db94b40fa 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.0.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcap"
 SRC_URI = " \
     https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
 "
-SRC_URI[sha256sum] = "988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646"
+SRC_URI[sha256sum] = "c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71"
 
 inherit meson bash-completion github-releases manpages pkgconfig
 
-- 
2.43.0


