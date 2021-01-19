Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.14579.1611077878071178441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux0-0001eq-Ms; Tue, 19 Jan 2021 19:37:55 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-pyephem: Upgrade 3.7.7.0 -> 3.7.7.1
Date: Tue, 19 Jan 2021 19:37:38 +0200
Message-Id: <20210119173746.24694-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.7.1:

- Fixed a memory leak in readdb()
- Fixed the Body.copy() method to correctly copy object-specific
  fields across to the new object, like Saturn ring tilt and Earth
  satellite catalog number

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.1.bb} (69%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
similarity index 69%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
index 38b3c0a4f..5949a55fa 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
 
-SRC_URI[md5sum] = "46c035b4a903ff26e0d8ad0f1fe6cc35"
-SRC_URI[sha256sum] = "607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c69c4436"
+SRC_URI[sha256sum] = "36b51a8dc7cfdeb456dd6b8ab811accab8341b2d562ee3c6f4c86f6d3dbb984e"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.17.1

