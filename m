Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BB9C32774
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 14:18:45 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.18583.1661177918803221146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=BN+KiVFC;
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
	bh=Z0yqvHIiXgMbsoHDJzcEYdsEdU7DsxJ0weWHsHVZMb4=; b=BN+KiVFCuRB30UhTsmxc2VrPMN
	XEdm0R0pn6xX4lhwQG5EXNCiQ3o283kRAzquJyiN/aJgZk/e5ftRGxpkq+qGgVrbht8vjNaN2K4cy
	OL2ZTsybEfNPnjfynhJCrrJdMR3WtI2IsW0l9AzkD4QPLIaDrveht10ZgjGR1iRjPYLPG5ct3VZKR
	jrjeeFsUpR5GwxqHI5zVQnG0A/JVfnmN0AvA1zc4OGKr661cFs3TBfCOjdJtDzYemgJifURLREz7H
	raJ5BCwV9S104EZrdcaQWmqI+ZyvG5+h1HmFTOeRPSCdmyqr1ioUq1SSnWIc1pydFkPp6J0M8SIG4
	1f0DD9+g==;
Received: from lan.nucleusys.com ([92.247.61.126]:58168 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oQ8GC-0007Y5-8k;
	Mon, 22 Aug 2022 17:18:38 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-regex: Upgrade 2022.7.25 ->
 2022.8.17
Date: Mon, 22 Aug 2022 17:18:28 +0300
Message-Id: <20220822141828.2554564-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822141828.2554564-1-leon.anavi@konsulko.com>
References: <20220822141828.2554564-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 14:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98367

Upgrade to release 2022.8.17:

-  \v for vertical spacing, added \p{HorizSpace} (\p{H}) and
   \p{VertSpace} (\p{V}).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2022.7.25.bb => python3-regex_2022.8.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.7.25.bb => python3-regex_2022.8.17.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.7.25.bb b/meta-python/recipes-devtools/python/python3-regex_2022.8.17.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.7.25.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.8.17.bb
index 437563b1c..4999fc64f 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.7.25.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.8.17.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bd0883e86964cd61360ffc36dbebbc49b928e92a306f886eab02c11dfde5b7aa"
+SRC_URI[sha256sum] = "5c77eab46f3a2b2cd8bbe06467df783543bf7396df431eb4a144cc4b89e9fb3c"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.30.2


