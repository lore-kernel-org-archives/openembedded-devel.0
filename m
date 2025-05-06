Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F659C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 17:01:46 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.81552.1746550898347877561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 10:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NNqHizFG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202505061701349c174300e5be0b9da7-_rxyjh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202505061701349c174300e5be0b9da7
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 06 May 2025 19:01:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eIevvsY4tcIIGh7UrfiOgqdlxz108/mzh86SrP2+PcQ=;
 b=NNqHizFGebHToMACrqdwuyeF7+TNhljJF9ALjrN3JbXzma+WE5PWxvD7Iq6BOGmJ7+EoJF
 PKW5unTGms/DkqvrEDoscCsb9sfcwZ7xFjOlscnDHTPdjkBvJWkmrdOf/zh5BwTFMPFH+V2B
 bNVtbjH6xKeFywrE80vzE78Zix6Bm2Sy+xhOoznK2lzxvwoNhtgW2nHogcWTFWumIUHZsOn7
 75YzvDkNQ7lOZILOe3lSQewWnIWxMG1d2eLtaY8RudTNbc0CXEyHX8S95F+9zIo6BM6QwNhy
 SJ5/UEbaEt/0cNGjMjTbxr3NyGBzrwpyilkq5/wOM64ND7JIdKP8WyHg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] libmodbus: ignore CVE-2023-26793 and CVE-2024-34244
Date: Tue,  6 May 2025 19:00:44 +0200
Message-Id: <20250506170044.4101186-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 17:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117354

From: Peter Marko <peter.marko@siemens.com>

See discussions in closed/rejected issues linked from NVD CVE reports:
* CVE-2023-26793: https://github.com/stephane/libmodbus/issues/683#issuecomment-2615601890
* CVE-2024-34244: https://github.com/stephane/libmodbus/issues/743#issuecomment-2222214256

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
index c8e1c3a3e2..853abced29 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
@@ -21,3 +21,6 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[test] = "--enable-tests,--disable-tests,,"
+
+CVE_STATUS[CVE-2023-26793] = "disputed: The buffer overflow concerns unit-test-client and it's intentional."
+CVE_STATUS[CVE-2024-34244] = "disputed: This issue is invalid and only found a bug in the fuzzing driver"

