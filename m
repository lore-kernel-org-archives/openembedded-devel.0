Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCBE71A74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 21:50:41 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n127so6100506qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4meVJbtAuqPsiSR8iJU5Geh/rPyTB0bE1riM/3GsI4Y=;
	b=CCMEUAR4mYry52PCuMxMojzS2UkY8A8PLtfS1frhV9iGC/U1YqTIL4F+VpfI1mqmnA
	zEMDFRuByM91nfvxBqkavGS8rO2y54tp6Ya6QgNuAHKUwWkpAqufFO92aF/sHogFdv/e
	hsCUysUs5RMhAjHJRU6q/3GOg8eBS5fYioPOFw+p7ZYeY4tyldh0y8VtOt5JA+KNOFBR
	BrIVV1l9YBA+Mf+/kN3jd0qERxDZdvafnZQRCMSvPbKeCwqO6eUcvbWTeR6wsycgAX3J
	lSVNGrMntRO5If7tSTVQH/0TyD5tw48cwxVq/PxtK3kvTFhCubi0nWQsqpYp/04aDQso
	K0EA==
X-Gm-Message-State: AMke39mYc1sMWSEYKWR2so7cYMurgwq6rit8XAnEwJ41e+zBYOoOQMCxi26DWxYMXYOrfg==
X-Received: by 10.55.21.129 with SMTP id 1mr5541576qkv.75.1488318643339;
	Tue, 28 Feb 2017 13:50:43 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j140sm1853649qke.6.2017.02.28.13.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 13:50:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 16:50:34 -0500
Message-Id: <1488318634-8029-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.0
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
X-List-Received-Date: Tue, 28 Feb 2017 21:50:42 -0000

Verified the license remains the smae and updated the checksum and location

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.6.9.bb => python-cmd2_0.7.0.bb}         | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.9.bb => python-cmd2_0.7.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.9.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python-cmd2_0.6.9.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.0.bb
index ed99792..5c092a7 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.9.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=17;endline=17;md5=25c0f7ede01b1eab41daf880e5791f05"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=43;endline=43;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "cf39b5a34955d263b42a7ffc9d3e536d"
-SRC_URI[sha256sum] = "ef09745c91dbc13344db6d81f4dea4c844bf2fabf3baf91fab1bb54e4b3bb328"
+SRC_URI[md5sum] = "ee92ff1b73765d64bf230e94512d0b7a"
+SRC_URI[sha256sum] = "5ab76a1f07dd5fd1cc3c15ba4080265f33b80c7fd748d71bd69a51d60b30f51a"
 
 inherit pypi setuptools
 
@@ -12,7 +12,9 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-pyparsing \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
     ${PYTHON_PN}-textutils \
     "
-- 
2.7.4


