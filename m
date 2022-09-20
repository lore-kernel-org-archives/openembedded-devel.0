Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A4EC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:14:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.7234.1663640070315340200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ng3uOLNe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640068; i=@fujitsu.com;
	bh=XdawVrlKswrdC1aKNp/RAFE4A21jWhPsG7LLkJk1V5A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ng3uOLNeQ9f9EfyDTd2GlL/fzLIWVQgbZrH/NIn9APbV/bct5LNq0n5WIQei35ga4
	 0s8GjByGLjo5kgiUgdM4TFoYktDzGcmV6MXun/OZAhuU+3AKkcaWuOVPORebp/Jo6P
	 Z3VfllwKGjyIe0LNlHHRr8M7LeYpdRWQI3C5htQQar7yC8ImkxYhKlzcci7AdgByK+
	 3ozPwcHPqgM2j62Us1wLH3OWbM8nqYteaNxe4e2DiVzGLoR8ZblLEovhI7QwN54hGX
	 q0nNBRDF38y7pmzvc83QIiIXNZ9sTOqN76JNB6pI44HItflZqB+bEdszosSWOyev2s
	 AYhFeDGSKDRjg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORpMuspJl
  s0NZvZnHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZvxrPMxeMImzYv+UigbGKRxdjFwcQgIPGSX+
  T/jCBOFcYZJ4em0PK4Szh1Fi/sW9LF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCzhKfJy0FsxmEVCVOHBsN1gvr4CTxO1lh8BsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzB
  A1ihKzLzdD1VdINE4/xARhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJNUlJmeUZKbmJmja2hgoGt
  oaKpraQmkLPUSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L08lJLNjECAzOlOLl8B+P2
  fb/0DjFKcjApifJy1WkkC/El5adUZiQWZ8QXleakFh9ilOHgUJLgtRfUTBYSLEpNT61Iy8wBR
  glMWoKDR0mEl00KKM1bXJCYW5yZDpE6xWjJMXX2v/3MHMvB5MyvbQeYhVjy8vNSpcR5UxSAGg
  RAGjJK8+DGwSL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3nA5oCk8mXklcFtfAR3EBHT
  QDRV1kINKEhFSUg1MO3+LZ069EN5aun+3v+/F3U9Ylq2947bLSmSZB0eRQZcdX9fjC3XNH74c
  7qy7/VXu3cF53LElT/YsNPGuvZ7zTqElMrnxP2PRT0/9s6JSk5MD/p+bwvKpO+Ilb+x91S2H6
  rY/vHXZ6oyCRPrG+GNnRQ3cdSK8BbaWetW+++cwnSna4uBaqTPvS4vt30nrLq/fKrrAuLZZJ7
  t05aV05xlPzsT6KTOt+laWvtx8j2SfmL3m+naBmt9h6d7+R3ku10RMmmneLWi8Led34VH35dU
  b/ieeWNXXFDXJWPlDF/v2A2LHC6aEZ39Okb0ZfXrHl88FbBsuKG/9peJxI7lWkvl29rnM7m3P
  fLbIS3/d7ymjxFKckWioxVxUnAgAp+5Yu18DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1663640067!137522!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29885 invoked from network); 20 Sep 2022 02:14:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:14:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 529B61B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:14:27 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 477E61B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:14:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:14:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libpfm4: upgrade 4.11.0 -> 4.12.0
Date: Tue, 20 Sep 2022 10:13:11 +0800
Message-ID: <1663639991-27028-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:14:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98873

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpfm/{libpfm4_4.11.0.bb => libpfm4_4.12.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libpfm/{libpfm4_4.11.0.bb => libpfm4_4.12.0.bb} (93%)

diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.12.0.bb
similarity index 93%
rename from meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
rename to meta-oe/recipes-kernel/libpfm/libpfm4_4.12.0.bb
index d2d2512b2c..4baed62145 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.12.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
            file://0001-Include-poll.h-instead-of-sys-poll.h.patch \
            file://0002-perf_examples-Remove-unused-sum-variable.patch \
            "
-SRC_URI[sha256sum] = "5da5f8872bde14b3634c9688d980f68bda28b510268723cc12973eedbab9fecc"
+SRC_URI[sha256sum] = "4b0c1f53f39a61525b69bebf532c68040c1b984d7544a8ae0844b13cd91e1ee4"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 
-- 
2.25.1


