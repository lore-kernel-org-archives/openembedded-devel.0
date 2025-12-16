Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65441D5E13F
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:58:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20586.1765886321470181050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 03:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R2gS4dOZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso45191505e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 03:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765886320; x=1766491120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SI3QP+4/bZtymkM9hrQQuU/mfMGV5FPT/s3TA2xuI8=;
        b=R2gS4dOZQFr8n1qGeWossF2WISnGoWlsQ2PXVH5lXdXWBO4KKyaCsY2cSwfwggjRxg
         AGCDMmF4ihjwcO8PzX2opqf+ag2oyBrf7xmSdl4M2Wj52BQNbyym40S7BQSwS0tL60mk
         RTjXCMg+HVDA4h/vOvuW2Ndlw24a8IsF6wtywvpk3YmxXh79kUC4x+jvThs0tsAeSc2Z
         d1RxcIIuCfzDIjjGkmtlt9tnGEkodqnvHNItIUXv6fzpjeoMCFqXMNg1+siAiqmsePC4
         RFZKPgwHAhvcdlraojxl3lCFEWnRA6mcov5td5Bco4+XVQUhxQDeMre8o+DSVT809KlJ
         vg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886320; x=1766491120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4SI3QP+4/bZtymkM9hrQQuU/mfMGV5FPT/s3TA2xuI8=;
        b=QihOyBf78R3SROJOtGyN6Y+1Uk5Omq2Y8wRVraiFC0OCezvBIKKNdFOx21JZr2YAtj
         m6M+LEGmCfTNPbAv9wyPVvYOyFDmdsl36gjN9RaXXpkXL+l1w5BvlTgzVU8aSAPL1+Rh
         Lgt+pDvJUmZ/VwlRS+6xlSLpqmbujkJAFAI0cVWRFdIDHbksn5dR5Jr79E/05f+ep9/K
         BNvmzvsxzqSFC73sBOIS5j7hR/zYcSLbeHnQlaHPyLcYTOuTzgDHsV6f8HARq2GDxpvx
         VThAlKWL6chl+Iuy1aFJLnoUvXNS+vheaRv7RHMwzHFR+TEASf4r259rOB7539eMZUyy
         CMfw==
X-Gm-Message-State: AOJu0YwNCQi7Xr59zxWccEb8/jVMnEIVvoAQShXLtUbcfV3e/WVzW/bz
	MkedlF73gsSBO8o+BEOnfd6i1a46TdIAZmmdJRL981GxxQGZ4hSBI0efVKUZ4g==
X-Gm-Gg: AY/fxX7CFS2KkqvLIABgxPQ76oq7QRiwWa6LsLT5QncJIjx/K2MVveZ0N0LYa1ZlmpW
	lbRx89RaXxe8etj5KToSKe6EsC0B97ZpXy0nR9OKcseFZje2RHpT+fDWuTcm/DRVE17Qx2SNzgN
	z/ZZnMPXLGYik7/YWYvQ5g2B/IhBY0t85H8b/L+YlhaWTyf75JDcVT0FzauPoRICEoUaTLgsZd/
	rBSV+R6m1dteR46XIByMFNu7QplF/Tprbx2iJIthkZADIa+azUKHZjZoNCntimClxy1Tu7Fc9Ho
	Nt+eq/Y/j4txe+5johSJ43O/HSORcHfRxxg1+SD1+SsSANj8F0rLhujvxc/HdR3Z2rYefZHWYWj
	fvjQwKxO/q2PrtmXpa/ZFrUUo+J4o13GgcxG1bycY+v+fzjpimyV5mgh5u726pM+8INPBZK4NND
	Vqa62Z7VCm
X-Google-Smtp-Source: AGHT+IGUYWdxACMFsx6WHHWYy8mY50d8ul2ZLk3N6+NnaYhQEpQLi/0UVp/NHLKnD+CkZDxOC0go1w==
X-Received: by 2002:a05:600c:84c8:b0:47a:8383:f2b2 with SMTP id 5b1f17b1804b1-47a89ee2f54mr127101325e9.17.1765886319721;
        Tue, 16 Dec 2025 03:58:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b1347sm261010495e9.8.2025.12.16.03.58.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:58:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] unbound: complete ptest support
