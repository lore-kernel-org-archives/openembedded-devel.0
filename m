Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8314.1598947920176900467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kD1OW-0002Vq-BR; Tue, 01 Sep 2020 11:11:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-luma-core: Upgrade 1.16.0 -> 1.16.1
Date: Tue,  1 Sep 2020 11:11:43 +0300
Message-Id: <20200901081147.13556-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.16.1:

- Fix bug in bitmap_font: glyph_index now computed correctly

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.16.0.bb => python3-luma-core_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.0.bb => python3-luma-core_1.16.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
index ce1e7ba03..3428dbe9f 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "52ab2cdce4222aa71d9ac254a806dccc"
-SRC_URI[sha256sum] = "ca523f606f8fff2c9843d48b415a0a748bb2c96270eccac97d9caa9ae6810c94"
+SRC_URI[md5sum] = "de7bda49c4146ba242923a88c587cd7a"
+SRC_URI[sha256sum] = "2181a60906fea3104dcfa3923f9654928502cd7541ff9b4d76c6ae29c6a9d9fc"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

