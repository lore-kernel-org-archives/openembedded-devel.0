Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BE1CFC53F
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 13:22:20 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8924.1763817734338969300
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 05:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aSd4hZSG;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so4831869a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 05:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817732; x=1764422532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WkDWcpxqSqekwND+Yq6CTsmyOpS/JnXfCVaJxlM/uY=;
        b=aSd4hZSGC0p5FiN1X8+IJAaKU8a1YBAl8fCMcV2GbZeG4eN9X7YoBHsWf8sHeizq5O
         rwPvWmGPbBVDj9jgFtEcOOMBUN6PjerO40lkY9cIMm8Ahr6TS9Bhnw4kNZP21EU5pktb
         +TRXW8qi1PNaze3zl+L3W1VH1aktSDUuEKUgTwFcSIakbjtqoc1JkiyuWoc2fF1fKre2
         AfncoFTqLnCF0h//TdveCl6QmG80mYyITVS2afMdljwai+QXbXND5WNrJpsTLHkfDfxi
         7ApYUVe0pUtYZtY9IYX/Pf/02njac9Gtsqtmrf5z2aD8+8CRIthAUV7T2sGibE3fBLsW
         eBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817732; x=1764422532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WkDWcpxqSqekwND+Yq6CTsmyOpS/JnXfCVaJxlM/uY=;
        b=Hu45Bhg3M55bcm+DUhtNXSVq0wsql68oZC1/lW9FasYIVfaS/6Dc7g1vkDtNHDkka9
         ObWL2wA2cSO/kgQX4caFU5/lA5QI3n5Pc7s+1eFLsbjmHXBWq81FapDNpOzl/n14dXa0
         V6A3v/aA+YeUbsHmnUTc7h9z16RY2QxAVFcfzDM23J3SV09qdVXC1em+ZtF4xtaACU2x
         ZUvKd46MdvBfpoVsMwcheA48qf/CPV+zOi0WG6RYZ8oM6jf8m8uVmlTWX/7arTJH0p1c
         sLhsKkAGL8qDwhCXYlVQPkEoHHmUi+JT+wxOTHMQhrfxIHfr10acgsgFcBfOGthx5VWo
         7Xpg==
X-Gm-Message-State: AOJu0Yy1pyfHMXFyEa6pfMtdtXv1Jt8w4LkUgeTDthoB7P8BUiZACRiZ
	FelzdehcGsSaSmUXsd5n7D9t2DyGYQ/8xdQPnqHJW6fyuYNoxz3Cg5G1th/1fg==
X-Gm-Gg: ASbGncsfOqc2exGfs14wadg/J65NAG9IDmJ2rDws7cKpVuxx9mRyEklN4aYCqvDbRva
	RnZZ2CZNk+YA2BkMb819n+4qaLhvD1ri082pfGKlh2RF9d+8Ur38g0mdQjKATcW33rOfJeZGSOC
	VZA0ygcTY7Nua0eMtVaMYaR29VVnJQsVziLdUszyuZVyq30hM75DA3HgFiMiq4B9ylDQgvvDwjL
	EJhQChlITn8geJg7SIhik8Wcy5l5WNGg9ksPXOvAg2srm+GM3DMMtpbAes0i0XGEMP0OKJsN0Ii
	wQHoT+YDr0+Noj24qsn6yx6z0zejWrjxFBoLuJEZ2CvS5a8geQcD5M5cdsQYsuu9aEX4I6vdcUZ
	eLuDpdlhjfhgaaEc844vuORIP5C+NN9xn3lPMBgmhTVavIuHpELCqkFd8rJRDDXLlGpX3IC661y
	PXPufC+PSHzbOb4am7WHfszjjUlcmBuufE1vTgY2o7PQA186HWbL2Rd/p0ALCWsgr7YqRJC752a
	EhiI78addkHbRzFGzYvVZDz
X-Google-Smtp-Source: AGHT+IERcKd3l1M7EtDT1+R3VxCxmVp6CIftP6YiZCW2t9ymp0izFPANu5esLS9wzrx88aT2V65SMg==
X-Received: by 2002:a17:907:3d8b:b0:b72:5e2c:9e97 with SMTP id a640c23a62f3a-b76716db44amr644827166b.36.1763817732219;
        Sat, 22 Nov 2025 05:22:12 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43a6sm705844666b.32.2025.11.22.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 05:22:11 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/5] new recipe: python3-pytest-picked
Date: Sat, 22 Nov 2025 14:21:57 +0100
Message-ID: <20251122132159.1774324-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
References: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121974

Description: Run the tests related to the changed files
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc   |  1 +
 .../packagegroups/packagegroup-meta-python.bb    |  1 +
 .../python/python3-pytest-picked_0.5.1.bb        | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a172f8c676..1cb419a721 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -76,6 +76,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyserial \
     python3-pytest-httpx \
     python3-pytest-mock \
+    python3-pytest-picked \
     python3-pytest-sugar \
     python3-pytoml \
     python3-pyyaml-include \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index ad68d74205..d3abc0761f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -351,6 +351,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-httpx \
     python3-pytest-lazy-fixtures \
     python3-pytest-metadata \
+    python3-pytest-picked\
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pytest-xdist \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
new file mode 100644
index 0000000000..79c47a32cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Run the tests related to the changed files"
+HOMEPAGE = "https://github.com/anapaulagomes/pytest-picked"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d374a27c85c3fcc979009952ec16f1b"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "6634c4356a560a5dc3dba35471865e6eb06bbd356b56b69c540593e9d5620ded"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+RDEPENDS:${PN} += "\
+    python3-pytest (>=3.7.0) \
+"
+
+PYPI_PACKAGE = "pytest_picked"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


