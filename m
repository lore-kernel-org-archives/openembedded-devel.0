Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0DEC54757
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8730.1724833555554806210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L/Z+DL8y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833555; x=1756369555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GVIKMfk/oV9A+Y9DUFVzg00SG6MPvn6Dzo9ZNEaB3ro=;
  b=L/Z+DL8y8f2ZRYsJLXIYdCpK84It10+tUPa2ZearL76iHaKYjbIg8ePW
   iiMKiD9fKpfm/Lnw/4pr6ofwQidUeArgetwh2Beihc9CwF1x5lgdRS5lX
   8yb9Nxf4xYu/smwLtxwbFoQMwTZx8Dm3+Yul3AKMX9NddmvHzy/GZ7J/F
   xN/y5nJ3663GenK2NVBe3NLwRlAnYWNHgpLKB8DjGiNp/O8h9bruolK8K
   hFmGfF/h8cGCLYwhuMkGM3he7PZKmGyYxqtHmjrlj9GIrpQC+TxEeu7Vr
   uUJ5kWNyFgmmtcF01ISqlVZhDUf41uXAP/yJtCogw/H4XQDL/6q1oxrK/
   Q==;
X-CSE-ConnectionGUID: I4XimvQNQGyIKkleVrT8hQ==
X-CSE-MsgGUID: 79++KIrnSRGXZp7yi669aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913210"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913210"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3A59D64AB
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EB191D9CA6
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C68520079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 293F41A000C;
	Wed, 28 Aug 2024 16:25:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/46] python3-pymisp: upgrade 2.4.195 -> 2.4.196
Date: Wed, 28 Aug 2024 16:25:11 +0800
Message-Id: <1724833525-2162-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.956200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Hf7mdD84mFnYZ5
	BcymZVqji8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFFf9DGEs6r3K2MMM3G+KpidvEZ
	z73eV/hxFgQ67hGeeh7vdf3GMhGhD6GEmMqYjVQzOr49gJNDaJoL2HopbYlawPr4T29443m+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112009

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove broken config.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.195.bb => python3-pymisp_2.4.196.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.195.bb => python3-pymisp_2.4.196.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.195.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.196.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.195.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.196.bb
index 9738ed8ba..44640f178 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.195.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.196.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "3200bc0934fbd51c8146eae3e5174720cd1987307c1a561312b29f96bb52fe51"
+SRC_URI[sha256sum] = "86620b0b77b51eb5d08dcb2c1705ab0ce36813e35f48a488067266f565005dc9"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


