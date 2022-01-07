Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB54C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 17:47:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.10130.1641577670506737069
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 09:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=iI0L3MMe;
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
	bh=2o3sr4seINpd/eJ+/5Ra9qiEa8t/BRXvm9IfrWPH43w=; b=iI0L3MMeMh6Ip/DNFBG9LOFm6T
	YrffD+5oBdie6xYfENqsDi/226oRXgJrpT2b6Z3+AEpTRq35ZhprbuqJRdK3cIYd7DtVF4xCKX/S2
	0QLk7vQNgNw4UGkqvuFrIQWE3pKsXZzqv0ObBNrnJJieQ0cQ6+DqYsUBZd5kX9YZLDlAZffofIaYH
	/aLiM/PXAOzKSMnmhLydQFdGDdYwAApijqWtGMjNhrJc97QyIPpbsUw6MYexcOa0WsYoLH1fpHlfG
	Vu/L3ENt/TQ/MLU+0O8+tX0kSxJxrcrsJu/vA+jwm9bkZYqm08jCSw6lI1u75/FNXV3yYu2w9zcaz
	0W6+b4zA==;
Received: from lan.nucleusys.com ([92.247.61.126]:48914 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5tMj-0000YW-73; Fri, 07 Jan 2022 19:47:50 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-robotframework: Upgrade 4.1.2 ->
 4.1.3
Date: Fri,  7 Jan 2022 19:47:29 +0200
Message-Id: <20220107174730.3326962-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107174730.3326962-1-leon.anavi@konsulko.com>
References: <20220107174730.3326962-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 17:47:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94695

Upgrade to release 4.1.3:

- Fix to a regression related to parsing reStructuredText files
  that was introduced in Robot Framework 4.1.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-robotframework_4.1.2.bb => python3-robotframework_4.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.1.2.bb => python3-robotframework_4.1.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.1.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.1.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.1.3.bb
index 0c3de5da7..a40d047d7 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.1.3.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "7ea2454b847cfcb211e2906743c5c4a868ab096ab4ce1547ab102d91fb224443"
+SRC_URI[sha256sum] = "d2675cbe3e5a4c90be3ddb61be3b88cc0d6ff503c298ad8f8a78aad14e71e886"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.30.2


