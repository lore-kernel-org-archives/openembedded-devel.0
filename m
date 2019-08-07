Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id A6E0C7F325
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=774; q=dns/txt; s=iport;
	t=1565181062; x=1566390662;
	h=from:to:cc:subject:date:message-id;
	bh=uTEGmr5yGtRw0dvJq7VwKVN7wyX8+AtwrM05BompMVQ=;
	b=gVqBY9YL+qlbboerO9n/X0o6NGzy1UjSakgdKUqqnPF/fx5iT+gfug60
	NTic2ovFoVG82ZRDDSBjdGcqU8SDVEe0i3NUIAzoOw9yh4Ks8z8R9VKe1
	nU6VTDoP5WAlMkuBpjLXAqK6BAl1lWFxifZfiGqsWicQCAgLf2Nab1GfB U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BZAAA+wkpd/xbLJq1lHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUwcBAQsBg1YgEiqMOmChZYF7CQEBAQ4vAQGEP4J3NAkOAQMBAQEEAQE?=
	=?us-ascii?q?CAQEGbYUzhkqBUYMiggusHIVJgziBSRSBIAGHCoRwgUA/hGGBBAGEDIUWBJV?=
	=?us-ascii?q?NlV8Jgh6UIgIZmDABpWmBUDiBWDMaCBsVgyeCWo4vPAMwjyQBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="15124400"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	07 Aug 2019 12:23:52 +0000
Received: from localhost ([10.63.15.140])
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id x77CNpYl021610;
	Wed, 7 Aug 2019 12:23:52 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 15:23:51 +0300
Message-Id: <1565180631-2492-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.140, [10.63.15.140]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] kpatch: fix QA build errors for nativesdk
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
X-List-Received-Date: Wed, 07 Aug 2019 12:31:01 -0000

This patch fixes next QA Issue:
nativesdk-kpatch: Files/directories were installed but not shipped in any package:
  /etc
  /etc/init
  /etc/init/kpatch.conf

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index cd819f3..ae753bd 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -15,6 +15,7 @@ EXTRA_OEMAKE = " \
 	LIBDIR=${D}${libdir} \
 	MANDIR=${D}${mandir}/man1 \
 	SYSTEMDDIR=${D}${systemd_system_unitdir} \
+	UPSTARTDIR=${D}${sysconfdir}/init \
 	DESTDIR=${D} \
 	BUILDMOD=no \
 	CC='${CC}' \
-- 
1.9.1


