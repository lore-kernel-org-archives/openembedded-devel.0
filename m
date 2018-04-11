Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id EB34C746BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 12:48:47 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n139so1635471qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XnOqDjFo4lUId7PL1irpRcO77Wcq+g63g6PIsBWuL78=;
	b=fc6Buq60xP31EY7NZfpDUPhNwfR0K5ed8fjD+bpoRErUl4g0Rfd15DCCHg7io+hC30
	h/cl/NU7f8TIZhovJODygXDyUTlfTO3Mjy6wvWxG/e65F/FKcSovIoY2TCumXaBU8IpD
	L7yTZS+dXbs+lhB0blk7mSjw0bUL9JtpVmqJ4jidpc9yfL7CxPL8Js0Xv7XJXY1mG/ul
	YZiwohXC4lwf41WctU/Xj7IuvmlLxrycwQvWhMnn4Kt9E9Y4IOGiEvM7h5+30ZQHLaas
	xL7mZ4yp/WGBk3wQTcNhIoLH+3bBgidFmsM42Oq3w8ss9QOGx3hlGfSXYDb0xXLudTeB
	knmg==
X-Gm-Message-State: ALQs6tB4vnYtDQyDhhBbn8hz+1W7tW+KwE9Aclggh9gQVWCpzziXUc+l
	5MhZCFGUveqJsERUjqvkEJKB3B2k
X-Google-Smtp-Source: AIpwx48iHMI+7PEqWZgW24Z5MSR0CeHxWVa2aEs8YvBr5WvHRWfqF74N0NImCJQWpCYPfu/CN4kFbg==
X-Received: by 10.55.126.5 with SMTP id z5mr6663397qkc.240.1523450928060;
	Wed, 11 Apr 2018 05:48:48 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id c10sm806476qtn.90.2018.04.11.05.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Apr 2018 05:48:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 08:48:33 -0400
Message-Id: <1523450913-23198-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: update to version 2018.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2018 12:48:48 -0000

License-Update: Update the checksum for whitespace changes upstream

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz.inc                 | 6 +++---
 .../python/{python-pytz_2018.3.bb => python-pytz_2018.4.bb}         | 0
 .../python/{python3-pytz_2018.3.bb => python3-pytz_2018.4.bb}       | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2018.3.bb => python-pytz_2018.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2018.3.bb => python3-pytz_2018.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 979faa6..519487f 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -1,12 +1,12 @@
 SUMMARY = "World timezone definitions, modern and historical"
 HOMEPAGE = "http://pythonhosted.org/pytz"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=39ea92752a35cf67d8a885d8e3af3c69"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
 
 inherit pypi
 
-SRC_URI[md5sum] = "abb07c09c79f78d7c04f222a550c99ef"
-SRC_URI[sha256sum] = "410bcd1d6409026fbaa65d9ed33bf6dd8b1e94a499e32168acfc7b332e4095c0"
+SRC_URI[md5sum] = "f054437920c895dd14a4509fabafe029"
+SRC_URI[sha256sum] = "c06425302f2cf668f1bba7a0a03f3c1d34d4ebeef2c72003da308b3947c7f749"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2018.3.bb b/meta-python/recipes-devtools/python/python-pytz_2018.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2018.3.bb
rename to meta-python/recipes-devtools/python/python-pytz_2018.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2018.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2018.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2018.3.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2018.4.bb
-- 
2.7.4


