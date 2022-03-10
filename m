Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBC0C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 15:19:30 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.10631.1646925568617421654
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 07:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bDvp55rb;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646925569;
  x=1678461569;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RWfhsi1R200/6bBxUxcbA/ggR4W5tEGvTOHl5vZ212Q=;
  b=bDvp55rbsCNSh3TiFRTkoV6PM0OlaIvaDcSv9Ex5g/2UzkiLRYfjtBBe
   +/Ahti+zWOrbmbep4OMNhjFeL1vrXwZE5I9Gh+A2G9zJz4hVlLG7UiyY5
   ap0nkmvFQclZG3YU/PnzNvLfUbBm0Kn+qwZsp3ZDptIKPTcxIsUFXe59F
   6FShI+BpH648TTTQjZiEpIagJNHl/cD4XxyYTgh/AIjHDRhzB69vZIX8c
   GMK26nH5jJRlHBkfkTV8HC+kGgDCu8aMJRwhhj5H9LAOBunGgDMrr9aad
   AL/uG6XWL+TXqfdyy1ybAMaE9iroY3LBPmdqQIXSvnSkfWRyiZk0EUrpn
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] net-snmp: Avoid running `make clean` as it
 may fail
Date: Thu, 10 Mar 2022 16:19:24 +0100
Message-ID: <20220310151924.14089-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 15:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95933

Rebuilding net-snmp may cause autotools_preconfigure() to run `make
clean`, which in turn can cause `configure`to be run. However, since
CACHED_CONFIGUREVARS is not set under those circumstances, `configure`
will run with an incorrect configuration and the build will fail with:

  checking for /etc/printcap... configure: error: cannot check for
  file existence when cross compiling

Avoid the problem by setting CLEANBROKEN = "1".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index b0c5bbdac..5f887b886 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -40,6 +40,7 @@ EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${B
 
 PARALLEL_MAKE = ""
 CCACHE = ""
+CLEANBROKEN = "1"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 

