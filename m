Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.16719.1600953696299434095
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 06:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58940 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLRBn-0007nc-2S; Thu, 24 Sep 2020 16:21:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-google-api-python-client: Upgrade 1.12.1 -> 1.12.2
Date: Thu, 24 Sep 2020 16:21:22 +0300
Message-Id: <20200924132122.30697-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200924132122.30697-1-leon.anavi@konsulko.com>
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.2:

- add method to close httplib2 connections

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t_1.12.1.bb => python3-google-api-python-client_1.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.1.bb => python3-google-api-python-client_1.12.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
index d79ac3c397..4fcdb66b0d 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "92106822131f76ca77b77009674e78e4"
-SRC_URI[sha256sum] = "ddadc243ce627512c2a27e11d369f5ddf658ef80dbffb247787499486ef1ea98"
+SRC_URI[md5sum] = "94d58d98a32b85cf455d8b4f0737b4b5"
+SRC_URI[sha256sum] = "54a7d330833a2e7b0587446d7e4ae6d0244925a9a8e1dfe878f3f7e06cdedb62"
 
 inherit pypi setuptools3
-- 
2.17.1

