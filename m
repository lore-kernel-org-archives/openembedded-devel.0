Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2ACC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 10:46:53 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.12223.1674038804954968482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jan 2023 02:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=REke+sBH;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674038805;
  x=1705574805;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s8X428Y3yzvWjgHtGTNScDvMK1JdUomhbrzoTcOjLS8=;
  b=REke+sBH37IlcOx8cZgRQs2Xljpx882KfxuW4gHPwylF6H8hyG57PrHR
   f7BIorwKdBkU5pux5o/6jW/erde0eTzJA9oYbKCAqLBUDpjhgtkF/8aP8
   Y5PW+D4Z/Lqs5rtIc1f9NcboMAhA9j6Szxp2NgRQAkQKaNCUDLHpoyTbP
   DRp/FqClQ7LQjOO0Hq8CBeG2t6j8DpD5qJS/W3ymLY9dMaipE5mINi9L/
   rvGa2z+wSP1D5Bco6YjL90crSj5haBBhPbRO9x7oaBjhe/mY9iMVNyjU1
   Erxl4QraA0D4UsWpzhNNCTk4DwmBT2v7S2PP4zUzybj5O/e8RI9X9bYjQ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: [langdale][kirkstone][meta-networking][PATCH] kernel_add_regdb: Change the task order
Date: Wed, 18 Jan 2023 11:46:36 +0100
Message-ID: <20230118104636.2605955-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 10:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100650

From: Hermes Zhang <chenhuiz@axis.com>

The kernel_add_regdb should run before do_compile to make it take
effect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/classes/kernel_wireless_regdb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
index 1238172bd..9ad566c83 100644
--- a/meta-networking/classes/kernel_wireless_regdb.bbclass
+++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
@@ -17,4 +17,4 @@ do_kernel_add_regdb() {
     cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
 }
 do_kernel_add_regdb[dirs] = "${S}"
-addtask kernel_add_regdb before do_build after do_configure
+addtask kernel_add_regdb before do_compile after do_configure

