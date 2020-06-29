Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.17242.1593432767448996244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseT-0001kP-KG; Mon, 29 Jun 2020 15:12:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-pyparted: Upgrade 3.11.3 -> 3.11.6
Date: Mon, 29 Jun 2020 15:12:25 +0300
Message-Id: <20200629121233.27026-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
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

Inherit pypi. Upgrade to release 3.11.6:

- Use preprocessor for the _ped module and what constants to
  include
- Reduce libparted requirement to 3.2
- Update the pypi target in the Makefile
- Reduce minimum Python required to 3.5

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-pyparted_3.11.3.bb => python3-pyparted_3.11.6.bb} | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.3.bb => python3-pyparted_3.11.6.bb} (73%)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
similarity index 73%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
index a801920c0..63f493366 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
@@ -8,15 +8,13 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
     file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
 "
-DEPENDS += "parted"
 
-# upstream only publishes releases in github archives which are discouraged
-SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
-SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
+SRC_URI[md5sum] = "b85dcaecc3106eb6e9a117270b09615e"
+SRC_URI[sha256sum] = "727ccdf308c194069aa9797f7a6a973bc95b2e407cdf5d58d6c8bc4c9dec92dc"
 
-inherit distutils3
+inherit pypi distutils3
 
-S = "${WORKDIR}/git"
+DEPENDS += "parted"
 
 RDEPENDS_${PN}_class-target += " \
     parted (>= 2.3) \
-- 
2.17.1

