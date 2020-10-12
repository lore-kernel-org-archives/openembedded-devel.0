Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.41285.1602511232192418940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 07:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kRyNI-00026S-9b; Mon, 12 Oct 2020 17:00:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pywbem: Upgrade 1.0.2 -> 1.1.0
Date: Mon, 12 Oct 2020 17:00:18 +0300
Message-Id: <20201012140022.15761-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.0:

- Test: Fixed dependency issues with ‘pyrsistent’ package on
  Python 2.7 and Python 3.4.
- Increased minimum versions of nocasedict to 1.0.0 and nocaselist
  to 1.0.2 to pick up fixes needed for pywbem.
- Windows install: Upgraded WinOpenSSL to 1.1.1h.
- Test: Changed collection of .yaml files in function tests to
  address DeprecationWarning issued by pytest.
- Upgraded the minimum versions of nocasedict to 1.0.3 and of
  nocaselist to 1.0.1, to pick up fixes in these packages.
- Removed dependency on package custom-inherit and removed package
  from pywbem.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pywbem_1.0.2.bb => python3-pywbem_1.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.0.2.bb => python3-pywbem_1.1.0.bb} (91%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
similarity index 91%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
index da731989da..d68ae9abf0 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
@@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[md5sum] = "0f171e365e294554f8e7624ccf511067"
-SRC_URI[sha256sum] = "66d8ec82d30f2b95d8b4bd51659429066c2879d3f46292561f5fdbc7fed10f3d"
+SRC_URI[md5sum] = "6ade0cda6a997542d61f15713c2dd971"
+SRC_URI[sha256sum] = "4e2baa4b4b88943cca32c7eb588fffff22ce86c748ba7544e01149f9638014fe"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1

