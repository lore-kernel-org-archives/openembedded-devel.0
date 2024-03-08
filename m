Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F613C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:55:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2754.1709927712656651574
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N7SwBEhL;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412f62ee005so18017435e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 11:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709927710; x=1710532510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J97BXzKuLOCLAo14NZO3DksxPm1H7Vwgs2DBdjlC64w=;
        b=N7SwBEhLxveVi0c6t+0tu1zXCfFu8DBOoh90/zJJQeuwgeHbg7sLzP9EU6bjak8XS5
         ZMajzSjCFzQYgunI+3x+3n9hn0OIko7En8BWuMo9j+Ychh8tyXrUfbZD4G4pwPEkrLtj
         6kDZY0O/eOjgM9MRZJUd8l9pKtrL3VcN0MGCcykSCG/8WJuZjWuUrsoOneFprKEPzZrZ
         5aiBkNSvR+TaLnB67oKzyhEjEjl0HP+XFuq2zreTn6rbF0G9piPm8WP4mFYKhudqUG2F
         x2L2Vm0s0+4BByH6+Gu5Wt6pCpqbpVNDrpQ0dgFkWBuZPCm4oSSoVs9akCOUBeS2I8ok
         PBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709927710; x=1710532510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J97BXzKuLOCLAo14NZO3DksxPm1H7Vwgs2DBdjlC64w=;
        b=tXopD5c/0IlpVBzIh9HpmkY3myhZzqP9p2YrJZS4IRCrgUJdOvecxePT+Xemf54LQu
         SgIvs7WsG+lsdEZr8hw09ETrx+VMUuDN8GFrv5AycmVBdoFzT3JsDX18juLlrXbSVDCU
         pRSGL66iey6i8/SC7kKNp6oqqlg9nKB8hxVdumhIlcQD47ZZ71yl+H6kV+1s0nMh2PFU
         0IZaGWJYjzyzav7gGdQ4045KqMCYxuCZP+bCLnvzNn8VVK4t4x3cLfLxXXG8fGnoZXLN
         BXI5iLqDtr8h2GfhqIu9JhIP0DPZ0ie1uEMdHonzF1KguvvMAuUwM0lYQMOZyt2F5LQE
         tL8w==
X-Gm-Message-State: AOJu0YyLun8wKApTX7xZHeD+uyBzI7AV/iB/dAqW8ykUtqGeVN/GbjsD
	1Ov19+MxkNqL/ENFyEzlkob1FYH9SCwUOoKGsij+nXDfnWgJvSvBvrb1MSmgAUs=
X-Google-Smtp-Source: AGHT+IGlhc2Ii0TCgLMqnRJ/DMj4LDnaWhdC+ckF+iSdYx90JBZdXQ1gSSTn9i8vp7LfEud+iQ3fMQ==
X-Received: by 2002:a05:600c:5020:b0:412:f523:6361 with SMTP id n32-20020a05600c502000b00412f5236361mr164836wmr.28.1709927710278;
        Fri, 08 Mar 2024 11:55:10 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id j18-20020a05600c191200b0041316e696besm3435099wmq.13.2024.03.08.11.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 11:55:09 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-wsproto: added recipe which is also include ptest
Date: Fri,  8 Mar 2024 22:55:04 +0300
Message-Id: <20240308195504.3199754-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109240

This package is a pure-Python implementation of a WebSocket protocol stack. It’s written from the ground up to be embeddable in whatever program you choose to use, ensuring that you can communicate via WebSockets, as defined in RFC6455, regardless of your programming paradigm.

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============
qemux86-64:

Testsuite summary
TOTAL: 230
PASS: 230
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 18
END: /usr/lib/python3-wsproto/ptest
2024-03-08T19:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 230
PASS: 230
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 15
END: /usr/lib/python3-wsproto/ptest
2024-03-08T19:40
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-wsproto/run-ptest          |  3 +++
 .../python/python3-wsproto_1.2.0.bb           | 27 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wsproto/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index acfe28039..5ace8a9a2 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -71,6 +71,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-unidiff \
     python3-uritemplate \
     python3-wrapt \
+    python3-wsproto \
     python3-xlrd \
     python3-xmltodict \
     python3-xxhash \
diff --git a/meta-python/recipes-devtools/python/python3-wsproto/run-ptest b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb b/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
new file mode 100644
index 000000000..09f5565a9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "WebSockets state-machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/wsproto/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI[sha256sum] = "ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-pytest \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/test/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+        python3-h11 \
+        python3-netclient \
+"
-- 
2.25.1


