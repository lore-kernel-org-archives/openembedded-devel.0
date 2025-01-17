Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6645C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:31:02 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.4858.1737145854805196152
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-84cdb6fba9bso202591339f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145853; x=1737750653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blVcnJygRdNHoQDJhd+FD2uuZQN+4+SnNjdboPDX0mA=;
        b=RTagT0weodnCW1L5Bq7eFC5Q0m1vdm33rw1mz0H0mbtrnpCi/Y/2sG/VnAd8KPA07t
         3Az8sZaLi3dtS4SzO+eO5tqOR+mWS6kXHtz2jDQqFPIQpsmvmxi0bKpGjaXh/SAewBFa
         Ygg3nAsrRud4EcRFZZ1IDFov5rjn9D/R9uhDq+URgZDMp7dWHU1VLv1zjt+ATyHbWeuR
         ZzQdMZnv2Ai7SRZ5rjreT2eUBLCEuj9FOaJKONVrUD1qJZxYZuhnBE2rQMbYpMpNSghu
         7+hrTN1iwdSbg2Ed21oegkhjKEYTu4ptR/dYuWcqmplzFKB/qRJfSaldXaffq/J9ZERO
         7QDQ==
X-Gm-Message-State: AOJu0Yz+tcKySQkUjlhRrBAsxkmZHh7lvQJuN/UN7LfXoXi6OjBNx8DK
	U1zByksaqrNezfxhZog0IBmqpWE4z0uio1qQVbabSjaZXo7FZMNciCuFeA==
X-Gm-Gg: ASbGncsiZONIds62KOHHob6lXs4nm1IeBrshdr7oTPCA+roNhvXQgjmVmKGRH2QJOxH
	s86YF8+vB8uw8Zch2qCyejgDPRO78twDKdlinDOxYRxc2x6xz+s8hmV4NEADqOAnahQTB45unr9
	3tu01OrLFsTAnY5Uragh3HsUbl2izMhJGj3xuiqm/R00irTblj3Sbk3071GG+KfMjdfGIZInXVp
	L7/s1aLx2AiNRHIqo7f5W1oM0nhaynM7ZSGeqBNSq82FzUhBlSQr0OhyuEx21OU8EDiUmCNhM+K
	gD0nccjXg/AOCjNSZkpmR7hCOg==
X-Google-Smtp-Source: AGHT+IEwa8Kq3AynWq39Pg8z1m2zDOV+mmqSe5mWiF8kZ3lRFZ0HrxAGttEBfuBhYUpmRK3Rvbw3Wg==
X-Received: by 2002:a05:6602:29cd:b0:84f:2915:daef with SMTP id ca18e2360f4ac-851b653aae9mr380262339f.12.1737145853194;
        Fri, 17 Jan 2025 12:30:53 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/10] python3-portion: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:30 +0000
Message-Id: <20250117203030.3648575-10-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114943

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-portion/run-ptest            |  3 ---
 .../python/python3-portion_2.6.0.bb             | 17 +++--------------
 2 files changed, 3 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-portion/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-portion/run-ptest b/meta-python/recipes-devtools/python/python3-portion/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-portion/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
index 31c6f0731..8bdbc032c 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
@@ -5,28 +5,17 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "6fb538b57a92058f0edd360667694448aa3fc028ab97e41e3091359d14ba4dd5"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 RDEPENDS:${PN} += "\
 	python3-sortedcontainers \
 "
 
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
+do_install_ptest:append () {
 	# This file tests README.md and deleted as redundant.
-	rm -f ${S}/tests/test_doc.py
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	rm -f ${D}/tests/test_doc.py
 }
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


