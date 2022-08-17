Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE51AC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:35:55 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.30332.1660750551503794882
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=JpXop22d;
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
	bh=qEchy6QLVcYmjVDnsT5HqBWIbbiZHjPYkSBG9nEGV+E=; b=JpXop22djukcZOveCVYvHQQ3sD
	kwx/9BxvtrwwzcLRCAkCPlbOxGj/7ZxiTqEZSbEFlZUylvjOHnv1+WwDq38Gnr/cJ3ZUznJwzmZCm
	klvR2wymjPTU3XDvnfB5L5DTjkypfw9asXFc3ANSOKnYRNrwPnkbzjV2931Tq8E3gLgGh5dewLk4l
	1tkFRJ3S0zpcxradAMQk1upIjN4p4cKodh1Bio88J7pVPbXLgKFsJNaNDiF751IsP8JZFm+ZJp/oD
	PhNw+TrlNxDrWFdX/nuOc/OVIxFIwuWCKXE+CLslCAD90SnpwBh0kM0HdGsMn1pJKDy3lnAoSfhmv
	VatJyxVQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:46664 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oOL6k-0001XJ-Uo;
	Wed, 17 Aug 2022 18:35:50 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-eth-abi: Upgrade 3.0.0 -> 3.0.1
Date: Wed, 17 Aug 2022 18:35:35 +0300
Message-Id: <20220817153538.3853497-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817153538.3853497-1-leon.anavi@konsulko.com>
References: <20220817153538.3853497-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:35:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98307

Upgrade to release 3.0.1:

- Fix small warnings for make docs
- Rename: encode_abi()->encode() and decode_abi()->decode()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-eth-abi_3.0.0.bb => python3-eth-abi_3.0.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_3.0.0.bb => python3-eth-abi_3.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-abi_3.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_3.0.1.bb
index e1f220af9..3d8a67ba5 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_3.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
 
-SRC_URI[sha256sum] = "31578b179cf9430c21ac32a4e5f401c14b6e2cc1fd64ca3587cd354068217804"
+SRC_URI[sha256sum] = "c3872e3ac1e9ef3f8c6599aaca4ee536d536eefca63a6892ab937f0560edb656"
 
 PYPI_PACKAGE = "eth_abi"
 
-- 
2.30.2


