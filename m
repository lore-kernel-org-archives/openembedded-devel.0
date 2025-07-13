Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0274DC83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 15:10:34 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.58334.1752419430377216079
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 08:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G6UAhpkc;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so704765166b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419428; x=1753024228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t50tgyd7lekVUDl3Xkwg6+brhWVoZ+TjvTnrf5FyRSA=;
        b=G6UAhpkcSAbnTAGW5amnkVptAD7Qowcnpq8P4P+SXqTMVse9NGFebacDvoViBkAXHh
         +/xH/xxKZT4JZjlhZf14PSHHPy91XuSKP7n4rWrsoQ3yi6LEvOp3AbJnPj+gUPzhkqii
         BUXkje05/x1DCQdI5RGZuzmuEgz1AEk2EDG72Fi1uLvzHqUs+jDX2xuyV8s8ZiX/xqhB
         CD7jPU8gnUAtLzRNsrqn+3xcOE3yutcEribdY0mIN3YimbjCAAb9Gns/99zz7Nqfo16A
         MDsZX+UzNWAhDWCx2wRiarpY32U8dI62dhxSKPdqgtzXUlfpHnz2t3exLHcIsYRCFhj2
         zJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419428; x=1753024228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t50tgyd7lekVUDl3Xkwg6+brhWVoZ+TjvTnrf5FyRSA=;
        b=XCnItNsbi15G0lUAHkMi75o5zmqiIlPqAM9A/G8vXBxhSgJ9cqZBiNyedOiOUuxA15
         G+RWUYOvqgk1vyww9ehu2xO/fgmokxnfYffn3xydvcmMIlnmfOX4b2WRcQBYVgPTE+nz
         RlqH+aiY51vnMc0a1dP7hiBWQ0SG3gRfZknrQl2lqkLvwdla/p17RukoxtPGgY4WJVOh
         Viz0mXkCO6EDIOaAgOkAbKsphFf3GMzh8AHpE1cA4kiPAgm2B1k2sGFL6GWt1Mj0o1zA
         hYuRsAZHxxHJ0NxdAHirUNQ1ocJX4EN0aFBuT+oorHudEB9nt5kH4/5U6gyvUsh2xfSF
         HGpA==
X-Gm-Message-State: AOJu0YxF4uDx2dhcFJA19JBjsdIQTIEaiNGl3WuV+FozVML47WpZrKf1
	LoXdj8/MpUq/oTZOGZ9ELcvJJ2sUZqJBLgJBHa7laEsVOyU3ZFaQhNKAXxMytJjY
X-Gm-Gg: ASbGncuGCDaxeeZkIIvTVX+pQUzhem6N/EIbQAGqR9Ff3XOkd06uv/q3oLPC84v2erH
	K/YajX+kb2PmU9qhMR/URGnAGD4jLaXHOMAQwusjXSuwbYJIPOamYm6Oh+FQ2L27w9ZaNwTK1rT
	bjYEzmXA8KQIreO0Wpfk7KLlxy2QhmrC51FRuze5Ms2MGKIzK3Pfqy4A+5V2Yhky5kqtdZNf3Q6
	m2Ic4GNdIyc6WmoiH1D3rKx17kzK/qNPYgAavo9/kkirvz5xqMv0QeQVs5ulN7VmwTTbLxeUK3J
	kDeUssWufRbIBZNoLoQoHyV4BNCnqsDr2WNMjmeEZIktWie+UbyfwPPH7thrYQJ1NfLvvsy4fQ+
	qCfN8l0737yZA12DKuhk5ktPSSoeZtAmcCPM//2aUP9d1Xya4H4Jvi/4OqR5dNqYFAFtmrPBqBu
	kn
X-Google-Smtp-Source: AGHT+IEU0GN6WtaOzCnEWEaK4RFz4Eco+lH0Wf/F5498Vcrjmzx6ocbJvS+zZDnFF7cVmrKEjLBinw==
X-Received: by 2002:a17:907:1c13:b0:ad5:7bc4:84b5 with SMTP id a640c23a62f3a-ae6fc0f4e38mr1105313266b.57.1752419428058;
        Sun, 13 Jul 2025 08:10:28 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm650493066b.127.2025.07.13.08.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:10:27 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/6] python3-pytest-cov: 6.0.0 -> 6.1.1
Date: Sun, 13 Jul 2025 17:09:38 +0200
Message-ID: <20250713150938.2992477-6-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
References: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118510

Added additional runtime dependency on python3-pluggy.
Update PYPI_PACKAGE as the package naming has changed
---
 ...hon3-pytest-cov_6.0.0.bb => python3-pytest-cov_6.1.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-cov_6.0.0.bb => python3-pytest-cov_6.1.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_6.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_6.1.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pytest-cov_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-cov_6.1.1.bb
index 75742f3e8f..292cc8a063 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_6.1.1.bb
@@ -5,11 +5,13 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=cbc4e25353c748c817db2daffe605e43 \
 "
 
-SRC_URI[sha256sum] = "fde0b595ca248bb8e2d76f020b465f3b107c9632e6a1d1705f17834c89dcadc0"
+SRC_URI[sha256sum] = "46935f7aaefba760e716c2ebfbe1c216240b9592966e7da99ea8292d4d3e2a0a"
 
 inherit pypi setuptools3
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-coverage python3-pytest"
+RDEPENDS:${PN} += "python3-coverage python3-pytest python3-pluggy"
+
+PYPI_PACKAGE = "pytest_cov"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


