Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F33C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:13:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3791.1675843975451818146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VL8SBbR3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843973; i=@fujitsu.com;
	bh=NH6MZTOnAV8l9yx3yk0M7ABXQtFFIvzjPbdFclCEy7U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VL8SBbR3do+xtuCVICgpuGCFV7EIobEbMWlJ8N9M/av4pop1KMVUi+/aeeOGoSdpj
	 QyMCqo+YXwWRJIUqzD/Cme77Dr6aHB9IQasShL0KuKcvTMNebb0Dq3S4cwXzRtzRRJ
	 H/uq/UjwZLbFSP36n+x7eCoUkBDCNvzpupIcssqOeaMjLcnreB2s9Nja4gr0xqBXBB
	 pWtScrFlLkK1k8CUnnyvn11ZcigWeqsXuxdemwOVCLjyJRVZX+aualPT/PSXPqjbPz
	 JQPKCnxeh5rjmZziCpGLGjGmlMDvoKd41C40GfdDNTFWcVPYlrR0/5CuJhgj5mgF6T
	 p7kICiiPeUWQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWbc18nG
  ywdud/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anN58YC87zVnz47tXA2MvTxcjFISTwgFFi
  6/wmNgjnCpNE/9OTrBDOHkaJ/9ceMXUxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAt0da/nxXEZgGKP9v9DayXV8BJ4sPpz4wgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9g5J+FpH0WkvYFjEyrGM2KU4vKUot0jfWSijLTM0p
  yEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQKDMaU4UWgH47fev3qH
  GCU5mJREeT3FHicL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCNCAfKCRalpqdWpGXmACMDJi3Bw
  aMkwhsZCpTmLS5IzC3OTIdInWJUlBLnvQrSJwCSyCjNg2uDReMlRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8AWFAU3gy80rgpr8CWswEtDhE9SHI4pJEhJRUA1PjF0+h3AneKpf/x3ytZux
  +bLtH08rTuOdDF9sG5zlF2byHt715sOnwzrZyrj/TjRS59vPuDOIJPLm77H2/84qau2+VH8Ud
  ywwWnyQ4RzStQOIyq9szwV9hG/c4/lEPmBo/ez2H6a5cjW87NUSy981UifeVf7BWtJP9k0D3p
  NWdZcaN26pOvhA+NuvBhSU7eBoXX1pck633sNCM4YjonjOX69aazu+u3ZamU7WtNGJO5LTrBm
  Wbgl827bI8mqR16eucXzfLrzCXH3apMNm0Njjz4+JP88W2+npwPVxz9daF+tMyFaXSMcaHOwI
  /Hz7zryF9gm+cT+5f/QCH+X02NWdOGvYoCYp+XuN6KWdpFo8SS3FGoqEWc1FxIgA/VKYGQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1675843972!176435!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18220 invoked from network); 8 Feb 2023 08:12:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:12:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AD2F27C
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:12:52 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A17BF73
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:12:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:12:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.8.0 -> 8.9.0
Date: Wed, 8 Feb 2023 16:12:39 +0800
Message-ID: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100983

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- right accepts a single character from suggestion
- ctrl+right accepts a semantic token (macos default shortcuts take precedence
  and need to be disabled to make this work
- backspace deletes a character and resumes hinting autosuggestions
- ctrl-left accepts suggestion and moves cursor left one character.
- backspace deletes a character and resumes hinting autosuggestions
- down moves to suggestion to later in history when no lines are present below
  the cursors.
- up moves to suggestion from earlier in history when no lines are present
  above the cursor.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.8.0.bb => python3-ipython_8.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.8.0.bb => python3-ipython_8.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.8.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.8.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.9.0.bb
index 5b3d85db0..fc5075bbf 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.9.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0791db95b"
+SRC_URI[sha256sum] = "71618e82e6d59487bea059626e7c79fb4a5b760d1510d02fab1160db6fdfa1f7"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


