Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51035C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 12:05:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.19013.1646049926933197312
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 04:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ih5kdflg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646049924; i=@fujitsu.com;
	bh=MsiyXcYmEat942O7WqKXFJa/PgR1IZiFgJfXdYnk+3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ih5kdflgdjZKrnLYQglFo4lsYBS++c1zhtZn/+y6h/qNd/4bXctVpNE51GZwPOhHJ
	 cb5D4klcjNr6ACjDGUM+rrCOWxXOyuHmgrblqRpWlqt89Irpa1EAP80iXsBOoeRHUn
	 O/ZnQ59/mSNj1HPeoijoPKKwK7uzgN0xiLEs2LqJrFF6X/Dt+UNRpc0cKFa70EqGLI
	 Krncvx5CDEUcgmhDSO0LGh4BpkmZWZH3TYxzfUwhfQ19QNdK8qiBul+hN3wEMgRPCs
	 rKVQWVHasTtck0Jv/iMx3gb4EuQfKh5ffFBdhVghv3UT5XPa7xznL9/wgSgWsVnrAD
	 WHo04g7RnBbog==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 3E/B5-30582-48ABC126; Mon, 28 Feb 2022 12:05:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSbdll0y
  SQc97XouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNO+33Wgl6eivcf37A0MLZwdzFycQgJPGGU
  ePrsBguEc4FJ4vX+eexdjJxAzglGiQe7i0FsNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuA
  asXFvCTOPr2IhuIzSKgKrHkyGSgOAcHr4CTxJ5ZaiBhCQEFiSkP34O1cgo4S8z70cYEscpJ4m
  /nBbBWXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWRC9EkCnXT23iXkCo+AsJO2zkLQ
  vYGRaxWibVJSZnlGSm5iZo2toYKBraGiqa2ama2mml1ilm6iXWqqbnJpXUpQIlNVLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM5JRip4QdjI/6fuodYpTkYFIS5eXskkwS4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMGrtl4mSUiwKDU9tSItMwcYVTBpCQ4eJRHeph6gNG9xQWJucWY6ROoUo6KUOK/TTq
  CEAEgiozQPrg0WyZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNOBZnCk5lXAjf9FdBiJqD
  Ff4OlQBaXJCKkpBqYTgr/f2607tbyvdJ+rCn1XPdDk5bpN860MlT9L6t+6QrP98wJ/5rvBJar
  O+R9P9/dd2ceC/+/yjc7tmxlrix/bvrO/XLInnPPL20McrWY/o7nYZ+RaRvvIgE913tPc47Pl
  zhd+OFc0/GbViJcKUyX2bRu5n9fWr1MQHhm7rOJty7p7I4uL3ie+pBjr+AXtZQcg+iJx0v+fn
  4x58RSKd077E5zSqx1i64ozTRfH6D7Ov+YUW/fhaVNvAvfi97N4pZRPnKRQbJ2xScv7bmC1/X
  PiS59/+RMts/mU68+L/7IvGv79ndM86OE/z5r/xxvNGUzs9+ENO/guErJpqcRWvt/WUT9j7fW
  uNK3iUn/U9mi9UosxRmJhlrMRcWJAHzvg8tfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-528.messagelabs.com!1646049923!23184!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25840 invoked from network); 28 Feb 2022 12:05:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 12:05:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B3A06100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:05:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9B7CD100440
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:05:23 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 12:05:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.2 -> 3.0.3
Date: Mon, 28 Feb 2022 20:04:56 +0800
Message-ID: <1646049896-35695-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646049896-35695-1-git-send-email-wangmy@fujitsu.com>
References: <1646049896-35695-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 12:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95566

Changelog:
Added :func:'print_black_and_white' worksheet method to set "Black and
White" print options.

License-Update: year updated to 2022.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-xlsxwriter_3.0.2.bb => python3-xlsxwriter_3.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.2.bb => python3-xlsxwriter_3.0.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.2.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
index 04f25532a6..0f8dd35e0f 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e5c795ec8cf90514a6d844b1d3cc3224"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b9a26d1a52d2c66df334bbdad23896a"
 
 inherit pypi setuptools3
 
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "53005f03e8eb58f061ebf41d5767c7495ee0772c2396fe26b7e0ca22fa9c2570"
+SRC_URI[sha256sum] = "e89f4a1d2fa2c9ea15cde77de95cd3fd8b0345d0efb3964623f395c8c4988b7f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


