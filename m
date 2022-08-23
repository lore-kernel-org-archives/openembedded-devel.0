Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2695FC32792
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:02:21 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.30370.1661252538191267943
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=jzHhjm6q;
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
	bh=CxDOFWugK14VLu+ts7m2vYxHE+p6/X0x2xWrFMY3kdc=; b=jzHhjm6qgtAI06Y+N2PKomWkuM
	+fpixZ6AODqwlDLjOR8MkXYNIAb9XmEv6ntUDUFk1AUHqBEzDeBx8EmkK7UNtyVvMmXCjx/40+G4P
	PH8hOWIXctfGSxph49NKl+N2KBpVSwP8v/I/HDAImehU/QoPYkUAv3/voqThJsROqj7GScgRY76n1
	2Hty5vwoDPzywrV5XVUUbfLpDnB4tqB288iTNpcpa+FC269NCvw/5Nc8C4p9NOZwIq2Bn+y7Fwaua
	5LJ7Mqx3XzON7nwU0mm3yxnMIgtDQJFa3Hy3CHlrRzZEBJJ5gREwYuxu5p9P0pFIW3IxebFaZzOGZ
	YGWi+hUg==;
Received: from lan.nucleusys.com ([92.247.61.126]:60034 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oQRfn-0000ni-DV;
	Tue, 23 Aug 2022 14:02:17 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-prompt-toolkit: Upgrade 3.0.24 ->
 3.0.30
Date: Tue, 23 Aug 2022 14:02:03 +0300
Message-Id: <20220823110204.2685251-3-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98390

Upgrade to release 3.0.30:

- Allow zero-width-escape sequences in `print_formatted_text`.
- Add default value option for input dialog.
- Added `has_suggestion` filter.
- Always wrap lines in the Label widget by default.
- Fix enter key binding in system toolbar in Vi mode.
- Improved handling of stdout objects that don't have a 'buffer'
  attribute. For instance, when using `renderer_print_formatted_text`
  in a Jupyter Notebook.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.24.bb => python3-prompt-toolkit_3.0.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.24.bb => python3-prompt-toolkit_3.0.30.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.24.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.30.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.24.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.30.bb
index 9a6798ad3..15627b1eb 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.30.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "1bb05628c7d87b645974a1bad3f17612be0c29fa39af9f7688030163f680bad6"
+SRC_URI[sha256sum] = "859b283c50bde45f5f97829f77a4674d1c1fcd88539364f1b28a37805cfd89c0"
 
 inherit pypi setuptools3
 
-- 
2.30.2


