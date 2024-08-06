Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC16AC54741
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2882.1722934016964852790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K+A+9r1t;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934019; x=1754470019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=K1DdPVQoqo/pFOS9KkJsbjhVxkJrFOU0qZR7lbJUdlI=;
  b=K+A+9r1tiTbBE2ZgzRiokQbgfpW2haqM/3F8H97eIq3rnObNVsDdqgj2
   rrnUm+NcHi+QIu1sTeThgMKAwVPNjOkcRIVZLt3E6VfbGso9ePBFo61e+
   v4IjNV8bSM81QJE0i3xruJ98upXOjs4WHbeVgkQhbqK5mtfjoXr2IzpFX
   cRqWypQ+8LgrwgWgaCZudPkG5jvvDICN+MhyVGl/+mtl8xEmqT2zRptys
   CQtmr+cvqJDA1QMPvOqokprE502YM+0zDqGQ7Bp2JgmF8128jl8iZLLTB
   dlUKiX7m5EVsdY/kOXVKC12GVoCP0EnCIjpc53xMDBADfHnRZ6dgUQGjf
   w==;
X-CSE-ConnectionGUID: B+MUBceDQz6ykEaAanSQCQ==
X-CSE-MsgGUID: yF41x1kDScmec5SMOehqOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="149361404"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="149361404"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BA3CD8008
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C4EB3D8B2F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66C2520076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 306B51A000D;
	Tue,  6 Aug 2024 16:46:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/60] logwarn: upgrade 1.0.14 -> 1.0.17
Date: Tue,  6 Aug 2024 16:45:56 +0800
Message-Id: <1722933994-32549-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.107000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v8Ea8g1x8eqF2g57jYcpVEO4nP
	T8jZv1NHi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDAFcEKqLcgqisbptrlbkzTU+K
	7iF6Fr0e/h3bbMLrHNWfqGd9ZLld0akyKd+QYXs9HZZ///2NLub1DdvliWPpkppeMaMlQdf+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111536

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwarn/{logwarn_1.0.14.bb => logwarn_1.0.17.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/logwarn/{logwarn_1.0.14.bb => logwarn_1.0.17.bb} (91%)

diff --git a/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb b/meta-oe/recipes-support/logwarn/logwarn_1.0.17.bb
similarity index 91%
rename from meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
rename to meta-oe/recipes-support/logwarn/logwarn_1.0.17.bb
index 0738b50bd..6be82979a 100644
--- a/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
+++ b/meta-oe/recipes-support/logwarn/logwarn_1.0.17.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "https://s3.amazonaws.com/archie-public/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "e544a6230673ea54f7430bf817bb39d8"
-SRC_URI[sha256sum] = "8dbfcf9b28c782ab3bddd6a620d4fb95d1b0ffcbe93276996cdc4800aa9aebd1"
+SRC_URI[sha256sum] = "062d197349f4a43d8f69887fc642cb58b59a8e2cc54cc951d5c1c6abc4809a9a"
 
 UPSTREAM_CHECK_URI = "https://github.com/archiecobbs/logwarn/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


