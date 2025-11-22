Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C57CFC538
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 13:22:20 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8923.1763817731145490153
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 05:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WxXTrr2l;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b75c7cb722aso428854366b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 05:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817729; x=1764422529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mfAwj5DW6BblhaVqdN574d9ZtDYaMmfrhWnfKqgidE=;
        b=WxXTrr2legx6qS6qSgVHx9FkB+d/aWgSxa9MTf+MtWjIn0K3VxdgGsBIKH4WO7kQaz
         OqQepWf+iPjKdRw8VUaxcpE65V1QROEXaEDMQgBhx97mqsV2A1fakt35u1KJpOGEBSVa
         pNV+daG+5EfxFR1dNlSa8oHRc9R+iKigezqq0uy4T0nO3QqPK/qWpJ/vF46Nq4nj/25I
         qU5k6uZ3waZ5ZOO8K888dheDqrvlPl/qkRLqfEBWjMHDppBDNchJqYWVaBVVave/IdrW
         A9VImjGopF74UZF5it+J/44jmmvr67pLEqjU/msy7XXIkxy2NRaFrzBlH4De0gX3JL1P
         9ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817729; x=1764422529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mfAwj5DW6BblhaVqdN574d9ZtDYaMmfrhWnfKqgidE=;
        b=rUPif2JbfgxvJ2jly84pZsTzTHY+b/wlXRou2kM9xQJ+HgT4cyhG8KWZVMKL96eaPe
         OPcJMRLEQmEF2Ihw8+2JUYH5d4TKwVD2os/eLscqDVADlbPbpEsVuW2eVzmVO7ri5EfN
         hsFRgCjIc/THP643W4MIUIUXpL2xdhkWtDptLwZZ/I3pEqaa6VGHs1ESNS5qPaqLQ2rV
         S33Zobdi1e9hmqEtfm9RctiE2j6RBvpZvhqQUw0hDnjJc/QcLgcTnB0dhhem03Cl4bwX
         9d4bFdLyFzad1MlLRdJhAZxi2+gm+TLHaSo4XhNlkcNAedun22NjHzEkapx4N7yQCZYa
         tqNQ==
X-Gm-Message-State: AOJu0Yzd32mjbwedGb83d7aQW1TCw8M+fOxCyKTVG5lRu8TEdJKzwhQi
	Tx/1E3d+JohBhRNC5OHpioOXvpObSyqEJ0Smr1P3UaakAQAu7g09ENoSlaOt5A==
X-Gm-Gg: ASbGncuCFt7imzWXxNyRr8npiEVaNvS5dgiWeRYJm0wZI16WuT3Dn6mmXndlWllXVSW
	wy+LGzr/dJX1agXod7i7J9qAlnt2YM4scP68f7Wo9wkeIS74vT7/Hg80BFm4akKJcK/eHFFzdYL
	QKEeNDzQdP8h3GZfYaJcRMG9MJNykIzWb+b/lsRVaFyIChiQmjH366JUyl7peY9odtkTQrJ1ebt
	kMSvXVZb3ZrRwcTvpUfpt/heHc48HK5Su3Xxz85QPen72ZyLc5Zzwnqsb61uvLscv78vSGmTKke
	jqeh1iZqkwoHL/8ECHF8kNYbmRjhFYbj82DhGakjh2+DcE3X/FEi674HzgAA2w8pc17b2x8Iocp
	r6Sy6aqD9HjimmSpe4Ba7+H/R30hsAHSPb4WLizxLw8/EaV/UTmUUXGMLd2Z3SICM7lTgjzaYWC
	RQKrOpl2KfBcyklMMfKpV5lN1d/r+bwW4tvPl2AIu6qfx4Uj7xANEfxcVXfscmhe+GIOksv5B5E
	M5lwj5rdKmhutlRLm5nf4i1
X-Google-Smtp-Source: AGHT+IGX7r7m4cevJQIQ9QpcJwEUE4NkLwyJ4b95zGa0ex0xQQss2PAuG4xVi/JuA3X/uLlO8NKsBA==
X-Received: by 2002:a17:907:9812:b0:b73:398c:c5a7 with SMTP id a640c23a62f3a-b7671847649mr598230066b.41.1763817728818;
        Sat, 22 Nov 2025 05:22:08 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43a6sm705844666b.32.2025.11.22.05.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 05:22:08 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/5] new recipe: python3-pytest-httpx
Date: Sat, 22 Nov 2025 14:21:56 +0100
Message-ID: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121973

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


