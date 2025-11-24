Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81CACFD36B
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 23:43:24 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5628.1764027794718103738
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 15:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hct+lNdt;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7355f6ef12so1031098966b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 15:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764027793; x=1764632593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mfAwj5DW6BblhaVqdN574d9ZtDYaMmfrhWnfKqgidE=;
        b=Hct+lNdtK1wguwJviTVHkQPZ2JxPyFPTWHcJXY/EqrELRMC+hdHED6CzvFKs9sJ/gn
         9qa/Sf/QWyKRI6nOB2C/4Wpzq4YWQzYMjoHay31cSeYu3fIS5+WkmW53jP1nyN900tKQ
         mv5aI7Ak7aq1FNwbv0Mi8XcGBmGj4WcgRJuameJzXJOXSJFdBx/KkF24qM2+L56XWbHK
         7CuF2XLHqGHLS9H9XpiNPNplPLx/7k+WnkPLmZWWrRT5FsATiOwN7ZZYGaqqF83wMHv6
         kMd0T4G5ajroa3Cv/SlalTkbZ4+Pg9hR3m+Z83kh8denhX+EVk7ujTrC9l2fGreYjv9I
         r6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764027793; x=1764632593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mfAwj5DW6BblhaVqdN574d9ZtDYaMmfrhWnfKqgidE=;
        b=vCN+wd5QMC25z+fXHrmLqA7uAI+irMOfDuDIVysxJFlk/XfKcCpf/UyZe8JUO9kTOG
         LBR5mxkUd60lq1rw9dPbBg5ZxZIhgQjAKq8V+Do1wLeaCa8H7NVBupStzh9yNuRgmbkM
         /104qxxqAAByy28SYKXJLt64njwYvbRvyojQlGWz/Ekbf4S+UYNEOVA+Poq35D9SX534
         Ky1XXgheAizjy+lfZVuNvN/GqHSXEmkn4L4FeHemD87FU2zbbqcemKjvs7Bb4qpQHmgm
         mClYgLs6xy5+WVx88BD1TDmQzvvodB+UGrxouOTJTgXRt3WDJj8Z9jcxDU0/1mXB54dQ
         NXGg==
X-Gm-Message-State: AOJu0YzPK0cFwKZvcnJYz4ytOFLjo1cExKDkvIfVdYH0dDrrEMXPeidW
	1GTaJV148Fpi81AIg8GMaeaowprvFyDVQM95dO2V21xkTaAxCjmMXUpRQZZ2vQ==
X-Gm-Gg: ASbGncu2ugDYjkJYhfPyGIfCt+LbMyI1uLZu/yovFHZsYgrMt5NaYmwOP105iqyhxx0
	5SboG+VHmkoxwSVIDDMGkYdnV3w7a9MB2r58JLaBc3vS/55QAff/mF5HS7xav2Er02M0lxE4bzQ
	1oPDZFVWu7wpuX/8hASY46IXkaYWilBt3jRY6Bren6OkSMYUxFoj7NwaRFS69vIfiouEtsvlnFM
	cvUh78ID2dYmRxdsDlhZMA0cbWY+CcKyX0zq8Vpm+UKRyEw4BAq+0RL13Icnp7pluSgi0ZvQdKP
	F4k0HFZqyyIDEXAI4EeK5qk4r6xZlySiekFwKNJrz6LJZZ6Pib49AIIUTVVpa1UiZiZ+9kfJBnV
	l183Hzr5va4MDFHJc/zOOAmxC354TSiUpJBSFvaxMf8wtHGzCH0QAx46Mq5sC8/rhGNCYqnPfBC
	Jo14kqxwv/1PrvjJ+KTFMtIiPAI1R13gJ8jl1Y0vwm9Yq15fYS2Jqvo3YtxXtNXzKW
X-Google-Smtp-Source: AGHT+IFQwUTHzh0Tq9bNB/XpkEEPpnwsDqvcAxW/l/PwDwqu32da4nam2QoZJuHZdv2NWCwmPG5J5A==
X-Received: by 2002:a17:907:705:b0:b73:7bef:dab9 with SMTP id a640c23a62f3a-b76716db8f4mr1494347166b.39.1764027792599;
        Mon, 24 Nov 2025 15:43:12 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765502a9cfsm1391494266b.57.2025.11.24.15.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 15:43:12 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] new recipe: python3-pytest-httpx
Date: Tue, 25 Nov 2025 00:43:01 +0100
Message-ID: <20251124234301.2617281-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 23:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122020

Description: Send responses to httpx.
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-pytest-httpx_0.35.0.bb     | 24 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ad179ccf56..a172f8c676 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -74,6 +74,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyasyncore \
     python3-pyroute2 \
     python3-pyserial \
+    python3-pytest-httpx \
     python3-pytest-mock \
     python3-pytest-sugar \
     python3-pytoml \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9b06096d1d..ad68d74205 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -348,6 +348,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-forked \
     python3-pytest-helpers-namespace \
     python3-pytest-html \
+    python3-pytest-httpx \
     python3-pytest-lazy-fixtures \
     python3-pytest-metadata \
     python3-pytest-tempdir \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb
new file mode 100644
index 0000000000..a419f8841e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Send responses to httpx."
+HOMEPAGE = "https://github.com/Colin-b/pytest_httpx"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=80d06bde9296c367ea063b11e9518842"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "d619ad5d2e67734abfbb224c3d9025d64795d4b8711116b1a13f72a251ae511f"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += "\
+    python3-httpx (>=0.28) \
+    python3-pytest (>=8) \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest-cov \
+    python3-pytest-asyncio \
+"
+
+PYPI_PACKAGE = "pytest_httpx"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


