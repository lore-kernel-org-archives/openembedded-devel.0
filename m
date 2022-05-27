Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE63EC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:37:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.2708.1653615466539308165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f5wgxZCA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615464; i=@fujitsu.com;
	bh=uXCdLfhEyVvchTkekJuiNvUnU23ScVePUKlP6ZRJacw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f5wgxZCAgwM4yWulkCXFAeUfFjRjgUDlfifwDJV9phUEwdJP4scao6RRuIrP8mMtM
	 JHuN5i/iqeRyn2MadWGauwtQ0eD5Pad+gLPy5CUA3xcTzVdUFxxkEO7CrAznhq3aIs
	 G/QqirftWVWu9hnFVdxZHw/RpmJP4uTUOx/VCGHXEgb4Qs6az8b7sn4zVxg8/hEktd
	 0Us+GtC5se7hkzmVk2ces2EBSpwDjsAn4yIWIHcZ0wLPk2YeFA13+IGzOFeJj2pp2P
	 iTuRZcjWGVRJNfjEq+nMUbYXxiiqP3BX+pdIyd5UtO67NYhNEsiadURRVt7vEYPOuO
	 co8a8WCf1+2uQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8OxWTdDe0K
  SwYfP7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+nma2gt+cFa8ubWZsYGzl7GLk4hASeMgo
  0br1FCOEc5ZJ4kvzTFYIZw+jRMOp80AOJwebgJrE9Fs3wGwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICnhKTH58Dsjk4WARUJe68KQYJ8wo4SSw7s50NxJYQUJCY8vA9M0RcUOLkzCcsEGMkJA6+eM
  EMUaMoMftyMwuEXSExY8Y2qF41iavnNjFPYOSfhaR9FpL2BYxMqxitkooy0zNKchMzc3QNDQx
  0DQ1NdU10jYwt9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAoMypZjl/Q7G
  pr6feocYJTmYlER5M+/1JwnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L2jNiFJSLAoNT21Ii0zB
  xghMGkJDh4lEV4lGaA0b3FBYm5xZjpE6hSjopQ47xVNoIQASCKjNA+uDRaVlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ8z4FmcKTmVcCN/0V0GImoMX5vL0gi0sSEVJSDUz2nKIbO7j1JPY
  XH5h5/pKv0znNN5ue92nmdTDclrTW+TjxZ9S0F98DfWx3ZxyYt3XxLxn3b1oHqxgL5j774Xvs
  iFzo4dgGFw3jv0nPPh+cIZLxdlKWflfPg0NqmwvTjrWtD+delJT168eWp4UvAlu26zCYyOkzT
  61YsmvfzG1SE2M33xBsenmF/fF28b2VG65vFNOY/Pm3pqXEC/tl520tuW0+OFjy+/au/qyfZZ
  2k3t99w89Uo2LnHQGtjWdzDE7fTw9Zy/YjzOJJ3cpu60o7S8aEszOnxVco1G3M3Tv7ar9p/7F
  6UfbQOX++8i3rTsrfPyns/nktjdIpDfYm9++/f9PE4nFjTdDspvBX+TpKLMUZiYZazEXFiQDL
  GyJlRQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-591.messagelabs.com!1653615463!20441!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14806 invoked from network); 27 May 2022 01:37:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:37:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A30388AC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:37:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 85F1B816
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:37:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:37:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-yappi: upgrade 1.3.3 -> 1.3.5
Date: Fri, 27 May 2022 09:36:46 +0800
Message-ID: <1653615406-24837-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97297

1.3.5 (2022-05-20)

- Fix an exception with matplotlib on Python 3.10 (#97)
- Fix incorrect walltime when same coroutine is ran with concurrent tasks (#58) 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yappi_1.3.3.bb => python3-yappi_1.3.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.3.3.bb => python3-yappi_1.3.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.3.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yappi_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.5.bb
index 45a5f058a..9b08f759a 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "855890cd9a90d833dd2df632d648de8ccd0a4c3131f1edc8abd004db0625b5e8"
+SRC_URI[sha256sum] = "f54c25f04aa7c613633b529bffd14e0699a4363f414dc9c065616fd52064a49b"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


