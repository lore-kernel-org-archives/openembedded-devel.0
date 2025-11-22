Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EFCCFC539
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 13:22:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8925.1763817736178514111
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 05:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cO3Wa0Hl;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b71397df721so523501666b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817734; x=1764422534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TThbsuiWfJlqIwHC3AZ5PZciSCqhJylV4pGv2z/DKvg=;
        b=cO3Wa0HlgcEKF65Rl9GW8/TL+TnRqcZc0mHbh2Pom1KfehXprnG93yTHP3RiFQu1YQ
         ndnXw9tJr5GJDIdCcyJLqQuFvXYMDUhFJBFe4ulpp0pbk8MQWD1vmxqBFuc1TOgBSQ3I
         B8FU8e51+/xoV/osjcltR/YSCStDxdCIIs0bJdkIrNYBN464xVHkf1pzRxSNxg2lApyr
         LDnSkp7pFN64CTC1vV7r43DCGdaGOLPCVGvYQrS5xdXyzydeUdaXlq1K9MozSTCjA/gb
         8czTpuWBwdfGQDh216EjFfmSK2zvCfDTSONh90LbQpUu/eu99hIV1dP2g3/gzMtuQ5Ku
         XlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817734; x=1764422534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TThbsuiWfJlqIwHC3AZ5PZciSCqhJylV4pGv2z/DKvg=;
        b=Vq5j2PAVKy6eezpHtEmJBhdimyV2TngK09cEPlcdembbsq+jdacAbc0FbKL69T/THL
         10kxiEPqMIghEXOMiFhAWnyVQpPGV3rt9Yl/LbTsVvhURfXNkztxUEBl1i6hyXjbj9wg
         88rxDugKB+v/v0yNIajvhTyQ7JNoasJcOhEzw5pJg9r+AuMGzIibbil+jsdaQ7TWdoip
         FgLO3yz+DQNrivU1yuPiHABpfzV+nv9IkMhq54mmnBaJfm2Rurm1SDZW6/Ue8MLc8xBd
         F/+xWXJgFBBwMOAEcC7i6VxTjfBoh81FWSKgmUf1qzgwC/pctCdfKgeOqXRyucmbdHtj
         aKuQ==
X-Gm-Message-State: AOJu0Yx41EExCBEFBei2o1Lp1eyW/iUiWUPs769ODL0K4Ou4nA7tp/5Y
	I4Vip6WkyyD6FwP4QQQfSJhoqa8zo53eCj+3cZQOX996hGJN+wBeuE1yKaLWjw==
X-Gm-Gg: ASbGncu5UCgQ6jxGLqOwFBOXuBUBxXqqf5rwF8m3qxyZKdtE0+DuW/uxCJnjHcDiK2k
	P7z29cXbjbvGtiGosOK1KEhzi8XP5jV8bQ0DHga18uSgaFmRJvzSPecvVAa355qLcRltWWVUS1Z
	KN8k1fyRai/jZ1quUy81JJRqbdYfes6rAPcfOBry6SCA4T1fo0lbX80XlzJybY0aGSE4NTYzKIS
	nl+ipIPUN5NGN0jS7mfv3MqW4sbhJQpjsxGha/P3L5dITNG8vEPNQ9zCKvq2YGWGR+HZ4UW8ESy
	CzHfB+Re9iTJD3qcXci7Fpv+qIwcchSJ7Evs7+wgGoa+HrzHeF8Y9/ViPLT/9VnbnCieVTv1dVx
	7jORGpde4ZyLFX10Yl4jYzusxNpbR2obnE9kWFcFgZS3Bi4Fgh/rfq2FxkUcuZ/1E1y1Wq+f33y
	zo5LcYytPJZ0V+OWeE0tqZDMT4ncVUGlBafXyhYx8QJb0T3HFSQ2kZ0JOEI/3U/LTZVnBSKihj+
	Laz72W90jUVFBqvXSg/BBde
X-Google-Smtp-Source: AGHT+IEPeDqV6GUl7giEvyy3yXW1JnsS1HTSGt5rDNNL+s9o4kllVOLlZCwewrWCRM0lGxvz0fs2AA==
X-Received: by 2002:a17:907:971e:b0:b73:9fea:330a with SMTP id a640c23a62f3a-b767158cd9emr588388766b.17.1763817733650;
        Sat, 22 Nov 2025 05:22:13 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43a6sm705844666b.32.2025.11.22.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 05:22:13 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/5] new recipe: python3-pytest-retry
Date: Sat, 22 Nov 2025 14:21:58 +0100
Message-ID: <20251122132159.1774324-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
References: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121975

Description: Adds the ability to retry flaky tests in CI environments
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc   |  1 +
 .../packagegroups/packagegroup-meta-python.bb    |  1 +
 .../python/python3-pytest-retry_1.7.0.bb         | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 1cb419a721..d2794d5df1 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -77,6 +77,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pytest-httpx \
     python3-pytest-mock \
     python3-pytest-picked \
+    python3-pytest-retry \
     python3-pytest-sugar \
     python3-pytoml \
     python3-pyyaml-include \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d3abc0761f..dfc35f946f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -352,6 +352,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-lazy-fixtures \
     python3-pytest-metadata \
     python3-pytest-picked\
+    python3-pytest-retry \
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pytest-xdist \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb
new file mode 100644
index 0000000000..e92122aa63
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Adds the ability to retry flaky tests in CI environments"
+HOMEPAGE = "https://github.com/str0zzapreti/pytest-retry"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c25bd3d1db774af27b10acd6f80bf939"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "f8d52339f01e949df47c11ba9ee8d5b362f5824dff580d3870ec9ae0057df80f"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+RDEPENDS:${PN} += "\
+    python3-pytest (>=7.0.0) \
+"
+
+PYPI_PACKAGE = "pytest_retry"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


