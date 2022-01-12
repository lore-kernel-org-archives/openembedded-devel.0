Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C8FC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 18:35:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.1285.1642012549520147628
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=EsrgcsqG;
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
	bh=nLc3AH4u5qowNP8FdpZGaVvHvLXvjF1jNkmiF0P8MKg=; b=EsrgcsqGzNBs6alJdvbFItqY9S
	RypBOrMmVcaYDw3BTSVQaG85AeftTJh2NpB8o+g4yo7x+BtNyRJ8sb+KmELkTxwwzP6vI44EE++LB
	GnyGJitAqNVGmUNO3KC2h+TS5J0/hyhOnTP8T6aIoI0mAxNjV1xMUCveMVTnxSKUadqnjZds/oSK+
	fg5TE2xEVEdW44CNWrSQ+lXuVvkRYaL1Fpq/XMdZT7uTh9bNnswk/Io5g6mgRHI3DgtWdSunOUnxA
	5DUDXz04gjIlHzav6S7fvQsxjeEpvjn3JGBlH6I1d/K0t9oq78MZADFZpDnvtWEJJGZh0zNReGkXp
	BbF6+cjg==;
Received: from lan.nucleusys.com ([92.247.61.126]:48040 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n7iVF-000Bc0-MH; Wed, 12 Jan 2022 20:35:48 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-requests: Upgrade 2.26.0 -> 2.27.1
Date: Wed, 12 Jan 2022 20:35:29 +0200
Message-Id: <20220112183531.2712341-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112183531.2712341-1-leon.anavi@konsulko.com>
References: <20220112183531.2712341-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 18:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94792

Upgrade to release 2.27.1:

- Fixed parsing issue that resulted in the auth component being
  dropped from proxy URLs.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-requests_2.26.0.bb => python3-requests_2.27.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.26.0.bb => python3-requests_2.27.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.26.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.27.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-requests_2.26.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.27.1.bb
index 406e42a5e..af52b7caf 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7"
+SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
 
 inherit pypi setuptools3
 
-- 
2.30.2


