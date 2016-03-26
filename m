Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CF6C86FF97
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:21 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id e124so6290985qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JbJg6Ja7VZoxG3bFsgvPPIK4B7ye8MmhDjvPzUggLRQ=;
	b=Uo3eYCpiM+vbtVndI423UYhnJ1Ga3AZzmm05rr9PNHZjxKJS2isFx7Uhl6I2NXeoi2
	TWohCJLb3poe/bOGAR0wl4SUxGjbYUq9R8jt+5lcrC5uRKaaIGglXzgr/gblIrlqbyqA
	74jUlXSSbmUjGK/e4Z/1oNVhHkl4tYurqM21n87kn7maKEB1XyLJfRg/Aw0KHF9ckoUS
	LWEPesSuzGn0Hm4p83vL1VIla7IrKZcCHj/uBQsyR5Iub9uG0v9/2lFmBjTCf3S4lVAc
	MXRkqllQO193JEMSzq3C2qYAjR8CbeMNsybRKbdriWs8nJMwSA/KXagw+6zeKlj5cwIo
	t9dg==
X-Gm-Message-State: AD7BkJKPS3tB1vFHYiO8lWfE3cYbNbCmV5uLqM1O0zzHa5h4ZSAS2ku+P3EC1aAiGgGiQQ==
X-Received: by 10.55.76.134 with SMTP id z128mr23681521qka.90.1458997522662;
	Sat, 26 Mar 2016 06:05:22 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:43 -0400
Message-Id: <705b5d0b137188a19bb1dcd1f45f01b4a983f39f.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 23/30] python-pymisp: update to 2.3
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc          | 10 +++-------
 .../python/{python-pymisp_2.2.bb => python-pymisp_2.3.bb}      |  2 +-
 .../python/{python3-pymisp_2.2.bb => python3-pymisp_2.3.bb}    |  2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.2.bb => python-pymisp_2.3.bb} (52%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.2.bb => python3-pymisp_2.3.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index ca543f0..9cd0844 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,14 +1,10 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
-SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
-SRCREV = "a7fc1ceb20d455ccfa2ba7af229048330e22b173"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c0a3e801b740ef31d1f5ddfe76bca538"
 PR = "r0"
 
-SRC_URI = "git://github.com/MISP/PyMISP.git;branch=master"
-
-SRCNAME = "pymisp"
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "398408388902c108e3b378152b6c1d24"
+SRC_URI[sha256sum] = "d70e74c528f040f5ff8137337f1758aeb63a5966b58b297f2171f53cb9df033e"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.2.bb b/meta-python/recipes-devtools/python/python-pymisp_2.3.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python-pymisp_2.2.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.3.bb
index a0b655f..1b1fbe9 100644
--- a/meta-python/recipes-devtools/python/python-pymisp_2.2.bb
+++ b/meta-python/recipes-devtools/python/python-pymisp_2.3.bb
@@ -1,2 +1,2 @@
-inherit setuptools
+inherit pypi setuptools
 require python-pymisp.inc
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.3.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.3.bb
index e41acd6..4523d9e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.3.bb
@@ -1,2 +1,2 @@
-inherit setuptools3
+inherit pypi setuptools3
 require python-pymisp.inc
-- 
1.9.1


