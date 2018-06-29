Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 952F56006E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:51:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c5-v6so9057459qth.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=guucl7RgcIHJr5lB9BueaBppWvTPjHae4ZjpwStWa2g=;
	b=NrGz3TRgH8t2XANHQ1fKtUVlHjbV+ePCAaC7zymub1+TSJytFUX4CTjRO03A8oU7v8
	8709q0mCLhNrXSM3xFIN1fwl1GIrTOjoOvWwCjqjE6mucim0NibT3qKpDELnoGT7YclR
	b4gjg8Mzhv4MCGX0w6mqjJtGjUgZIVvNJmaMtk38RFC+ibsi2TwC/Cy+Qt3bmzS/Xdas
	JqoxYLpeysK3GLtsOSLStNth9G3xjbuOaOq5HamIxMK8TGURrBDIHlREglPQscKxqdfY
	iRF8bkLVe0n39R04yHn6zcRxA3KaBhSQjK4b9qETvnBPOVV1DWqZtB986nxcP1TupN9U
	yzzQ==
X-Gm-Message-State: APt69E254/sqJ76iXWUykU6A0H/Bld1VDuSvTr0veiE1wRliOkFmUMJj
	ygymalTtMI+cXiX7wcvDbRwuF4Qd
X-Google-Smtp-Source: AAOMgpdFS9oKMQR0sP4ZRrH4EJC5FNWIstav1AB5SbCIO8uFFCG5a3CWXy7kdqNrWpu0SuYoQ3/qIA==
X-Received: by 2002:a0c:95fa:: with SMTP id
	t55-v6mr11982213qvt.246.1530305465195; 
	Fri, 29 Jun 2018 13:51:05 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	o19-v6sm7488970qtc.17.2018.06.29.13.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:51:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:50:58 -0400
Message-Id: <1530305458-5660-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-zopeinterface: update to version 4.5.0
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
X-List-Received-Date: Fri, 29 Jun 2018 20:51:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-zopeinterface.inc          | 4 ++--
 .../{python-zopeinterface_4.4.3.bb => python-zopeinterface_4.5.0.bb}  | 0
 ...{python3-zopeinterface_4.4.3.bb => python3-zopeinterface_4.5.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.4.3.bb => python-zopeinterface_4.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_4.4.3.bb => python3-zopeinterface_4.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
index 1fab2cc..12623c9 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "8700a4f527c1203b34b10c2b4e7a6912"
-SRC_URI[sha256sum] = "d6d26d5dfbfd60c65152938fcb82f949e8dada37c041f72916fef6621ba5c5ce"
+SRC_URI[md5sum] = "7b669cd692d817772c61d2e3ad0f1e71"
+SRC_URI[sha256sum] = "57c38470d9f57e37afb460c399eb254e7193ac7fb8042bd09bdc001981a9c74c"
 
 PYPI_PACKAGE = "zope.interface"
 
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.4.3.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.4.3.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.4.3.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_4.4.3.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_4.5.0.bb
-- 
2.7.4


