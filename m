Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659BFCD12A4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.39482.1711983100184328318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=npLZMuz6;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983103; x=1743519103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uLMdSCyQsmWRdUgg8ZGkWFeoB1NiVgxXszkbSlgprkA=;
  b=npLZMuz6f/0Pd4kz4cOlgMRcSfhV3Ei5K6Z7sKR1fxsdYXnjQkzIjeJ4
   /Dngr/zVrClfgDElLZEUGZy8KnqHAvtekhq0jn0s3Ox6T3IgHv9CVFnIq
   4FSBnD3IJCPtQi3Nq1AEAh0xgwyxzDgxtCxk2J72eqm4l3GxjP0F1cQi2
   yVXaXENgfxhEJZHeLOTErVEbp6jZwgF1Bcty4+k63VdIpGn8EAL119O2S
   S7vOqZFTej3k9RAyeBZ2Q/5vfJUl0923qVh78vSu+J2sykiZ1xdI3Qngs
   4foJyNJX/2bQbw1N+Dy/lxQZJz0CArhLSiJ/3Llcjn5yREMPZxJotdrvW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133563984"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133563984"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C353E48C8
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2B24CF7C2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DF2C20093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 134961A000A;
	Mon,  1 Apr 2024 22:51:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/47] python3-pytest-asyncio: upgrade 0.23.5 -> 0.23.6
Date: Mon,  1 Apr 2024 22:51:01 +0800
Message-Id: <1711983079-16849-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--2.743000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCyfWMucVYsOKOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEUKdY/TlJmfrX41JZg9LyZ4gaRi8lQG7NbFDhn82oPp6uZ0uTyYhGQTR/QncBZocdawBh
	xnvZ75BrGFpvuEc0dMJWg9KIo5mzvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109746

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix compatibility with pytest 8.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-asyncio_0.23.5.bb => python3-pytest-asyncio_0.23.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.23.5.bb => python3-pytest-asyncio_0.23.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.5.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.6.bb
index 2eda16f93..492020477 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "3a048872a9c4ba14c3e90cc1aa20cbc2def7d01c7c8db3777ec281ba9c057675"
+SRC_URI[sha256sum] = "ffe523a89c1c222598c76856e76852b787504ddb72dd5d9b6617ffa8aa2cde5f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


