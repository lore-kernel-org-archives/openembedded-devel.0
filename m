Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A61C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:32:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.6482.1708403534798911943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DvyW7m0a;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e47a104c2eso203830b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708403534; x=1709008334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noOVf9Fbz2oLtr5L7RtUCt+kxap+wnsyCRfLKN2wY7w=;
        b=DvyW7m0aqlDsX2iaAohULCUUiQIn3v/l8k48PDH3+BUc2be5InFhisudR2L17Vl/q/
         BGCCZuQqU9cQGTU5oeLdvDtdGzvyPGYsrfSwKdbZaFLQ/H74K+r2DHBal0060jrpIExB
         Dncl46eKrEmxeeMX9nRlBh8CTd3D9jfypZh/2zL2vQ7WB+Z+mRKvvQd2Zs6WumtRZnHa
         /iKziHPiidE0QBUGPbO0BeJXw7KMQfXXree8N8soiFannX23f0qFBs0asEJFrRQEW0gz
         sssGoF8FYReA2oM55dYTV3h6E3haWYXF+pPc9x57g+/vhFO5LNe3J6MF6MjHqrRXdZpu
         e7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708403534; x=1709008334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noOVf9Fbz2oLtr5L7RtUCt+kxap+wnsyCRfLKN2wY7w=;
        b=KSd8PIseUGqXwruG5cYj2HMM+fuyrISUE+2SkfO3Xz0ivkwwVNj8qiji4qtm+F8WVP
         D4O0LND2+xVFMsg4wbRNxgfBTi9tARz+hcc9nt9UvPM1n0uS8TWJy24DqoTCVUXS/1NO
         58T87FFFhO1g6/TIZdbnWDfnPtKPQiHLVFP5pKrHH8V+iXD4vieIAHOBLvwUIC3udaeP
         XNCC+wrfwMuGbK63QtV2XeX3q2ZDp1TjCIWvmohXjyyWbhmO0f1dMOd0Ny6A8j/c1NUA
         TiSIJ36CgxMg4k+qgPwWw4eeiDEk6FWdmMDaYtbElPDg5yjEXNUfj4jLPgF9jkcBjktt
         diTA==
X-Gm-Message-State: AOJu0YyXfyw9zGEkrJBPRbKviSIt5b5h5o1VmKTc/cmEfp5Rvz41Uvq1
	bAULbORZDEQLWhvDBHMMKSOdV+h9+mgmUnDK9s4u5IqpSWNFJ/P3CV6j5hSn
X-Google-Smtp-Source: AGHT+IH+oY079yb2KYfhV4HON4dKEvp+AYwQGON3xZR175Jzj9iRudB1LaGWJ9HnPqXuhpSYRetRqQ==
X-Received: by 2002:a05:6a00:1f10:b0:6e4:6a19:1f8c with SMTP id be16-20020a056a001f1000b006e46a191f8cmr3325652pfb.20.1708403533720;
        Mon, 19 Feb 2024 20:32:13 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id g14-20020a63110e000000b005dc88b232a5sm5490269pgl.26.2024.02.19.20.32.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:32:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 1/3] python3-pytest-lazy-fixtures: add 1.0.5
Date: Mon, 19 Feb 2024 20:31:51 -0800
Message-Id: <266899d7096aec9a40ad229718a5056f879d9c78.1708403129.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708403129.git.tim.orling@konsulko.com>
References: <cover.1708403129.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108908

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
Changes in v2:
Rebased on top of rebased timo/drop-PYTHON_PN on top of master-next

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


