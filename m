Return-Path: <sipke.vriend@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31C2E74D89
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 23:12:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m21-v6so89553pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=t7CEZxbolX9wVRVzt27kkBabYjIvnLSUq9273A0SdbQ=;
	b=VE5Qbuzy6fAQodeAEcCX81uNFUFZ83qKhx3ZdACtB+K6trzX5aQZVJVDJBHhnP33l/
	i1fvMqXu6e7gk11nVxVH+Cjhgdf2TQyARQVbAbcueNmtC5ZfOA/tM3a8+cxYPPQMI+Ws
	VTstZahdxbsrBOxMAWzwtU3LjoiYoMcLniDuFpywbZrAzxYoD/f2WnIuXBTs6IzX+bFH
	lLBvSdj0TGZGir1/b+9i0mLGUvkES2JAMmPkTDuIL0eXQ14CSzwp4vUUPnU82XtVg6ip
	fqN0mEmH8856JCBiBQvrIR0WPzxuyOk3zZC6dXBII1UPw+WKBn3QKIX+EIMB0U7FAvhL
	MBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t7CEZxbolX9wVRVzt27kkBabYjIvnLSUq9273A0SdbQ=;
	b=ZBduAfV+o+WlqOaS+XL58MR9AHWvOCmfdM3n9Uvxgv7UIBR3yMRmyo81AiMClmu23l
	yrrxWvPhVPnHkW5GVRIlssV9LwGGMuTsWca5It1iqT49B7sTyLDnccHggAMUZwsE874a
	CgafFMtVmQ02EuGKRt4ruN6sXqrmyWT90E2VhVN7OIimoDzyFi1FGedKnfbPJAz76AM5
	YvqcDhaR9JlMvc3IdvvHPA4c1emj2Dp36d9zpkumIBcUUisct9lJTNLtMPuYlIOV9sWN
	dpG9+2Los7q8r7H9Yqn373MZhOZ/F9qjPGhpFv5QT4/727mQT5fZeRGYRm0lwwMMPK0l
	klIQ==
X-Gm-Message-State: ALQs6tCzk6vN9PtavdYATIPN3WLkPMew3hya+DZe0v5jPmx3pUrYFruE
	XV6NdsS38+kN8UKcPNJCUcrbBA==
X-Google-Smtp-Source: AB8JxZpEV7TZNOE+augCQ6fCGJpusSoyhy0MMumr2Q1usi4FkYyV+jQpnebihD/DfNHevz8pAEO5pg==
X-Received: by 2002:a63:a74a:: with SMTP id
	w10-v6mr10620317pgo.109.1525907555042; 
	Wed, 09 May 2018 16:12:35 -0700 (PDT)
Received: from sipke-dt.bne.opengear.com ([59.167.150.161])
	by smtp.gmail.com with ESMTPSA id
	w8sm38948562pfk.112.2018.05.09.16.12.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 16:12:34 -0700 (PDT)
From: Sipke Vriend <sipke.vriend@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 09:12:24 +1000
Message-Id: <1525907544-4034-1-git-send-email-sipke.vriend@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH v2] python-robotframework: Add runtime dependencies to robot framework
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
X-List-Received-Date: Wed, 09 May 2018 23:12:34 -0000

Add the runtime dependencies robot framework has so they are available on
images including it.
python-robotframework.inc is included by both python3 and python
robot framework.
python3 includes zlib by default so include python-zlib as a runtime
dependency in the python-robotframework recipe and not in the
python3-robotframework.

Signed-off-by: Sipke Vriend <sipke.vriend@gmail.com>
---
 meta-python/recipes-devtools/python/python-robotframework.inc | 11 +++++++++++
 .../recipes-devtools/python/python-robotframework_3.0.2.bb    |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc b/meta-python/recipes-devtools/python/python-robotframework.inc
index cc20d64..78bbbc6 100644
--- a/meta-python/recipes-devtools/python/python-robotframework.inc
+++ b/meta-python/recipes-devtools/python/python-robotframework.inc
@@ -13,3 +13,14 @@ inherit pypi
 
 SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
 SRC_URI[sha256sum] = "2018f233568227f9af8c366f93e243a157b742f3baf5b649ecc9750ac0ee1ff7"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-docutils \
+    ${PYTHON_PN}-ctypes \
+"
diff --git a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
index 16eaa78..ff7dedb 100644
--- a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-robotframework.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-zlib \
+"
-- 
2.7.4


