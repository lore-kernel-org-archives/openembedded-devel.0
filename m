Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDA4C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 07:39:06 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.7579.1645688346427767695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPELfqIE;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id g1so1151278pfv.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UhvWkTdwOyZlEj8Di7dXbnwnHzNA9o+c70IfF6ddWrU=;
        b=hPELfqIEXU91wXd16HTX1Xt9lxPWLr9DyniKyym+e8vOkES+A0Z7lnKI2waeKCFCQp
         lditRi+z5mczBIf5UHT/JknzjTDLoUMiiQBROd3/ZaKy78Ra/5kVKN+AQZYI+ABKm5V2
         8pkOjSoMt6KFDh71NQ/bymqaEA8TgEc+AAl9bOOUZf1PavlqvwTyExA37xJFSYqfag7K
         sdlpDO68HxyklATGc/d/5yyCfkrh1oFLSHACTK9k2qPEikOs3wpfGe8SAX76Ogac7IYy
         bMrD3gn654FQnzzehfqexD9CZHQSWTqYSNtDZYo/NAhRPBZROzAkzHZ4oIZo+bvGxROk
         xc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UhvWkTdwOyZlEj8Di7dXbnwnHzNA9o+c70IfF6ddWrU=;
        b=OBtzhYWPSZA+HcbEgG9Fc2SDDN2lTnovN1PP08UKnXwix2LoGHNtrui7/8hgBEZzXI
         xXyVRvJfFGzOrmQ7lILTvbGj8tf9OZPmC6LdQpSfFIboo0CtYuBzD/I+ounaodhOgTCF
         tAWV1Oq37NUlPjvS+b/ZEj9wRxvcDhCslhFG4CKYMkaNNtD/x4ZzY2Pufg6JRi/g/Mn6
         9TfvGWg//AlwFZDffyaLwuX4i+XN8icjhbGByHXg6bJL/K5Hat7OTyUK4In9fPBiJE9Z
         OWwVneZneJnDRubLm1qklTPiOJqzuGEJuKlq0Eg/k2tyh8hIp0M3OkSSs9lxazFrsFJl
         eoPw==
X-Gm-Message-State: AOAM533OmQk0WUZWAwlZBVsX4jDRRiGtKcx5uf+Ny7ORIZ5K53Ky5dyV
	qUL1RyYAJhjELh9dQD5QnE9EcHBqo16iVA==
X-Google-Smtp-Source: 
 ABdhPJyfcyjLBpVEQ4LHFXlK5emxm2tCxYf6bOFJ76jjKSZSJiWuCHj3tz/uUF+DzMmIZx4g8Jn5Fw==
X-Received: by 2002:a63:e5f:0:b0:374:62d8:c551 with SMTP id
 31-20020a630e5f000000b0037462d8c551mr1318455pgo.129.1645688345229;
        Wed, 23 Feb 2022 23:39:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001b8b01e2479sm5486180pjb.16.2022.02.23.23.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 23:39:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-blinker: Migrate to use pytest
 instead of nose for testing
Date: Wed, 23 Feb 2022 23:38:59 -0800
Message-Id: <20220224073900.1350656-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224073900.1350656-1-raj.khem@gmail.com>
References: <20220224073900.1350656-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 07:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95498

Nose wont work well with python 3.9+ anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-pytest-instead-of-deprecated-nose.patch | 36 +++++++++++++++++++
 .../python/python3-blinker_1.4.bb             |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch

diff --git a/meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch b/meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch
new file mode 100644
index 0000000000..a04c79b1e0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch
@@ -0,0 +1,36 @@
+From 9750d01118ee59ab174525e30d987065b69c0538 Mon Sep 17 00:00:00 2001
+From: pgajdos <pgajdos@suse.cz>
+Date: Wed, 8 Jul 2020 15:22:19 +0200
+Subject: [PATCH] use pytest instead of deprecated nose
+
+Upstream-Status: Submitted [https://github.com/jek/blinker/pull/60]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_signals.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_signals.py b/tests/test_signals.py
+index 9771e40..ccbc35b 100644
+--- a/tests/test_signals.py
++++ b/tests/test_signals.py
+@@ -4,7 +4,7 @@ import time
+ 
+ import blinker
+ 
+-from nose.tools import assert_raises
++import pytest
+ 
+ 
+ jython = sys.platform.startswith('java')
+@@ -232,7 +232,7 @@ def test_meta_connect_failure():
+         pass
+     sig = blinker.Signal()
+ 
+-    assert_raises(TypeError, sig.connect, receiver)
++    pytest.raises(TypeError, sig.connect, receiver)
+     assert not sig.receivers
+     assert not sig._by_receiver
+     assert sig._by_sender == {blinker.base.ANY_ID: set()}
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
index 397fdcfb05..08a961f938 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
@@ -8,12 +8,12 @@ SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d6
 inherit pypi setuptools3 ptest
 
 SRC_URI += " \
+	file://0001-use-pytest-instead-of-deprecated-nose.patch \
 	file://run-ptest \
 "
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-nose \
 "
 
 do_install_ptest() {
-- 
2.35.1


