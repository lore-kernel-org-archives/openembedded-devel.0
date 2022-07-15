Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA4FC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:00:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.2763.1657857596639179935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 20:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KWBBpTrD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657857596; i=@fujitsu.com;
	bh=K9kp0U7hBXTRgBV7KBnt92JiFe/vYoLqkEiIWNKKtrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KWBBpTrDkAdH8gRk2LBWy24xzisumaLPitd8QZNx2DLYlnGupJTQMmQ/enjrSyNlS
	 R1+OLEhHha1rw79wITEzu7uBkWPZlQX7Vw5JBgoGPYwLdNZD1OPLfNnbZsDfiHG6yD
	 QBrt4UOcl5ogBFlPBS3egG7j+mic+FzUFes7azBxlnAS2TlyNFTMS0HFzAQecpKG4Y
	 IYYpEB9Th5R54uY6j01TBCPiatYK8YA6twNezKS5RWbAeYBh1veritaYQAF9HXgULJ
	 FgbNX86PkIrQhjH8gfIMUlWZoclQgAITIkhQ3BTE++Jn+vrvCxjPn8OC5kQRTYB4OD
	 aWypeVeWvJSjA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORpGv97EK
  SwZx+AYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePwqn6mgv8cFTe+zGJuYFzK0cXIxSEk8JBR
  omnvXlYI5wqTxP8DN5kgnJOMEkt+vmXuYuTkYBNQl3h88zUjiC0ioC+xdPYesDizgKpE98U17
  CC2sICPxLaDO8HiLEDxns0dYHFeAXeJWxc2sIHYEgIKElMevger4RTwkLizqhesRgioZteydh
  aIekGJkzOfsEDMl5A4+OIFM0SvksSJFR+ZIOwKideHL0HF1SSuntvEPIFRcBaS9llI2hcwMq1
  itE0qykzPKMlNzMzRNTQw0DU0NIXQluZ6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgcGcUpxydAfjsX2/9A4xSnIwKYnyHsq/kCTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  vfYY6CcYFFqempFWmYOMLJg0hIcPEoivE4PgdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlR
  LnLQEpEgApyijNgxsBi/JLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5l4BcwpOZVwK36RX
  QEUxARzz0BTuiJBEhJdXA5CtUfOSLa8AX6wt3OU49i22rc2qrS2ZtubJHoNnbSE9h7qbcnTo8
  862WGb67fPvxTcuFCqery8/0pVeIL8nLEJJjvB1i3GFlHcvQYatYURW21FNqVXdDzv9vR8yyD
  n009UjY8jXj4af/PDvbbt6Zqb6rUCTAxWPqjKDGpdPMHr54nnkvkzOx21TrC79ya8njtL1PhV
  xuxOXOidfaPy15qnmxXvzMs9w5vUVhU+5Ur7mQ6CiowFAX6rPU9cqle8F1uyZsmVX3We7wacX
  foZX/KuPnGJa4vt0v3PpGVUK+VpJ/vvXv/ZlcLm72X2efcUwWeZ9x5+eql3bfb/yd5aQlt65w
  5a6TAjfev+6aO0lAiaU4I9FQi7moOBEA2zDelm0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-732.messagelabs.com!1657857594!323764!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31621 invoked from network); 15 Jul 2022 03:59:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 03:59:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AB5BD1AD
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9F01B1AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:54 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 04:59:52 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-hash: upgrade 0.3.3 -> 0.4.0
Date: Fri, 15 Jul 2022 11:59:38 +0800
Message-ID: <1657857578-19917-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97835

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-eth-hash_0.3.3.bb => python3-eth-hash_0.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.3.3.bb => python3-eth-hash_0.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.3.3.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.3.3.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.4.0.bb
index c4e8e5e51..317bcd528 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "8cde211519ff1a98b46e9057cb909f12ab62e263eb30a0a94e2f7e1f46ac67a0"
+SRC_URI[sha256sum] = "ae8ba88c1c2f0074e5e169bc0c08318c063054532809aa1bfc8367962b1b7088"
 
 inherit pypi setuptools3
 
-- 
2.25.1


