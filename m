Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377B2ED7BA9
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15854.1776163197755722549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bFOVnaT1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163200; x=1807699200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hh3KejWvz54knktmyOUUtBv+Tz3+YA90x+LwDD0ModQ=;
  b=bFOVnaT10lyiJ6ez1XAdzlaZosnqXiFulx1VK217MTZKa8ULe6CQlo8K
   ViBnSOPUkGSj4YewxL1X3dh3y1kRDg3toGgQSNic8PHBusYu9pDG14b80
   /CyD9dDGrzfHIP0YNbBAjE5hv4uL9RL+1eP7Y2dzCTOvMqFpKpG8uhZSF
   iWVZa2K21WoRNdConBt2Foe4m7YTflNHe87RZ08v+nAVLmPWsx9cS+UJN
   KhbBwbbHyLWgDdbnOFj2fA8iwJYrhqXBeLKYzVbAeQSo/WlLqSPBsnPlr
   O3OPdft5SDaxTqgApM7FeFPaZDzlDS15B1IA+2EjgYyT/YctBGoIPrSRf
   A==;
X-CSE-ConnectionGUID: +8ssksv1TY+lXBTGDhD0+w==
X-CSE-MsgGUID: 8io1/owSQ6uxXk3VPqRSJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236867039"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236867039"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 14840C0023B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:59 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C30328D65DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 493A614000E2;
	Tue, 14 Apr 2026 10:39:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/32] mpich: upgrade 5.0.0 -> 5.0.1
Date: Tue, 14 Apr 2026 18:38:24 +0800
Message-ID: <20260414103845.1728-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126315

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix bad cast in release-gather collectives that caused data loss
  issues on Big-Endian 64b arches (s390x)
- Fix issue with canceling MPI_ANY_SOURCE receive requests
- Fix configuration issue when C++ compiler does not support complex types
- Fix function signature issue in Hydra PBS support
- Fix crash in MPI_Allreduce with MPI_LOGICAL type
- Fix potential crash in multi-nic libfabric initialization
- Fix memory leaks in Level Zero and PMIx support
- Fix bug in CMA code when GPU support is enabled
- Fix potential shared memory collision between multiple singleton
  processes on the same node
- Add large count and other necessary aliases to ROMIO to avoid
  accidental profiling of internal MPI function usage
- Add missing error checks in rndv and colletive composition code
- Improve autogen.sh error message when autotools are too old

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_5.0.0.bb => mpich_5.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_5.0.0.bb => mpich_5.0.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_5.0.0.bb b/meta-oe/recipes-devtools/mpich/mpich_5.0.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_5.0.0.bb
rename to meta-oe/recipes-devtools/mpich/mpich_5.0.1.bb
index 505fc6f92b..55f6cde82f 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_5.0.0.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_5.0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a296dfb961b957b0e8adf67d8478d3d"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e9350e32224283e95311f22134f36c98e3cd1c665d17fae20a6cc92ed3cffe11"
+SRC_URI[sha256sum] = "8c1832a13ddacf071685069f5fadfd1f2877a29e1a628652892c65211b1f3327"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.43.0


