Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B745C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:05:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.11466.1642770350626254980
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=kl94X5fj;
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
	bh=NChA5M26+9uj3E7l1hlLJquJSALzGzu8Asph5cXD8IM=; b=kl94X5fj3WZbNLeVjRuqABmpqa
	Qv+jBDlZtw4qCZ+lTLOaka6Iul5QlQso4pxhOccsw6plTdFtLmljwBtGQKq6f1m1HjJaQymIbg0Uq
	mt/nEFZiLWewR8RWnf14TPjXtEkcoNNOyBh0F1E+7vAvOZuAAG8qgOXWcQUD2iLn7br+/P4uAIo4X
	fmMhlXWY4tki7pHFvsmP0/mgBAydORlfn8f3EyLwnMt4Ft5446g17V+TdP0/U3vvjrwXZs2DEnNBM
	Fhh1Yg1OUQUEePTaVuFybCaeunYLEUiOA23drO5FNJb7OkHJgrRnzQ49JEfsNg74a8++XTu78U6xM
	UdEc7Rjg==;
Received: from lan.nucleusys.com ([92.247.61.126]:50940 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nAtc0-0003GN-4J; Fri, 21 Jan 2022 15:05:50 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-paramiko: Upgrade 2.9.1 -> 2.9.2
Date: Fri, 21 Jan 2022 15:05:32 +0200
Message-Id: <20220121130533.3973579-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121130533.3973579-1-leon.anavi@konsulko.com>
References: <20220121130533.3973579-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:05:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94969

Upgrade to release 2.9.2:

- Enhanced log output when connecting to servers that do not
  support server-sig-algs extensions, making the new-as-of-2.9
  defaulting to SHA2 pubkey algorithms more obvious when it
  kicks in.
- Connecting to servers which support server-sig-algs but which
  have no overlap between that list and what a Paramiko client
  supports, now raise an exception instead of defaulting to
  rsa-sha2-512 (since the use of server-sig-algs allows us to
  know what the server supports).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-paramiko_2.9.1.bb => python3-paramiko_2.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.9.1.bb => python3-paramiko_2.9.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
index 8cf004aa3..0a54efde8 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "a1fdded3b55f61d23389e4fe52d9ae428960ac958d2edf50373faa5d8926edd0"
+SRC_URI[sha256sum] = "944a9e5dbdd413ab6c7951ea46b0ab40713235a9c4c5ca81cfe45c6f14fa677b"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.30.2


