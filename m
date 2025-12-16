Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2C2D609D9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.245.1765907924766782045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwpAs03u;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so49448045e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907923; x=1766512723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7X3JI+IcfDYbSiElrdn3eA82EmmNGm5/bYoxm5pG6A=;
        b=bwpAs03uTyToDJt6rzLWVyvnW419MzlDf/bhQ0xiuuOKcULMoNVWyte2wKEY91JB6b
         BoCAkLmUvnnQP08mLRpG7YZXF7lnBLi9AdY5uqFTjOj4CHvVdzrz7u1a8ZCzi6z/qhB/
         wfph+WFMkiRwoCYohYLvaLARqWw3VfmVsZXyYGl215gb7/YFJ10KhrpcRGNa3hA2MDpa
         KIRYFKDGXbhVVXQsks1Y08nbGR7Ae+uvTJMGgSehgriovx2MGYd163YMDXrGZDT56BhJ
         CYn4okSdDWWoNC02+qeRvo7jIbIhn+GviQ4Ny6lUPbRS7GRzjD354hQexcfS5VQrmn5J
         0/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907923; x=1766512723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7X3JI+IcfDYbSiElrdn3eA82EmmNGm5/bYoxm5pG6A=;
        b=k1GhiwW55LKN9fArWsZr22Lgkt7sVojVg7XRvTkLAiTW4MdrEVMbUAhwND8Xi4sDY7
         6cmR9BtbLwsiLhSnqZSPHhylZdbxtagfs7FjYAakHsqAKRe57ln1sfFJ6zipOlDvc9Dp
         3UrRiCetoyU3EEIZqWoKEntLgbozOz8ZWrjL7B3NSjKkeG8m3kwXOqzC4P2lKNwsR2c8
         5jAC8yspA1/zDuFdY4egEkx6IdkYRpARyH5O3gMFXZn31ztheIEpjD8QY1EJXqhmvMLj
         rCfw77Wty7e2mn/KRciUq5FEgmg+7Slha64ncbirrrT6f6GVIijqMmK2ijipr53X66CN
         ytsA==
X-Gm-Message-State: AOJu0YzJ6Lts/x09cz/XLmQ1d5V0aYglhV43iISZxXy4NNrJQvCR9nr6
	nbdak3btJXBk/eronouxUwrSZxb+AkC6cd9ZPPoydWQprV/Y/o01eBsUBW1jdA==
X-Gm-Gg: AY/fxX7uTeOebFJldEn5yupZ/kSppS924uWynXY/vpA26L616ncsW0RaFeWdD6BMxmR
	3QxIR1WMKqpHFnHZottNyhTHPbj5lpD2cEJhEGCBBe2ELajHvGw3e9VT6ogemDkWpaOorLGDulS
	T45YuPDl08Q2a7TatV7bH06bmXkdAzXJKoY+Lw3qrrUaZyO/yYR5K83bo+QTpPUlPa2KuX2H2oL
	/unNRwdYYIY/m0+71QV7DPAXK8h57oitNKJH1cn+aoZi8zWCTLc1uOlZWTLRYsVaEU9G4tbkTyz
	4/xVaVl0DEvnMbC2lO5QsHo7YFx7Y8Sqf8SaEuWEil4R/s8FHi5M2/dwGqdYmWt4b4Qm8PdSDB8
	741bHtbRGJaJaLOKFV2l92g7MOT+UH68K2lwb3NUtLM25sXAOthCHDhyuzB00VuhRaG5bK9ybZl
	tcajbuaOXf
X-Google-Smtp-Source: AGHT+IFVlcQFMdrYafHhWtx9KKaLtQshntAxW9nnShLTQ9Mhz29B47yz0FeATtcDrScW0vSuHfixng==
X-Received: by 2002:a05:600c:1c88:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47a8f917533mr169625325e9.34.1765907923136;
        Tue, 16 Dec 2025 09:58:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/7] python3-hyperframe: add ptest support
Date: Tue, 16 Dec 2025 18:58:36 +0100
Message-ID: <20251216175840.2939403-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216175840.2939403-1-skandigraun@gmail.com>
References: <20251216175840.2939403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122702

It takes about a second to execute. Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-16T15:55
BEGIN: /usr/lib/python3-hyperframe/ptest
SKIP: tests/test_external_collection.py:TestExternalCollection.test[NOTSET] # SKIP got empty parameter set for (tc_filepath)
PASS: tests/test_flags.py:TestFlags.test_add
PASS: tests/test_flags.py:TestFlags.test_remove
[...many lines...]
PASS: tests/test_frames.py:TestAltSvcFrame.test_altsvc_with_unicode_origin_fails
PASS: tests/test_frames.py:TestAltSvcFrame.test_altsvc_with_unicode_field_fails
PASS: tests/test_frames.py:TestExtensionFrame.test_repr
============================================================================
Testsuite summary
DURATION: 0
END: /usr/lib/python3-hyperframe/ptest
2025-12-16T15:55
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc     | 1 +
 .../python-hyperframe/python3-hyperframe_6.1.0.bb               | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 2a7be4f331..18f31a7c6f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -42,6 +42,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-hpack \
     python3-html2text \
     python3-httptools \
+    python3-hyperframe \
     python3-inflection \
     python3-inotify \
     python3-intervals \
diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb
index 0d4bfcc584..0e15dd0d67 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
 SRC_URI[sha256sum] = "f630908a00854a7adeabd6382b43923a4c4cd4b821fcb527e6ab9e15382a3b08"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest

