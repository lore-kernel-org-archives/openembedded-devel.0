Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C61BEDE9AC
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.18330.1725959003202735294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=InWeYX9H;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959014; x=1757495014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G9aOkFdj6CjObmREs7P//Xd/7phiDNCxv38EtsxQpx4=;
  b=InWeYX9HTZiF7+g4smYPpVrYqQlBxuWM1970sZ8GCLqopaU8f/W7VKkH
   VDHHWvJ0iEECEmUgkO6noxCzLqSX8NunTjg+4xqQW7bOj9RyBKcAjZawx
   0GK8Yv/NZLPJDapTMVPR0nW7T6XY/twkzYwP5Scp9lvtvLUBFcBa6La+D
   o+OW6xzNUbNag70fELvfvH0rT5Tsu4q90l4FcWJbY+U41pF2XiFZbls7J
   8zXDv5FTEuzCLD/PkaeQUevhwYZZ7trPHBLL3fNYedpXNEGfW462O9uga
   XnVLdYKgjNKEGn23TgQ0RE73K/FmXgzcdDfb+lBsOUtFTuJl9vZS8dP8Q
   A==;
X-CSE-ConnectionGUID: YFT2XBHMRQ2Stw5Yc23jdA==
X-CSE-MsgGUID: mnIU4GsHTYK6F/eaTMo5gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="161244781"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="161244781"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:33 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DDBB2E8525
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29143D3F0F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A9C9A40B51
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CB831A000B;
	Tue, 10 Sep 2024 17:03:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/42] python3-rich: upgrade 13.7.1 -> 13.8.0
Date: Tue, 10 Sep 2024 17:02:58 +0800
Message-Id: <1725958990-5719-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-6.712400-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiPURQWyqYB0Bik
	w8i4WW9MuU0Igx0oS5h9+b2UAY3sBhXVeikbUInER8Oi8Auxn3pa9oWcYwi86tWO4MK8ycTFo5W
	cmbsFeEoP4aT1dGzYAQ7YGloFeMEO7gp3lniZRi8Zca7SN08UZAV54COoxb6X1nkLa3J3C32e88
	IVRwpFue/spC84eMUoTZGH8K2mj5U5HWa1kxc3MTyjd/AizytBJ7Rnqmx7r5tf0tA+ZB+mEtOoC
	hbY8Yd0WgWOyHx8tVudd1hMfjNS2rKMKAuc41QjeVYoZkVsmtyfjJ25h/keVZTx+2LIqNmtlw+3
	9nTtEGxNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG011pGlZnMxFmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1K9JsbVqK5tu1xn+QLhXs4i9EE/B36Qx935+YDaGI98Y1mdq0askGnVo9IO
	6yaAfSXhkz2E6ejCAh1UyxCeOWlax4gu6KPO89H8FerAT0dJY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112217

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixed
--------
- Fixed Table rendering of box elements so "footer" elements truly appear at bottom of table, "mid" elements in main table body.
- Fixed styles in Panel when Text objects are used for title
- Fix pretty repr for collections.deque
- Thread used in progress.track will exit if an exception occurs in a generator
- Progress track thread is now a daemon thread
- Fixed cached hash preservation upon clearing meta and links
- Fixed overriding the background_color of Syntax not including padding
- Fixed pretty printing of dataclasses with a default repr in Python 3.13
- Fixed selective enabling of highlighting when disabled in the Console
- Fixed BrokenPipeError writing an error message
- Fixed superfluous space above Markdown tables
- Fixed issue with record and capture interaction
- Fixed control codes breaking in append_tokens
- Fixed exception pretty printing a dataclass with missing fields

Changed
----------
- RichHandler errors and warnings will now use different colors (red and yellow)
- Removed the empty line printed in jupyter while using Progress
- Running tests in environment with FORCE_COLOR or NO_COLOR environment variables
- ansi decoder will now strip problematic private escape sequences (like \x1b7)
- Tree's ASCII_GUIDES and TREE_GUIDES constants promoted to class attributes

Added
---------
- Adds a case_sensitive parameter to prompt.Prompt. This determines if the
- response is treated as case-sensitive. Defaults to True.
- Added Console.on_broken_pipe

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.7.1.bb => python3-rich_13.8.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.7.1.bb => python3-rich_13.8.0.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.7.1.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.7.1.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
index 27bc95428..ee66c3554 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.7.1.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "9be308cb1fe2f1f57d67ce99e95af38a1e2bc71ad9813b0e247cf7ffbcc3a432"
+SRC_URI[sha256sum] = "a5ac1f1cd448ade0d59cc3356f7db7a7ccda2c8cbae9c7a90c28ff463d3e91f4"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


