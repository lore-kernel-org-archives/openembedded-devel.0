Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583F0C54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8159.1710827206450089136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D53KDRyN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827216; x=1742363216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kdZGBexexw0hr2lJrJx4gOyJyHGopc2JObDbEvgbZx0=;
  b=D53KDRyNpAhawMU7hHBmwVM8Ue9VqqsHznR0N/PCWnzOKiOYuGeIG1Lo
   a8uCRm5nXon3W8Weg2G/RX/jc+qWfzPadcrwOJjcBkfF9P/FtpwMmmAtW
   zc0x325/KWKogGXlUWVjpZidDPaAFVM4KkJ65AtKRXXpGFaxjk+daIaDn
   feY8/JQd8jmMdJYaIDa1LXoFYi5qT2U6Jm1IgwqB9Ui1+eXMZZQ3haHzI
   uSemhVYdDxaiEXaHZvZPX+eFRSyQ145KGUV4lFZel7uB2O5MfC7/3n+kd
   8Zyrjp4HriPyGa2d2hKur/bUeTKUfCv/QBtJB0/cPq76wi4hDkfb4Ba9c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152674098"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152674098"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E3C7141214
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B4E8B4E22
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 411A22009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF8821A006B;
	Tue, 19 Mar 2024 13:46:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/50] python3-types-python-dateutil: upgrade 2.8.19.20240106 -> 2.9.0.20240316
Date: Tue, 19 Mar 2024 13:45:35 +0800
Message-Id: <1710827139-30056-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-1.599700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr7EQ+aGl68cTSCgqR50UUhb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCRli+
	BaqMwTNrVuPnsbKmJliiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaeHoidXaPIy/+kQPZJAXbkTh+jGx0/QoKx54ciWjkEOZyK4bpkOqlwku3YT/fwmbLEQg
	Qu1aCCpyKy/nSan26jQK0a4D5LQUfK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109462

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-python-dateutil: respect inheritance on relativedelta.rsub
-Bump python-dateutil to 2.9.*
-Use PEP 570 syntax in third party stubs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...40106.bb => python3-types-python-dateutil_2.9.0.20240316.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.8.19.20240106.bb => python3-types-python-dateutil_2.9.0.20240316.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb
rename to meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb
index 2075d96b4..4b786066f 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://github.com/python/typeshed"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
 
-SRC_URI[sha256sum] = "1f8db221c3b98e6ca02ea83a58371b22c374f42ae5bbdf186db9c9a76581459f"
+SRC_URI[sha256sum] = "5d2f2e240b86905e40944dd787db6da9263f0deabef1076ddaed797351ec0202"
 
 inherit pypi setuptools3
-- 
2.34.1


