Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6458C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 13:57:27 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13584.1786715802195590935
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 06:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Nmn19pST;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-934944f2d22so57873885a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786715801; x=1787320601; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4INX/gBpl5vumGGe81hcWoccieMNcngoESLHACV2MEo=;
        b=Nmn19pSTKk1Kx+Li/Q+9VrXb4xJfWpLukNerfeI4+I1h++VqoWTglFj1kz+zwad7wO
         Y8HiY6APvX69T5pBkxuYkr5l9hLPphybphJ+L0hYnA0rQSzCGGm6ZXXfJhxi/XAWJx1g
         sIOjDgrdG0v6/tu03aOeWhRFFt+/89r3PFkmHXg03kj8h5+9fnbZngh/mPFb3TMsQpyl
         GrDT0dSGMKMEjs9xNT3+IBA0W7QA2//p8i8VX1qIPESoxNSiyuFjOnYgwzrf9kR14sh3
         zF6vAeEl5sjdBKcqjcJqI3wCxCV+J5VNSoSCAn4hte8+dLtEHH56LAhhhsT8qAjTcz1v
         XPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715801; x=1787320601;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4INX/gBpl5vumGGe81hcWoccieMNcngoESLHACV2MEo=;
        b=hALkzrAUldZ9hi7KGVFuNbGmY35ay0NG0o9/Mq2pDmhwwqU74+C4x9qpSZQuJe74Qq
         W3rASfokxhsZjIYsb6Ytr+F28cYVwvf+yolt+61Npy46RVjkNMm0ZqEmUi3Fy4NLu9fy
         RfJVkjD8P3NDEn50su/Bq6tItceEivxvwuqqTict1CRsuYj46jcX8wJ/m2nQu2TanOvc
         om/GP4miVCWXungm6v/nkK5HWL4FSXIZp7XDPawNraRdk2vgjSS2uLGujfao/h4T9dQk
         2OcohFd6veByHoVnFym/t6WhIsGpNsSaxVCa5ma5yVFYddqbtjiVMg/1INiI9p0l4tOq
         Kghw==
X-Gm-Message-State: AOJu0Yy7O2pF8hARePldof6DeWhxr4Ji38HHq464DuCtlriResYsqXuk
	MRCw7472aPihQfq4EImV594SNbvAH5rh0sV6U1JkNmkojp9U2DiqyTLGHU1QpkSulMniP6k/+eN
	SoKjR2pE=
X-Gm-Gg: AR+sD12CeiqjCfsAQrznv82MSEzEF2JFeeRp1HE+qAb/1OrGLEhIBJ73dAtCconPrBf
	lzO3GGWKHUjpL552/pdvM6gD6+YSLEZvgZAc99iMr6/Yx/bRcQO6B3O/LSVWsFi79b8L2kfkm8Q
	7y/1JG29Fb1LgcVmJb3Dd6NFY3iqj7qyHLsM8pCfSfwf1GwgL+5GrL6ViSkLuherLnT9aepTSFl
	wdEOEW8PcAEd5TtuN4IZwYpGuKMVAJSrSgWbLSUJwbjIhr/hmHAjpB4xHRgkZsw0Pk55jBx8G5D
	idVhBI4o1KXcDCl8OygoXqu7BnAAeRq92zK6eZzpJ+Qsuh9NQrgmb8RCR33zlkTHWQettflRltg
	pJMaWSe3oqgvZRSegnqado6u2T93MUfrQBXB4203kKZ9GQyV3F8tfypDR+6B6ZLo3xrhgXbrHQt
	foGhtuc7B8VpYOiEbNzSEM1Yli524KAMMJbl5GPA5Fhfa8TaqJo9RQ5XvmKO1cP6S8
X-Received: by 2002:a05:622a:5517:b0:517:8011:3a4d with SMTP id d75a77b69052e-52d854cdd60mr69847761cf.20.1786715800773;
        Fri, 14 Aug 2026 06:56:40 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d8406f4e8sm22249721cf.22.2026.08.14.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:56:39 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: pidge@baylibre.com
Subject: [meta-python][PATCH 1/4] python3-glances: add recipe
Date: Fri, 14 Aug 2026 09:56:34 -0400
Message-ID: <20260814135637.537350-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 13:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129045

From: Eilís Ní Fhlannagáin <pidge@baylibre.com>

glances is a system monitoring tool similar to htop, with both local TUI
and web server support for remote monitoring.

Co-developed-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Eilís Ní Fhlannagáin <pidge@baylibre.com>
---
 .../python/python3-glances_4.3.2.bb           | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-glances_4.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
new file mode 100644
index 0000000000..6acd8429b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Glances is an open-source system cross-platform monitoring tool."
+HOMEPAGE = "https://nicolargo.github.io/glances/"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=852ecadc0ac7e6f4d7144d5544a3815b"
+
+SRC_URI[sha256sum] = "736faa7faea3bcd58afffd6443974b4ed4b498627a71ce5d6c9640b7b5ddbd94"
+
+PYPI_PACKAGE = "glances"
+
+inherit pypi python_setuptools_build_meta
+
+# psutil/jinja2/packaging are oe-core; fastapi/uvicorn/defusedxml are
+# meta-python. 
+RDEPENDS:${PN} += " \
+    python3-psutil \
+    python3-packaging \
+    python3-defusedxml \
+    python3-fastapi \
+    python3-uvicorn \
+    python3-jinja2 \
+    python3-json \
+    python3-logging \
+    python3-asyncio \
+    python3-multiprocessing \
+    python3-netclient \
+    python3-xml \
+"
+
+# Optional fast-JSON accelerator glances uses if present.
+RRECOMMENDS:${PN} += "python3-orjson"
-- 
2.55.0


