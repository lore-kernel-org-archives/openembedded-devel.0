Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6DDC43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:53:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.15893.1668844419620196756
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZzXFrIdf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668844417; i=@fujitsu.com;
	bh=Cw79mHSrzgXgOrdGHwnK9Q8hOlre5kyusZW0BH5ZNcs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZzXFrIdfDpEaG041vGvCd8zS3FIqpf39a9r6kn+wgRFCfQY3cR4DdolQP4vp+hxrn
	 dOJ6YJdWAXF4/kvq7YRfgUhxwPffAfqV0bCRkuaQ6vFKN/TnUOkP1R/wQFaglQm0LN
	 Pwuw/lo0YF+6T2WBZd8jJ4+qVd7CjADd8QZukq+3HFWBlfGm6UOu+LRZ0jRexRvDl3
	 4If9sxRVW03amw/pGtHE/Zx2QigYO51OFIiyA2DlvEfOpiJSqBkRICKxrw6XiCeDZZ
	 i55vYbKstNRftDzTasqOpJkiND94/9B0d0xsw2Kko+v9aBCyfH4cHfE8A87/csWN/X
	 ODx7qY45ICjoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpNvYXZF
  sMPu6jMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFoYk3Bar6KhdvvMDcw/uDpYuTiEBJ4yCix
  /8t+5i5GTiDnCpPEwunJEPYeRom5t7hAbDYBKYkb9/+zgdgiAvoSS2fvAatnFlCRePG7hx3EF
  haIk1jV3gNWwyKgKjGz+x0jiM0r4Cgxd8ZTsBoJAQWJKQ/fg/VyCjhJzJv0jRVil6PE7Dt7oO
  oFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFacWlaUW6VroJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWW
  bGIEBm5KcYr7Dsbjy/7oHWKU5GBSEuXd216eLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN66tI
  llIsCg1PbUiLTMHGEUwaQkOHiURXhEfoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5H3
  YAFQmAFGWU5sGNgEX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFmdQFN4MvNK4Da9Ajq
  CCeiIHOcykCNKEhFSUg1MRYs+5kXbzhBctLdb6rvytTUvtvd16ynN6+ipnX02oif+cfJPk+gd
  z8vz5+wT3l9m9PdX3IM3Py/1H26tmpjkVhxnUBx/69eLf0mhsYmb2M89t/vq/sQtckvXaqus5
  DUfq7fdrfmzR5Hzxb5NKstbnaWP5u356f7vht//HVNvRa+d1KB9RPsz1/n8X2cVnHcHH9ySt9
  zlco5m4m6XbRWeKu5cnK9unDYpOLpp3mKXRe+vCEg1dgpaOUv7HGgvsfr9KLBpkaPhrLmXTR9
  onA4Kfn3VX+mR/JXmiDVLGkNddwmc/MzcmJ5vIxO6ouBKdu+GXOvi7ENhW7yU7iUuMueZ77H0
  XdfC1V/sUr58mOasqcRSnJFoqMVcVJwIALHcAYFjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1668844417!127730!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23955 invoked from network); 19 Nov 2022 07:53:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:53:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EADF3658
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E011E241
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:53:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade 1.56.4 -> 1.57.0
Date: Sat, 19 Nov 2022 15:53:09 +0800
Message-ID: <1668844391-3117-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668844391-3117-1-git-send-email-wangmy@fujitsu.com>
References: <1668844391-3117-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99637

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features
------------
    Add support for Python 3.10 (#143) (63ca888)
    Add support for Python 3.11 (#145) (b9dbb21)
    added google.api.JwtLocation.cookie (6af2132)
    added google.api.Service.publishing and client libraries settings (6af2132)
    new fields in enum google.api.ErrorReason (6af2132)

Bug Fixes
-----------
    deprecate google.api.BackendRule.min_deadline (6af2132)
    deps: Require protobuf >=3.19.5 (#141) (9ea3530)

Documentation
--------------
    minor updates to comments (6af2132)


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.56.4.bb => python3-googleapis-common-protos_1.57.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.56.4.bb => python3-googleapis-common-protos_1.57.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.4.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.57.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.4.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.57.0.bb
index 3f03933e0..2a233ad18 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.4.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.57.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c25873c47279387cfdcbdafa36149887901d36202cb645a0e4f29686bf6e4417"
+SRC_URI[sha256sum] = "27a849d6205838fb6cc3c1c21cb9800707a661bb21c6ce7fb13e99eb1f8a0c46"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


