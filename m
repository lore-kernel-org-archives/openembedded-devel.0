Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13378.1614269175030245976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54856 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFJ9W-0004JR-4p; Thu, 25 Feb 2021 18:06:14 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyzmq: Upgrade 22.0.2 -> 22.0.3
Date: Thu, 25 Feb 2021 18:05:44 +0200
Message-Id: <20210225160544.8994-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225160544.8994-1-leon.anavi@konsulko.com>
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
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

Upgrade to release 22.0.3:

- Fix fork-safety bug in garbage collection thread (regression in
  20.0) when using subprocesses.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyzmq_22.0.2.bb => python3-pyzmq_22.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_22.0.2.bb => python3-pyzmq_22.0.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
index 555f27cb49..dbf8e6446c 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "d7b82a959e5e22d492f4f5a1e650e909a6c8c76ede178f538313ddb9d1e92963"
+SRC_URI[sha256sum] = "f7f63ce127980d40f3e6a5fdb87abf17ce1a7c2bd8bf2c7560e1bbce8ab1f92d"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.17.1

