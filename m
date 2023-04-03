Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD94C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:00:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.65401.1680512429170208779
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=X5N4L/k2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512427; i=@fujitsu.com;
	bh=b9PQGwsoLojmjaaYj8+ghe7+Ys3AnQMhvdVWe77796E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=X5N4L/k2XX/LRVU+nnttxfFJki5Dk3/fQsVrBd2ErOgudoVIpCgubuM2SP2Q14GVF
	 /+iZHIA8oxEIdW9JOvQhGJ5UZl2L1VlBUfBh7X5aZ6CZq85Wmbcg8zutip1AEbaCZm
	 5JU8ei8txWw/+6REW85ZjHC/PCNJ3mlSPI+mZIZCus5o9d8SsTL8IlaV2aHdPCzsMF
	 +VkdEyFpxUYXm/aLykJcJ6TPIBlgHJLO38QT5p+V0pdjtyWTLPNrlTqC06q0G62+6G
	 wQi+bbhgyZR+cm350f432SOoJ87MqnuKf1SXxdPBkZjiNXA8b3I3tGmFI7263LUhB5
	 ONJD0TMlMKtng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpLtqqla
  Kwc2/ehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bnXdeYC5ZxV/w8v5algbGfq4uRk0NI4CGj
  RN+lEAj7MpPEpcsqXYxcQPZuRokTN26xgiTYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCV2DHhPEsXIwcHC1D8yX5/kDCvgJNE14HXYOUSAgoSUx6+ZwYp4RRwlpi/RRdirZPEj1
  33mCDKBSVOznzCAjFdQuLgixdQrYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaF6cWlaUW6Rpa6CUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBAZuSnFi3Q7GFX1/9Q4xSnIwKYnyCtZrpQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  D04ASgnWJSanlqRlpkDjCKYtAQHj5IIb3AvUJq3uCAxtzgzHSJ1ilGX4+qVK3uZhVjy8vNSpc
  R5/aYAFQmAFGWU5sGNgEX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvK8mAk3hycwrgdv
  0CugIJqAjWqM0QI4oSURISTUwrWnPCHr+Rtv1nETd1ePrhD3X3/Nd5KVi1HilYvn1fmtHlUkH
  Lv7TdhIW8upNZNr//czOvyZM7bf+Btyat2ZNNZPp0u9201k58kI8jiUlPFojaq29fsuRGX+n8
  4mcWaATk/Hw4CuD40I3ZttbHosxjk/awW/hX/F20dSu+gwRgwwHmWAuZfcXlemH8wUSmDY+ON
  XEIXYy+KXQZbk1beeuVNXPD37XUc9gq7qvNWL+q8/vpJTtM5hPBM62Wvd6BneyYtEVHcaQXzu
  Cll0/d0OEdUlL68/2tCqX6ykCUb2zmNf5b9uvne4sfuO1zawFE88XWrUweyp92sRvu17VYhtP
  ZZ2PiwKfjWZ6gO1Ey1NKLMUZiYZazEXFiQBItIANYwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1680512426!915058!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11942 invoked from network); 3 Apr 2023 09:00:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:00:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 33FE01C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:26 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 28CF77B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:00:24 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libtraceevent: upgrade 1.7.1 -> 1.7.2
Date: Mon, 3 Apr 2023 17:00:06 +0800
Message-ID: <1680512408-30384-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
References: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101899

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix big-endian build breakage in unit tests
- Fix double free in process_sizeof() function
- Cleaned up process_sizeof() function as well

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtraceevent_1.7.1.bb => libtraceevent_1.7.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtraceevent/{libtraceevent_1.7.1.bb => libtraceevent_1.7.2.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.1.bb b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.1.bb
rename to meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
index f876f7534..089b6814c 100644
--- a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.1.bb
+++ b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "4e51588b1f4d6617df7e39a38acc0d0daa3d8a3f"
+SRCREV = "1c6f0f3b2bb47571fc455dc565dc343152517d98"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
 
-- 
2.34.1


