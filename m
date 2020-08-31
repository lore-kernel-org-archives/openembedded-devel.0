Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.48465.1598857421666661813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdqs-0006cW-TX; Mon, 31 Aug 2020 10:03:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-paramiko: Upgrade 2.7.1 - 2.7.2
Date: Mon, 31 Aug 2020 10:03:11 +0300
Message-Id: <20200831070318.6573-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.2:

- [Bug]: Fix incorrectly swapped order of p and q numbers when
  loading OpenSSH-format RSA private keys. At minimum this should
  address a slowdown when using such keys, and it also means
  Paramiko works with Cryptography 3.1 and above (which complains
  strenuously when this problem appears).
- [Bug]: Fix incorrect string formatting causing unhelpful error
  message annotation when using Kerberos/GSSAPI.
- [Support]: Remove leading whitespace from OpenSSH RSA test suite
  static key fixture, to conform better to spec.
- [Support]: Add missing test suite fixtures directory to
  MANIFEST.in, reinstating the ability to run Paramiko’s tests
  from an sdist tarball.
- [Support]: Update our CI to catch issues with sdist generation,
  installation and testing.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-paramiko_2.7.1.bb => python3-paramiko_2.7.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.7.1.bb => python3-paramiko_2.7.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
index 0ead23608..324847c31 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[md5sum] = "bf8239dc820ca86dd3c3226f4281c35f"
-SRC_URI[sha256sum] = "920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f"
+SRC_URI[md5sum] = "44136d79da4cd7619e368018ad022619"
+SRC_URI[sha256sum] = "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.17.1

