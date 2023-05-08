Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FA5C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:08:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.103657.1683540490583202077
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Kxys8lZd;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540489; i=@fujitsu.com;
	bh=pQr557Kc69/ptgRhSXKrQ8XVpMVTq7LCpJKjJV2Q23E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=Kxys8lZd7YyZTNBPx4oYlzwkrAXv62N0aX+iwpk/C4ancfLOGc0EOoTgpkeoI8gLW
	 rg4oA5BE3oPE0nBRYL0FfLNDNwKYfvj1f7uKZm4B7R4Vrz7tEsSbRwe2DRGhxABaxt
	 Yhaw7kmLxznnmj2IAh2mk0KpKz6c91Aru/8EIc4ueEyR/1pMBJKb9tbABbem67ELaM
	 fdMUXAzsxblMCutyLwrZJJdHWVbGxoCEE+mRSoR9Gf6yXuPUywHbSL6ZnM9JQMrBhz
	 e+G9bY+X6A04xiAstfQ8rQ+J2cBIfxdnrC3t+TgJKFr38ku33p4SvsdHLj8WIDDabz
	 eCzmMohgHhiGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpMtxKiL
  FYOJRDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePk/SaWgsWcFbfPzWNqYFzB0cXIxSEksJFR
  4tjxyWwQzjQmicNrJ7F3MXJysAlISEzfexLMFhHQlfj4YS4jiM0soCIxY/IRpi5GDg5hAQeJm
  W/qQMIsAqoSW490s4DYvAJOEovfHmUCsSUEFCSmPHzPDFLOKeAscXuBAEhYCKik8+RxqBI1ia
  vnNjFPYORZwMiwitGsOLWoLLVI19BIL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W
  4WK+4Mjc5J0UvL7VkEyMwIFKKFbt2MB7Y9VfvEKMkB5OSKK/pwbAUIb6k/JTKjMTijPii0pzU
  4kOMMhwcShK8bdsiUoQEi1LTUyvSMnOAwQmTluDgURLhlT0ClOYtLkjMLc5Mh0idYlSUEucVO
  QGUEABJZJTmwbXBIuISo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHezSBTeDLzSuCmvwJazA
  S02P9yOMjikkSElFQDk+uB3eoVm5eva//90ltz7ua3bvt0lgtxdV/vuZNY+ly67eoPgZ1Gn0L
  Cju50Kfi+XczNlP/YvcWXvNavaF2XwF9Y8dNRImkZ9/v5VyOfz/xtJ2/aVSO0at2z6cH/atMf
  Ke+R7DRZeOPwZSbbjUs/PF3Qo9YWcHXzV8+bK04+rW7f67Ol5Py5A2VrhGb8tolRXq+3+m7KL
  p24T3Y5xhLmkumlfKdX/Y+6pSf0PDJlQhlT7p99qzj9A82Ush0WMnyesj9t8oqQm73Cxtm1Fq
  0lXhu+qXxYP7HpliTvI57l83e5KxjU9MroJnn58C1Q0y1c0FzZnjX3m762z3TrrAOM7UEVTGJ
  y9TVmv9gC/XMPKLEUZyQaajEXFScCAAONJh4DAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1683540488!181438!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4036 invoked from network); 8 May 2023 10:08:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:08:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 61DF41D5;
	Mon,  8 May 2023 11:08:08 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8184C1D4;
	Mon,  8 May 2023 11:08:07 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe]  [meta-oe] [PATCH] log4cpp: upgrade 1.1.3 -> 1.1.4
Date: Mon,  8 May 2023 18:07:51 +0800
Message-Id: <1683540471-25268-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
References: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102399

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../log4cpp/{log4cpp_1.1.3.bb => log4cpp_1.1.4.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/log4cpp/{log4cpp_1.1.3.bb => log4cpp_1.1.4.bb} (80%)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
similarity index 80%
rename from meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
rename to meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
index 8e6d455174..729857eb62 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
            file://fix-pc.patch;striplevel=2 \
           "
-SRC_URI[md5sum] = "b9e2cee932da987212f2c74b767b4d8b"
-SRC_URI[sha256sum] = "2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d"
+SRC_URI[sha256sum] = "696113659e426540625274a8b251052cc04306d8ee5c42a0c7639f39ca90c9d6"
 
 S = "${WORKDIR}/${BPN}"
 
-- 
2.34.1


