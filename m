Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BAAC52D73
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:46:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2880.1722934012727295909
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RAxwhrlQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934013; x=1754470013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JeZ5ezVGdA7+wd0KFgviRIYn5bS7+nYwSV2th+Az8TY=;
  b=RAxwhrlQp/ybaEj2GObkD/FXMcBlgaioD1nQchuvqkCvtT2LlUUtCWml
   dv08pR6hD6PGielRLTq+VDQssScYH7nK5leefXgyqWWDgyjWp7WGtHBkL
   Ygja6T/s86IAHCmBFOGrlUui9Q91ac4ZBtJkizLlZg24Xq51nW2ZnohWm
   OSilHpWISuFMnSbgQlFW+zYA4Kw6pk1xclvBEyLtVTsZkGSmFU8WyeqV2
   xJ/4l2J3qXdeGU9pM/Xc+LMCMVb63ozNvVmMRGpByV48iMwlJ5BrID8ij
   6CecRa3Ch2WSgOW7Yg3PyOBfhYW8QXEdrAOdYoll04Bf1a8SZYDk5r9GO
   A==;
X-CSE-ConnectionGUID: t367tul6S2OWQT0DNK3gSg==
X-CSE-MsgGUID: pMJi4OaKSzmHWDeriPQfuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882430"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882430"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:51 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43964DB3BD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90399D50B5
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 15C7920050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B90351A0002;
	Tue,  6 Aug 2024 16:46:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/60] cfengine-masterfiles: upgrade 3.21.0 -> 3.21.5
Date: Tue,  6 Aug 2024 16:45:36 +0800
Message-Id: <1722933994-32549-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.058000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v9YuTsoeO+cJN9zZd3pUn7KTz3
	dJ4vVe4M6hUOcTonr9IAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz88wBWKemMeGLan
	NZmF93wffH0kbCqe6P2y+EZ4mqM5y3tYFzMiXqlkH3BuV2uUXm4G6X2YHRdNpsaNcHgXG9O/ZwF
	0HKQiX2iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111519

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-masterfiles_3.21.0.bb => cfengine-masterfiles_3.21.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.21.0.bb => cfengine-masterfiles_3.21.5.bb} (93%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
similarity index 93%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
index c6cde7a96..acd5b1e80 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb843e794feb6890f7697637b461c36e"
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
 #SRC_URI[md5sum] = "5df2f85c75efc351ffadebcc11046a98"
-SRC_URI[sha256sum] = "013ebe68599915cedb4bf753b471713d91901a991623358b9a967d9a779bcc16"
+SRC_URI[sha256sum] = "0adcfcf36d47317776ad64331058a4d2e3669683314716ddb885f8a13309f47d"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


