Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.60146.1600089355350581705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKo-0000ED-94; Mon, 14 Sep 2020 16:15:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-pint: Upgrade 0.15 -> 0.16
Date: Mon, 14 Sep 2020 16:15:35 +0300
Message-Id: <20200914131536.6072-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16:

- Fixed issue where performing an operation of a Quantity with
  certain units would perform an in-place unit conversion that
  modified the operand in addition to the returned value
- Implements Logarithmic Units like dBm, dB or decade
- Drop dependency on setuptools pkg_resources to read package
  resources, using std lib importlib.resources instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.15.bb => python3-pint_0.16.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.15.bb => python3-pint_0.16.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.15.bb b/meta-python/recipes-devtools/python/python3-pint_0.16.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.15.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.16.bb
index 4df5573b1..7775d733a 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.16.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "8171859d92713c13cd13ea7100a707f0"
-SRC_URI[sha256sum] = "73b517bc4e49d199eb8ae9ed49104d74a11e596849ad2330b58c09e1eb6f327d"
+SRC_URI[md5sum] = "ec78e4e42512b93f80b9093416ad7417"
+SRC_URI[sha256sum] = "e437420e65fa72a2805f4036f986669c48d54944eeb0e47c8ba16f98cbdcd599"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

