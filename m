Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2855BFA3745
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:40:10 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.7034.1667205603694150793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zFIFJgnv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205601; i=@fujitsu.com;
	bh=9eyNURqVcssMCcfkcI7foN3cFlS8vXFh0ffTSGA2ko0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=zFIFJgnvovW9kwBmxpxCsVR64EZFrVNIG1qzmWdL6W/IO4f+ZQhSkj2hDZQpT+8/E
	 rbRbaOtuLVZUt56Rl6ed+XMpxYglxpuJZU4BGLyl6YUUhbk5jgmIwYuynL6X0MVqd/
	 ItnZFkCAQOYEmQrGU5bnWhzox9/Gws5fzkjb31Nxzj5DMfGde6Zlm3dfRnJy8qVtbf
	 kwmlCXwtFFwr5dSg9hic4xyiV2aiyYWD5yHwBB8CyKEBJJPkyK80ZEKnZ826q8ulUV
	 N9G7mjwv82bhD2Rp/slCi395UF+QuVSWoNP5T4dfHpEb0wKcxQLU+4czS0fzVHb7PL
	 qpObCkOeVCMWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpPuwMz7
  Z4O9hYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPds5/sBcs4K+53eDUwHuToYuTiEBJ4yCjx
  Z/NCFgjnMpPEkj8L2SCcPYwS52ffZe1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBfou36U7A4i4CqxJqFp8BsXgFHiU0XroDVSAgoSEx5+B4szingJLFo1xwmEFsIqObJu2
  vsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA0t9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelmO36DsYZy/7oHWKU5GBSEuV91xKfLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCl
  7EdKCdYlJqeWpGWmQOMJJi0BAePkghvbytQmre4IDG3ODMdInWKUVFKnLe7AyghAJLIKM2Da4
  NF7yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxbQbbzZOaVwE1/BbSYCWgxW3scyOKSRIS
  UVAMTg8DRM/2fW61T+YvCirco+6QHG5Q7+mZVr/9tp9eTwiukbW3i6r/ws3zevQ8z3ZN7JyaG
  JzKq995n6zm8m03C2lDz2vz+z9UHdB3q1zzzFSzd0m3ZvurjIdFQ93un9T4lLxd99sEq5/EB5
  Uvz1RXrzSc9iKjyWWqxiC3z4XpTXrnU7jTp35ciDu9s4ay/uDTT6lLD08OuzjXnGU46/q2d7p
  BebnNP7+Kbiolfba/8VhY4qbpvsWyYcjlTU6N87xG+WU691teFLurLLGIPzmMo8lZrfM3WeE3
  M8XH+j2dcByfXT/3h5h15pWj6T0H1W+z7j2/yUzCcE5YWxq/PcOVajavdX8U1id/vzVy+S4ml
  OCPRUIu5qDgRAFrXuitZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1667205601!802725!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11198 invoked from network); 31 Oct 2022 08:40:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:40:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EDBAB1AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E2E4F73
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:39:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221016.0 -> 5.9.20221023.0
Date: Mon, 31 Oct 2022 16:39:42 +0800
Message-ID: <1667205585-3786-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
References: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99366

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
lregex: warn if mgroup= flag is not given in --mline-regex-<LANG>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221016.0.bb => ctags_5.9.20221023.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221016.0.bb => ctags_5.9.20221023.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
index 809f578803..b7703cef96 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a2995833175678358767e1c9a36ad3946667edf1"
+SRCREV = "d8f5c062ea6ff484f4f1f5095a7d3c364f3019ea"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


