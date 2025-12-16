Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EA4D609D7
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.244.1765907924065243666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZLiWSq/w;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so38998715e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907922; x=1766512722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llGX4bjRY0awAt8g0WRZvNJP7plgyeYVyN4URq9gRzY=;
        b=ZLiWSq/wMa3m+PAwfc7gqzb2wXpQLpurNM3eXgo/jwTPQd8rzeJsbQlXJ1TY/ybawq
         BxOZOe/UML9bdP897M7n1GA+b1OvLakk1hVX/Hx9S0kSjA0T1F7eePO4J1E9VuIyrKEn
         vK6oumG8xYZnbmrnBylqy86PaSkoUY4BXmZsDwG7eFBRHxa4QyO9QID+rExin1YZggor
         5JmEgsj5YHNao3clIyQWD+IIx2EUhhWYlVYvKmc7toUH+TInu+i32qW8kZ0ZzIPGFVpF
         OGi55pAeVsyHjgqT4c2YbcF0Q+cJjiH4oH6AYuSo73PJNiP89/xVWS8F2Mzt6Zi4NjD0
         1vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907922; x=1766512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=llGX4bjRY0awAt8g0WRZvNJP7plgyeYVyN4URq9gRzY=;
        b=OZqTStpCgy5ADvpDqQPuX9rttyZ8vxmZkb6A9ig8PAGqd7++dPqymxjeAUNzHQweGV
         O+1z2zepnoIwDMYkx/0LAU1cqHg0ZRanveAGthZ68oLF+pVS/9ED0RnHIa62iW4B5psg
         Grp8fSomHcpk31Ov44b6HpMf4VE0zLmMGPUgIC+q/ESgN0HQrJBbToClZGVcnqTe/uZq
         AruH03gFKNLoao/rmEeoZsZwNo2ob7jyD78ay3w8GnmYv2kDJFcswQAJXHoonETlBQek
         EIVoXCgA9UH0+StkNWeUN83+6cyJQPCW0YEsDSCANar4omJMlO5/sXx4RgYNfAwUrmMG
         H4vQ==
X-Gm-Message-State: AOJu0YxZ6Y1IpHCMi7kRpukXokDrXyiXipa8kSnx0+lmURVPVCARYREn
	PKL4nE7nWxPXDqTrR2DEUJp/EG065ny4CkKnD1aO5UKET8zhKZxHqaTW9XODhQ==
X-Gm-Gg: AY/fxX7Wt1HtZ//dg1mVB7//1e5SuhGnO8QlpsP6XTnUZnZKG8rdhw74EeQCOZmND7L
	HOrTk1uCfnVnKFNXid563Hm1+RdOc/ssjKqyC9YO2lTO8euZ9jqWPWh0Lp8XakjrcATP+LVcPpU
	dCHLR0gDJEtDwA9sYmADTK2NhP4umxjwOKBWRvWJJXC0lha84+mmTSruIVTO6LKE1ZUlQFEJeT+
	6cKRee1bQW8eNunGev/kuDARM/qKDxi+7Mvkdsuku+kkWj75o2+xLDw928GZHYxdmU2Gi4Rzo8p
	m0kOTYB64PjHdK+Bl1iajhhsJCNt7UNbme4eSMJjGG2hx4ZD08uJMbJRxoM6W2WRVsWLjca8bt6
	iNfFtJgdbfkzi3YZFk3Cjk0A1vfc0YWhurWh2kKpOi7LmwQdhpzhx6fCZrUgUgPpVnO0uNiZgvz
	X4u1pUte8S
X-Google-Smtp-Source: AGHT+IEBgtZlcZ8oph5VqRhIFA59z5Ec9bzQMJVuRQ+Uy0oYRefr/XMxIC74UjJBng2/56huRhUjlg==
X-Received: by 2002:a05:600c:3495:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-47a8f90e7c9mr175747265e9.26.1765907922373;
        Tue, 16 Dec 2025 09:58:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/7] python3-hpack: add ptest support
Date: Tue, 16 Dec 2025 18:58:35 +0100
Message-ID: <20251216175840.2939403-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216175840.2939403-1-skandigraun@gmail.com>
References: <20251216175840.2939403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122701

The tests need about 3s to execute.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-16T15:48
BEGIN: /usr/lib/python3-hpack/ptest
PASS: tests/test_encode_decode.py:TestIntegerEncoding.test_encoding_10_with_5_bit_prefix
PASS: tests/test_encode_decode.py:TestIntegerEncoding.test_encoding_1337_with_5_bit_prefix
PASS: tests/test_encode_decode.py:TestIntegerEncoding.test_encoding_42_with_8_bit_prefix
[...many lines...]
PASS: tests/test_table.py:TestHeaderTable.test_size
PASS: tests/test_table.py:TestHeaderTable.test_shrink_maxsize_is_zero
PASS: tests/test_table.py:TestHeaderTable.test_shrink_maxsize
============================================================================
Testsuite summary
DURATION: 3
END: /usr/lib/python3-hpack/ptest
2025-12-16T15:48
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc    |  1 +
 .../python-hpack/python3-hpack_4.1.0.bb                | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 4cbdec70a3..2a7be4f331 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -39,6 +39,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-gpt-image \
     python3-gunicorn \
     python3-h2 \
+    python3-hpack \
     python3-html2text \
     python3-httptools \
     python3-inflection \
diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
index a5b9130d00..4ecbd583f3 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
@@ -6,6 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
 SRC_URI[sha256sum] = "ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca"
 
-inherit pypi python_setuptools_build_meta
+inherit ptest-python-pytest pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-logging"
+RDEPENDS:${PN}-ptest += "python3-hypothesis"
+
+do_install_ptest:append(){
+    # One test is failing due to missing fixtures, upstream's recommended
+    # solution is to delete this file (as of v4.1.0):
+    # https://github.com/python-hyper/hpack/issues/272
+    rm -f ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/conftest.py
+}

