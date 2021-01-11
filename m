Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.35492.1610378730937443685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4U-0006IU-5j; Mon, 11 Jan 2021 17:25:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-mock: Upgrade 4.0.2 -> 4.0.3
Date: Mon, 11 Jan 2021 17:25:12 +0200
Message-Id: <20210111152512.23506-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.3:

- Remove unexpected call of __bool__ when passing a spec_arg
  argument to a Mock.
- Revert bpo-25597. unittest.mock.MagicMock with wraps’ set uses
  default return values for magic methods.
- Mock objects which are not unsafe will now raise an
  AttributeError if an attribute with the prefix asert, aseert, or
  assrt is accessed, in addition to this already happening for the
  prefixes assert or assret.
- Fixed reverting multiple patches in unittest.mock. Patcher’s
  __exit__() is now never called if its __enter__() is failed.
  Returning true from __exit__() silences now the exception.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mock_4.0.2.bb => python3-mock_4.0.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mock_4.0.2.bb => python3-mock_4.0.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
index 39ab6d01f..b34f25b93 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
@@ -13,5 +13,4 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes"
 
-SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
-SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
+SRC_URI[sha256sum] = "7d3fbbde18228f4ff2f1f119a45cdffa458b4c0dee32eb4d2bb2f82554bac7bc"
-- 
2.17.1

