Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0A6C6FA8A
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 11:58:53 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.5361.1663156732186384528
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 04:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=GkiQbLA+;
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
	bh=eVqq+K4xO3HOg5StAhClV26yLcyF92EUGBO6ZNHrzVw=; b=GkiQbLA+h/owmXZh0oL15kJe7x
	OaQQDvT4fTsGVHKVQLKFddR8deYzhdnvzKgSctJT14jSbWDK70UHEc2eYrSSW+M7W0faO+Yqgbq1N
	BMhMWXvvXrEX4kH0GPWvJL1EnupzWbIdizA3fDkCsRlfwhl9R/C0kuriU2IhmiF1RzioD4U/im/kV
	BFYGViTYatD+XL8B70+xgEhvgWSfLGuObOgjOBAxcyFNHabQNASdPzyq7Nj2aORV5jPwu+nq1goKM
	cpyKUXYo1YYDfrOjjZwUSO6qXmosTx9ssyF4Z+hQ7biOBf9f/h/Q6fMgoSxpYjsI+EnGNq5TE3QnV
	/hbswduQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:58898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYR2X-0002R1-0q;
	Wed, 14 Sep 2022 14:58:51 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-prettytable: Upgrade 3.3.0 -> 3.4.1
Date: Wed, 14 Sep 2022 14:58:33 +0300
Message-Id: <20220914115833.177477-5-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 11:58:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98794

Upgrade to release 3.4.1:

- Add option to specify line break character used in pagination
- Add header alignment attribute
- Revert "Add header alignment attribute"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-prettytable_3.3.0.bb => python3-prettytable_3.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.3.0.bb => python3-prettytable_3.4.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.3.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.4.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.4.1.bb
index b98ee4942..c8b50f0b2 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "118eb54fd2794049b810893653b20952349df6d3bc1764e7facd8a18064fa9b0"
+SRC_URI[sha256sum] = "7d7dd84d0b206f2daac4471a72f299d6907f34516064feb2838e333a4e2567bd"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.30.2


