Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B6FC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:16:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.16673.1707203779536171035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A+IUbguS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707203780; x=1738739780;
  h=from:to:cc:subject:date:message-id;
  bh=PLgglN4TBoX0v3IAhgCIgg+3yc/9Z+NWzqtUsStYuag=;
  b=A+IUbguSDvBgEDVG1lTADwoFnysuoVuY40ZCQ4YzADPXrdiotzZoPICm
   NUeBPYbKYScLAkuZ37mgSWbok4iB5nxBKItFChBiCSSKD/BB+JZ1efCT1
   /PjFLAjtvqEF3e9i6YOnaAIWpckpRbIgdbK0YLFXWrZUz0CAKKPt4n9xJ
   n1rxA9fLHfYVASiACIOLsY3QSVGX11QC/uH+6fFyHgWw+RLRgqNFEN8DP
   9vVQcMc8hgFjxhxh2K8yC4E4uf8pYeN/SltzfZ2Y9ZQO4mCneFWrhZ5d/
   GE9xBcWmvghzyCeS+6uahuTb442bpezvkBixHKZ4J2BYZvUnl2HLsWOmu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148385261"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148385261"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:16:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BE1826A753
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:16:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A2BBCF7C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:16:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E792F6C82D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:16:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9CF791A009A;
	Tue,  6 Feb 2024 15:16:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libcbor: upgrade 0.10.2 -> 0.11.0
Date: Tue,  6 Feb 2024 15:12:57 +0800
Message-Id: <1707203577-4385-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.338000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkeZzJlaRLGxb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah9bJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6hxA
	kpk7gFyz+VFFmFsmA0Hc2JdzkxEL04ICzImF9pd3I00VDfo26P2vXi1AmtKeyWu9Pg7HzSXSBlu
	oSpc75jo90LS9OaSLiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108591

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Updated documentation to refer to RFC 8949
- Improvements to 'cbor_describe'
- Fix 'cbor_string_set_handle' not setting the codepoint count
- 'cbor_load' will no longer fail on input strings that are well-formed but not valid UTF-8
- All decoders like 'cbor_load' and 'cbor_stream_decode' will accept all well-formed tag values

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcbor/{libcbor_0.10.2.bb => libcbor_0.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.10.2.bb => libcbor_0.11.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb
rename to meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
index 3ac270e5e..28bd5b5ae 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 
 SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
-SRCREV = "efa6c0886bae46bdaef9b679f61f4b9d8bc296ae"
+SRCREV = "170bee2b82cdb7b2ed25af301f62cb6efdd40ec1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


