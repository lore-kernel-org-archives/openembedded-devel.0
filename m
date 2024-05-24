Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C593FC25B7D
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:44:20 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.1728.1716572656606985739
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUx/i+Hn;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so10748859a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572654; x=1717177454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B21ygxC4anMQJDmpZNhCvy76eaMACCcvdDGE/XexmgM=;
        b=DUx/i+HnEy5fVG0BicwSRuB6Zebtdy1xPL7BLsFNqYzSO7GsQOrZz5zjIiTUJFPnxm
         pqbVgpOHOvba5WUaVS0wVjxu9jtxyErKn7oGmKXn3nfAL+eKy4mm5isR2xTWYf/tU9vP
         aXyHBJuzDRDVyS8EHsLwrb8WDCqnxjImOPHoW7eQvCdpAUl35iYFt0dcZWts3VvmRohx
         JlTjoHa/wKxQv3mvztOgrmJsxCSJ9fQhev+qefEbnK8H6hNdsx5yBkxKU7tV7xQyBrk5
         RihlZQE96h35VelalyDe8bNsg1dYK7vfsHOn8bL/mwfzcZkZdj2JnTb2bFA8pJNGXMyi
         dfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572654; x=1717177454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B21ygxC4anMQJDmpZNhCvy76eaMACCcvdDGE/XexmgM=;
        b=j4Izl/lXXhIIuhE3kNtdC2jL7FYqzwKNQnDl5HmFPP7B9fkOaNopmoVrn3cqL9oQu4
         S+YVT64RDOr3NpQegsLgXhhak1zIktZ/u1z+huIRiqswFMDlMrUhuVMmp8jtfqfF55c/
         NtafexuX/VmDsuaQxtDA3FFBHRwKgDOn9chIG+NWpC/gjztLmKNfgEeHlaGWx4c+OIXZ
         SvDpGZKRqTVo6Vodzn1oO4JnS68v177o5n2/EqtgWHb6kuJxVwBVnK07p0o9YLg20r42
         J52JIFrOuTzOAvzhOiyLn2Ida0xNzQ4saKjjcNx7MgmBv9ff/JESEKx4Y0X0a9wOJRWg
         q6tA==
X-Gm-Message-State: AOJu0Yyn4h0pqZNB0n3wu7syAJimIg07dI0SH1Z2w48OX0xfFFUkHMcJ
	p/+TVRdZcslpB80Z7/ymYFnepoanm8X6kpJ/PTgmd47/B5aSaRdj99bEXQ==
X-Google-Smtp-Source: AGHT+IFKsH2tvKtzVhLW70M86loFfBOZxV8ikTpp8Cu//K5pfdZpj31Ais9INa7mSuXg2PqUHyCG8g==
X-Received: by 2002:a50:aa92:0:b0:572:46db:8fa with SMTP id 4fb4d7f45d1cf-578519be908mr1932463a12.33.1716572654070;
        Fri, 24 May 2024 10:44:14 -0700 (PDT)
Received: from control-center.home (232-13-20-31.ftth.glasoperator.nl. [31.20.13.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852495e01sm1979737a12.63.2024.05.24.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:44:13 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-pytest-freezer: new recipe
Date: Fri, 24 May 2024 17:43:42 +0000
Message-Id: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110518

Pytest plugin providing a fixture interface for spulec/freezegun
---
 .../python/python3-pytest-freezer_0.4.8.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
new file mode 100644
index 000000000..6ff69a396
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Pytest plugin providing a fixture interface for spulec/freezegun"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-freezer"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1661a0f2b9b83ed73b8e05b5683b10d0"
+
+SRC_URI[sha256sum] = "8ee2f724b3ff3540523fa355958a22e6f4c1c819928b78a7a183ae4248ce6ee6"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} = "\
+    python3-freezegun (>=1.0) \
+    python3-pytest (>=3.6) \
+"
+
+PYPI_PACKAGE = "pytest_freezer"
-- 
2.34.1


