Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8FCC83F2F
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:21:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.23573.1724948463336080876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 09:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2gnkBdyX;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3718acbc87fso507133f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1724948462; x=1725553262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1417iHfAsksaScvKvXCXBdNMpo4U4hTv1s5FcTNNFmw=;
        b=2gnkBdyXHgy2qKdpovjGeoiGULUCQ+51c2+T7O/xkMlXGBRPaNAaMhgT3Dfl5h6HqG
         RRgsWLtMRN61Qse0oPsppUUKUjzBtcZLwZDrAGjrZHIoOcasEuphc6BSKPVXl4DXCmi/
         E8yrvZnkQEv4NzuuI9mefG75g8dDsamuaP01c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724948462; x=1725553262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1417iHfAsksaScvKvXCXBdNMpo4U4hTv1s5FcTNNFmw=;
        b=gZJR2PkwLwawdult5Ui2VVguelCv2QAWOqfqn79iUOYnZI63UQb9UFdQkvBahMr+b9
         9O9UI7rwdzQHnu3L2/UFQLQq+770euAtCUU5UBTHU+PfPdwDfcN2bhQdgjfXKN2eeNPc
         obLsfNH1RIbyoFIKgzW/jgdy3kIhEJ75Icap6Gkt/zYFSuIdOUvYHcTxaNn1qcrsuH07
         n42hjhDQEg8F12mIo2oZhjRkYsUgm09ageMP5zgA2hK+I//1SlCG2DgahXyVLVKKARQi
         Th9UgtcUypzk3AR2Ugd0v29yyNkMpzbHrQgBjMG/L7M9W6cqwocKGbK9kSyL6Lce4FWz
         X6XQ==
X-Gm-Message-State: AOJu0YyNn2QsPWwgzz9WpxxGCGvHCpzIwIIUZ29+GyPw7dQfv8GQzj5H
	P+eQqGOTmFzQS9nL318lvKDCqSHZ4dORu9pv7NFXPL+znCgB/6qh88BMa+BDNwUGid+g+pny7aL
	j
X-Google-Smtp-Source: AGHT+IHlq8TknmJfS/JOfizefL+Wr6wYKFsL4hlECpLvhyD2SO7DVZCEnPl9wHvdnvo/IcZrYB9/AA==
X-Received: by 2002:a05:6000:1569:b0:36b:3384:40e5 with SMTP id ffacd0b85a97d-3749b5486f4mr2943282f8f.24.1724948461454;
        Thu, 29 Aug 2024 09:21:01 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef7e933sm1787047f8f.87.2024.08.29.09.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:21:00 -0700 (PDT)
From: alexandre.truong@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] pegtl: add ptest support
Date: Thu, 29 Aug 2024 18:20:46 +0200
Message-Id: <20240829162046.49426-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 16:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112035

From: Alexandre Truong <alexandre.truong@smile.fr>

Test added to the fast-list.

Result of ptest-runner:

root@qemux86-64:~# ptest-runner pegtl
START: ptest-runner
2024-08-29T13:57
BEGIN: /usr/lib/pegtl/ptest
PASS: src/test/pegtl/pegtl-test-action_enable
PASS: src/test/pegtl/pegtl-test-action_match
PASS: src/test/pegtl/pegtl-test-actions_one
[...]
PASS: src/test/pegtl/pegtl-test-utf8_general
PASS: src/test/pegtl/pegtl-test-visit
PASS: All 128 tests passed
DURATION: 4
END: /usr/lib/pegtl/ptest
2024-08-29T13:57
STOP: ptest-runner
TOTAL: 1 FAIL: 0

NB: two tests are being skipped with a exception raised as support is disabled

Exception support disabled, skipping test...
PASS: src/test/pegtl/pegtl-test-internal_file_mapper
Exception support disabled, skipping test...
PASS: src/test/pegtl/pegtl-test-internal_file_opener

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-extended/pegtl/pegtl/run-ptest    | 23 +++++++++++++++++++
 meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb | 15 ++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 01bf975a15..0ea43f5972 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -33,6 +33,7 @@ PTESTS_FAST_META_OE = "\
     nodejs \
     onig \
     oprofile \
+    pegtl \
     protobuf \
     pv \
     python3-pefile \
diff --git a/meta-oe/recipes-extended/pegtl/pegtl/run-ptest b/meta-oe/recipes-extended/pegtl/pegtl/run-ptest
new file mode 100644
index 0000000000..e819628c9f
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+fail_count=0
+all_count=0
+
+for test_suite in src/test/pegtl/pegtl-test-*
+do
+    if "./$test_suite"
+    then
+        echo "PASS: $test_suite"
+    else
+        echo "FAIL: $test_suite"
+        fail_count=$((fail_count + 1))
+    fi
+    all_count=$((all_count + 1))
+done
+
+if [ $fail_count -eq 0 ]
+then
+    echo "PASS: All $all_count tests passed"
+else
+    echo "FAIL: $fail_count of $all_count tests failed"
+fi
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
index 237828dbfc..2e32e3e788 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
@@ -3,11 +3,22 @@ HOMEPAGE="https://github.com/taocpp/PEGTL"
 LICENSE="MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dccf35ef30bf912bb07b01d469965293"
 
-SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=3.x"
+SRC_URI = " \
+	git://github.com/taocpp/PEGTL.git;protocol=https;branch=3.x \
+	file://run-ptest \
+"
+
 SRCREV = "cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe"
 
-inherit cmake
+inherit cmake ptest
 
 S = "${WORKDIR}/git"
 
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/src/test/pegtl/data
+    install -m 0755 ${B}/src/test/pegtl/pegtl-test-* ${D}${PTEST_PATH}/src/test/pegtl
+    install ${S}/src/test/pegtl/file_*.txt ${D}${PTEST_PATH}/src/test/pegtl
+    install ${S}/src/test/pegtl/data/*.json ${D}${PTEST_PATH}/src/test/pegtl/data
+}
+
 CXXFLAGS += " -Wno-error=type-limits"

