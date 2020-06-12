Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.1244.1591987035611533723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id c12so7857781qtq.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=d26kO5RpVLLhUGBfU651GHHRQ5GLWByBbqrFHLPZNFs=;
        b=QtuEHKfI6GaE9Gym3/QUkqD2IgUk9ZsmZmd49rnSJTaT/pyCyV9lScIInrlTt964Ln
         2V64u9kQTbXWLV2IXhSRW4cqrBBoKKHAH0MFZAlmdkGz+78zvjlPUv+lmbB25JkkTiaM
         SvwGcIm6S2bf+IxvHU1Vr0FCIxdD7nCQ/GIvLN9Pv+yT9MBpjtNPaIHknlwzhyBM0J34
         lEZZXZlRiAAiSB5VK6hYU+tN//ppc0D8j+CUcUU9aGeU2RiTaEVpypfJ8HxjK8WatrHR
         +mTFzOdGU0Pu3PQlylklbrM73/K+8M0qkNiipUoIxGsatJIFWmM2IFtfBvMTOj0pFlOn
         bFtg==
X-Gm-Message-State: AOAM533VigxNlUKkcJkCBC0zPfBtHCSgw1EgV5qTilobSF0laITTZ3aT
	1nn+6sq/tjE6lp3brVmX8zKZQYp0yc4=
X-Google-Smtp-Source: ABdhPJxQ4fGXbfTzI3fr7nqEhvH+TVuVh1b6OfaKrx0ZJ6lnYq6eLsw5CMZIPYnQo+yrAPygUZ2krg==
X-Received: by 2002:ac8:1288:: with SMTP id y8mr4404449qti.208.1591987034558;
        Fri, 12 Jun 2020 11:37:14 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id e7sm5107222qtd.83.2020.06.12.11.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:13 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 17/22] python3-ansicolors: Add recipe version 1.1.8
Date: Fri, 12 Jun 2020 15:36:02 -0300
Message-Id: <20200612183607.108989-17-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb4cdd4d80fe690a28c2c20048d675d4584ae9c7)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-ansicolors_1.1.8.bb               | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
new file mode 100644
index 000000000..9ba710cb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Add ANSI colors and decorations to your strings"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
+
+SRC_URI[sha256sum] = "99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9c372e0"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

