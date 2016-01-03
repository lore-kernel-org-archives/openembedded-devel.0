Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4166E666
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Jan 2016 20:32:55 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id e32so151872073qgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2016 12:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=sn5esCccZY8kMlnMQI9Z4UulBJdGAFK1qdd+fRbWO/4=;
	b=XZUQF1SvSYt1ZzhD6qs36Kwl/Eop4g4PX01ycxDam+Su86GOpiIm6JH8RUy++BiZfT
	AR4PO8GCLUSylSCs980nxVcVFV+5DCMdJ8b9wnIoumI/If6EXgCtIpwSkbIDAUoc1an1
	hQAKMJKPeNvZNZ+mgqsLbO1CxDWoIiITJ9mVpf7jvqDmrvLxxZjlum5IVh4xL2AKHbZK
	PAn4RAbY9YRMW65mhIRm97E2QXBxaRKJAl6LMN0I+uCBF+WZr+9pk2jqEdRdtoYOXfYk
	I0QGRU0aajHPMBer9y6R3rMBD0mPSkqhe3uSzuMMsoeLA/YYKTbwmEvZ65aVlNUQ5r2t
	yGIg==
X-Received: by 10.140.160.193 with SMTP id g184mr111245423qhg.86.1451853176574;
	Sun, 03 Jan 2016 12:32:56 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d195sm16947865qhc.17.2016.01.03.12.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jan 2016 12:32:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jan 2016 15:32:44 -0500
Message-Id: <1451853164-10192-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-tornado: upgrade to 4.3
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
X-List-Received-Date: Sun, 03 Jan 2016 20:32:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-tornado_4.2.1.bb => python-tornado_4.3.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.2.1.bb => python-tornado_4.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python-tornado_4.2.1.bb b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python-tornado_4.2.1.bb
rename to meta-python/recipes-devtools/python/python-tornado_4.3.bb
index 4580b34..c107d6c 100644
--- a/meta-python/recipes-devtools/python/python-tornado_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
@@ -5,15 +5,15 @@ polling, WebSockets, and other applications that require a long-lived connection
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c7dc99d243c4004087229f84f6b46828"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=65b6c818261e415f48f5463a232ad195"
 
 SRCNAME = "tornado"
 
 SRC_URI = " \
     https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "d523204389cfb70121bb69709f551b20"
-SRC_URI[sha256sum] = "a16fcdc4f76b184cb82f4f9eaeeacef6113b524b26a2cb331222e4a7fa6f2969"
+SRC_URI[md5sum] = "d13a99dc0b60ba69f5f8ec1235e5b232"
+SRC_URI[sha256sum] = "c9c2d32593d16eedf2cec1b6a41893626a2649b40b21ca9c4cac4243bde2efbf"
 
 inherit setuptools
 
-- 
1.9.1


