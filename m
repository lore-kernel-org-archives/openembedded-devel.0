Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589F7C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:24:16 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.10497.1660310645610303914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Yql7Y4se;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5CWZBV5fj6TyQ4zdxwAp/a9MpCoTylMiqf4Nm9E+Vr8=; b=Yql7Y4seJoN7BLnyGRiTBKeSXW
	CtrGvSyjedXU1gXC6JgCwqc/THa7Fj/CM0LcBefxoo7BzHxjoyuhShbr/DPin04Dmb4f9vY/+6QZ2
	p92knP2vJachwXspALFZfxqaLDUhtOKWaybFvEy6VbuFGDYba74L25FqqcTKQardF1u9iEvOj10NB
	EEmVyNhwOK6r17Q5q3FK6kJ8H/m/ngfRFzcXVHi1kGmL4DwrnCvA+HjbbQFCXUFM6q5/XnaSe4Uqm
	3i1eNQSRPbevNdLqLGZvBYX4mZO/wQv0uHsrYRqZDQe2Ygrc2FSAHxAEgWdc6VoHkz8nopdZl2l6d
	V5qbAtaw==;
Received: from lan.nucleusys.com ([92.247.61.126]:37172 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oMUf7-000B58-UO;
	Fri, 12 Aug 2022 16:24:04 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-nocasedict: Upgrade 1.0.3 -> 1.0.4
Date: Fri, 12 Aug 2022 16:23:51 +0300
Message-Id: <20220812132354.1588599-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 13:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98213

Upgrade to release 1.0.4:

- Various bug fixes in dependencies and test environment

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-nocasedict_1.0.3.bb => python3-nocasedict_1.0.4.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.3.bb => python3-nocasedict_1.0.4.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.4.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.4.bb
index a47c4a455..006799c8b 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.4.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "8220b97ba06b08eb2deded774c406c77e0ca0d5352ae71249f6f9d1f2a17bd7b"
+SRC_URI[sha256sum] = "7c111da4cefd244433cb63377aff081a40f84bddae9e6f376c67f086c0f806da"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-six \
+"
-- 
2.30.2


