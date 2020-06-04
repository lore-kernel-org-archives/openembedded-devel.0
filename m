Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12647.1591272772972887464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50342 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgojq-0002zK-Vw; Thu, 04 Jun 2020 15:12:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-html2text: Upgrade 2019.8.11 -> 2020.1.16
Date: Thu,  4 Jun 2020 15:12:23 +0300
Message-Id: <20200604121223.3818-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604121223.3818-1-leon.anavi@konsulko.com>
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.1.16. Consolidate inc and bb files
into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-html2text_2019.8.11.bb  | 2 --
 ...{python-html2text.inc => python3-html2text_2020.1.16.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
 rename meta-python/recipes-devtools/python/{python-html2text.inc => python3-html2text_2020.1.16.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
deleted file mode 100644
index 9cb5b01eb..000000000
--- a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-html2text.inc
diff --git a/meta-python/recipes-devtools/python/python-html2text.inc b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python-html2text.inc
rename to meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
index 678dcef3f..565b31d97 100644
--- a/meta-python/recipes-devtools/python/python-html2text.inc
+++ b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/Alir3z4/html2text"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "21aad7ec95b70606024b783c8253899c"
-SRC_URI[sha256sum] = "f516b9c10284174e2a974d86f91cab02b3cf983a17752075da751af0e895ef5e"
+SRC_URI[md5sum] = "c77b580c94d1a9e0145f23cc4472993d"
+SRC_URI[sha256sum] = "e296318e16b059ddb97f7a8a1d6a5c1d7af4544049a01e261731d2d5cc277bbb"
 
-inherit pypi
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

