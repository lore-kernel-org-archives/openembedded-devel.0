Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10787.1602239746447060953
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59440 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kQpkU-0007Jc-6x; Fri, 09 Oct 2020 13:35:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pywbemtools: Upgrade 0.7.2 -> 0.7.3
Date: Fri,  9 Oct 2020 13:35:32 +0300
Message-Id: <20201009103535.31339-2-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.3:

- Docs/Test: Fixed failing install of Jinja2 on Python 3.4 by
  adding it to dev-requirements.txt and pinning it to <2.11 for
  Python 3.4.
- Fixed incorrect property order in instance table output, where
  key properties were not ordered before non-key properties but
  ordered along with them.
- Test: Fixed qualifier definitions in qualifier_filter_model.mof
  to accomodate improved MOF compiler in pywbem 1.1.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pywbemtools_0.7.2.bb => python3-pywbemtools_0.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.2.bb => python3-pywbemtools_0.7.3.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
index 9121f81079..8620057f59 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "54ebb824d7ab231ef1f1e88d8d69ac69"
-SRC_URI[sha256sum] = "36d70f7d33498cab626e9a2871ea82e434a2c36fe6c240f400615082965f1e4e"
+SRC_URI[md5sum] = "e3f8cadb8d1253b1b51afabcce4c3461"
+SRC_URI[sha256sum] = "b475da4389ac77901191c886f4348660f3c0fd59365feb18ede47a086442efff"
 
 inherit pypi setuptools3
 
-- 
2.17.1

