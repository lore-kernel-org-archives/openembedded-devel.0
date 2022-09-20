Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADE7C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:15:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.7324.1663640149611658335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PfSYGIi8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640147; i=@fujitsu.com;
	bh=TOrCsEDfpetRDM/bY75Fu6Wc+rL+ESZFf60fmAkrqkk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PfSYGIi8/hg6fO9UkYCnasEqNbYiWTxcrlBosFQjcriZDJovEIPSzfdbJCBaYYVlX
	 dLRkA5hPa1S03gbj0SjPrQnR1VnlIvtBMSWI5PsCRzR8oogmguAGk+5UrYnUuaRR8d
	 lu88nC7ZwPLk43LOjWfkMGqv0JAM7QLMQAnjGRYNtfcAHqKnC52fB9g8hcoDFM13n3
	 asHVL4r9nTOaOxjpKMB3fAICqY2zjrFPh3+aIBsm+E/4JJVVMT+9qfGqR9AYa9wbRg
	 pSix1GHiGJttkCRczjytxXS8LzE5Vsekw4PYjlWzONdjahATaGH61NnTyWSK4qOaQ8
	 E5b+G4w/FKGkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpBukpJl
  ssHa3nsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHSzVLQwFGxfUZGA+N09i5GLg4hgYeMEh+X
  LGKGcK4wSRx8sxjK2cMosfn+NyCHk4NNQE1i+q0brCC2iIC+xNLZe8DizAIqEi9+97CD2MICd
  hKXr7xlA7FZBFQl5j29wARi8wo4SXx5PgHMlhBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQxRoy
  gx+3IzC4RdIdE4/RBUr5rE1XObmCcw8s9C0j4LSfsCRqZVjDZJRZnpGSW5iZk5uoYGBrqGhqa
  6lma6hpbGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIFhmVKccHAH44p9
  v/QOMUpyMCmJ8nLVaSQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC1F9RMFhIsSk1PrUjLzAHGC
  ExagoNHSYSXTQoozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd4UBaAiAZCijNI8uBGweL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3XA5oCk9mXgncpldARzABHXFDRR3kiJJEhJR
  UA5Nakud6/Zuv40+/jbNQmvciU2qZoN7ueacYWg34jePucjxYWNiw6VvQfdmauM0eihzpty5V
  FzBpdt28uV1ss1/Aspacf1aPHcOvPMv/OH273fNPX2cduVTyZLVLwJlffM/X7zzQG1Lgdy374
  EQtX4eL5fJyQRP8d7sWcdQXOVxTWcthUn/1YfTOZiV+mzdfXnEIntDa3urR6aTzvljL/8eiCI
  ej91aLO2hNmfCn48p5rgv/kjXktsnyqa3o1yywtc19+WGn9aJH78T4/ZveOc/KFXgVNENA8ag
  ZT8mZRapJkl8Xxh/01nipo3JiWvKfZxMWTbl1JafiZnvY54Lkbc++Xn93faXURj4N1q7OI4eV
  WIozEg21mIuKEwG4zv9BUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1663640146!137269!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19332 invoked from network); 20 Sep 2022 02:15:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:15:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 32D741B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:15:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2764C1B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:15:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:15:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] neon: upgrade 0.32.2 -> 0.32.4
Date: Tue, 20 Sep 2022 10:15:31 +0800
Message-ID: <1663640131-27107-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:15:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98875

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/neon/{neon_0.32.2.bb => neon_0.32.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/neon/{neon_0.32.2.bb => neon_0.32.4.bb} (96%)

diff --git a/meta-oe/recipes-support/neon/neon_0.32.2.bb b/meta-oe/recipes-support/neon/neon_0.32.4.bb
similarity index 96%
rename from meta-oe/recipes-support/neon/neon_0.32.2.bb
rename to meta-oe/recipes-support/neon/neon_0.32.4.bb
index 0f4e971982..c16a2c10a7 100644
--- a/meta-oe/recipes-support/neon/neon_0.32.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.32.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "7a25ba2c9223676b9aaec22a585a0ca118127bad71deed0b9ed6cd960fe5c353"
+SRC_URI[sha256sum] = "1bcdaabb63206b5e00c9a8c4b3672168b523b49eb559c5a486e3256463af34fd"
 
 inherit autotools-brokensep binconfig-disabled lib_package pkgconfig ptest
 
-- 
2.25.1


