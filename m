Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7676CC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 09:59:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.103417.1683539973747659716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 02:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nYkt91fB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683539972; i=@fujitsu.com;
	bh=pdanBWI7xHtM905gjt/DLs6Tj5PUbM+xAuEh9Y/zrNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=nYkt91fBpe854YWLXU57Pd0tpSTh9R/afvGEIQeOiofqCzWqqTOx83K9buzbrCycx
	 lVP+1y3cxBiKMcbH1WUCTFFUaQrpNw45Mk54P6GF65IWq7175n322n8Q8yLEu/H0ph
	 NdcLgSZF7KfZYgNdWWDNDtTv3YuWYaQR0sIfNBu5POwEGzqA6XHSkcH8xNNETelvNO
	 6Ffa8V/nf24wro24VNZ3UEMh8WKzZ32nbR5m9lqrcBgZYognKZHgoBxo1kn+Qw5k6A
	 YKHrOmP6RVQqmmcbAEsintV52v3a0CAY6lU0c/Z6iPT70fNPL6cSKM7AVkcNecN28b
	 JTP9x+PPzelIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpMt8IiL
  F4NQkBYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN/xj7WghOcFb+XL2VtYDzK0cXIxSEksJFR
  YuudmawQzjQmidPL9jB3MXJysAmoSUy/dYMVxBYR0JX4+GEuI4jNLKAiMWPyESYQW1jAWuLpk
  xtsIDaLgKrEzzlnwGxeASeJCdcfgdVICChITHn4Hmwmp4CzxKrLp8FqhIBqNv35yA5RoyZx9d
  wm5gmMPAsYGVYxmhWnFpWlFukaGeglFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhf
  rFVfmJuek6OWllmxiBAZFSjHbtR2Mz3b+1TvEKMnBpCTKa3owLEWILyk/pTIjsTgjvqg0J7X4
  EKMMB4eSBG/btogUIcGi1PTUirTMHGCAwqQlOHiURHhljwCleYsLEnOLM9MhUqcYFaXEeUuPA
  yUEQBIZpXlwbbCouMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcaZDxPZl4J3PRXQIuZgB
  b7Xw4HWVySiJCSamBK8/jyKM9sg7Kt3ifjdSu/v5wb0pL7/8Hy5eZcfp03NxaKiwYybM2SnCB
  3fnJxRkXI2n9qv49yzOuTep+dGNzZsms2296P4fO5LafILdDQtIv+Pf+9pHwnA/PJLbcTe2+d
  8Naf8yvvYwnz/PtFVnNF7xlWV860EmjcKNUrr/hc1+DeRINZ+2/N/h6yK3Hupr/y994G5WhOk
  Tzu/8d35lOvoFfWL4q4FudFyQf/2z7fhTHjiYWkwrSCOBlDeeE7f2xNf9r4qGR3dRckCr76fK
  p2XkGPb+8cr5krXpx4JS90aOYb+xZbkZ1TZh78cfPA+m+b+2fqxn00iyzLS6h5LXX573O7e5W
  e7csUGC/F/5mrxFKckWioxVxUnAgA9k8uPwUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1683539971!423912!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24308 invoked from network); 8 May 2023 09:59:31 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 09:59:31 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 27B531D2;
	Mon,  8 May 2023 10:59:31 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4B2F11C2;
	Mon,  8 May 2023 10:59:30 +0100 (BST)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] audit: upgrade 3.1 -> 3.1.1
Date: Mon,  8 May 2023 17:59:15 +0800
Message-Id: <1683539957-25094-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
References: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102382

Changelog:
=========
- Add user friendly keywords for signals to auditctl
- In ausearch, parse up URINGOP and DM_CTRL records
- Harden auparse to better handle corrupt logs
- Fix a CFLAGS propogation problem in the common directory
- Move the audispd af_unix plugin to a standalone program

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-security/audit/{audit_3.1.bb => audit_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.1.bb => audit_3.1.1.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.1.bb b/meta-oe/recipes-security/audit/audit_3.1.1.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.1.bb
rename to meta-oe/recipes-security/audit/audit_3.1.1.bb
index 8bd81791ed..7ed2fd2dec 100644
--- a/meta-oe/recipes-security/audit/audit_3.1.bb
+++ b/meta-oe/recipes-security/audit/audit_3.1.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "81c813fc4ebb11bf1eca8b8bdb5b253dff31e68e"
+SRCREV = "6e367585a899231da05797c6126f8bb01febb2f5"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.34.1


