Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52915C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:40:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.29017.1661244001378975648
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GrSVpseu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661243999; i=@fujitsu.com;
	bh=IJixJs3qsxD5E1WQepqRfNbmRph4oXFD3zRE+ll5SUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GrSVpseu8ZhohJ9A8j+rSbisiHKoSrrFJPLu5Z6mK6yRZcqs9DFKWVUz1WGu7BeUs
	 5epEJ92xwtGYs4DQnEyU5EpsmDm+5O1y63RoOKSYht9rlxqTGuAEuBT81WEdA7kJMs
	 s6toGTWBQnktH7AejwO3XglOCSc5WLHnrJqUVe69l7vC4wICfNFxK3AosWn1ahkJyY
	 b9pSkwYxKUzm5B1/MetPB2TOslLwKH4Ax1n5RSkc07rU2ndhM2qJcZNa/EG4CsdBpr
	 PjU2r+3O53TFiaEEJlEuen6mGgtn97jl4e0jaicPgVrsuQMNDzjK5kEqge1XX6pmG5
	 yemGTo04H2uyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqBs3iSX
  Z4F+XocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHy8DzGgqUcFVNXhTYwnmfvYuTiEBJ4wihx
  ddlXFgjnBpPEr75VUJm9jBLdF16zdjFycrAJqElMv3UDzBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SxgJzH19w42EJtFQFVi7eqHTCA2r4CjxImfT8BqJAQUJKY8fA/WyyngJPHtWjuYLQRUs//LBj
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHalxJ5Z/UwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6prpGpqZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBQZxSzPp/B2N330+9Q4ySHExKorwO9SzJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4PfqBcoJFqempFWmZOcCIgklLcPAoifDqTwBK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcjA582
  vbAWYhlrz8vFQpcV49kAYBkIaM0jy4cbCov8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPc
  gyFU8mXklcFtfAR3EBHRQ0G5mkINKEhFSUg1MzRJPy0IqA93+Pf4U4FZx89OUv33xeQw3F7qH
  q+2XWfLm/tPIohDRv54Okz/eOn3okhvv132HJnGE3GRWuxI/X+6WpMCrYx7siT1b/zDE71zQH
  +fru0RXSnzJ7sK4Cu6r82aYrWGVXGu8tJLzWqTBskDFvN2z0iceOfNwl8HmPNsaFsO8gDzbAs
  4lHZkhNzbZHiq/ofRR0YWvhDHVkcFgTcCSH2dfiyqWSU/rXmXzx2ZWI68WN/fR62+VVt8M3bf
  B4LHJOZE6Vcv183LkJdVqUx7Xdb552GlmEGPx9OJ5IVGeuRGbNvxtPfBjjcXf4FtbVi6LcW/z
  Yr6/3p3nlfiu9y9Y3ZVeHzlkueu/seAuJZbijERDLeai4kQAs7sa/nUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1661243998!42047!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6210 invoked from network); 23 Aug 2022 08:39:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:39:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6F857100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:39:58 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 62D7510018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:39:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:39:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.8.0 -> 1.0.0
Date: Tue, 23 Aug 2022 16:39:36 +0800
Message-ID: <1661243978-4657-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
References: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98382

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.0.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
index 76fd862142..b6ec9f77bc 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
+SRCREV = "a0325403afa8a3eca0d3a3e43f43784dc6b47511"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
-- 
2.25.1


