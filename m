Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16203.1595414960652310057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJL-0001ZT-4a; Wed, 22 Jul 2020 13:49:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-mock: Upgrade 4.0.1 -> 4.0.2
Date: Wed, 22 Jul 2020 13:49:03 +0300
Message-Id: <20200722104905.15499-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722104905.15499-1-leon.anavi@konsulko.com>
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
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

Upgrade 4.0.2:

- Issue #39915: Ensure unittest.mock.AsyncMock.await_args_list has
  call objects in the order of awaited arguments instead of using
  unittest.mock.Mock.call_args which has the last value of the
  call. Patch by Karthikeyan Singaravelan.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
index eebfcdade..39ab6d01f 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
@@ -13,5 +13,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes"
 
-SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
-SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
+SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
+SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
-- 
2.17.1

