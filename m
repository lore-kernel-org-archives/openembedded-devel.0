Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC6678145
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:55:42 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id z28so2947637qtz.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 07:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vtKvnTwKIjbqY2sSN+FmMYgsxxGWGIS2n8Lzts9w2W4=;
	b=DgkVlcfVmU0iOUUWdYtDQY7GSWsG1tMi1rNEZMfodiMOLceO+76PUgkZE506/z2+vx
	kympwlTP3LaaP3U0LFBe0MY85FcJp4zin73Zkc2EinHR119E39kkx0UqJ0m1O94wc9r1
	ffosg3SO3FcuXHvUD9M0c5pRinQHyXNIIAQLmOgBOnMni0vBMJxsQu4VafKBa4qGFacm
	szr8keW86xeXC677Y6/nIEscxxC1GvlJ0yHfpGtOTuXzvB7MwmJFOCobFZq8g2KWzVGL
	9tniFpTTmtmWf5Pa/oasVdLXnnprqEQq5rrmmP1bV/c9KbF6kp3TFcZqXqYkjHuV2wJj
	yYrw==
X-Gm-Message-State: AJaThX5PlU9OWewyB1r8lTwEJTnQmeXuaxGgiROxlMq01RDXTJNmmHZk
	5+FFXzhM0t1Hf++YzjQIJQxkd2KI
X-Google-Smtp-Source: ABhQp+RJlv2gKkGtb//0nLqGETQRR9H7FUNv6HpUg9iAcVZcZeMEqFmXr5kOIhrEF1wsrRcjZVy34A==
X-Received: by 10.237.42.43 with SMTP id c40mr184118qtd.322.1509548143131;
	Wed, 01 Nov 2017 07:55:43 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id l20sm554695qtb.27.2017.11.01.07.55.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 07:55:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 10:55:13 -0400
Message-Id: <1509548113-2182-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-constantly: add a recipe for version 15.1.0
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
X-List-Received-Date: Wed, 01 Nov 2017 14:55:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-constantly.inc     | 11 +++++++++++
 .../recipes-devtools/python/python-constantly_15.1.0.bb       |  2 ++
 .../recipes-devtools/python/python3-constantly_15.1.0.bb      |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-constantly.inc
 create mode 100644 meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-constantly.inc b/meta-python/recipes-devtools/python/python-constantly.inc
new file mode 100644
index 0000000..8153504
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-constantly.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "Symbolic constants in Python"
+HOMEPAGE = "https://github.com/twisted/constantly"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e393e4ddd223e3a74982efa784f89fd7"
+
+SRC_URI[md5sum] = "f0762f083d83039758e53f8cf0086eef"
+SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-json"
diff --git a/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
new file mode 100644
index 0000000..29b15eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-constantly.inc
diff --git a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
new file mode 100644
index 0000000..3f66754
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-constantly.inc
-- 
2.7.4


