Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A387CEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 21:55:54 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.45309.1688421347323860318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jul 2023 14:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XBZhqHIJ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1688421347;
  x=1719957347;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=otHxE3nUUEoEnMRZWcZkwq9EADkLA9O7+M6paQNfuJU=;
  b=XBZhqHIJXz10EIVY3JuSTg/vlhgERIoENfTtdrA1AOBNk0ZChnRBqShP
   Ea9ewVLGKBvvPDwlewjlPA7pYo1xeIpUvSZzlok4qIMHmHbH4EbUh7ThB
   O7JamMEH7XNLuZgWfA5LVq6YwZKxtSAipvU5jvE6fg2iXp68oHEBrkLBi
   cxCBpfTOfjOQQdojkovklXl1JBoZp86RhEEEt3SjWqBpj5a8CpzgQ91M4
   jVOW8/+cGfHx6DhY9OxmL1Lv0/6tAsRn5+qxy+wlbTs7uz5S8fDdl3zia
   8nOzNphGR/PDbZQ0FosvRc3SN2jVTTyIR0EVtxZ764FjwXjWxyFgcr1bq
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cppzmq: Move the version to the recipe file name
Date: Mon, 3 Jul 2023 23:55:41 +0200
Message-ID: <20230703215541.326439-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jul 2023 21:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103652

This allows a versioned bbappend to be used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../zeromq/{cppzmq_git.bb => cppzmq_4.10.0.bb}                   | 1 -
 1 file changed, 1 deletion(-)
 rename meta-oe/recipes-connectivity/zeromq/{cppzmq_git.bb => cppzmq_4.10.0.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
rename to meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
index 0e1ad9af5..948d312bd 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
 SRCREV = "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
-PV = "4.10.0"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master;protocol=https"
 

