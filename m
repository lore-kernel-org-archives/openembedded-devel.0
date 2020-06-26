Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5829.1593171001571994581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYR-000568-R2; Fri, 26 Jun 2020 14:30:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/12] python3-pulsectl: Upgrade 20.2.4 -> 20.5.1
Date: Fri, 26 Jun 2020 14:29:42 +0300
Message-Id: <20200626112944.25569-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.5.1:

- Drop unused decorator mode for _pulse_get_list wrapper-generator
- volume_get_all_chans: add docstring to indicate that it doesn't
  poll libpulse
- tests: fix tearDownClass for "python setup.py test" operation
- tests: pass PATH= in subprocess environment for proper lookups
  there
- tests: lookup executables in PATH

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pulsectl_20.2.4.bb => python3-pulsectl_20.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_20.2.4.bb => python3-pulsectl_20.5.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
index f0db9682f..df0c8e578 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[md5sum] = "07d7a5fddc49f5da22634464aa008003"
-SRC_URI[sha256sum] = "fca9ed501bef2efd551b35773fd24bba36bbd21bc448f402cf8ee13c12423c19"
+SRC_URI[md5sum] = "8de84a0f4005ecad96d2c55a6d7c3a10"
+SRC_URI[sha256sum] = "39b0a0e7974a7d6468d826a838822f78b00ac9c3803f0d7bfa9b1cad08ee22db"
 
 RDEPENDS_${PN} += "pulseaudio"
 
-- 
2.17.1

