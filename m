Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB1BD0D16D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 19:17:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14433.1767813443382071574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 11:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IPfk6EQ7;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so22144625e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 11:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767813442; x=1768418242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EprJiE1qrZ81EGBCm6lSEU64iad9Ooh2f09tApbRmzg=;
        b=IPfk6EQ7yNOj3V2dGTxEjIpdqFLVje7ZoLRDQ8FrbidyOTj/njpnNZV5XnUDE1RIqC
         mRwL4F+3Y8RHOrq54+H6mD6HmrAtrZBXZamfu6khM35VVvTZHKISa4x1LvyyELuRTMWH
         LuHTh5Wb3q6iI7Mo9XAjvMVJxYSZL/cheAywIuvRvGlvLNkwRti66nTsZkI6dN7rSp9k
         U0lQVxlJMNuc6ZMdyPvxRP8r6Tl1YIzF9mqra57CpLCJ/cdb2zYQ5TbTyNmI3aXdspWh
         K6xPHZqi3bwa0EvS1Zlft8H7UN1XWGQ87FKuZM2LPs/YGipWY4Qwm69fEHTB06rXGtjd
         g7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813442; x=1768418242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EprJiE1qrZ81EGBCm6lSEU64iad9Ooh2f09tApbRmzg=;
        b=dBDCByGoiUTZGTl7dLX0sxvqsiUnrh0R4vI4GInBKlpniPDkJr1rtSVvKlgs+AcwTR
         HC2enVxj4ELQ//QKzBM0I23/KvPaYSAMnvJlkRxIUzdaZ8RvWwM3T+XpwtQ9ppBdu4BR
         h+Uc4PcxuNfA880ijOXKnKN0UoDwsubbUvTqcdPhHBHMHCDKrppgzOG3SbA6h9S1FxFZ
         wF4CqJBf6Vr0aGwb0PgVPQ/XWMmbWhtX9zyOKP34JFXnn3/tIh8+heq/Mi/lZxN737uR
         fGBxaWf+y0J4MLZkXRwl/FmNexmv/JyC/9ZGPTDGLEDLLbMc57kHttZCq+TQtKJtdT4I
         K6bQ==
X-Gm-Message-State: AOJu0YxsQW6Bvn1AMCzbrgGAHxSQKdiFBX6Cj4ana+pSgb6HOAjncUdl
	7VGbWF6IN8pO7eI69o0jL/NEy2g3Id6sYPYJC5jp1tSpRcpaNyLFCvthhJWdXQ==
X-Gm-Gg: AY/fxX6pXXIQpBPERXj8vBMLBxxJdQQGuT8n5Ham71a3WNR1PG0E4nDLzACyMFUYmKO
	HZB+64ExanLzECxeXa98fyRhT8oyIK+vS9mIxaoDUYktVIvhLhr9cKojs6SU0B2pqF/IDGAAtMK
	mBDKZjBbz62XBPf4hUgZenHeAvYzKvj0knixNRu8YoPvw7fs4HpZX0In0P3WwOmBggAS47ciSUW
	AwtJz9K/AJfMG+0f1n+5u5vjM0OlYOCy/421TAp3KZtD8BYP6bdZKbr08/PdEBdBKzHQzCosQqt
	J6+N4r2NyzWCuaRwCDuKdNHZzFPFt8bsYu4tSQMkjVMKAMSw8x9v5719y3Ypqloo+52UJlZHdaN
	YnTapePJaV8IY593ZL1peVOX34cqqeb9PyEi1a8X5hoofwN45pVPG8+HuFhwF8bimFwgrFWD9ps
	b1//ltH2ko
X-Google-Smtp-Source: AGHT+IFQ9VTTkJWjZrj8bk9XFiJ76v50FFiNjf3TkA+yrLOX/Cz2kEV2kkHlwvcxzt+OQbuMjs0YMQ==
X-Received: by 2002:a05:600c:699a:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-47d84b1fcd5mr39766975e9.13.1767813441391;
        Wed, 07 Jan 2026 11:17:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f7035f2sm107717895e9.12.2026.01.07.11.17.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:17:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-h2: remove ptest execution deadline
Date: Wed,  7 Jan 2026 20:17:20 +0100
Message-ID: <20260107191720.2452141-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 19:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123238

Hypothesis Python module applies a 200ms default timeout value on
the tests, that can be violated too easily in qemu without kvm support.

Hypothesis however also has a feature, that in case it is running in a CI
environment, it expects that the host has more load, and it removes this
deadline.

To switch to the CI profile and relax the execution timeouts, this patch
defines the "CI" environment variable in the run-ptest script.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/python-h2/python3-h2_4.3.0.bb      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
index db181dc0b4..4034ffe7c1 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
@@ -10,3 +10,9 @@ inherit ptest-python-pytest pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-hpack python3-hyperframe"
 RDEPENDS:${PN}-ptest += "python3-hypothesis"
+
+do_install_ptest:append(){
+    # by defining CI envvar, hypothesis will use the CI-profile by default,
+    # and will not use tight execution deadlines (which times out easily on qemu without kvm)
+    sed -i 's/pytest/CI=1 pytest/' ${D}${PTEST_PATH}/run-ptest
+}

