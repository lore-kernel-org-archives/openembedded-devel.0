Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0A2D609DE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.247.1765907927348155958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=goWUI3Ug;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so38373515e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907926; x=1766512726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rd+TGBOAbky0uDhsWJRzEITMo6VGUAUsr5j4raL9MA=;
        b=goWUI3Ug4eCggj7WO1L2fCQ9sJdy8m87LKeBntIyIZAIR8i00bQM/3ao2lQFLYbv0i
         SegguvOqo2l8rqsmnF3dZddr0LmSmu92epbVCS7duCvOmI9XpRsexm9sThd1TFV2PU1n
         HEeFalkz6n7pu+mm2liEoYrVEPhMa/PcQzvvUhKVklN+M9+chNF7VwGtSFW0//YBVkb9
         Gs7jhEgVvBbMYZRh90y7L4cyDmAExhWOYWxG8dBuTl9ENtxu9/ggvIaSv6NTDgZikOWz
         Yjyp4bJDKakeOkXstWoxQv5YPGU/kXIUbZUPf0tGSXTj46PW9UU559kq4+hg9PFGk9nS
         AEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907926; x=1766512726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rd+TGBOAbky0uDhsWJRzEITMo6VGUAUsr5j4raL9MA=;
        b=s1XgvMLIBmIs18NmAjcULdAB1BoIalvZxx26DoAZAQRFqChYEShjnuaaAYDoYUAMxl
         FQDedjaHaSQeEGaS7oYCFgSDxyYgdFczyh0ocQ/mM21b9KpYf/zF00+87hZe8RgA6pT5
         ++Dnxf2+Kv59nB143BkpIExPHzLbMQc7RqBUTIcxof1pZbEC9z1zTONsZw3heXGIXYLJ
         L2rjzl2RFIzSculR/+LZbfbgyqrQ5adUoMAC0v4p7z9bDHJEhSuCChPWDbYzshLHoZnt
         PeoXtTsNcK87NbIltVnl2dPGa3odfmtIQer/s6BkP582FbD0haYfxtrtsX+fmhApIwxr
         Tylw==
X-Gm-Message-State: AOJu0YyRCmoyIt+a2L8SYb6RNDkND/6Q7G5pEP8bMvS/OKeQWOXOB44Z
	D2qDQi+qhVGLsI4kI4a8v2d+tvZ43tR1zz9CJSV7qnTDnlhMmNSEfsD67ZQRAg==
X-Gm-Gg: AY/fxX6SNZ1GYR/Z9zO5OihcK5F5fsnEEq/+MKVcS2Hsltcrgn45DPy6oaC0nFYh39l
	ZuGIYRXcA4uTUshbRiqr1C54pdimN7u14KV3h1vZR3kdKxt2wXnwN4y6ue0NJGVhKwsvo4KkzWz
	9t2DqtZmBbfMD8asaf70ZpiX4V9kYcKWujsTPVyd6xWivw/f/Ahpp0bg753T0psjy/ZzdWZOHlH
	HxmdbfeyLx9v/n8tTTJMBrppnSKCOQdHKModYNZph7jCrM9pdn9ICTZnktFUwGOrFB7I+61YAae
	NTZ+ICewZROPYDKgHFy8H+IogO+XvQDdw2zyx1fmWneYI5aIOn3r5XiLgP37oD7OSUAcLRv+I0R
	CyEcKbIjr1zM5mD44lw26wcjYlgvkqmZue/y6evZXiwD1rh2slg/azVi9lhymuUGlxiwSvr0now
	W+u8DTKlxi+89H1dOtbIY=
X-Google-Smtp-Source: AGHT+IGHJJBPg5OuFHg7trnmDeJJGFTBS/dlyMgrGrzoEbNKiMAnoC3sx8sIIGLLvGjAVxOQWcBsdA==
X-Received: by 2002:a05:600c:8283:b0:479:3a2a:94e7 with SMTP id 5b1f17b1804b1-47bda747eccmr20777595e9.10.1765907925612;
        Tue, 16 Dec 2025 09:58:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/7] python3-pyconnman: add ptest support
Date: Tue, 16 Dec 2025 18:58:38 +0100
Message-ID: <20251216175840.2939403-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216175840.2939403-1-skandigraun@gmail.com>
References: <20251216175840.2939403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122704

It takes about a second to execute. Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-16T16:32
BEGIN: /usr/lib/python3-pyconnman/ptest
PASS: test_agent.AgentTest.test_simple_wifi_agent
PASS: test_manager.ConnManagerTest.test_agent_registration
dbus.Dictionary({dbus.String('State'): dbus.String('online...
[SNIP... debug log... SNIP]
dbus.Dictionary({dbus.String('Connected'): dbus.Boolean(...
=========================================================
PASS: test_technology.ConnTechnologyTest.test_scan

============================================================================
Testsuite summary
DURATION: 0
END: /usr/lib/python3-pyconnman/ptest
2025-12-16T16:32
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc    |  1 +
 .../python-pyconnman/files/run-ptest                   |  3 +++
 .../python-pyconnman/python3-pyconnman_0.2.0.bb        | 10 ++++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-connectivity/python-pyconnman/files/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 7bc6b6575f..e575b372b5 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -20,6 +20,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-cachetools \
     python3-cbor2 \
     python3-configobj \
+    python3-pyconnman \
     python3-click \
     python3-dasbus \
     python3-dominate \
diff --git a/meta-python/recipes-connectivity/python-pyconnman/files/run-ptest b/meta-python/recipes-connectivity/python-pyconnman/files/run-ptest
new file mode 100644
index 0000000000..aafa0f731d
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyconnman/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+cd tests
+python3 -mputao.unittest
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
index 040f1acc92..52fc1dac55 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -4,8 +4,14 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
+inherit pypi setuptools3 ptest
 
-inherit pypi setuptools3
+SRC_URI += "file://run-ptest"
+SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
 
 RDEPENDS:${PN} = "connman python3-dbus python3-pprint python3-future"
+RDEPENDS:${PN}-ptest += "python3-mock python3-unittest-automake-output"
+
+do_install_ptest(){
+    cp -r ${S}/tests ${D}${PTEST_PATH}/
+}

