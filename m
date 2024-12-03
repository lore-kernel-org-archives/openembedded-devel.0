Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7463EE6C5E8
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8202.1733185014942937146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NoepKatu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185021; x=1764721021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aHzO96U4+1YqU1yOqREAQYPE5oh4sOuZJk7lH3ENHyg=;
  b=NoepKatuIDwQi+KL8eXZnMopGhFI9NxwHpaa0R+75f8qNJWpSKZXhlC2
   POFFy6lY6ep0sI/RvolRG8+eUU4k3KTqwbEeBgckk6FLAwjBXnNdzaeqd
   CECpQQYzjDYxSUm4VuJvm4u8yY10w4bU/UC2WOckCMqrSmUCNiwuP3nIG
   89iubLBiZ9wq0/QpkGg5aaEEsf0KlkU9r6mwLAKvL0cr9GRZjcGTmk6cC
   cXWScW4DTEMXC4mcdUtsOXMRG2G47XQ31nTsOW+PfPzTvJln/8TtXhveT
   dFv3U0nhqf2ArKqR/XPBzQih9roDLmqEiRR0REhXw74R9B43BGYNoGanz
   A==;
X-CSE-ConnectionGUID: 01WFfbQrTkywYKF9VzeanA==
X-CSE-MsgGUID: Z8nB8FO+Sz6hCS5BqvXt6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="181550259"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="181550259"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C6E2AEA890
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C928CF7D9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AFEB20071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9DCC1A0003;
	Tue,  3 Dec 2024 08:16:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/34] python3-cppy: upgrade 1.2.1 -> 1.3.0
Date: Tue,  3 Dec 2024 08:16:22 +0800
Message-Id: <1733184999-27041-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-2.342700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrFYsDygJuoUqU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9y4VFP6muDhmAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEcNyNJgaTM//7rkJqnBB/UfAd
	ve2b4gU3HqrBJnJfTKA5ZLAaW3hL1m61L4WnEbLr8uvfdRsnrk3jDmrgB3a1JIRmw8QVFllOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114158

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
 prevent liinking dynamically to MSVCP on windows

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-cppy_1.2.1.bb => python3-cppy_1.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cppy_1.2.1.bb => python3-cppy_1.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-cppy_1.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.3.0.bb
index 7817401fa4..58b5a067eb 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[sha256sum] = "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
+SRC_URI[sha256sum] = "da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604"
 
 RDEPENDS:${PN} += "python3-setuptools"
 
-- 
2.34.1


