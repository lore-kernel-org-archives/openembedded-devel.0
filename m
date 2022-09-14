Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F9EC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 11:58:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.5276.1663156724725044917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 04:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=m1ce2xbU;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mbf1aJ+zc7uYBVbsNX+CrUR6UuJKzV1Bj2OJ9ktasVg=; b=m1ce2xbUXlW+m2aOcGb3vwP72V
	JLlUXuWwjimiKPPBgtP0HFK3AiiAcVQ4bgBMbEjzij+t5X42NNn73D8u6qPH7rmbU1TBJ6vuikEnH
	1AaDyRZPJIb+XlhFclNl+lablBQhQ9BMjv0xObcpXmFUvsIIWBWl6bcO4V24LAN++8du4TAsB/Njh
	nrxA/v3DWH53EZVKB9SXoVX0DjDRKC0nF93FjckEj9YCSkfIJB9P4x1AlIXj/mWShz8ZYl3CJHDht
	CXN+YfAqNY6KtDHQGbc4mKAF6g+AkZVQDoKmIHjZZQpWjK1ynNCw/XzNEZLK4JdfGiur8rwMMmrPj
	60+3i9qA==;
Received: from lan.nucleusys.com ([92.247.61.126]:58898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYR2P-0002R1-Oi;
	Wed, 14 Sep 2022 14:58:43 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-portion: Upgrade 2.2.0 -> 2.3.0
Date: Wed, 14 Sep 2022 14:58:30 +0300
Message-Id: <20220914115833.177477-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914115833.177477-1-leon.anavi@konsulko.com>
References: <20220914115833.177477-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 11:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98791

Upgrade to release 2.3.0:

- Support Python 3.10.
- IntervalDict.as_dict has an optional atomic=False parameter that,
  if set to True, returns intervals that are atomic.
- Experimental support for structural pattern matching (on left,
  lower, upper and right).
- (breaking) For consistency, the empty interval is never <, >, <=,
  nor >= when compared to another interval.
- Comparing an interval and a value is deprecated since it is
  ill-defined when the value is on the left of <= or >=. Convert
  values to singletons first.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.2.0.bb => python3-portion_2.3.0.bb}  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.2.0.bb => python3-portion_2.3.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.3.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.3.0.bb
index 0dad8b0ce..1638d64c3 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.3.0.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b6bfb08a7834787aca076da1200b735d97beef61b60a462b05213e7354a099cf"
+SRC_URI[sha256sum] = "0e9d42838099263201b25517e4c1bd57042b5fe44432d6df38cef72d84d1eb1f"
+
+RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-sortedcontainers \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2


