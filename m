Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id B12436FF97
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:20 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id y89so8548714qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0A+mKQsuAPvNRf1hJOHM7vGI6pzPPzfCMTmBUNpcuig=;
	b=k4BQ8KB21jGFEPaczKkEXAOhCIuVYNwVRb5Z9fzSTzZke6x2UEDaNxY2RHD5so6nSV
	3RnKI27VdMqagcmSuHkxCXVj2nOc+r9Fhgc3y4SY3FIBtIT8wsCHUppZtc+fB9kYylIn
	UkWd9aZZDTlYOzWcDYqAlpth/XKd0AVZ1ZU1nO44+N4gOnJ55GmOYS7sCUh3LlouHDq6
	V51aRrBvIxJxusvFypftkgKZaeeLnoWsWte+k+dMmd0+REaF1kYtbzaT7Z2zn9oBtfMf
	aOxHDpLrA/PeXY2XbNEwZY8k0dVraK3ElrSMuGzUTkcMCr64qBMpJu93uWzrXzhqCDwJ
	5ebg==
X-Gm-Message-State: AD7BkJLFNO14Xiz9NcRcZBXoEQ4+sj2Kqk1RfpCOXSNH7RoGqD9izRcRb035VMTu91CGkQ==
X-Received: by 10.140.179.134 with SMTP id z128mr24739400qhz.40.1458997521567; 
	Sat, 26 Mar 2016 06:05:21 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:41 -0400
Message-Id: <979dfdfa1b76299e025279182da3add436a0da76.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 21/30] python-pycparser: update to 2.14
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pycparser_2.10.bb | 10 ----------
 meta-python/recipes-devtools/python/python-pycparser_2.14.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycparser_2.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pycparser_2.14.bb

diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
deleted file mode 100644
index 3ff2412..0000000
--- a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Parser of the C language, written in pure Python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d29d3ce07825100c58ca57eea171ab65"
-
-SRC_URI[md5sum] = "d87aed98c8a9f386aa56d365fe4d515f"
-SRC_URI[sha256sum] = "957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.14.bb b/meta-python/recipes-devtools/python/python-pycparser_2.14.bb
new file mode 100644
index 0000000..18006ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.14.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Parser of the C language, written in pure Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8fb364772b1441821d391591f340c35a"
+
+SRC_URI[md5sum] = "a2bc8d28c923b4fe2b2c3b4b51a4f935"
+SRC_URI[sha256sum] = "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73"
+
+inherit pypi setuptools
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


