Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820A3C47079
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.219013.1704025421311465672
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHjpXRNV;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33678156e27so7502414f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025420; x=1704630220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04y2Etxsgr6lt1idvWiH5IEEqT3GxxsZZUhecAlm1rA=;
        b=KHjpXRNVvLnAs6KFEtmKKfJddk/2OU9wun379vudlVyjRTlLpk32tMtphZfPPioE4a
         jaXuYYy7VVva0hClw23YiA8UiTZJk2TOpk0ScrwZ/Am0GXy/kyMSoywudc9NyAn3aVam
         Aj5nM8yYtl3fstBZtYJj2VoPWLKn07rKXYMdZ2lKOrPXa/x/gBulbtB8kzqwi43UqFHV
         x1R0U01KxmE9uBnVJDIeoO7uKIK34iNUzjRm6FPeEdDiWf2J9OQ8HChZeLv/XlJk2/cp
         10u1H7j0jrfzlwqXsL2449ULAjeFzlhz9ETrErpOT9rBY7BOUOmKetCK2vE2QZapk4C6
         cIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025420; x=1704630220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04y2Etxsgr6lt1idvWiH5IEEqT3GxxsZZUhecAlm1rA=;
        b=sDMVJZE9QLUT+uBODbb5luTEsLUor5zOYrTHefaOOulXO+fmStXauZUrHDHP7N84sH
         mF1EQPg9q4feVoTSmUZ0XQ6oYSqLdxTwkWJF90Z0WHhK/UhTqlxt9HfEfJM8QcM9Ga59
         ExHqrzD6aJXrP1Co2LW3Uod5+crIQfQ/7tXuWutTvt9NiR+WK2ndqJWhElyJfnTyyOOR
         wLd6L/A0VpiglXWUXo3O5PmsOUmyE1FtR0hPzbWlin3+VEy4zW1vGap1cWrqk27cAcnZ
         km+tHDZ+kGA1NNt79VnYYXpKQE9HC7e978n57bP/mTYgdVTY3LzvVwImL6aF7fasVy+U
         X1cg==
X-Gm-Message-State: AOJu0Yxoct8pbq5sZaO27eVqGPtNXnywXDvruPTKXlXfuvAyI7misfKU
	3UPks3ITLhme4/9BcabWAJbCWHXOQ6E=
X-Google-Smtp-Source: AGHT+IFuZQj2MwQtGr5Kc8p4LGBftTTYoJj++K++mzpfgQVq0iFt44o4B7JRgMEnTg2xY3q/cdljtA==
X-Received: by 2002:adf:eb4d:0:b0:337:33a:c86a with SMTP id u13-20020adfeb4d000000b00337033ac86amr3827554wrn.46.1704025419509;
        Sun, 31 Dec 2023 04:23:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/23] python3-xmlrunner: remove the recipe
Date: Sun, 31 Dec 2023 13:23:13 +0100
Message-Id: <20231231122329.405225-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107958

Last release in 2014, not compatible with python 3.12.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 -
 .../python/python3-xmlrunner_1.7.7.bb                 | 11 -----------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 7b7d7bee9..0500ba19e 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -459,7 +459,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-wtforms \
     python3-xlrd \
     python3-xlsxwriter \
-    python3-xmlrunner \
     python3-xmltodict \
     python3-xmodem \
     python3-xstatic \
diff --git a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
deleted file mode 100644
index 7259c3fad..000000000
--- a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "unittest-based test runner with Ant/JUnit like XML reporting"
-HOMEPAGE = "https://github.com/pycontribs/xmlrunner"
-LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fa964f202b6ae067ed5828fe43c77c1a"
-
-SRC_URI[md5sum] = "7b0b152ed2d278516aedbc0cac22dfb3"
-SRC_URI[sha256sum] = "5a6113d049eca7646111ee657266966e5bbfb0b5ceb2e83ee0772e16d7110f39"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "python3-unittest"
-- 
2.39.2


