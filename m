Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7596.1617967451387465981
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 04:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUpF9-0005lE-Uf; Fri, 09 Apr 2021 14:24:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-python-vlc: Upgrade 3.0.11115 -> 3.0.12117
Date: Fri,  9 Apr 2021 14:23:53 +0300
Message-Id: <20210409112355.18857-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409112355.18857-1-leon.anavi@konsulko.com>
References: <20210409112355.18857-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.12117:

- adapt to new libvlc_media_list_new API
- re-introduce MediaThumbnailRequest definition
- implement generation for struct wrapping

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python-vlc_3.0.11115.bb => python3-python-vlc_3.0.12117.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.11115.bb => python3-python-vlc_3.0.12117.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
index 014509d55..5d9dde9d2 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "422fd025294af2e55dfdcf9bc7d7dbac"
-SRC_URI[sha256sum] = "a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b"
+SRC_URI[sha256sum] = "dd512f8438c1bba032fe9d22a7f8f98423a537992141ce2d1b28e29aff30381d"
 
 inherit pypi setuptools3
-- 
2.17.1

