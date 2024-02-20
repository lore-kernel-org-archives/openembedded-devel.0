Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB8BC54798
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.9332.1708419298545787483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TA8jJM7N;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419298; x=1739955298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=I38n7PZ6Uz3uS8yTnf8mXVPE7ggkwoV3px6/RZJoHTU=;
  b=TA8jJM7NhIuZhb46muAlPJUxz07uNmSwuXGx6ctmZuQdJDUdgobqQfYi
   PqBEDzlPl5c+RaaAQ/z+BU3/X7rn8BnGP6AnJ5Exb9CkTvdbLokgZ8i7e
   FoSlOpIap4uX63nm42ZWgplnekZ+5ocFD3dlqikbXEYWIkfRk5buDLFcZ
   VwDtnTzspdXxgOKRahOhVuhP41oPL1ghiBVuefXiR+RsPLfUBor9EYYeM
   E5jI+mCte5N9SqerGec0v2zNoDnIzosBIq+Wn5jn8WyxhKwrWzHjaHzXY
   LPIc9TlqtLQI3npoN3eBlo7JRIbWsLl+89uPymw/CJc0khoPo0kHRQg/x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149872558"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149872558"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AF00F256B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84834D622F
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26BC3200A7683
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB6FA1A006B;
	Tue, 20 Feb 2024 16:54:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/26] python3-gspread: upgrade 6.0.1 -> 6.0.2
Date: Tue, 20 Feb 2024 16:54:24 +0800
Message-Id: <1708419281-26047-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-0.973700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa3zndiJkHFMhJcjfum7DjO6lIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzfookL6HpVwwH3C
	vEni0RQg5z7t9GZiRj/4TZAQEoALeHB9F6KOL9Mv+XSO8Gc+5MMFdOzKujMYM9fEIDpPSkn/q5W
	7wZZVw9iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108929

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixup gspread client init arguments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.0.1.bb => python3-gspread_6.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.0.1.bb => python3-gspread_6.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
index 7854b7562..6d8f4b411 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "8c8bf83be676a019d3a483455d8b17b442f2acfc620172f245422ca4fc960dd0"
+SRC_URI[sha256sum] = "0982beeb07fa3ec4482a3aaa96ca13a1e6b427a0aca4058beab4cdc33c0cbb64"
 
 RDEPENDS:${PN} = " \
 	${PYTHON_PN}-google-auth \
-- 
2.34.1


