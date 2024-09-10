Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48958EDE9AD
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18597.1725959013737955438
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YZ3CIq5h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959015; x=1757495015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=j0vJtdw+YWxTAVUQNc4cg648nePOCk8u9aCxSHWJRms=;
  b=YZ3CIq5hkWwHTntpiqGktLD67cpNKwV7u2TH2J2yFbUM3ksn7BqD0ZWW
   t65Ogyhc7tp+rtH8hXkS9esCZTmld0LQ6pwIo+tQTBuQJ+Fd+hABf8SPf
   eVhlCIk983If5n8HfdhgUAs+ZJT6qhTFJzFFofpWX0zsijbfSlQRJMHnz
   axCHiYuZYcVZDIOP3EyB8T5iD7IN5gDFyRlBtcrpOgfYhqNBcSqv+bqim
   qEp2pOmrNUSUJBqU6m/ftJdQMxZs/bqIOQt8fPph3a2BI//ItIdTRAMBu
   X7MvmePz+jksFHeYxAv/ZuiYyvUKUnP+iEiGOUUNNHFV4LerJF/Sm8nxu
   w==;
X-CSE-ConnectionGUID: QXj0UNs9TGeobHjUDjvVMw==
X-CSE-MsgGUID: 9/GOa+kDQXejyNbehez2Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173214184"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173214184"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC1D5E8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C22410353
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CC31C200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80BFF1A01E9;
	Tue, 10 Sep 2024 17:03:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/42] python3-pymetno: upgrade 0.12.0 -> 0.13.0
Date: Tue, 10 Sep 2024 17:02:55 +0800
Message-Id: <1725958990-5719-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.879000-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrFIuBIWrdOeOU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQ9z4cH5hW96YOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SdjDKVBUP/TrJb5sAmqmf8QF9PhoK8FibcboYAhIc/67NJ6
	DKtvCmxH8cSxnm4zaWv5k2lBCtudoOlIrpvRZqbQOaGOpPngbcS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112216

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Expose UV Index

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymetno_0.12.0.bb => python3-pymetno_0.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymetno_0.12.0.bb => python3-pymetno_0.13.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
index 5be6e6319..193760664 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
 
 SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
-SRCREV = "50f427aad264a4793abb94a3c8cbf987fadcd4ae"
+SRCREV = "921812ddad3f147489916c3c7ab7fb7a80d8c646"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.34.1


