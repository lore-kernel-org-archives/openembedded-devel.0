Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.26302.1611141039147271615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45624 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2BNk-0007qB-U9; Wed, 20 Jan 2021 13:10:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-evdev: Upgrade 1.3.0 -> 1.4.0
Date: Wed, 20 Jan 2021 13:10:25 +0200
Message-Id: <20210120111027.12947-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120111027.12947-1-leon.anavi@konsulko.com>
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.0:

- Fix InputDevice.set_absinfo to allow setting parameters to zero.
- Fix off-by-one in ioctl_EVIOCG_bits, which causes value at the
  end of the list to not be reported back.
- Fix set_absinfo to allow setting parameters to zero.
- Fix leak when returning BlockingIOError from a read.
- Fix "There is no current event loop in thread" error for
  non asyncio code.
- Prevent InputDevice destructor from blocking.
- Add missing return codes to os.strerror() calls and fix force
  feedback example in docs (#138).
- Add the util.find_ecodes_by_regex() helper function.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-evdev_1.3.0.bb => python3-evdev_1.4.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.3.0.bb => python3-evdev_1.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
index fe11049ad..e15d83b60 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI[md5sum] = "05f9e900d6e11e1674475d2dd2668f0d"
-SRC_URI[sha256sum] = "b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d"
+SRC_URI[sha256sum] = "8782740eb1a86b187334c07feb5127d3faa0b236e113206dfe3ae8f77fb1aaf1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

