Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA03DE69EAF
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8074.1733185016767824925
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RGVAaKPQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185017; x=1764721017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yGvNWyr+ZJY+pXlPHxa/Yf/C0flVUEJzTvGK1IuqoJY=;
  b=RGVAaKPQlV9LdFnoAjvPFj/xoymS106Ig+wYx/swQOxqJGXw/Njsjb41
   RSiixVpzzbtU+Kbkiu1vfgcRPTtDuSJfQlJGeGSZ5XUwfU6iMQWB5tj/b
   +c/CmntcdlUavsZZs3xnZAHbsDRaE2gX7sJ1MQ5PI1nYy636zIwTgGz3T
   VTcBpQpz6mNsEVeMbMcnn/o+8d81tWVnXww82DSncGkRO6o6jvRuzn7Bf
   R+6qAjlGirHsKk1B0fsHtDafqDD+s/EX/Fs+u1lG5SQ3HkHu0ZmZTpatU
   ib3mJjRsMD7brBTTTa4j1bRXygRnQdg9dyHuO9wZNXDvVCP0baAvCuOK8
   A==;
X-CSE-ConnectionGUID: JwatVBmYTPWPx+cNXiKndw==
X-CSE-MsgGUID: US8eFNNrR/C92xlFM0cgoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="184689066"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="184689066"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CEDAD6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B767D5085
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC8226CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4CDE71A0003;
	Tue,  3 Dec 2024 08:16:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/34] parallel: upgrade 20241022 -> 20241122
Date: Tue,  3 Dec 2024 08:16:15 +0800
Message-Id: <1733184999-27041-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-2.136200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrTq6L3EFhq9HpEd1UrzmFRxq
	dt22rdOg3WhgsWJsCXANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2fr0
	mqpu8k1/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDTB0vXy9FINhaCXzYRdfC7FyI
	hrLTgXDytMQONlgYKjBck4dw1BxznuwgEbO+YxBQgrZTYlSymhN0a9A/YUklZ+X1puXdG37+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114152

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* --pipe --block works similar to --pipepart --block if --block size is negative.
* DBURLs can be written with / instead of %2F for sqlite and CSV.
* Bug fixes and man page updates.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../parallel/{parallel_20241022.bb => parallel_20241122.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20241022.bb => parallel_20241122.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-oe/recipes-extended/parallel/parallel_20241122.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20241022.bb
rename to meta-oe/recipes-extended/parallel/parallel_20241122.bb
index 30ff9182ee..36b522dbcf 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20241022.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20241122.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12"
+SRC_URI[sha256sum] = "1a9e752f42c17ca10bc07d0a63a2ca6edcee532282e55d2b34bd9dd14c978a58"
 
 inherit autotools bash-completion
 
-- 
2.34.1


