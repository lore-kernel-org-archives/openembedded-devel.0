Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DFCF677629
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 14:00:43 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c20so30649760qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jul 2017 07:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lw69ApbmbgBcMfdOraF/3izJans0CX4gKTV37Hv43YE=;
	b=g5EWwXVaT7KM0yjm/fQfnubffz+88Oij9l3Gmjd9LkXaWEFt+d7cM7x5oMUYaKwqxD
	zP5VTH0ZqJkvNAiKts4CEC8Ehu4z4pWYyK4+WquwekPtbXVg9ACRABDvyVtKwKJLNWRF
	VKc47kNkKFewWDC8jvuhQ/zpjy3VyRfO6iJW4RzMBw7GQEDI1jDnry7fwt8zCqMlsr24
	4vY8HTyWovkyaKSZ35hrTSCRS3jz5hJZbPpTm4i2zOxjt35wUyGPbsKgJ1BCEKp0RMAL
	6PovNq/54hAL2ZIggsBNsds3mH/VrNlbyGDlgN4unb3GVOaRgNX0VhKSIXOGFMaMm/dB
	3/fA==
X-Gm-Message-State: AIVw112GujNjwp5m0uk2jLRhiPywdX354oHNR/Nt/Lq/f4uBLzntWDQq
	SbDnnlS3UnJyApd8mPs=
X-Received: by 10.200.37.56 with SMTP id 53mr18616489qtm.216.1499263243900;
	Wed, 05 Jul 2017 07:00:43 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	q90sm16646267qki.11.2017.07.05.07.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Jul 2017 07:00:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jul 2017 10:00:22 -0400
Message-Id: <1499263222-25342-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499263222-25342-1-git-send-email-derek@asterius.io>
References: <1499263222-25342-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-pytest: remove fetch during do_compile phase
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
X-List-Received-Date: Wed, 05 Jul 2017 14:00:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pytest.inc      |  4 +++
 ...ove-the-setup_requires-for-setuptools-scm.patch | 29 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 2279596..b5c1fa8 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 SRC_URI[md5sum] = "35356e6e31cbd8318e8b2a8340a90b72"
 SRC_URI[sha256sum] = "095e1832f7e424563c95daf4d8d3c865052b80e139cdd2f9610a986ee8526206"
 
+SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
+
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-debugger \
@@ -13,4 +15,6 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-setuptools \
 "
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pytest:"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
new file mode 100644
index 0000000..e283b17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -0,0 +1,29 @@
+From e2d81009c790b4ebeced8408b6bae78060cabcaf Mon Sep 17 00:00:00 2001
+From: Derek Straka <derek@asterius.io>
+Date: Wed, 5 Jul 2017 09:35:51 -0400
+Subject: [PATCH 1/1] setup.py: remove the setup_requires for setuptools-scm
+
+The setup_requires argument forces the download of the egg file for setuptools-scm
+during the do_compile phase.  This download is incompatible with the typical fetch
+and mirror structure.  The only usage of scm is the generation of the _version.py
+file and in the release tarball it is already correctly created
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 751868c..ef6ebf1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -71,7 +71,6 @@ def main():
+         keywords="test unittest",
+         cmdclass={'test': PyTest},
+         # the following should be enabled for release
+-        setup_requires=['setuptools-scm'],
+         install_requires=install_requires,
+         extras_require=extras_require,
+         packages=['_pytest', '_pytest.assertion', '_pytest._code', '_pytest.vendored_packages'],
+-- 
+2.7.4
-- 
2.7.4


