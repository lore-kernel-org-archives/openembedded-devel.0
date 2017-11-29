Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2FE601D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 20:44:46 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 63so6212389qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 12:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jOnTnhqyJyzCM0Ri/56qqBZ9Twkkk2mY1GrZpD+aFFY=;
	b=OM9ATO7jby+9SoUMqgBTnX0IdTdt7nli0oRcTTEKYIghE2r2jzWaUDSO7H48AV+pDq
	L6l9xdUjr1hcJ9LvRgr2TpOtQY2mjMeEgrHpETEUMLfHyL/6sNVtnQXN2/VfRi4ObNbV
	XDFrIgYESh5CkUHgqBRGB2evEC2U+ZfsJfjXIX7PKWrCQcIo6faZZwWYpAssU+QQQDqO
	MZzN0WIMuWZUFdI3TS5/UizhgXUBApd33kZc/N+ah8GbSVIYZIazTGmhgWLteoN3L1+S
	a37HZumG88ozM24YHLhhXcTZ0gIstdwo1gcM9QZDSfQrxIx4Q7YXkwJvEDIIG3BMUm+V
	MEzw==
X-Gm-Message-State: AKGB3mIzpMsM2DQvrbvQqnOCI9PNKfM3GO8hPY9QbJ8+5iMhmKH3Xu1C
	4aiETLk1uP8/5v/0nUt+sdwGrEzK
X-Google-Smtp-Source: AGs4zMZHi1u8K0br1CQHvycTGGlIp/xjfvKAG6wilTpaT9pWgtNy1lLVHPnZofByLLNgcfji1zOxww==
X-Received: by 10.55.209.220 with SMTP id o89mr202810qkl.291.1511988287821;
	Wed, 29 Nov 2017 12:44:47 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id h4sm1865952qtb.22.2017.11.29.12.44.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 12:44:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 15:44:35 -0500
Message-Id: <1511988275-5323-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-asn1crypto: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 20:44:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc    | 12 ++++++++++++
 .../recipes-devtools/python/python3-asn1crypto_0.23.0.bb     |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 41b7342..92c7198 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -10,4 +10,16 @@ SRC_URI[md5sum] = "97d54665c397b72b165768398dfdd876"
 SRC_URI[sha256sum] = "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc4aaf42a9d94d70"
 
 inherit pypi
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-textutils \
+    ${PYTHON_PN}-subprocess \
+"
+
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
index 30f3404..bc67215 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
@@ -1,2 +1,8 @@
 inherit setuptools3
 require python-asn1crypto.inc
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-selectors \
+    ${PYTHON_PN}-shell \
+"
-- 
2.7.4


