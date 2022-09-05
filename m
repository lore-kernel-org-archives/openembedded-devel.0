Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D45EECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 14:10:03 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.25217.1662386996654211624
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 07:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=L3fSSiAk;
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
	bh=j/CXjFnKlrOCl5OtnoeTTAhB+UKcIOB05Y7bR+uf/8Q=; b=L3fSSiAkF5eiBgmtFJoxZYI1Uv
	1Eye7EsnMETmNb0WiPGr8CD1FsmU0HoO/qnofqWyV7bV8UuOIeu+UBeisYFhHxOHQek1T8EitsfND
	g2JWbdp3+yIuxVNz5af5edjdDHZypp5ltQvdCID48eiawNhX6O4pc3lMVYO4yGH/ZdRVY2Bq/Y0VQ
	1qA/Sl7Jhx5Ox6+IucbpIOM95f6qiGVrApnzF2+g+iUEQ970sTfJu1mUpV0pMvJCEsMTQV+2NYNCC
	MYDPV8u9X80F71TW8hZ/mhsCT0M2yByhwqdj0YDedAfsOa4QR3nQLHtxm29Sfrdgde33ruSFx3u87
	CUoe+RQw==;
Received: from lan.nucleusys.com ([92.247.61.126]:51094 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oVCnf-0009xE-R0;
	Mon, 05 Sep 2022 17:09:56 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-prompt-toolkit: Upgrade 3.0.30 ->
 3.0.31
Date: Mon,  5 Sep 2022 17:09:44 +0300
Message-Id: <20220905140944.2017445-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905140944.2017445-1-leon.anavi@konsulko.com>
References: <20220905140944.2017445-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 14:10:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98667

Upgrade to release 3.0.31:

- Pass through `name` property in `TextArea` widget to `Buffer`.
- Added a `enable_cpr` parameter to `Vt100_Output`, `TelnetServer`
  and `PromptToolkitSSHServer`, to completely disable CPR support
  instead of automatically detecting it.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.30.bb => python3-prompt-toolkit_3.0.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.30.bb => python3-prompt-toolkit_3.0.31.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.30.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.31.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.30.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.31.bb
index 15627b1eb..0b8962ded 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.30.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.31.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "859b283c50bde45f5f97829f77a4674d1c1fcd88539364f1b28a37805cfd89c0"
+SRC_URI[sha256sum] = "9ada952c9d1787f52ff6d5f3484d0b4df8952787c087edf6a1f7c2cb1ea88148"
 
 inherit pypi setuptools3
 
-- 
2.30.2


