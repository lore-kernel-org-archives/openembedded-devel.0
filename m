Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99B6C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 15:54:35 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1879.1686153273881165325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 08:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eKrKNK+U;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686153274;
  x=1717689274;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RMfnlUSSy736GzbdLYpbRvW/bvbqE8EkAe0pua0riLg=;
  b=eKrKNK+UjIcvvwW4yzm9amIEUb613vzBLRmZxXrTrUPI++poHiNn2fhG
   Rjyls78SgZqQEEajHCktON4D1JD4rDuCEeNfiP23gaufIoC0iUkzyPxI8
   Ujd/l6b785OlVwkuGZFZEG2Df5K9aDKNWBQVS1RbAc+3nvDNReLUfo6s9
   05udzv16F0oFGFsl+/do4dCAlFeo686dztyEoAA5FYzJc+Ir0bCZ/BTZ3
   IRfz8YIlSIvAzgFDS/6BOaycjvz07ikToYZ8XCYvSK7OpsXRxKa1THbTY
   7h3lL36Ch+0W//ZjCGtX9nIeRwiJaj5hcWcIV6o9OJb35fCCbpMAH9pX9
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] glog: Correct the packaging of /usr/share/glog/cmake/FindUnwind.cmake
Date: Wed, 7 Jun 2023 17:54:26 +0200
Message-ID: <20230607155426.2994549-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 15:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103179

It belongs in the glog-dev package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/glog/glog_0.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/glog/glog_0.6.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
index 5d12ba693..1c8867f04 100644
--- a/meta-oe/recipes-support/glog/glog_0.6.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
@@ -37,3 +37,5 @@ do_configure:append() {
         sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/config.h
     fi
 }
+
+FILES:${PN}-dev += "${datadir}/${BPN}/cmake"

