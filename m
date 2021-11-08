Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0117C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:42:46 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.43062.1636368165969819299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36832 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mk26r-0005f5-M6; Mon, 08 Nov 2021 12:42:42 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-soupsieve: Upgrade 2.2.1 -> 2.3
Date: Mon,  8 Nov 2021 12:42:35 +0200
Message-Id: <20211108104235.24727-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108104235.24727-1-leon.anavi@konsulko.com>
References: <20211108104235.24727-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Nov 2021 10:42:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93873

Upgrade to release 2.3:

- Officially support Python 3.10.
- Add static typing.
- :has(), :is(), and :where() now use use a forgiving selector
  list. While not as forgiving as CSS might be, it will forgive
  such things as empty sets and empty slots due to multiple
  consecutive commas, leading commas, or trailing commas.
  Essentially, these pseudo-classes will match all non-empty
  selectors and ignore empty ones. As the scraping environment
  is different than a browser environment, it was chosen not to
  aggressively forgive bad syntax and invalid features to ensure
  the user is alerted that their program may not perform as
  expected.
- Add support to output a pretty print format of a compiled
  SelectorList for debug purposes.
- Some small corner cases discovered with static typing.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-soupsieve_2.2.1.bb => python3-soupsieve_2.3.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.2.1.bb => python3-soupsieve_2.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.3.bb
index a656af6246..3e0e6f0ee1 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67"
 
-SRC_URI[sha256sum] = "052774848f448cf19c7e959adf5566904d525f33a3f8b6ba6f6f8f26ec7de0cc"
+SRC_URI[sha256sum] = "e4860f889dfa88774c07da0b276b70c073b6470fa1a4a8350800bb7bce3dcc76"
 
 inherit pypi setuptools3 ptest
 
@@ -12,6 +12,10 @@ SRC_URI += " \
         file://run-ptest \
 "
 
+RDEPENDS:${PN} += "\
+        ${PYTHON_PN}-beautifulsoup4 \
+"
+
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-beautifulsoup4 \
-- 
2.17.1


