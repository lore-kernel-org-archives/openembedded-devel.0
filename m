Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8742.1792580514306966158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NPi2F6Bk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso326634f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580512; x=1793185312; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/rR6tn+DiO3p2h4FxXMEUzCeMGJCJjOC1MCi/6mzic0=;
        b=NPi2F6BkFg6VkACKnaGxGB4mVV4bAMWvz9ZlZ24C1pmA2ymGw105yYsRM4xz5gOTUw
         9EDAajLW81qGVdYuLREb/prs1dXiNgysc7WOQP8E8RGKsVql1nxgtzZU2/FvBkx2cdQu
         M/ZjlXL4xZl5mie/aMbR6dgHewpY8wmFFEjsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580512; x=1793185312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rR6tn+DiO3p2h4FxXMEUzCeMGJCJjOC1MCi/6mzic0=;
        b=fHmavZdW5PFcsyh+dA1Lm0A5TIrKiqawdFZ2CL8L/irCy0Sn+wsq/4KUbWscirvkJr
         MmV4kXLG0Qi8KzZ2tvlylGGDJL08wLopJzNQTiFvGpJ8FdAHM0VjHatbfCmuxqDkfUDJ
         FKfxEbO4BZrSZLtI+PQg5bmu5Ty4wCzRwPhcKimpdu41WxVaMuLWLRHtdCx/BKcBSxr8
         +Wc4tVW/+uezkaYAmdsCt8y3UXTuGLWAoxtrhRBraidVr/zdwFcSHEg6w/IgwrG98l5w
         vtW1VRQfl9A7uTW927+arPehu5zgvdnhn1rVoP2q9NiwFu9QQsVQttewt+aHUlhKUPMA
         yCMQ==
X-Gm-Message-State: AFq9FYJen07J5zr8RvYyWhiNB8D6rCFt/pw3wRz9eVTfeQRccqTccNDf
	CD/42TLBuAqvoS3+FHxgkOTqBPutO3ZkSl9Zgea+G2yI8PLKuJEdEDYDUItFeIz7w7mhQRimzv7
	mf4M4
X-Gm-Gg: AYBFou1Fp1k0j3R1UbUoubjUCqmfwrIOg9VV2UTbGBVNZAnunUGsLlOTcbp+5at09/j
	Kw5vtFudfCxyHrFlreYQz2tZdA+xRodqUkOQpPXlHvgL5B+/HgaSTVv7L3tDTfLU9mkZpk6chOu
	Gtc0ztALq3QYCdHXfUubDSg7KrvFu9idrbylQQTq25lVMXvRH6KhfQi1bHMtwDQvT3VLPe43ubG
	I/ktEEsdlDpFDMQZGdr2mzdsf6SFX4y9Myml5ZO5mumiOWvCOYVu6MgSlBwbghlaXqt7duQtW/c
	RJ6soDrA/sMYIo2xD3/RmYQxczbvn+FHsza6J15Ef5cv8B2mIM0VOSgau52dJfqnu1SJDlGHPeQ
	qYSogBCXUVvr/Mf6NCHp8ZxS32758FjX2e98Qg0EYbVnuuMH5dWTzTnQAcoulbdyWZZbVnEtkyk
	c3Ag/TtFM9TSYqC7IdDxJM2nTGTDRLbd+5Gjf985pkXkqqASHzKpgjv6+CRl72iqLNIiMQB0+W1
	YBcWY6lYJgaDLmuHAKgLBICLtUjU4kq6LdzjsFMYxOdtqBS5TG82dPKx8QEzWCaSet/lL+MjeWO
	8mYzC2/EW8NFu56kGmD4+2J5X0bGrrr2zmykC/ZhFB++R3Rd/hlBUNYtn0qmbfNpc9GVWy5+MwH
	ax4Rj
X-Received: by 2002:a05:6000:2313:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e264d182cmr3931068f8f.43.1792580510877;
        Wed, 21 Oct 2026 04:01:50 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 25/36] python3-lazy-object-proxy: Upgrade 1.12.0 -> 1.13.0
Date: Wed, 21 Oct 2026 14:00:49 +0300
Message-ID: <20261021110103.1943456-25-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131284
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.13.0:

- Document explicit proxy evaluation and identity checks with None.
- Fixed some broken tests on Python 3.15.
- Added configuration for Windows ARM64 wheels.
- Added Python 3.15 wheels.
- Dropped support for EOL Python 3.10 and 3.9.
- Dropped wheel building for Python 3.13 free-threading
  (experimental and unsupported by cibuildwheel anymore; details).
- Fixed typo in __annotations__ (basically it was broken).

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-lazy-object-proxy_1.12.0.bb       | 16 --------
 .../python3-lazy-object-proxy_1.13.0.bb       | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
deleted file mode 100644
index 273211a3e9..0000000000
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A fast and thorough lazy object proxy"
-HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
-LICENSE = "BSD-2-Clause"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f0cd92fd68aacee0503822c05a3ee6a2"
-
-DEPENDS += "python3-setuptools-scm-native"
-
-SRC_URI[sha256sum] = "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c124c0c61"
-
-inherit pypi python_setuptools_build_meta
-
-do_install:append() {
-	# contain moddate, makes is non-reproducible
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/lazy_object_proxy/__pycache__/*.cpython-*.pyc
-}
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb
new file mode 100644
index 0000000000..e8f1f7a0c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb
@@ -0,0 +1,37 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  BSD 2-Clause License
+#  
+# -Copyright (c) 2014-2025, Ionel Cristian Mărieș. All rights reserved.
+# +Copyright (c) 2014-2026, Ionel Cristian Mărieș. All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
+#  following conditions are met:
+# 
+#
+
+SUMMARY = "A fast and thorough lazy object proxy"
+HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
+LICENSE = "BSD-2-Clause"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d907de309286ace60c424a81666867d"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+SRC_URI[sha256sum] = "ce34046cb021d69c72d05ddb83821ecfd4d2d0a5d43a93c5cd01c9e34779cf14"
+
+inherit pypi python_setuptools_build_meta
+
+do_install:append() {
+	# contain moddate, makes is non-reproducible
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/lazy_object_proxy/__pycache__/*.cpython-*.pyc
+}
-- 
2.47.3

