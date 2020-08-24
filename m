Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.190982.1598260508520755082
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37652 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kA8ZH-0005wO-79; Mon, 24 Aug 2020 12:15:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pint: Upgrade 0.14 -> 0.15
Date: Mon, 24 Aug 2020 12:14:55 +0300
Message-Id: <20200824091457.3360-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824091457.3360-1-leon.anavi@konsulko.com>
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.15:

- Change `Quantity` and `Unit` HTML (i.e., Jupyter notebook) repr
  away from LaTeX to a simpler, more performant pretty-text and
  table based repr inspired by Sparse and Dask.
- Add `case_sensitive` option to registry for case (in)sensitive
  handling when parsing units.
- Implement Dask collection interface to support Pint Quantity
  wrapped Dask arrays.
- Started automatically testing examples in the documentation
- Fixed an exception generated when reducing dimensions with three
  or more units of the same type.
- Fixed right operand power for dimensionless Quantity to reflect
  numpy behavior.
- Eliminated warning when setting a masked value on an underlying
  MaskedArray.
- Add `sort` option to `formatting.formatter` to permit disabling
  sorting of component units in format string.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.14.bb => python3-pint_0.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.14.bb => python3-pint_0.15.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.15.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.14.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.15.bb
index 333b015a9..4df5573b1 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.15.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "e5e409806bc82f518230117b30ae23ed"
-SRC_URI[sha256sum] = "9aa450ebb9d722ed03fa9a450104cfd16c479b49f862d547c6f77320de597f72"
+SRC_URI[md5sum] = "8171859d92713c13cd13ea7100a707f0"
+SRC_URI[sha256sum] = "73b517bc4e49d199eb8ae9ed49104d74a11e596849ad2330b58c09e1eb6f327d"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

