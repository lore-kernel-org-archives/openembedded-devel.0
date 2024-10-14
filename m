Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B081BCFC50F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.50485.1728896159019919912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=odO+top/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896161; x=1760432161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aR6Mv6I5RyVJOZ/KkgFA4TEzfiLVCjy6UWl3G/wyws8=;
  b=odO+top/N+53YsWlDVvEd/+44lISundJL8HddV/63vz2jCQQqvEIqmg3
   X1k/7S6F5SDFy00uZseGDa8cxyM9bG5V6x3UPJI0jpQE7wpDgbK6SuP9L
   suzTP3TC0l6RN0S6Ogu10lM8A8bkiWW746651MRRGOUWNDe/7UJvGdjSs
   gMJCvMvJoDJenq8sPLNCa07/m5GVGVRUGNWf8bCTZKoKLoW0Eb4Vc4ofH
   JTyAZpSmPkjWsYEYA/yZQOvilnk8HC/55lDug6a2pedRJ26kDHtCD002m
   GnEO5Hv0HAEn1MPtiW9YM/Zcsd/dlLHWAI1gkLlLLKt/HSqBXtwspbLB6
   A==;
X-CSE-ConnectionGUID: NZ2mBFr0Rq+aXAhOWZExyQ==
X-CSE-MsgGUID: fuI5z36WRom6BsfjiJLneg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176739234"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176739234"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 226E3D4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 66CDBBF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC35D20071A00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B42B01A01E9;
	Mon, 14 Oct 2024 16:55:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/54] mpich: upgrade 4.2.2 -> 4.2.3
Date: Mon, 14 Oct 2024 16:54:32 +0800
Message-Id: <1728896115-2944-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.676900-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svLxBc
	ITrB8RYN3RhqobIdSIRp4m7s32pkfOx6sVFArPFq4yhsfWHTXOJoQA0psEk3Xcbl1d1BOPY4ADP
	a8EfcrDO+cKWVQmxRy+avmsUG/UyDPXdZx1sZHpDy3h9RQZ4StNXLiEcLf+DIsrDwfHQQaK2/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IVKDZlLBSf8qysIuzCLc2mNzO8G3kpNly2bKItl61J/yfJvo
	cwUrWp7fCZxiDQ9OQwLbigRnpKlKZx+7GyJjhAUYfKzI27eyOGFWCtEq6JgXNwfSiZjd/lMmmmZ
	GYaJbRoVI2SzFyq5XM4kIN/oNeSaw2WzVUULbfZXm7MGmlAhDnfMsK+nYuKy7H2fVekOqwmYL1K
	ImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112857

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update embedded libfabric to fix a build issue on FreeBSD
- Fix HIP support for use with AMD GPUs
- Fix potential invalid context issue in CUDA memory hooks
- Fix GPU fallback path in ch4/ofi for Intel GPU buffers
- Fix IPC handle destruction with Level Zero API (Intel GPU)
- Fix potential crash in MPI_ISENDRECV with derived datatypes
- Fix bug in persistent MPI_GATHER that incorrectly cached buffer
  contents at init time
- Fix memory allocation bug in ROMIO GPFS driver
- Fix missing error names in ch4/ofi netmod
- Fix potential hang in multi-VCI active message RMA
- Fix bug in ch3 large count support with derived datatypes
- Fix manpage generation to provide aliases for large-count versions
- Fix potential crash in Hydra with long PMI command messages
- Fix bug in exit status capture in Hydra when there are multiple
  processes with non-zero exit
- Fix implementation of C/Fortran status conversion functions
- Fix implementation of MPI_Type_create_f90_xxx functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.2.2.bb => mpich_4.2.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.2.2.bb => mpich_4.2.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.2.2.bb b/meta-oe/recipes-devtools/mpich/mpich_4.2.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_4.2.2.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.2.3.bb
index f9ff07740..941dbf68a 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.2.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.2.3.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7a88f0d96d0d7396a7c66bf353235b62"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "883f5bb3aeabf627cb8492ca02a03b191d09836bbe0f599d8508351179781d41"
+SRC_URI[sha256sum] = "7a019180c51d1738ad9c5d8d452314de65e828ee240bcb2d1f80de9a65be88a8"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.34.1


