Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1351.1591986996768902906
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 205so9954204qkg.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=2CKinaLDOCHKxUAfQa+ECc1iyKsONkOWJ1l3U3XHYMo=;
        b=Ur59QoPUrHRL5n9janIEUSqDMskrvoBmkBauSvhO7AZBIzJIjUGQfe4sNM5gLtKCTk
         rSKZc3u4YV5ZjHoTmTdV0c31EUBfVifL+wAToxM0HIMeI01TNIGBISjJd2eGSJG6iIln
         uvrHDUlFyujjZyKePF6SONLlvFto+zrJbaGy94RWRhj5i7ccX+eN3ox/Rj+Wb7pOf8oL
         C6+n616crbl5Q93nkz0BdmuMVVQDTNVpeY45eYr/Wbqn3e+J2l4bAj7iiVKDtmb5FhTY
         Jl/XOFe6gBmz2TOcEwEffgg84KPaSXJ+Fhnla635PG2zdH7TZvfRZ9rXJAkXijCIud6X
         YbXg==
X-Gm-Message-State: AOAM533zY3D5Ust1Qvkocg9gFTrv83bNltkZVww64E6GjkzLsp4VOPkV
	a6d4Fzdau+CApwZCZMBPYi+xo34cCXI=
X-Google-Smtp-Source: ABdhPJy3cdmTvA0lIHFRpSaKmBNzcxNn+MGb+VTMjo9JGMUm+eGg5qmXf8M6fswTXTxoANtwwgmzOQ==
X-Received: by 2002:a37:5805:: with SMTP id m5mr2553259qkb.176.1591986995714;
        Fri, 12 Jun 2020 11:36:35 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id p22sm5480343qtc.7.2020.06.12.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:35 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 05/22] python3-trafaret: Add recipe version 2.0.2
Date: Fri, 12 Jun 2020 15:35:50 -0300
Message-Id: <20200612183607.108989-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dadaed39c981f360609d6c4fc53a9ed6568adf46)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-trafaret_2.0.2.bb             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
new file mode 100644
index 000000000..4e814073b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Ultimate transformation library that supports validation, contexts and aiohttp."
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437"
+
+SRC_URI[sha256sum] = "61dfc25b574f70bfdf7ee3a808ec423061811c13a10b8d3c9e11ab539b96ab65"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-urllib3 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

