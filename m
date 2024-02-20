Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3C2C48BF8
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 00:48:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.2788.1708390081416541440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 16:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hsMKdyKi;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e47a8fcd5eso111718b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 16:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708390080; x=1708994880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZtj4Abh6+VRXeKvvcRDb+oNjxYl1x2Tx2R/3qKgF2M=;
        b=hsMKdyKi0xOvbnuH8t9ypC8/KXfOnMqCaK8zfBF73HjmYBy78mLe1knkv9W4CX3DXR
         wKm8qLczpOjAzgG5Tja/fz1m1s4CjXMM2ag5ymPLOWGA74BfeLsc9u9Z3qxwANBrKML0
         HsMjeJb+PBVclJ3tDoBk7D6YWJbeYxiNI0WUoVqvZdcBUKYSqblEV7T2iXSQ+3EUCo5L
         1DuFCIcI1wR0IVaNSlTis5L275dtaHydMHWJ1rcWX4ifxQrKSgPrumUTLGc7Tqu00oBd
         cN07f3CCGZcRZ5m5IH7YzRwE6uAG2HZZ/VfXc5VjjrmR7Howyj/68s69tGDU2izPjdsv
         OKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708390080; x=1708994880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZtj4Abh6+VRXeKvvcRDb+oNjxYl1x2Tx2R/3qKgF2M=;
        b=sLnhiSHE2Eh1kEUqhFgn6cyp1eoipWHhhkHR5gICLgXFRmASPF8YZQOWSiVaumHOdI
         3dYE8B9Xgp+u+wYIvsBpMbzcrJPy1wd6kq6POZTJtJyLyAgSArDCL62p3szhp9ueqZAy
         ZstQGq8vaQpOdZAqLDCYZEN5/T+z9sn1GROOruEBxG++pSIh/rENru4GVtRp/XQFeCJr
         haqNfpWP1i7xuf5rfapNEBcRVYKI53Nf5b+qHMQ+INUsiGjKteIpyxXXRKabysqL2eLr
         dP00ziq+Jih0yuHCCYPDBtw12mc9dfa0tRYGC+LU9M6uIEWBwiJtpIWnCe4fr+trrB6I
         5LXw==
X-Gm-Message-State: AOJu0YyKTJZ2JBhSZZTMbTMD9Rnq6H4bPhSVYrw567t3d7LtFdkW8V+M
	ZkM4xbC7yghhj/gxFGm3t6QlKqZqQ4D26bDodyotBgLpp+WvS3bvow3Au4ED
X-Google-Smtp-Source: AGHT+IFDQ73rE0Vj5/NtIQ4KyEt15uTm7T9MVpeHiZV3B6ASgVWXRifvoiZJ46vc0OGbhNi7X3+oAg==
X-Received: by 2002:a62:cdc4:0:b0:6e4:f40:b4e2 with SMTP id o187-20020a62cdc4000000b006e40f40b4e2mr5038144pfg.14.1708390080314;
        Mon, 19 Feb 2024 16:48:00 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id e15-20020a056a0000cf00b006e3be1a64f7sm4101548pfj.160.2024.02.19.16.47.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 16:47:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-pytest-lazy-fixtures: add 1.0.5
Date: Mon, 19 Feb 2024 16:47:44 -0800
Message-Id: <d25724ad8be17d77e2a188e6e7b1a541c910a182.1708389659.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708389659.git.tim.orling@konsulko.com>
References: <cover.1708389659.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 00:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108895

Use your fixtures in @pytest.mark.parametrize.

This project was inspired by pytest-lazy-fixture.

Improvements that have been made in this project:

1. You can use fixtures in any data structures
2. You can access the attributes of fixtures
3. You can use functions in fixtures

* Dependency for python3-prettytable ptest.
  (Not the same as python3-pytest-lazy-fixture without the s)
* Upstream does not package tests/ in the sdist on pypi, so
  we do not try to enable ptest at this time (it would require
  using git fetcher instead of pypi.bbclass).
* The ptest for the predecessor (python3-pytest-lazy-fixture
  without the s) was already in PTEST_PROBLEMS, meaning its
  ptests did not run cleanly.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python3-pytest-lazy-fixtures_1.0.5.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb
new file mode 100644
index 0000000000..dcf662a2c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Allows you to use fixtures in @pytest.mark.parametrize."
+DESCRIPTION = "Use your fixtures in @pytest.mark.parametrize. \
+\
+This project was inspired by pytest-lazy-fixture.\
+\
+Improvements that have been made in this project:\
+\
+* You can use fixtures in any data structures\
+* You can access the attributes of fixtures\
+* You can use functions in fixtures"
+HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
+
+SRC_URI[sha256sum] = "066b253a94c249e6d9cdfad465e2503d2219139fb468d8f687243dfde39ab9cb"
+
+inherit pypi python_poetry_core
+
+PYPI_PACKAGE = "pytest_lazy_fixtures"
+
+RDEPENDS:${PN} = "python3-pytest"
-- 
2.34.1


