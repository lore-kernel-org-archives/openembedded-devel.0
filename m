Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10729.1602239748908449240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59440 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kQpkZ-0007Jc-7T; Fri, 09 Oct 2020 13:35:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-tqdm: Upgrade 4.50.0 -> 4.50.2
Date: Fri,  9 Oct 2020 13:35:35 +0300
Message-Id: <20201009103535.31339-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009103535.31339-1-leon.anavi@konsulko.com>
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.50.2:

- fixed platform.system() causing fork() warnings
- fixed contrib.concurrent.process_map pickling error with
  threading.RLock
- updated documentation & examples
- updated CI framework
- updated tests
- misc code tidy

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.50.0.bb => python3-tqdm_4.50.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.50.0.bb => python3-tqdm_4.50.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
index bf0385410e..9c2d06ba94 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "4352d89e2c6d6b017f40f244baddfc51"
-SRC_URI[sha256sum] = "93b7a6a9129fce904f6df4cf3ae7ff431d779be681a95c3344c26f3e6c09abfa"
+SRC_URI[md5sum] = "2e56a15d28aa1fa06eeb31031c16c1f3"
+SRC_URI[sha256sum] = "69dfa6714dee976e2425a9aab84b622675b7b1742873041e3db8a8e86132a4af"
 
 inherit pypi setuptools3
 
-- 
2.17.1

