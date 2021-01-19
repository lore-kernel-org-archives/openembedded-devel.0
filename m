Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.14580.1611077878329574767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux1-0001eq-Rp; Tue, 19 Jan 2021 19:37:56 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-pyperf: Upgrade 2.0.0 -> 2.1.0
Date: Tue, 19 Jan 2021 19:37:39 +0200
Message-Id: <20210119173746.24694-3-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- The compare_to command now computes the geometric mean.
- The compare_to command no longer displays percentages: display
  less numbers to make the output easier to read. Also, percentage
  were almost the same values than the xxx faster or xxx slower
  values, but rounded differenly which introduced confusion.
- Project moved to https://github.com/psf/pyperf/
- system command now only emits a warning rather than failing with
  a hard error if it fails to get or set the frequency of a CPU.
- The pyperf project is now covered by the PSF Code of Conduct.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperf_2.0.0.bb => python3-pyperf_2.1.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.0.0.bb => python3-pyperf_2.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
index 7ced7d017..b57ea16eb 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
@@ -13,8 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[md5sum] = "7f62d3f6fc5475138791d3d883fdf4cd"
-SRC_URI[sha256sum] = "2189fbc4af08d519f85468e70e32c902eab0f1341b2c41028b94b2832d3169a7"
+SRC_URI[sha256sum] = "1257d673d89fdcdbaec8077afeb365e7a94739c1b263572b09403cac25708ad3"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.17.1

