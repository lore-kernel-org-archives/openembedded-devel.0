Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94ABC6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:07:14 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.6964.1677928026893422464
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ydmUoXuu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928025; i=@fujitsu.com;
	bh=xGGyNymK8mDQi9IXN7852HyKLOyhxR2L+wzKuShJCKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ydmUoXuuvb3SCr9XKagm1aDn6pLYE6BnVXW3UJ/JHp9M9Ex2E0V2mqulQPFj0gsL3
	 IpULkwWWXz4M6wJRqGVvPM5mkaLxQi8h3NE9PJ8YTyXe01OECdrR1MmhbP5jnBuvMM
	 68/NqDW4PdC2Fq0UP4p9Dl/JhHU1pIIKGXlmWmWyvA9VEB3s4A84JBh+ZcZFHmyLph
	 1C40Zra267Qclfi1UQ8Um5VhHpocaHhfVj8iKL9XgURa7xXEExuJIplkOz0gsphDfd
	 UwlRf2nfxytxveCxYnlm9jvMwLfQ7YlvG7wX7gujOoxbNrl+cy0PfU7LSeapi2qwch
	 cE90MbdaIfYhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWTdCjTn
  F4ORzFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPRzSXMBV2cFb3L1rM3MK7l6GLk4hASeMAo
  cWP7FBYI5wqTxPIP71khnD2MEqevdjF3MXJysAlISdy4/58NxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBXYsf0k2A1LEDxWac+gdm8Ak4SW95MBKuXEFCQmPLwPZjNKeAs0fTvE5gtBFRz4307C0
  S9oMTJmU9YIOZLSBx88QKqV1Fi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0BI9MqRrP
  i1KKy1CJdY72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL281JJN
  jMDwTSlOFNrB+K33r94hRkkOJiVR3kmsDClCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhlVJlTh
  ASLUtNTK9Iyc4CxBJOW4OBREuHdIgKU5i0uSMwtzkyHSJ1iVJQS5xVQBkoIgCQySvPg2mDxe4
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8WFaApPJl5JXDTXwEtZgJarHGaAWRxSSJCSqq
  BSdFkM9sa2f5FMuVbziS32MZ++3Xy6Nba3C6vWsvXJy2/tT44rv6k3KJL/qz2BrWsy3r3iqfL
  pah/3ser9kYg9uui0gWtTSLx+QdPXFnJ/bP6bMSuPJ9bSwWfKGVo749dEMFWYfbZn1d0xo005
  Ynhz+X0TxblKj/9+E9PJnOuWZtovvSqDzMYPIQfcrGt7ugNMfd6ryHaMTN3Z9+mf3Hh0jm6pb
  t3FJ3X+/1138z90jdql+4rnD1jW/aqq8/2TH5/wmXaseIHysWXNryTyvBv04jxSzv8Sj0lfNv
  DB1453zU2aJ3TKY0+tNFHr3eVxaLVe97tYJniufgGX9WV1u2i6z45CDxcnDJRLsWi+DqDmBJL
  cUaioRZzUXEiAN+8izNaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1677928024!585309!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11712 invoked from network); 4 Mar 2023 11:07:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:07:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 026967B
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:07:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DE13D73
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:07:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:07:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.10.0 -> 8.11.0
Date: Sat, 4 Mar 2023 19:06:45 +0800
Message-ID: <1677928005-22986-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
References: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101370

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.10.0.bb => python3-ipython_8.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.10.0.bb => python3-ipython_8.11.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.10.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.10.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
index d4b3012e4..4d21afd6f 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "b13a1d6c1f5818bd388db53b7107d17454129a70de2b87481d555daede5eb49e"
+SRC_URI[sha256sum] = "735cede4099dbc903ee540307b9171fbfef4aa75cfcacc5a273b2cda2f02be04"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


