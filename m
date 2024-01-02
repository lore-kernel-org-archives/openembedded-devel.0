Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B11C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:32:59 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
 by mx.groups.io with SMTP id smtpd.web10.34559.1704216778139959955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 09:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=bpqFThBE;
 spf=pass (domain: amazon.com, ip: 207.171.184.29, mailfrom: prvs=7248f9d20=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704216778; x=1735752778;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cEYGmhdZyIx1ietDXEyjq02KFrhMtsAPJs5sexWngXE=;
  b=bpqFThBEAmXUXmFVi+CF6A6GSKQ34iowOsmdjb/Z2AIuTXCkgaXZ8soT
   1JTDNa7vYadpDlG8uhfrgwN8YFgS0f08GAK8LmWdbC1KiKTiEJojM7MX0
   F7fwNHUr5jcyCPOmHrgCoAh/pM0pyvoW/uVE969H7N39js/A/I+axZEK2
   w=;
X-IronPort-AV: E=Sophos;i="6.04,325,1695686400"; 
   d="scan'208";a="387029590"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-d2040ec1.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 17:32:58 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
	by email-inbound-relay-pdx-2c-m6i4x-d2040ec1.us-west-2.amazon.com (Postfix) with ESMTPS id 87FB540D88
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 17:32:57 +0000 (UTC)
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:57287]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.87:2525] with esmtp (Farcaster)
 id 74c04d76-fe6b-4f49-9c04-7bc9ad940c77; Tue, 2 Jan 2024 17:32:57 +0000 (UTC)
X-Farcaster-Flow-ID: 74c04d76-fe6b-4f49-9c04-7bc9ad940c77
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.145) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 17:32:57 +0000
Received: from dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com
 (10.189.195.130) by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP
 Server id 15.2.1118.40 via Frontend Transport; Tue, 2 Jan 2024 17:32:57 +0000
Received: by dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com (Postfix, from userid 14178300)
	id F13B160F2; Tue,  2 Jan 2024 17:32:56 +0000 (UTC)
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] keepalived: Move the sample configuration files to a separate package
Date: Tue, 2 Jan 2024 17:32:56 +0000
Message-ID: <20240102173256.46404-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 17:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108013

By default keepalived installs a bunch of sample configurations to
/etc/keepalived/samples. These are good demonstrations but will almost
certainly not apply to any real world situation.

Move the sample files to a separate package.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---
 .../recipes-daemons/keepalived/keepalived_2.2.8.bb            | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
index dd193b12f..85f4a6aa5 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
@@ -41,7 +41,11 @@ do_install:append() {
     fi
 }
 
+PACKAGE_BEFORE_PN = "${PN}-samples"
+
 FILES:${PN} += "${datadir}/snmp/mibs/KEEPALIVED-MIB.txt"
 
+FILES:${PN}-samples = "${sysconfdir}/keepalived/samples ${sysconfdir}/keepalived/keepalived.conf.sample"
+
 SYSTEMD_SERVICE:${PN} = "keepalived.service"
 SYSTEMD_AUTO_ENABLE ?= "disable"
-- 
2.40.1


