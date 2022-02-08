Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7EBC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:47:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.12836.1644335261007354080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=I/f2sk8v;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644335261;
  x=1675871261;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DJua6tgsNwp5batm4eK6ZEUpvooKM7mUStS7C+MOStI=;
  b=I/f2sk8vXc0VD5u3nQ8m4nNHePGGiEKkZGSTUqrgOH9u4DXBoapc3KpD
   mTmwMKuya2dTlsWNPotuRkRKrrCEmwJ6k/FbS3DQq7/oG+GdcAaKc0E12
   qb9NykKkjifcRK+BHjeuFG8g5Wk/zRSV3dfXsnI7+s9MWZrLooOR0EPlF
   Sxy2f3QEUqUu7loIkzShgOZmdGW2GoLpuNfSfUgH0Go5w7AmXiSgEq+5U
   e5IQp9y/jzOhWOeEroH+WqM400cdc1bIkRObpOi4f4ftmODfURFEwzl0l
   8frh018DbSI3XdN/hNfckLSpUjFw3KZuJ1IpteTAfRpfUWN5fYbPpbnlE
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [honister][PATCH] insane.bbclass: Correct
 package_qa_check_empty_dirs()
Date: Tue, 8 Feb 2022 16:47:31 +0100
Message-ID: <20220208154731.10107-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 15:47:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95264

The oe.qa.add_message() method is not available in Honister, use
package_qa_add_message() instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bfaf2577d0..2c8f5338e5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -945,7 +945,7 @@ def package_qa_check_empty_dirs(pkg, d, messages):
             recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
                               "but it is expected to be empty")
             msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
-            oe.qa.add_message(messages, "empty-dirs", msg)
+            package_qa_add_message(messages, "empty-dirs", msg)
 
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):

