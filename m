Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F41C78087
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 18:09:50 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g9so51952026qth.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 10:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n1FU0h/MJ3OP+tGh/G3DCOa5E4oSbWyYMOvcJ+P5e5s=;
	b=AHFCuXx9Qs1P8ggLtcZgwLNL50gxmdksssg0EXN/TMjgXuR9NdqBF041NUdIBgmSZg
	/59+GWeCtgW2jiHIEB0TVScsDS9KBafn4p8ssoAIMB2QYfHeE0GYZ28Og5H3QciTIycc
	qizv0GeMi1mgLM5B4Z0IbXJyIDtoTEslhy/ntNGuMb8u4qL1AZ1GF3AtvGzf3bISB+dB
	Kc9gJAv5m+mHXqawkRZ9KFIXYi5ErZJuaRJ6ey4+xcOuqjOyrwpfrZeDDaHmXBVwl2Ih
	o9O2NZO1uKBqzyPfdou5XtGbgbFSZMbWlA0N4YqZPLixjHVVxaArjlUH8VzGzkJ9f1SM
	pQNw==
X-Gm-Message-State: AKGB3mKNnrO6e/sz4hsoy8G4S7JpFqv4s2kEHfYCOlGbLIArzOC413VL
	Hi6osw0NOGt33wUZQoG5yR3PI2V4
X-Google-Smtp-Source: ACJfBovgV+SboPwXEzOmLgO3Uc2MSVgfu6ZQLdyRsNEwspXJaHKctsXmzXHRO+h6Tf2sp6XmRgXXag==
X-Received: by 10.200.40.15 with SMTP id 15mr41972571qtq.74.1514484591636;
	Thu, 28 Dec 2017 10:09:51 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w56sm22752159qta.60.2017.12.28.10.09.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 10:09:51 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 13:09:43 -0500
Message-Id: <1514484583-924-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyroute2: re-add the RDEPENDS that were removed and verify on the latest release
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
X-List-Received-Date: Thu, 28 Dec 2017 18:09:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyroute2.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index 521162c..f63ccbd 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -11,5 +11,15 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
 inherit pypi
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-json \
-    "
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-unixadmin \
+"
-- 
2.7.4


