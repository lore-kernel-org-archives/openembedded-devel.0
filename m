Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA83C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:02:21 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.29941.1661252535947479539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=QekDnjY5;
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
	bh=U8DbVWIiavFKLlMcWoX7Mu9Mdic/uQaafI940JG/KS0=; b=QekDnjY57xdjVdcogTINdeepKD
	aqXvi2uSb9XxC8jCYs4zsBvgXaCm1bHm5yi+IlqujZzukT40DLb5m8j71zU+sz4pePvkMthGBP/nJ
	WBK4axjC9Agx3SZbc31rKMqDWrot16oXkHEViQPNRzRBqgKve+g5njFz/1X28fw/MWQGIsMsXgTKF
	+zsJYHSBEIlzHCPKU3b9Zse9zcfp76jB8chgOuSn1ofwdPt/ooFxLm02L15gkzP8At2F5W5ffTDmC
	tGHbWA8KM97CgMa1ghQMT29F1UBDiHcwRlEwEEY0mmtNmh/Fxv6bbT6+HJDlKwjZZuZIHYjmNg4pS
	W40NstWg==;
Received: from lan.nucleusys.com ([92.247.61.126]:60034 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oQRfl-0000ni-9r;
	Tue, 23 Aug 2022 14:02:14 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-typed-ast: Upgrade 1.5.2 -> 1.5.4
Date: Tue, 23 Aug 2022 14:02:02 +0300
Message-Id: <20220823110204.2685251-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823110204.2685251-1-leon.anavi@konsulko.com>
References: <20220823110204.2685251-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 11:02:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98389

Upgrade to release 1.5.4:

- Do not include now private code.h
- Fix Python 3.11 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typed-ast_1.5.2.bb => python3-typed-ast_1.5.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.5.2.bb => python3-typed-ast_1.5.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.5.2.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-typed-ast_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
index 55cd78ce8..e6c1746a8 100644
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = "typed_ast"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "525a2d4088e70a9f75b08b3f87a51acc9cde640e19cc523c7e41aa355564ae27"
+SRC_URI[sha256sum] = "39e21ceb7388e4bb37f4c679d72707ed46c2fbf2a5609b8b8ebc4b067d977df2"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2


