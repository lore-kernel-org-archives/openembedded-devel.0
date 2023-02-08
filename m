Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC4FC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:09:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.3730.1675843733047940038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DfYGvZPE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843737; i=@fujitsu.com;
	bh=rgbfw/9Ts/03HF/VmWC0TXg6sISS6KuCg5dtC8unk3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DfYGvZPEc4deKLSDqh8hkKQRJzoJ+j7sYIaZMyI8l2wUJ4dOauHEiYUK2NfxYGTxn
	 fcx1vtZAbWn6wdQ6NQcEUAmOgxMSf4cHLSiWWLpXbmkrxRPrsrORKHzwV7RQ0GhmRd
	 XNoqGE1mSu6kR3ntxrLJRX6P1LQWS22DDaZd8b87N3xSDaxXnoZjqfQ2lMB6A8mIFt
	 4Wai4ucBI2IJohg2670PlkWQySAT51ZyhW0+ZzHZYbyd+ySfi639PT4NSJcqhX1ioh
	 ZDA7b8Sqw9er8SI3kUjV30NtJbDC40gEGzcNhkI6goP402ZhB4rbB001QQZTJSIat0
	 FF3qHFgJoPb8Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXdGxON
  kgz9LVC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozLXe+YC+4LVBw/sZ6pgfEDXxcjJ4eQwENG
  idU/0roYuYDsK0wSD97fYYNI7GGUeHlZCcRmE5CSuHH/P1hcREBfYunsPcwgNrOAisSL3z3sI
  LawgK9Ex/tXYDUsQPH3h46AxXkFnCSmTvkNVi8hoCAx5eF7MJtTwFniUt9ZVohdThITL0LM5x
  UQlDg58wkLxHwJiYMvXkD1KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9gZFrFaF6
  cWlSWWqRraKqXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qy
  iREYvCnFKXI7GK/0/dU7xCjJwaQkyusp9jhZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvRDhQT
  rAoNT21Ii0zBxhJMGkJDh4lEd7IUKA0b3FBYm5xZjpE6hSjopQ471WQPgGQREZpHlwbLHovMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmDQgDmsKTmVcCN/0V0GImoMUhqg9BFpckIqSkGpg
  KHJuUWVJ2/xet5vfxFXdO7Looe3+J9bIdnDPuZb/4GzBP8buokJ6srgjLk61vF/IvfMPBOrHk
  U77bzpCrJcb3LGZvkhQofy2VJBAR2+Pld/lBPF9WneKPTUs9dhWc9gg8W9tzoPeCutJfbeOap
  reePA9fNV86lpQvtkQ2+Mi+F8qy6x3emT4TEF3DsIudM3NOcoy3Gu+0bBMFv4ml0gt3n3UpSt
  16LSqpXWzHjxciUvF/XYW+XTdX2pG9LL6RifuVsu+GD148AVP2TpWzlsl64b0lSluq5fMJpu1
  NT3nvG+oWCE5Slz9TLxyeLTdJbM4Ku3gjt+jCokLPxRFJL18/m/OGh/PMxraDVh7flViKMxIN
  tZiLihMBua8X/FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-728.messagelabs.com!1675843736!375739!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 550 invoked from network); 8 Feb 2023 08:08:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:08:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1324A150
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:56 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0719573
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:08:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.13.2 -> 2.14.1
Date: Wed, 8 Feb 2023 16:08:35 +0800
Message-ID: <1675843716-11186-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
References: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100971

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
==========
* Revert "CallContext" change as it caused a "RecursionError" regression.
* Add support for inferring binary union types added in Python 3.10.
* Capture and log messages emitted when inspecting a module for astroid.
* Revert "CallContext" change as it caused a "RecursionError" regression.
* Fix issues with "typing_extensions.TypeVar".
* Fix "ClassDef.fromlino" for PyPy 3.8 (v7.3.11) if class is wrapped by a decorator.
* Preserve parent CallContext when inferring nested functions.
* Add "Lock" to the "multiprocessing" brain.
* Fix a regression in 2.13.2 where a RunTimeError could be raised unexpectedly.
* Fix overwritten attributes in inherited dataclasses not being ordered correctly.
* Fix a false positive when an attribute named "Enum" was confused with "enum.Enum".
  Calls to "Enum" are now inferred & the qualified name is checked.
* Remove unnecessary typing_extensions dependency on Python 3.11 and newer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.13.2.bb => python3-astroid_2.14.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.13.2.bb => python3-astroid_2.14.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.14.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.14.1.bb
index fa22080d3..e59d1d999 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.14.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "3bc7834720e1a24ca797fd785d77efb14f7a28ee8e635ef040b6e2d80ccb3303"
+SRC_URI[sha256sum] = "bd1aa4f9915c98e8aaebcd4e71930154d4e8c9aaf05d35ac0a63d1956091ae3f"
 
 SRC_URI += " \
     file://0001-pyproject.toml-Replace-with.patch \
-- 
2.34.1


