Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F25AC433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 12:37:43 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.941.1637239060695238264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 04:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Gi2Je6wz;
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
	bh=zy0dFEHtYb+GT1580kkCT8FoQoYiO4fvuBDEfkvrZcw=; b=Gi2Je6wz12jvQlI+IVWJLp2KwY
	9VEOAtz/NAXpEnoo0ntjxMpu1AbtaYW63zqGeuL4nlg31gpvaB0qVpvO4h5ZlSzpqVN2ZkJtjFLqc
	F5pbX04ZZcqcLPW5kmjGTGYoTrYG6WmPcZRq6BgU5fgrU+s9dXJqwifQ8JmnedNfFDAp69gI9mqim
	W3VYP1e0290op8lDz6JEjXQ8Y+YWkdgZNmP2Rn+7W9j+zJr/mQnJOv0IXQvdRP+DjMpDslr9CCclV
	nM//ZWqH0tICwGgTN6ucSSmvWzMWihmhdxTaVP1jBdrg1lNYfQP+jMDwqzrsi2BYLdUsbQ7D7fWlQ
	JFRa7KTw==;
Received: from lan.nucleusys.com ([92.247.61.126]:60154
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnenS-0007sV-Ht; Thu, 18 Nov 2021 14:37:39 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-parso: Add runtime dependencies
Date: Thu, 18 Nov 2021 14:37:26 +0200
Message-Id: <20211118123727.45056-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118123727.45056-1-leon.anavi@konsulko.com>
References: <20211118123727.45056-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
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
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 12:37:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94024

Add runtime dependencies for parso.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-parso_0.8.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
index afcfabb95..950e82d1e 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
@@ -9,3 +9,9 @@ PYPI_PACKAGE = "parso"
 SRC_URI[sha256sum] = "12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398"
 
 inherit setuptools3 pypi
+
+RDEPENDS:${PN} = " \
+	${PYTHON_PN}-crypt \
+	${PYTHON_PN}-difflib \
+	${PYTHON_PN}-logging \
+"
-- 
2.20.1


