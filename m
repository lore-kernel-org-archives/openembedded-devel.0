Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.46989.1622481248365241946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lnlUK-00054C-R8; Mon, 31 May 2021 20:14:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-netifaces: Upgrade 0.10.9 -> 0.11.0
Date: Mon, 31 May 2021 20:13:49 +0300
Message-Id: <20210531171350.11059-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531171350.11059-1-leon.anavi@konsulko.com>
References: <20210531171350.11059-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 0.11.0:

- Added notice about needing a new maintainer.
- Fixed link to Travis CI.
- Added test.py to the source distribution.
- Fixed netmask calculation for IPv6.
- Fixes to gateway detection in some edge cases.
- Build CPython 2.7 wheels for 64-bit Windows (yes, you should be
  using Python 3 now, but still).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-netifaces_0.10.9.bb => python3-netifaces_0.11.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-netifaces_0.10.9.bb => python3-netifaces_0.11.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
rename to meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb
index 7edb7e7fb..09e54b0ba 100644
--- a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
+++ b/meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
 
-SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
-SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
+SRC_URI[sha256sum] = "043a79146eb2907edf439899f262b3dfe41717d34124298ed281139a8b93ca32"
 
 inherit pypi setuptools3
-- 
2.17.1

