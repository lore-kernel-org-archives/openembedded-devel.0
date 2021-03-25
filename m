Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8131.1616679292291547864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8R-0007lW-AZ; Thu, 25 Mar 2021 15:34:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/11] python3-pint: Upgrade 0.16.1 -> 0.17
Date: Thu, 25 Mar 2021 15:34:33 +0200
Message-Id: <20210325133436.18328-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17:

- Add the Wh unit for battery capacity measurements
- Fix issue with reducable dimensionless units when using power
  (Quantity**ndarray)
- Fix comparisons between Quantities and Measurements.
- UnitsContainer returns false if other is str and cannnot be
  parsed
- Fix numpy.linalg.solve unit output.
- Support numpy.lib.stride_tricks.sliding_window_view.
- NEP29 Support docs.
- Move all tests to pytest.
- Fix to __pow__ and __ipow__
- Migrate to Github Actions.
- Update linter to use pre-commit.
- Quantity comparisons now ensure other is Quantity.
- Add sign function compatibility.
- Fix scalar to ndarray tolist.
- Fix tolist function with scalar ndarray.
- Corrected typos and dacstrings
- Implements a first benchmark suite in airspeed velocity (asv).
- Power for pseudo-dimensionless units.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.16.1.bb => python3-pint_0.17.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.16.1.bb => python3-pint_0.17.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.17.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.17.bb
index d96659592..9a474901e 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.17.bb
@@ -10,8 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "d4a7bbdf505dee964eb1e5e6e7f80c34"
-SRC_URI[sha256sum] = "d43a2e9ae003164978b60fdf8cd920d8581e1a5991df8dded29b00f4850ec83a"
+SRC_URI[sha256sum] = "f4d0caa713239e6847a7c6eefe2427358566451fe56497d533f21fb590a3f313"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

