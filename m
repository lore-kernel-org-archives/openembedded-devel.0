Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22A4FC6197
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 11:54:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62425.1767614030390869759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 03:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bnAVqC20;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3239650f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767614029; x=1768218829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JbrgME14OYJle24tiVHykAUp7wgi/dV8F2oUonrYnw=;
        b=bnAVqC20d1O3u9ydCi9dQgVMuZsn2ygE8UDVX0UyfDbJXIerxEhK3Q0+a1BBRvJ4Mu
         E9FYpNndtPBtN5hA5p1PQg5AJjFEBiLKkkt2DscMMGgULry6h68ZMzgg2syaejAFMKr8
         3FNojQoGyQWeswqz7v/CGDxKkmHBdbovcRIcE2/UXnR9oQg2pz4USKFdE7JC3hhv/HjV
         6uUfPmrM3MQT4bKEwv871vDbgU2GUQggXre+MNNAKrmqyO29vACXSaMVf+tux3V/X3Mu
         l1FPthn32Sds7BfQLJD8bZk+/grpxxNppug80POsD50sPhP1FRA2jPGzLcIa9ZWBBxVh
         /ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614029; x=1768218829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/JbrgME14OYJle24tiVHykAUp7wgi/dV8F2oUonrYnw=;
        b=RdzkCxSh5swKUmTQExZzZPzgJS6ZJN+JAGnsN1LWrWtQKXP0xLadKGDWYnZr6Hu+2o
         9Z3sYya/dv/DStcVjZlrWtlBcHJnPKL8UP7CeftVcrvjLO3NjGdGXphSNdyZwV+n6SQt
         OMBr4W1PAY0IhXmConSbSQnGqvTC8mRoaVDbJdr2N9ntAltl/WKwaWVVuuxaFy26GUTv
         uihsaWREHdzz5QSeVcdhqJhPqwRjReJsJR4kB2RmYjeMTe6WxZFFgdtjVceqS99o1sIp
         1S+GmUzXxQ2C6t0r28b2nr22Lt7nESfUcPNacBd7Qm+ZaBJNharJ765SBLoHfUp25EY0
         VLTw==
X-Gm-Message-State: AOJu0YxNANNMRhvikRkBTKaVX+gE3OYK+iiiUSPZm6vJJUSgaNBzhzK5
	jNpcXtJvQIna1f8NV4eIzvKykVVCp6L7K9DRGLK9qDAkVI0Sf3ofglFVC/fLNw==
X-Gm-Gg: AY/fxX7XJ3JaVJYkFNHHMwgoLS1I8isirxb8S89E7yeX9P5SAkh/jhdnNzK2dqZ4Gkb
	a3zI1dWi2sPCPbgYaoLFJAyJQExEsXxA+/MQ394GCwR2h2FzufU7f5grfYEtXjfV8XCdfBURaUL
	P81KLurHF9EH4uVt0bLf/GvzieWleiSZjpaTxWu3FiNd7KkGTgYaX6XuNK+cTgr/MvyvpCElsyd
	FcqXHEFYTXcqBtI9VLUA1RJF7UbEhYMwsAslx29g7H6m1ngPDQ9MRpxvTWyZipzPzifQNpU5tRZ
	G6dAC+6IyBWGST3XGUO6fl/D+YiKoeSfX7lkc/f4SN5N1jEErnv3ZtmazqBJ7UodqKkLOSIt3kW
	tcuT9+E8c5S++teT4UEGtEuJ6n/mHXGSGcEbe8y5KbF/7oEpM9A1PqnHGrVjc2TzJsvNxgNm/Sk
	iYj3lYQ8eDDrbToJkcy08=
X-Google-Smtp-Source: AGHT+IFXbA9T888nzwG553SqMmP2nSV5p4GQAdQiYGVenB/UNH1r3FrdxssWtqo8dJD4hVD9KuCmCw==
X-Received: by 2002:a05:6000:186e:b0:432:86e1:bd34 with SMTP id ffacd0b85a97d-43286e1bddemr41350437f8f.39.1767614028614;
        Mon, 05 Jan 2026 03:53:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm99300617f8f.40.2026.01.05.03.53.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:53:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/5] python3-cbor2: upgrade 5.7.1 -> 5.8.0
Date: Mon,  5 Jan 2026 12:53:43 +0100
Message-ID: <20260105115346.3385811-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105115346.3385811-1-skandigraun@gmail.com>
References: <20260105115346.3385811-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123153

Contains fix for CVE-2025-68131

Changelog:
- Added readahead buffering to C decoder for improved performance.
  The decoder now uses a 4 KB buffer by default to reduce the number
  of read calls. Benchmarks show 20-140% performance improvements for
  decoding operations.
- Fixed Python decoder not preserving share index when decoding array
  items containing nested shareable tags, causing shared references to
  resolve to wrong objects
- Reset shared reference state at the start of each top-level encode/decode
  operation

Ptests passed:
...
PASS: tests/test_tool.py:test_dtypes_from_file
PASS: tests/test_tool.py:test_ignore_tag
PASS: tests/test_types.py:test_frozendict
============================================================================
Testsuite summary
DURATION: 4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-cbor2_5.7.1.bb => python3-cbor2_5.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.7.1.bb => python3-cbor2_5.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.8.0.bb
index e124207cbf..888bcefff1 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.8.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71"
+SRC_URI[sha256sum] = "b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

