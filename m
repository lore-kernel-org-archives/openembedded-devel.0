Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CFFC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:31:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.40264.1681115464271521643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BtpJFW94;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115469; i=@fujitsu.com;
	bh=u0muQG9LRwRLzGb2JHBBbeVCzsVBgkgPC/NQyfooAT0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BtpJFW943H9hPpsjv5A9W5xbkw/rLd3h8xFQvAoR73klkfaf7byFVieDzxQ/OlKSd
	 VcCGkVqSU9YVCFnTDqPEhptDi+3Xn7DXLItO8ilmd66xc01XVT3glrUhNo/APeE5Hy
	 EJETCL6MSW5ZIQod9/2sJRuD3VktQ9RrtQ/kK4VKLUU37fY4bb0YiQq8T89CVvhTQE
	 Q7hUasSM0KGAoUUsh6au3KuQhByEwXuSJCme1EuX8gXWE3MFoIKwHI8g0XfpXk28U4
	 KORQ3tn6KlsdL03TK0lFl0xzLDG0SGbDtdvMnZrJf7vU4PdeCOfe+DF8aOlo2X5rw4
	 77yiZUMA3VaKw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpOtz0jj
  FYM9SQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPNnn9sBTdEKxb+Smlg7BDuYuTiEBJ4yCgx
  83UDK4RzhUli45v/UM4eRolp1xrZuhg5OdgEpCRu3P8PZosI6Essnb2HGcRmFlCRePG7hx3EF
  hYIkLg3aStjFyMHB4uAqsTthjKQMK+Ak8TOufNZQWwJAQWJKQ/fg7VyCjhL7Fw+CSwuBFTz7e
  BCVoh6QYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbrmeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgaGbUpzKuYNxZd9fvUOMkhxMSqK8XVzGKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  BceAMoJFqWmp1akZeYA4wgmLcHBoyTCW3EMKM1bXJCYW5yZDpE6xagoJc7begIoIQCSyCjNg2
  uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK82w4DTeHJzCuBm/4KaDET0GIuFwOQxSW
  JCCmpBiad/NVrlgRl5F1o+LTpXOo/3nVHFx1+Ztb9WdxnqsPKdFnbgzppp9W+bHexv7Bv1y1e
  mWnHXQW1xd37tizOc/pzUfDedUvnwvffI5XvPTrMV+L4M3qxY+XM//9X7C4Iv7Lg+CPl70f6X
  095qXDDJ+j2HiOvKkeH218WufUczT5830T2klS8t8ME07+L1y989qz9btGytoUGfWJpQkq9x/
  pf7/FbYPnyn4dAxPnPhw75aRvuX6Zwy8ntS8/893ttOLttF/3fUZuy/8yD1YXpQZ3Tdync37o
  rNzi/d6FGc5vpLHdFh4t6p42fcH2dZthtt9LEhHPjszc5F6zCNtysUSnzrpg5a9L86Ixj/nzS
  D76cUWIpzkg01GIuKk4EAMOiX1xYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1681115468!189222!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21730 invoked from network); 10 Apr 2023 08:31:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:31:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3A4991CD
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:08 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2F6EE1C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:31:06 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-simplejson: upgrade 3.18.4 -> 3.19.1
Date: Mon, 10 Apr 2023 16:30:47 +0800
Message-ID: <1681115447-24458-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
References: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* This release contains security hardening measures based on recommendations
  by a security audit sponsored by OSTIF and conducted by X41 D-Sec GmbH.
  Several of these measures include changing defaults to be more strict,
  by default simplejson will now only consume and produce compliant JSON,
  but the flags still exist for any backwards compatibility needs.
  No high priority issues were discovered, the reference count
  leak is thought to be unreachable since the digits of the float are
  checked before PyOS_string_to_double is called.
  A link to the public version of this report will be included in a
  future release of simplejson. The following fixes were implemented in
  one PR: https://github.com/simplejson/simplejson/pull/313
* Fix invalid handling of unicode escape sequences in the pure Python
  implementation of the decoder (SJ-PT-23-01)
* Fix missing reference count decrease if PyOS_string_to_double raises
  an exception in Python 2.x; was probably unreachable (SJ-PT-23-02)
* Backport the integer string length limitation from Python 3.11 to
  limit quadratic number parsing (SJ-PT-23-03)
* Fix inconsistencies with error messages between the C and Python
  implementations (SJ-PT-23-100)
* Remove unused unichr import from encoder (SJ-PT-23-101)
* Remove unused namedtuple_as_object and tuple_as_array arguments from
  simplejson.load (SJ-PT-23-102)
* Remove vestigial _one_shot code from iterencode (SJ-PT-23-103)
* Change default of allow_nan from True to False and add allow_nan
  to decoder (SJ-PT-23-107)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simplejson_3.18.4.bb => python3-simplejson_3.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.18.4.bb => python3-simplejson_3.19.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.18.4.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.19.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.18.4.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.19.1.bb
index e7d6ca0cf..1fb31a3a3 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.19.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "6197cfebe659ac802a686b5408494115a7062b45cdf37679c4d6a9d4f39649b7"
+SRC_URI[sha256sum] = "6277f60848a7d8319d27d2be767a7546bc965535b28070e310b3a9af90604a4c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


