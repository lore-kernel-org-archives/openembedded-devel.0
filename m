Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.60953.1600089351752625745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKk-0000ED-Dw; Mon, 14 Sep 2020 16:15:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-nocasedict: Upgrade 0.5.0 -> 1.0.0
Date: Mon, 14 Sep 2020 16:15:31 +0300
Message-Id: <20200914131536.6072-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.0 with the following bug fixes:

- Test: Fixed that the reversed test against the built-in dict
  was attempted on Python 3.7, but the built-in dict became
  reversible only in Python 3.8.
- Test: Fixed issue on pypy2 (Python 2.7) where the testcases for
  update() passed keyword arguments that had integer-typed
  argument names. That is supported by CPython 2.7 when passing
  them as a kwargs dict, but not by pypy2. Removed these
  testcases, because the support for that feature in CPython 2.7
  is not part of the Python language.
- Docs: Fixed missing Python 2 only methods in RTD docs
- Pylint: Accomodated new ‘raise-missing-from’ check in Pylint
  2.6.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-nocasedict_0.5.0.bb => python3-nocasedict_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_0.5.0.bb => python3-nocasedict_1.0.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
index 440cf5109..dae1ebf30 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[md5sum] = "b1037d65f1f73322c3c2d76681195bb3"
-SRC_URI[sha256sum] = "ed74b83c7b81505ccaf4b09b0581477fdd5c1099c929098a6a170a91ec26fd33"
+SRC_URI[md5sum] = "14b405bf7ffe9d0f784aa9c3c39e277b"
+SRC_URI[sha256sum] = "22840b434e40f20da6d2ccf0821baba54589e2476499b65420b6e4c2e669aa04"
 
 inherit pypi setuptools3
-- 
2.17.1

