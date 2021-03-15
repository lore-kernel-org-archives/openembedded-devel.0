Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5990.1615798067411083361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLit7-0004Tf-Ob; Mon, 15 Mar 2021 10:47:46 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-bitarray: Upgrade 1.7.0 -> 1.7.1
Date: Mon, 15 Mar 2021 10:47:24 +0200
Message-Id: <20210315084727.26812-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315084727.26812-1-leon.anavi@konsulko.com>
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.7.1:

- raise TypeError when incorrect index is used during assignment,
  e.g. `a[1.5] = 1`
- raise TypeError (not IndexError) when assigning slice to
  incorrect type, e.g. `a[1:4] = 1.2`
- improve some docstrings and tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.7.0.bb => python3-bitarray_1.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.7.0.bb => python3-bitarray_1.7.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
index c91b7443e..f859283ab 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "e31b472ac92e04ea943723cf781ec168e15049d91a3052203defb81652d2b086"
+SRC_URI[sha256sum] = "e4de977d708b7024760266d827b8285e4405dce4293f25508c4556970139018a"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

