Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F183C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 08:25:25 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web09.33428.1634545523599190291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 01:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1
 header.b=VaecnSig;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81,
 mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1634545523; x=1666081523;
  h=from:to:cc:subject:date:message-id;
  bh=39Wv16ngRB62ShVC2Ayek1akUinusnItujcOlbXl0nE=;
  b=VaecnSigG9m9o+M/213K+Q4g0jkYoBLp6yahOu6Hdck9Q3jUHp3/j7qn
   WGqgf4IpqIa2BOSeBJ9rZjhl2yujQrNc7JTXLs4eEaqeWid7remhuD+ez
   HUjm8QB3LE6rML0jDI2y8e075vOv1O778SwnRMEbGQHBDQIj4R54J1gbR
   bguAbqrTikKS2yvZiEPp4BtFTEKXdBqm6lqsP9yQpHiw8k4CNG9Sj1jx5
   fMEx6rKPgDa7iVMM6PU1bD/8DFyu9rCD1Yl1FozUuNYtlDm3TELBz8Cvk
   Il3tB4bUWmxa31gC1QcyLtjHOsV2AZq1Ra8T89Ah+ZBXatmCzW4Zrqxp+
   Q==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624312800";
   d="scan'208";a="20098973"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Oct 2021 10:25:17 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 18 Oct 2021 10:25:17 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 18 Oct 2021 10:25:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1634545517; x=1666081517;
  h=from:to:cc:subject:date:message-id;
  bh=39Wv16ngRB62ShVC2Ayek1akUinusnItujcOlbXl0nE=;
  b=LjyoZ7suc0ZVoY2cRn8SBPhfWDEW7z0I9KKGcBxYfZxc8OBrAczDyteg
   00CxXXas0NUFX6WPLT1YyUTJ6GEMYJQVHxD1LUOn30XXFTzm3XwOs5BY8
   W4YM+21GSyilSCiwSKSLPsnTiKnDKhJgYJIwr1Lz/JhCFF7wZceHADWPx
   vxs0fo8Nryqsvel0YnrVM+S+YEaLCE98zwQU9erGkIHIIYV2zSUWgrH1C
   459CrVralHQm76gOMyu/uvQdwMQqjW1hB4j5y393vyckrTdHtBDuhJRGj
   BgKfJXU7TeY3W4xi5bMjWNDL6iPYFQjZ/ygOIMC3vXYQPPW2m84UbbCv1
   w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624312800";
   d="scan'208";a="20098972"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Oct 2021 10:25:17 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 730E1280065;
	Mon, 18 Oct 2021 10:25:17 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [meta-oe][PATCH] byacc: switch to official HTTPS mirror
Date: Mon, 18 Oct 2021 10:24:07 +0200
Message-Id: <20211018082407.22125-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 08:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93418

FTP does not always work in corporate networks. Switch to the HTTPS URL
mentioned on the tool's homepage. The same URL is also used by FreeBSD [1].

[1] https://cgit.freebsd.org/ports/tree/devel/byacc/Makefile?id=b128c1dbf3e8fbada5f753631041bf93ac51bf4d

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta-oe/recipes-extended/byacc/byacc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/byacc/byacc.inc b/meta-oe/recipes-extended/byacc/byacc.inc
index cffa7f5dc..a3d9bfdb7 100644
--- a/meta-oe/recipes-extended/byacc/byacc.inc
+++ b/meta-oe/recipes-extended/byacc/byacc.inc
@@ -6,7 +6,7 @@ programming language."
 SECTION = "devel"
 LICENSE = "PD"
 
-SRC_URI = "ftp://ftp.invisible-island.net/byacc/byacc-${PV}.tgz \
+SRC_URI = "https://invisible-mirror.net/archives/byacc/byacc-${PV}.tgz \
            file://byacc-open.patch \
            file://0001-byacc-do-not-reorder-CC-and-CFLAGS.patch"
 
-- 
2.17.1


