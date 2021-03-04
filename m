Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6004.1614863168960419835
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 05:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34576 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lHng6-0000xG-NQ; Thu, 04 Mar 2021 15:06:07 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-yamlloader: Upgrade 0.5.5 -> 1.0.0
Date: Thu,  4 Mar 2021 15:05:51 +0200
Message-Id: <20210304130554.32308-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304130554.32308-1-leon.anavi@konsulko.com>
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
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

Upgrade to the first stable release 1.0.0:

- Main change is that it returns always an OrderedDict, even for
  Python >= 3.7 for consistency

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
index dbf84d4132..a2483a6f46 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[md5sum] = "2e0750ace81235f750c072833d79c4c3"
-SRC_URI[sha256sum] = "dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8"
+SRC_URI[sha256sum] = "e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058"
 
 inherit pypi setuptools3
 
-- 
2.17.1

