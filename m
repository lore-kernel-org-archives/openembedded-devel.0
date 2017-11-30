Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A715780B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 18:18:15 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b10so2194447qti.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 10:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tWp1o4XSqJ4Ddr/vIVftW55t8N8xkn0uXl0Jop8JBZs=;
	b=B/jTyjo46PHxcZl9l1cLQ2Gz9EU4Xmjzs9jhvZI5dDshhJ8+MSOCnSV13PMjEB4Hhd
	fl7MfBaPUYbHBxqrxZqJQ5rzuBp5JR0mmJ/bO7LSmxW/zhYLNPprxpCQ1U4qUpmy4hwc
	WFL3kxC3PvivA4CDk0+t1lp9yqurU3TMpSllByymzV7nGuThdh8QabEhzi8p+IEhL94t
	OLjjIfZCq2GVqCk7B4PkH6cBo2/1X3WlIkIsECzX29QvH9CmWqDWQOdF+qAmFs3/5Oau
	drw09stLlTSSfyOoxHcXw+zojnDDC80PKgCOvoytsAUl0WSx7ctpzw+MSeAiuVHUcJ0M
	ae1g==
X-Gm-Message-State: AKGB3mJBjAkxi1nNSLOmRzZSw/tJmfDVuyje7LrqVApUTlWjRDQWLRqQ
	6Ckg9h3pK4TBjn2sBibWyYZcH3wk
X-Google-Smtp-Source: AGs4zMa4fRCt1fEsgskt1CDiuDqJBy6ut6lCvIoyp5kMhXFDkwEf2DH0yU2a54yTzJQ8matFlOLu3g==
X-Received: by 10.200.28.82 with SMTP id j18mr4926327qtk.133.1512065896788;
	Thu, 30 Nov 2017 10:18:16 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g32sm3424256qkh.74.2017.11.30.10.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Nov 2017 10:18:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Nov 2017 13:18:07 -0500
Message-Id: <1512065887-29802-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: add a test package for the unit and integration tests
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
X-List-Received-Date: Thu, 30 Nov 2017 18:18:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index b2949a3..e0b524c 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -17,6 +17,14 @@ PYPI_PACKAGE = "Werkzeug"
 
 CLEANBROKEN = "1"
 
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests+= " \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
+"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-difflib \
@@ -32,3 +40,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
 "
+
+RDEPENDS_${PN}-tests = " \
+    ${PN} \
+    ${PYTHON_PN}-unittest \
+"
-- 
2.7.4


