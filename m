Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5B6C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:19:10 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.5436.1642594749579263055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=MY6JCerb;
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
	bh=Z5d4Dds436dMfSaH/t9Pn94AGT0c7RTuyxApCOJo1i4=; b=MY6JCerbnsva1FePsq9ETeR6u+
	ZjlOeGvjutjBRfPnBRb/0McEeA+nmDbQiC3NOkX6zpTPfhpruc4kgrf3AVwCVroIo0sOn+N7queqk
	vAvKm6Y5QWl84ONoC2cN8YnOFSy1DMtbE7gknVAzCg1I3v3aS/HMF7afuOegbuAsuPbGLyIeETzYQ
	Q6esUrozCvY8pssSU/1B8JQUwy6A1luburLKnmFbhv12qHboOUug5jKB0aW0um9wyQpNTIQZ9CED2
	ZaRneMtiU4x4/Gh6/EJmQQ4jR0K9rMqcOBMbv5Ej7DatCoQNxCwkf3kFTJkcCjRkCmEi4tb3UMSCg
	0+Iske8w==;
Received: from lan.nucleusys.com ([92.247.61.126]:45782 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nA9vf-0006gb-46; Wed, 19 Jan 2022 14:19:09 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-decorator: Upgrade 5.1.0 -> 5.1.1
Date: Wed, 19 Jan 2022 14:18:55 +0200
Message-Id: <20220119121858.1575699-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119121858.1575699-1-leon.anavi@konsulko.com>
References: <20220119121858.1575699-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94942

Upgrade to release 5.1.1:

- Fix so that cythonized functions can be decorated
- Fix an issue in the decorator_apply example
- Fix issues with decorator.contextmanager

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-decorator_5.1.0.bb => python3-decorator_5.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.1.0.bb => python3-decorator_5.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.1.0.bb b/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
index 2e44c3d80..c9c6f9a62 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "e59913af105b9860aa2c8d3272d9de5a56a4e608db9a2f167a8480b323d529a7"
+SRC_URI[sha256sum] = "637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253acbc330"
 
 inherit pypi setuptools3
 
-- 
2.30.2


