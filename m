Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E193C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:58:32 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.24446.1660705102170117302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mH19ukDx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705100; i=@fujitsu.com;
	bh=x0MDZfD3ScbIVvvwgAQ/Z4GPDwM/GKlj7zpENpNhilE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mH19ukDxa8jggudPOkADIrZ7A9jBkYlDEDK219SrtQDpEXAze3El+LH2kWbj3/9t4
	 TeAGH2j6oytthtOMU8Ne4bjNoinuGDieONkuVSduxIEIs8obCnUmFuiViUb4Fu7hON
	 Dykpplcff8ccY2PYj/Jvv9pz9VVUUXgxNyithHqewWsT7O9YfySSx1fLLtvKPH4JTW
	 6ZvfZPmF9JJ/F37sfeAmkxo9GU/sZY5SuP91ky0v/qqC5CV4P4CanD2PnAK1DKl8S7
	 Cq36+jvRD1voZ4zxfY/SR6YP/pb61uAfl3cQqh+fa1gvzpQs4Tk/gzIAqOxZdi1h2Q
	 HHkSgPsQJ0rdQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSdc78k+
  SwZbJWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8az2SIFD/kqPpxpYWtg7ODtYuTiEBJ4wijR
  ffkSM4RznUniya81bBDOHkaJcxOWM3YxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgI/EmidCIGEWAVWJXbe3soHYvAJOEvOXNTOB2BICChJTHr4Ha+UUcJb4NnsnG0irEF
  DN3KnmEOWCEidnPmGBmC4hcfDFC2aIVkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6poAWYZ6iVW6iXqppbrlqcUlukBuebFeanGxXnFl
  bnJOil5easkmRmAApxSzpO5g7Ov7qXeIUZKDSUmUt5/pT5IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd5v4UA5waLU9NSKtMwcYDTBpCU4eJREeGUDgNK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy8
  9LlRLnfesDVCQAUpRRmgc3AhbZlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ834HuYQnM68
  EbtMroCOYgI44dvE3yBEliQgpqQam1rhmldXZ5n31vPe8TXP42I5tFtCbcCGnb/5+ZZ1P5hbG
  wucNO/T8LItfnrt1SrNoY3hK42qVpDl/q5N5v7zL3XZXduGTjsTUmwG3vqjGrYqur3OpnyR3b
  ZqsmeGe6lkLlKyeLrmbuyC01KirW9I0l93i6y3pvck11eWC1yJKuqyyVt9fd2ixWXhi5oqDXa
  2pslNNznccFf756c/ykuXekwsUxRUfbVvzuVD98KK6uuiDvlbp642vnT2cPPlMp9HGa2w/pZ3
  nle7/a+uTvadY8Ubq6l+2jpdeJ6bzHdwnzrK26q5uU6HMm0knJvAuSeb5HRwQ0NCr5/0+u+WY
  dOMhp5CNenf1f8wsFLC++EGJpTgj0VCLuag4EQBZ4K3MZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1660705099!22412!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30844 invoked from network); 17 Aug 2022 02:58:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:58:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4C2061000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3EFC5100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:58:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.2.1 -> 2.2.2
Date: Wed, 17 Aug 2022 10:57:40 +0800
Message-ID: <1660705060-17241-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
References: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:58:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98283

Changelog:
==========
- Fix router to restore the 2.1 strict_slashes == False behaviour whereby
  leaf-requests match branch rules and vice versa.
- Fix router to identify invalid rules rather than hang parsing them, and
  to correctly parse / within converter arguments.
- Update subpackage imports in werkzeug.routing to use the import as syntax
  for explicitly re-exporting public attributes.
- Parsing of some invalid header characters is more robust.
- When starting the development server, a warning not to use it in a production
  deployment is always shown.
- LocalProxy.__wrapped__ is always set to the wrapped object when the proxy is
  unbound, fixing an issue in doctest that would cause it to fail.
- Address one ResourceWarning related to the socket used by run_simple.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_2.2.1.bb => python3-werkzeug_2.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.2.1.bb => python3-werkzeug_2.2.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.2.2.bb
index d73235d253..92302f9cd7 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "4d7013ef96fd197d1cdeb03e066c6c5a491ccb44758a5b2b91137319383e5a5a"
+SRC_URI[sha256sum] = "7ea2d48322cc7c0f8b3a215ed73eabd7b5d75d0b50e31ab006286ccff9e00b8f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


