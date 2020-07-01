Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.22813.1593613372071727497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqddR-0002cZ-Jo; Wed, 01 Jul 2020 17:22:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-requests: Upgrade 2.23.0 -> 2.24.0
Date: Wed,  1 Jul 2020 17:22:39 +0300
Message-Id: <20200701142243.1686-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 2.24.0:

- pyOpenSSL TLS implementation is now only used if Python either
  doesn't have an ssl module or doesn't support SNI. Previously
  pyOpenSSL was unconditionally used if available. This applies
  even if pyOpenSSL is installed via the requests[security] extra.
- Redirect resolution should now only occur when allow_redirects
  is True.
- No longer perform unnecessary Content-Length calculation for
  requests that won’t use it.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-requests_2.23.0.bb => python3-requests_2.24.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.23.0.bb => python3-requests_2.24.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
index 9f3fb7d2e..de9a53584 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
 
-SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
-SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
+SRC_URI[md5sum] = "b54bff26a389e5932e8b1c4983a99ce7"
+SRC_URI[sha256sum] = "b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

