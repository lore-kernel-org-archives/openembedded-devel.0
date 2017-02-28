Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E85CA72F49
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 22:14:50 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s186so6287639qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mMkP5y5J5g+GnBM1UY8JjBqREJPVH+DAQ9C7Y+7mWXg=;
	b=VtehAvTIPaTAJVTvEgKx8tOH9dMdrQBLgjFh0irevZzmZUnekabVUlzc78M4MIiHBt
	X8p8umCopHn3kgwFlusmDjKYlR9eQZEsH8oAejNC12FrN8AQ/HutWwAq/cTJROOs1Ri2
	yixnfb81Go9qIAfBwqE49X8FTm/swfidbHV0FfEI2/uGmuTIpzyjQPSYBmSMB9mVKg3w
	0JYHLwmri0MysDbqxGIiouy02tM1SAhn0zJNOOLGNJswZ0KqrCVLd6mHkQIZYoO4HaD+
	X/Gih/zRBZXx8F7k/FzZKOPIkhCYmde7b1/IbXb+MT9diTRt25tAWyTGUt1TcIC9L7PS
	vryQ==
X-Gm-Message-State: AMke39nCvUmoWOOUZ6lJBGur2GlvdgApkTHmHQR8EeLiwsXZvhDWSx/iP1LKCRwVVFvlAw==
X-Received: by 10.200.33.162 with SMTP id 31mr4620123qty.93.1488320091579;
	Tue, 28 Feb 2017 14:14:51 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	i51sm1850926qtc.67.2017.02.28.14.14.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 14:14:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 17:14:44 -0500
Message-Id: <1488320084-30489-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest-runner: update to version 2.11.1
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
X-List-Received-Date: Tue, 28 Feb 2017 22:14:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...python-pytest-runner_2.8.bb => python-pytest-runner_2.11.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-runner_2.8.bb => python-pytest-runner_2.11.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb b/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
rename to meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
index a4685ec..188ef2b 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
+++ b/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
 
-SRC_URI[md5sum] = "041f3624f450d87a242e3907d7f90e8f"
-SRC_URI[sha256sum] = "1ec44deddaa551f85fd563c40a4c483a2609aca1f284a95399566a74d0680d5c"
-PYPI_PACKAGE_HASH = "466cff61a9e0d513222afa3529bdb565a465812b7e50b218a5afd705f46b258c"
+SRC_URI[md5sum] = "bdb73eb18eca2727944a2dcf963c5a81"
+SRC_URI[sha256sum] = "983a31eab45e375240e250161a556163bc8d250edaba97960909338c273a89b3"
 
 DEPENDS += " \
     python-setuptools-scm"
 
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json \
+                  python-compiler python-io"
 
 inherit pypi setuptools
-- 
2.7.4


