Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196B910A1E9A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46410.1774526226736510048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jzjgIG4/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526230; x=1806062230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nuU7fgRtfTmodpcgF7SkMU0hqqIxLCfkNuPdDIiemYk=;
  b=jzjgIG4/+AHhEoaUAF3skNgs3jwVOLiDX3xlMZ+/+yOj3O5kimvHSxk2
   8/dNvFT7bzK1yi4CPuZH7U59UqZbWLFjuxl6fiq3lAUWqhZYxjKAikxaR
   lHf9aDE0c/6gaA668Rv5HelAWGe7ZekNy+r+Hr0iR8DTnWYaJG3jAFgl1
   xfSln3SDCAXAhfCQgVk6Ay5pD+fGE3fV3+WIOBt0VFUNZWtEy2P/RXugX
   C5rwtgdInN4tfILI+26dn6TPeuobGNca6qaDzPLO0Ix+QbOI3zJCKolQ9
   gLB3KqKAJ3DizTYdps/qie+1rDqvdw09pgDc0D8fWCE10qjh92qoJQjZp
   A==;
X-CSE-ConnectionGUID: M/ciR6xhRE28IPOzbU711g==
X-CSE-MsgGUID: S/4ROtQbS2aW1gETTiiO8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718845"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718845"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:10 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C94791C1C702
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:09 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 814A2181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 25FAA1807149;
	Thu, 26 Mar 2026 11:57:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 18/63] libdaq: upgrade 3.0.25 -> 3.0.27
Date: Thu, 26 Mar 2026 19:55:48 +0800
Message-ID: <20260326115634.1199-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125673

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- libdaq: add a ChangeLog.md file to track changes
- pcap: add basic rewind feature upon reaching EOF (excluding stdin and pcapng)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.25.bb => libdaq_3.0.27.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.25.bb => libdaq_3.0.27.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.25.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.27.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.25.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.27.bb
index b999f385a6..fb45ad74b3 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.25.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.27.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "7baba902b3fee7a81be663bfb71418402411c24a"
+SRCREV = "959b13d76aa3409acadfe22d1c30864698a297a7"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.0


