Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C26C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:45:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.152440.1672123494886332726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mqNdO59p;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123495; i=@fujitsu.com;
	bh=1otK4D5kKb8d8ncjnnsJX7b+rRTbW6TqojVCp+Aja+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mqNdO59pyhrUSYtJiLoWm1na5+Aa+2FuM7waC33wFhO7+T7el2DJDuwManQ1XgHQO
	 s6yoJZ13MYV1EjUQIDuX0/jhJUyfnBKYHZdav1LRwlApKMWsY6FOSpq6H9yBCcCbd7
	 aUo5l73B5GuMtXHlXuKV/x5qJfzbeEXk3BEQsbw2s+kTYYQgYXNV4AYEMDBhq9IT6X
	 p77B/KO7KLr6OtkF10il9RekBGvjZ9OqtRuyd01KjB8sqnjkdh0QZpXEXsA840IGzP
	 YInSE44/x3ukOrT85Fz80PGeJYQQuWUUZY1tJ/Ckaulppz41jG8BjzrMnCauNfXSDy
	 IpXDOlwqvPPeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTdtyqp
  kg4Nt5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bi219YC1ZxV+ztWMnUwDiPq4uRk0NI4Amj
  xPbP4V2MXED2dSaJ7/vWskA4exglLk84xghSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAr8ThbZfAalgEVCUWL1rPBGLzCjhJHHq2kBXElhBQkJjy8D1YL6eAs8TxLffZIa5wkj
  jV1AZVLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDULol5CQE3i6rlNzBMYBWchaZ+FpH0
  BI9MqRtPi1KKy1CJdQ72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwU
  vbzUkk2MwNBNKVY9tIPx1ZI/eocYJTmYlER5pbpXJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  C2dBJQTLEpNT61Iy8wBxhFMWoKDR0kEopW3uCAxtzgzHSJ1ilFRSpz3K0ifAEgiozQPrg0Wu5
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOqg4znycwrgZv+CmgxE9DiD4dWgiwuSURISTU
  wtTx5xfbCe+uijicKPEEiZqyvS5/VBN8LPpe9/nDbx6iIuSHRyvYZVobpu1ZUvov4+Zl5vt3d
  qe9Xrblx93awfqNFYW2W5Jw3Wg7LxA7+5v7zPMfoIMNZ7oizv9Rsf9/4JHz0XMpp0ylsZe/PL
  qmZ/knrxA4rt/1PFWfsYJn+5XCd04vZhc6+p8/yTWdI3q3f+OXgvtdzohdP+ssXeM/he/GhX3
  kvT07//LL/h9bC8KLlnM6Vxk6NMhIrfdfdO9SQ47BbpbbqvfvqhI/7pZl/CGe4nDn74kFeTWl
  ciwqrnJW4iqL6zORdD5cqun36ri3f93eR9u4QI68/bW/nKmtfzrJ+dfzTjtkKYRkxpvPOL1Ni
  Kc5INNRiLipOBAC33f+qWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1672123494!411056!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31090 invoked from network); 27 Dec 2022 06:44:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:44:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9A4D71000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8E1DB1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:44:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.22.4 -> 2.23.0
Date: Tue, 27 Dec 2022 14:44:12 +0800
Message-ID: <1672123453-31906-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
References: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100268

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Feature
--------
  Add support for Python 3.11 (#920) (e4146a1)

Other
-------
  Exclude py3.11 on windows (#917) (c57e31c)
  GitHub Actions add Python 3.11 to the testing (#916) (8d49551)
  Add migration instructions for as_gray in new pillow plugin. (#913) (b3b040a)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.22.4.bb => python3-imageio_2.23.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.22.4.bb => python3-imageio_2.23.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.22.4.bb b/meta-python/recipes-devtools/python/python3-imageio_2.23.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.22.4.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.23.0.bb
index 919773060..99579398b 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.22.4.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.23.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "0fae027addf02bc89c73a56cc157ad84557f8b8b84aa19b4cb706fefca2d88ff"
+SRC_URI[sha256sum] = "cb635709765e527c94890b4fbb6870e59213fe182a1c8086d167eb3626073cbd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


