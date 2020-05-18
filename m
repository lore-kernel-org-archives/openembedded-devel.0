Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.43855.1589813430381830975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lx/lz4cn;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id k22so4321534pls.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kr8E23Xj2soeJfS37wa34i7yN/dazSKn+r5rlN+Knbs=;
        b=Lx/lz4cnPqul63eTdmVzpYlOfpOoU3gDHDyIWsyH11AaHG1NDVG8jMU5WAxZfwm/Fm
         x+DBusIlzwkT9xBvLBwvHvi2ihXJxhhVEmOH0auk/qf2LJxnLlIMH3WmyYmzoe/fvyrE
         kHmtXLEZHBmMfPJ/PGtJYN8oPFfNVb61D39EX4+Z5RCWzG+GL8AwrQ8Uij83/khi/qrW
         QuTWLhxIXJVIfT+9zfV3rEuT2n/fz1qeWpmFBucikqW6DBJCRDgd7iQZYQiQ8h6dEoV4
         NjMshzGosWxka02A08IFHCm6vnbsJox1aTQeqs4pu0LU7qXtYK/7SSmAHh+VagWr4Lgn
         BmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kr8E23Xj2soeJfS37wa34i7yN/dazSKn+r5rlN+Knbs=;
        b=q7+kBawmRZ5/rafyKRDqRMnyDIohcRW9v4uWaDGk/UmJmGWmlzD3WSd4MFP25CtkpD
         RQVSCNZ8k1+lfcuQoc3a1dkz1W2ia2TznCR2aIwV2ccrWcqav6uDNVDxpfQMauaUVtNv
         RpZrC2t3PdSbNcgz3eW35Gb7nlw4U5JpSUxYsK4udUkDnhVyBtz8bbTFsgppxlqo6zEZ
         fVE6AuODwfLgISlwJFMMdu44YAdoSyNAjUIr82mbjM5qQ7L8oU3sNimTkkJkaG7Tvh2b
         pZuxOWJQ4lc5ScGNX6ZYZUTOLI3B16DCsf8pKzcHkz/Y3N/TsvXml8elngTMEBoIe0HC
         W7aA==
X-Gm-Message-State: AOAM531zH2bLia2GiW4N1CD8GporSU+qMbrW7+K6vga3jJRF4+U3xe8F
	1EfjpAdmQ69N505zrUpuq5m+Ycj4
X-Google-Smtp-Source: ABdhPJzXa2UBEJd9KOr1vgYL4b26qhi4YIPv27NsbxJimzfk0gItr7oo6uovgW2q/4IOJAdEKgerzg==
X-Received: by 2002:a17:902:8c8f:: with SMTP id t15mr16386078plo.183.1589813429713;
        Mon, 18 May 2020 07:50:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 22/57] python3-setuptools-scm: Add nativesdk to BBCLASSEXTEND
Date: Mon, 18 May 2020 07:49:27 -0700
Message-Id: <bb93e3c6ff622689ab08fda93bd2a129bc660ff5.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

By doing so we mitigate failure when trying to bitbake recipe which
rdepends on nativesdk-python3-setuptools-scm, such as following error
when bitbaking nativesdk-python3-jsonschema:

  ERROR: Nothing RPROVIDES 'nativesdk-python3-setuptools-scm' (but virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c966d3f063a9f159fd8db532b8034435e1cf3964)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-setuptools-scm_3.3.3.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
index c061ea2e63..a1fc3831fb 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217a
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
 
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS_${PN} = "\
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-py \
@@ -18,4 +18,4 @@ RDEPENDS_${PN}_class-native = "\
     ${PYTHON_PN}-setuptools-native \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

