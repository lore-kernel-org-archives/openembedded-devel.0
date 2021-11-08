Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1EDC43217
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:42:46 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.43303.1636368165231589946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:42:45 -0800
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
	id 1mk26q-0005f5-Lv; Mon, 08 Nov 2021 12:42:41 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-tzlocal: Upgrade 4.0.1 -> 4.1
Date: Mon,  8 Nov 2021 12:42:34 +0200
Message-Id: <20211108104235.24727-4-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/93871

Upgrade to release 4.1:

- It turns out a lot of Linux distributions make the links between
  zoneinfo aliases backwards, so instead of linking GB to
  Europe/London it actually links the other way. When /etc/localtime
  then links to Europe/London, and you also have a config file
  saying Europe/London, the code that checks if /etc/localtime is
  a symlink ends up at GB instead of Europe/London and we get an
  error, as it thinks GB and Europe/London are different zones.

  So now we check the symlink of all timezones in the uniqueness
  test. We still return the name in the config file, though, so you
  would only get GB or Zulu returned as the time zone instead of
  Europe/London or UTC if your only configuration is the /etc/localtime
  symlink, as that's checked last, and tzlocal will return the first
  configuration found.

- The above change also means that GMT and UTC are no longer seen
  as synonyms, as zoneinfo does not see them as synonyms. This
  might be controversial, but you just have to live with it. Pick one
  and stay with it.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tzlocal_4.0.1.bb => python3-tzlocal_4.1.bb}    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_4.0.1.bb => python3-tzlocal_4.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_4.0.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-tzlocal_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
index f8339bb2e8..29a69f8b8f 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "8560aabba61b5d2a5e1697bb781f682e6eaa3ce386cee85a09a458cc0003f836"
+SRC_URI[sha256sum] = "0f28015ac68a5c067210400a9197fc5d36ba9bc3f8eaf1da3cbd59acdfed9e09"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+	${PYTHON_PN}-pytz-deprecation-shim \
+"
-- 
2.17.1


