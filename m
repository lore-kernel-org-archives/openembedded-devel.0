Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3050C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:05:18 +0000 (UTC)
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web10.33619.1704214706523544941
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=cGbMELdh;
 spf=pass (domain: amazon.com, ip: 52.95.48.154, mailfrom: prvs=7248f9d20=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704214707; x=1735750707;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lOrZFblNgH66plxqAxqTlwheEESKUBocv4DQbNti/2w=;
  b=cGbMELdhaK4tUCrahWeOkL+l0R7dp6Hfnvei/rZuV4I6nKTgXTmdtkBv
   PxOnmBT45IJRcK8L0Tow8vOeeK/FgHbk4hqvhpNap374Sg37xZolZ/7+R
   D6VFyv0myMGI1CnlbJDhqTGRS7z8VFPhCbB70uIfEgDCHLLx+tg0kCGKe
   g=;
X-IronPort-AV: E=Sophos;i="6.04,325,1695686400"; 
   d="scan'208";a="379767898"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-1cca8d67.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:58:26 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
	by email-inbound-relay-pdx-2a-m6i4x-1cca8d67.us-west-2.amazon.com (Postfix) with ESMTPS id B103F8076C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:58:24 +0000 (UTC)
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:49335]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.59:2525] with esmtp (Farcaster)
 id 70b32531-db53-4914-8b41-4c1eb1122db9; Tue, 2 Jan 2024 16:58:23 +0000 (UTC)
X-Farcaster-Flow-ID: 70b32531-db53-4914-8b41-4c1eb1122db9
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 16:58:23 +0000
Received: from dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com
 (10.189.195.130) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server id 15.2.1118.40 via Frontend Transport; Tue, 2 Jan 2024 16:58:23 +0000
Received: by dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com (Postfix, from userid 14178300)
	id 1161E60F2; Tue,  2 Jan 2024 16:58:23 +0000 (UTC)
From: "Jordan Crouse" <jorcrous@amazon.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] collectd: Remove rrdtool from DEPENDS
Date: Tue, 2 Jan 2024 16:58:23 +0000
Message-ID: <20240102165823.12306-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 17:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108012

The core collectd tool does not require rrdtool to build. There are some
configurable options that do need rrdtool but they are already properly
adding the dependency in PACKAGECONFIG. This saves building half a dozen
other libraries that wouldn't otherwise be present on a headless or server
style target.

Signed-of-by: Jordan Crouse <jorcrous@amazon.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index bd4a5b3e8..02f1fcb42 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://collectd.org/"
 LICENSE = "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 
-DEPENDS = "rrdtool curl libpcap libxml2 yajl libgcrypt libtool lvm2"
+DEPENDS = "curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
 SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://collectd.init \
-- 
2.40.1


