Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1160AC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:35 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.7367.1645622253863499203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=vdHdBpzW;
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
	bh=Eu+TUjfzbpdGM1n7ZyevDSrFyuWzItrcZsruCNiJGXo=; b=vdHdBpzWQHNJXnoNIlaMs/GHe6
	MV7Ya9uGTYACAr2AWZv8yKBpjRMhjUC2RejXmtHscyi9kisNMbkpT5V2mrvGe8EPnLLt3+pP5r747
	j9V7qI587RP2ag+DAtp1G+wgjbI7MvNnRog7VZ3OWbucnKXVwhobJJMfG40f+kKk+IdUtSiWz5qoT
	dy/ZF4lB6iq65Ef1yYVq1cM+hg/ojVavWJE85RmjynsJAaWxSIn/JkLvWTck3pyIivBGiWKKz+0NE
	UOHX6+mVIP65zDoJBgHmg6tULvBOXoCGIXhyY68T2hS5SiEnGH5yAwqenuNp1ASz+XyazCNNDDUFI
	h0GRr/hA==;
Received: from lan.nucleusys.com ([92.247.61.126]:51954 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMrYr-000Bp1-NH; Wed, 23 Feb 2022 15:17:33 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-bitarray: Upgrade 2.3.6 -> 2.3.7
Date: Wed, 23 Feb 2022 15:17:18 +0200
Message-Id: <20220223131721.1683054-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223131721.1683054-1-leon.anavi@konsulko.com>
References: <20220223131721.1683054-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 13:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95478

Upgrade to release 2.3.7:

- add optional step argument to `.count()` method
- add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.3.6.bb => python3-bitarray_2.3.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.6.bb => python3-bitarray_2.3.7.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.6.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.6.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
index d4fb6ed76..cac003a4f 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "3bfdb59ded15c961e6e3d5b7f167155cda053be2475ea8017461df0b4d820b7d"
+SRC_URI[sha256sum] = "4da790ab193e993107f3ff0aebc4f8d6ad5196a19071fbafad16b02898a44fd7"
 
 inherit setuptools3 pypi
 
-- 
2.30.2


