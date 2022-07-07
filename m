Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5325C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:47:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.3632.1657187228880270100
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=qzIukepK;
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
	bh=eiQEBzO6T3bTGWHUZGfOrQOwdykW5lqp/FoKG52gXvg=; b=qzIukepKsNtcyrzY8vaXvpVNam
	y/Cc01n7JIS6bPXQZ0Sauz9HcmNsbEP34rZvNzpHOXYz95oQg3aUV2sCItwIUBdLV6qK2QZ9/PGcS
	UMKKdwxwZL858j5R0q3WQvJnU9CvMtNP+tHzxGlbi1OBcfl9+/wVtnogu5Q8fjikDJUBFO8dQErSW
	M8mfT8Pf8InfewEzOPWnOrC7sJLurY5e1699SJdOAiWZgzAtxgyb4tpApurvIZJPTwh3HD2+dBE3r
	Yzkv5EdUJrsVl0zt0PJYOJoeqMstNo1AspeI0N4fXOheK8Urp3prsr6lnK7ZU84nKZufD1NYeMLrd
	Bfk+qnaQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:48688 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9O7L-0004Fc-K3;
	Thu, 07 Jul 2022 12:47:06 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-tabulate: Upgrade 0.8.9 -> 0.8.10
Date: Thu,  7 Jul 2022 12:46:49 +0300
Message-Id: <20220707094651.1716295-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707094651.1716295-1-leon.anavi@konsulko.com>
References: <20220707094651.1716295-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97771

Upgrade to release 0.8.10:

- Bug fixes
- Column width parameter

License-Update: update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-tabulate_0.8.10.bb    | 8 ++++++++
 .../recipes-devtools/python/python3-tabulate_0.8.9.bb     | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb
new file mode 100644
index 000000000..222e6e7bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Pretty-print tabular data"
+HOMEPAGE = "https://github.com/astanin/python-tabulate"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ad1430c0c4824ec6a5dbb9754b011d7"
+
+SRC_URI[sha256sum] = "6c57f3f3dd7ac2782770155f3adb2db0b1a269637e42f27599925e64b114f519"
+
+inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
deleted file mode 100644
index 19261c3d1..000000000
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Pretty-print tabular data"
-HOMEPAGE = "https://github.com/astanin/python-tabulate"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7"
-
-SRC_URI[sha256sum] = "eb1d13f25760052e8931f2ef80aaf6045a6cceb47514db8beab24cded16f13a7"
-
-inherit pypi setuptools3
-- 
2.30.2


