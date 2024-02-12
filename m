Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346F9C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:18:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.10371.1707754706659878310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 08:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nqSSrpzG;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: fathi.boudra@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d0c7e6b240so45627561fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707754704; x=1708359504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFwVwQNQEydc85BRu4fhmoIkmiJkGdZXAhLLciOAgJM=;
        b=nqSSrpzGIxgVWc2y20aAsJUADOFwcZ4pWZQ0VyFOycNVA2b3J+wawxpBvskLubAqMZ
         HDSoGH+14uNI7v6634WUlS7PXfDW1qYKyQxhVtypbByj83SHJXPIU0oJnc/EJvFRTvkW
         Fdigfbxawk8ceuzVUEDCsO/lmPBpv+NPeykUWasVVaTQbGFgtMeRXG6ar73hpPLZ2jfi
         70K5M2735EJnK7/a0aZvC7N66GvT3hK/ujZviV/jRaX2gdb5vwq6afXALa/bIjQfXd2X
         yDORmzfm20P3IOhPaFItm1xP+bhhuBv5g9SWS0RtmIOwbpIlolD7RmSiMQw5H7tywvAA
         KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707754704; x=1708359504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFwVwQNQEydc85BRu4fhmoIkmiJkGdZXAhLLciOAgJM=;
        b=iZwG9S+4JF0RNNC/1xq42Z43tD5SNzl4ZFCmqSWOJFFHzJANIR1x+cPfXwHk3ySUER
         MmcgTtt+gLo8hULhIezakKKa67eFHnCT2QqE6RD6Y4J2OJsM2RhFDtgMw1vaHnOAsvpQ
         CS7gQI2v2Irqk0ENF/L0NPAV9D2i6gISWQAf3fxZ8Ooy6667gf2hZ+5ZFeyAgrFw831T
         hhybfGGU+POCreqzb30+rd+yA/6s2fZk2Xl/C+ms82khruCKbixhWBZA7t8mHwyMaLJS
         P5EeBA6TQBDeKDLpm64xNOjL8cZQPTOdGLb34uuV+uFl0g1HNZnK/bXtyBRW8wuRj/TR
         +EZA==
X-Gm-Message-State: AOJu0Yx50VvbzjB/L+NniqXc2tWFHJYoYpZ5IIEunSq0SRxaK6xmkj4s
	J8oi6KRHXWRjDsPA+raDe2hCZGJszDG+HbwfAYdpq2YDB/0ptsnLRlIFGSCLd5DbrRooWTQmQxo
	L5NXUhA==
X-Google-Smtp-Source: AGHT+IFte4L3xSZVGeriFRZ/cuwHm75+nXRabshidm0oOrfjLNgkbnJRqzq/L3WsfxMorVRExwohbA==
X-Received: by 2002:a2e:99d1:0:b0:2d0:bc40:2aa1 with SMTP id l17-20020a2e99d1000000b002d0bc402aa1mr4702631ljj.10.1707754704137;
        Mon, 12 Feb 2024 08:18:24 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id u7-20020a056000038700b0033b72aa93b5sm6672147wrf.89.2024.02.12.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 08:18:23 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][PATCH v2] whitenoise: add a new recipe
Date: Mon, 12 Feb 2024 17:18:21 +0100
Message-ID: <20240212161821.776532-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 16:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108714

Radically simplified static file serving for Python web apps

With a couple of lines of config WhiteNoise allows your web app
to serve its own static files, making it a self-contained unit
that can be deployed anywhere without relying on nginx, Amazon S3
or any other external service.

https://whitenoise.readthedocs.io/en/latest/

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---

Changes since v1:
 * get rid of the patch and inherit from python_setuptools_build_meta

 .../python/python3-whitenoise_6.6.0.bb        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
new file mode 100644
index 0000000000..352a53769a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Radically simplified static file serving for WSGI applications"
+AUTHOR = "David Evans <d@evans.io>"
+HOMEPAGE = "https://whitenoise.evans.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
+
+PYPI_PACKAGE = "whitenoise"
+
+SRC_URI[sha256sum] = "8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c1012866dbcd09681c3251"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN}:append = " \
+    python3-brotli \
+    python3-coverage \
+    python3-django \
+    python3-pytest \
+    python3-requests \
+"
-- 
2.43.0