Date: Tue, 16 Dec 2025 12:58:37 +0100
Message-ID: <20251216115837.1669852-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216115837.1669852-1-skandigraun@gmail.com>
References: <20251216115837.1669852-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122695

The recipe had already an almost working ptest config which
wasn't enabled, it just needed some small fixes to make it work:
correct the output of the run-ptest script, and install some
extra testdata.

Execution is quick, single digit seconds:

root@qemux86-64:/usr/lib/unbound/ptest/tests# ptest-runner
START: ptest-runner
2025-12-16T11:53
BEGIN: /usr/lib/unbound/ptest
Start of unbound 1.24.2 unit test.
test authzone functions
test negative cache functions
test ub_random functions
[...many lines...]
PASS: ./testdata/val_unsecds_negcache.rpl
PASS: ./testdata/val_unsecds_qtypeds.rpl
PASS: ./testdata/val_wild_pos.rpl
PASS: ./testdata/version_bind.rpl
PASS: ./testdata/version_bind_hide.rpl
PASS: ./testdata/views.rpl
DURATION: 4
END: /usr/lib/unbound/ptest
2025-12-16T11:53
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-networking.inc    |  1 +
 .../recipes-support/unbound/unbound/run-ptest | 20 +++++++++++++++----
 .../recipes-support/unbound/unbound_1.24.2.bb |  8 +++++++-
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 838aee94d3..9bbae5ac91 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_NETWORKING = "\
     python3-scapy \
     squid \
     tcpdump \
+    unbound \
     wolfssl \
 "
 PTESTS_FAST_META_NETWORKING:remove:libc-musl = "\
diff --git a/meta-networking/recipes-support/unbound/unbound/run-ptest b/meta-networking/recipes-support/unbound/unbound/run-ptest
index 433a687c65..3801233eeb 100644
--- a/meta-networking/recipes-support/unbound/unbound/run-ptest
+++ b/meta-networking/recipes-support/unbound/unbound/run-ptest
@@ -2,15 +2,27 @@
 
 cd tests || exit 1
 retVal=0
-./unittest
-./testbound -s
+if ./unittest; then
+    echo PASS: unittest
+else
+    echo FAIL: unittest
+    retVal=1
+fi
+
+if ./testbound -s; then
+    echo PASS: testbound selftest
+else
+    echo FAIL: testbound selftest
+    retVal=1
+fi
+
 for x in ./testdata/*.rpl; do
 	output="$(./testbound -p $x -o -vvvvv 2>&1)"
         if test $? -eq 0; then
-                echo "$x :Pass"
+                echo "PASS: $x"
         else
                 echo "$output"
-                echo "$x :Fail"
+                echo "FAIL: $x"
                 retVal=1
         fi
 done
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 4ae8db4d08..e41e2dc065 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -47,8 +47,11 @@ do_install:append() {
 }
 
 do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
         install -d ${D}${PTEST_PATH}/tests/testdata
+        install -d ${D}${PTEST_PATH}/sources/${BP}
+        # unittests are looking for the data in the source folder, though it's the
+        # same data used by the other tests
+        ln -sr ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/sources/${BP}/testdata
 
         install -m 0544 ${B}/unittest ${D}${PTEST_PATH}/tests/
         install -m 0544 ${B}/testbound ${D}${PTEST_PATH}/tests/
@@ -56,7 +59,10 @@ do_install_ptest() {
         install -m 0664 ${S}/testdata/test_sigs* ${D}${PTEST_PATH}/tests/
         install -m 0664 ${S}/testdata/test_ds* ${D}${PTEST_PATH}/tests/
         install -m 0664 ${S}/testdata/test_nsec3_hash* ${D}${PTEST_PATH}/tests/
+        install -m 0664 ${S}/testdata/test_ldnsrr* ${D}${PTEST_PATH}/tests/
+        install -m 0664 ${S}/testdata/zonemd.example* ${D}${PTEST_PATH}/tests/
         install -m 0644 ${S}/testdata/*.rpl ${D}/${PTEST_PATH}/tests/testdata/
+
 }
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"

