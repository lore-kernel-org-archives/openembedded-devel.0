Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9DCC7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.103893.1683541485541274965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UK98To4o;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541486; i=@fujitsu.com;
	bh=p+dyxJTvipntpcVtX4KGqaUuYzCoHbpf9gfxRc0mKrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=UK98To4objVjVZ1s1blbsDSr3AKqqjCsGx71FNEJ2yxx+VeMVnwdHH/KFgANET1qy
	 XcvSDoJOlpjb4al7eQM5uKMy3lT0jx6bnNz5YQwSIms9KmFjL3hXyKLCuBpxiET6ew
	 d9bHsYLI7wcjReE7SkPTvke3tkxnzKGijCDWP3ZZKAXco21bFlPSu/U+4HekIBTKOW
	 IbaEQ1oC7vHJE70FIc+6sefNo4OJbL0yNXTmIlxypK6mbf9/2J2VhBiWATDBkdKbRD
	 LNfINCXbiZawdhd50CngDI1y8vf5qNlYaDOPSDYU1Z8oWyxBVrwQvDEgSJrq8tuYmg
	 exB2mJhz2kJ0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpPv2bES
  KweYpihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aFs//ZCg5yVuz+foG9gfE2RxcjF4eQwEZG
  iTfbJrBDONOYJJZtv8TcxcjJwSYgITF970l2EFtEQFfi44e5jCA2s4CKxIzJR5hAbGEBb4kVh
  7+AxVkEVCW+zWwHq+cVcJI48WYW2BwJAQWJKQ/fg9mcAs4SW/u2gtULAdXcau6FqlGTuHpuE/
  MERp4FjAyrGM2KU4vKUot0DY31kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yo
  rc5NzUvTyUks2MQKDIqVYfe8Oxv27/uodYpTkYFIS5TU9GJYixJeUn1KZkVicEV9UmpNafIhR
  hoNDSYLX5XREipBgUWp6akVaZg4wQGHSEhw8SiK8skeA0rzFBYm5xZnpEKlTjIpS4rxbzwAlB
  EASGaV5cG2wqLjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXAWQKT2ZeCdz0V0CLmYAW+1
  8OB1lckoiQkmpg0inPnXGL4YFXwN/TnPanua+rvM9ieK5fvW3PujhvTvVGx0kaqtwyN6ZbRr8
  u3Rtls+mJ11yZ00/sC71ED0l+qGO/PbtWcMsUvfsfVXqePOK8Ol2v6VUSNy974PEdS/MmFXir
  TBPO32zxSre2cPLnsNaZB4NE78+V6/T4sevuAeuFu0J+RTxKXGWnHiMRqqK0jSdYVJ9XaItq0
  60rh84uSH3x5tVXk7rOiJv/Bc59k92jZ/Zu8t7EvLN2Se+WLJau4tO44/XorvGFvj8R330Nbm
  eIdxk0rZxlqsb+N/2O+blbu+K/XVqwjvW+adWiTknlV8yC7VZlu4NOHOFVLb0Q1ePv/lo65pf
  BsXqdnzqySizFGYmGWsxFxYkAi8iU9QUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1683541485!320955!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16073 invoked from network); 8 May 2023 10:24:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:24:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 46A0C1D2;
	Mon,  8 May 2023 11:24:45 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6D58D1C2;
	Mon,  8 May 2023 11:24:44 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-smpplib: upgrade 2.2.2 -> 2.2.3
Date: Mon,  8 May 2023 18:24:32 +0800
Message-Id: <1683541475-25799-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
References: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102428

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix: correct UCS2 part length following #184

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-smpplib_2.2.2.bb => python3-smpplib_2.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.2.bb => python3-smpplib_2.2.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
index 5c635d6fb0..25f8f6afdd 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "f2191e73b24dba94f2889bf2ea1a60aeef6bd43afd3ddbbc632d7e41d9f30e47"
+SRC_URI[sha256sum] = "5215a95b0538d26f189600e0982b31da8281f7453cd6e2862c5b21e3e1002331"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


