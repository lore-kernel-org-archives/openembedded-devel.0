Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5BFC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 22:27:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.4041.1646260076164520745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 14:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=GhiFkEhE;
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
	bh=HNjI4qEAqGIg8kXAh9qLCnbdUgd1lcX10oYGgv8eBMM=; b=GhiFkEhEzDY3HPl9aIYTKZAs3h
	yknltBfGFFdbNAIlq9uC+tSk0X2R/65XXBx1tQ+G6YbbO/72yxR73DRHhNTfSnxNBN9aqjHu3hHzS
	4Owsc4bfDemtliMPmnbvS6raHpS0UMAloOS866gIlg7SNSG6cae+orz2Mi9mYnRQwVB08BL+j0mcu
	U+IXiFLfyAyGYfsQYeb2hOZEWMF51CARFrXIY4WW94omVnRn23q/tjdIjNwwuAyMtFNl7KmnV68st
	qCs7BwGxiD/t4Qu+t9JfCklpYi+plhBsp7okGott+meUelb5XtRQaRQ4+RkOEQXM1nYJDkGvVLH4l
	C6TBee0A==;
Received: from lan.nucleusys.com ([92.247.61.126]:32944 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nPXS0-000BsC-Nh; Thu, 03 Mar 2022 00:27:57 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-typed-ast: Upgrade 1.4.3 -> 1.5.2
Date: Thu,  3 Mar 2022 00:27:38 +0200
Message-Id: <20220302222738.1047918-5-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 22:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95718

Upgrade to release 1.5.2:

- Add support for building aarch64 wheels
- Remove update process document
- Port ast27 to Python 3.11
- Define _PyUnicode_DecodeUnicodeEscape even on Python 3.6+

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typed-ast_1.4.3.bb => python3-typed-ast_1.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.3.bb => python3-typed-ast_1.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-typed-ast_1.5.2.bb
index c482251b8..55cd78ce8 100644
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.5.2.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = "typed_ast"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
+SRC_URI[sha256sum] = "525a2d4088e70a9f75b08b3f87a51acc9cde640e19cc523c7e41aa355564ae27"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2


