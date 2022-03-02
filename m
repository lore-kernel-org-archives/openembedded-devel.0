Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F19C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 22:27:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.4133.1646260073236246601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 14:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=NKWGVrJX;
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
	bh=m1ONUV/amGxI57FSYJFlrl05PFUB7NH63ZJ7u0FP9Is=; b=NKWGVrJXq77rAI+qv/vXeJxUbN
	Freg3ntTcI3L658z6iQS1gU/DhsS9cV06LgITh0OBNbnXY8b3SWzveNlw1WWDOSGGt1zDozRr2lSg
	VAnj7Fq2VpP+2cSWCrXMq3ZGuNiXze0DLClkiPpumZMNDbTvd0UCOVmpTspeXfWOgCA4upa3PfDb1
	0YAHpB8cFx/j0eUdOqkmqmlky6pr67IMTwI6WNmscXYJgKcPNOhx0GE7gYLfGLzs0bXk8i4EgfwMA
	CJ5YtDaczOKInW+sbnq/O49QYxc8sHBtWlQt+I8uLskOrWhvSi8wGvLzu2ZQHRx2v+1gzftLBWJBu
	pgvkyH1Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:32944 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nPXRw-000BsC-II; Thu, 03 Mar 2022 00:27:52 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-h11: Upgrade 0.12.0 -> 0.13.0
Date: Thu,  3 Mar 2022 00:27:36 +0200
Message-Id: <20220302222738.1047918-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302222738.1047918-1-leon.anavi@konsulko.com>
References: <20220302222738.1047918-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 22:27:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95716

Upgrade to release 0.13.0:

- Clarify that the Headers class is a Sequence and inherit from
  the collections Sequence abstract base class to also indicate
  this (and gain the mixin methods)
- Switch event classes to dataclasses for easier typing and
  slightly  improved performan
- Shorten traceback of protocol errors for easier readability
- Add typing including a PEP 561 marker for usage by type checkers
- Expand the allowed status codes to [0, 999] from [0, 600]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-h11_0.12.0.bb => python3-h11_0.13.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h11_0.12.0.bb => python3-h11_0.13.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.13.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-h11_0.13.0.bb
index 4cd0d4de7..afc643965 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.13.0.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "47222cb6067e4a307d535814917cd98fd0a57b6788ce715755fa2b6c28b56042"
+SRC_URI[sha256sum] = "70813c1135087a248a4d38cc0e1a0181ffab2188141a93eaf567940c3957ff06"
-- 
2.30.2


