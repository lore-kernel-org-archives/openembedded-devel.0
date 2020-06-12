Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.1236.1591987025963246593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id v79so9923194qkb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=EnJxLey/KanNhXufzHp8Mbduiq2mp8W0bpYYJJLdKaM=;
        b=gfNUgi/C+cHKa4mYVWPict0mP1sGJ1YhbKw9jpIrH/L1vaA+ZnHgbI7mdSbao9+iOx
         qUZbtvgfRDIMN2rW1Dzr4J/MP6b1QJaUAKJGXAKH25vp/VQrGXF4kcNRS7t42pM/guR4
         1Litp9Hw6sBt9TlmxtgsKFDVesnnXbu4coMdalEMX2pxI1zxRNcX54jweWfg/HQm/fpy
         p0BdIXDUglWalGmJH667hb2x7hGfaQ63vLylx1qWAL5gZuWNdzg2TZr4GZjy1BeWQPi7
         ersZ+3bhd3yXON8neFimgqs5WvhlNIQ2+zl1Nw9CrVZlZD/JdUKYWAsgJQQH8L99gvKC
         DgEg==
X-Gm-Message-State: AOAM532sTANQIVZ1sCLlqWRlSA0IJ6x7j2Ntrsx/KXBGZa3m+yHGZkWH
	5jJCDEZF6MR4/tSLuyfHIjsJtKexXMw=
X-Google-Smtp-Source: ABdhPJyYj+YGkcnNUG78nDrFvv2LovYvqe6UghY0yv6I0d9BG3wBjMyuPx1+hweeUrNv/gNTONIBBQ==
X-Received: by 2002:ae9:eb47:: with SMTP id b68mr4327875qkg.479.1591987024773;
        Fri, 12 Jun 2020 11:37:04 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id z9sm4982473qkj.129.2020.06.12.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:04 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 14/22] python3-cbor2: Add recipe version 5.1.0
Date: Fri, 12 Jun 2020 15:35:59 -0300
Message-Id: <20200612183607.108989-14-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e57344e7979acfe2b59ee5df082c4736620fe7aa)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-cbor2_5.1.0.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
new file mode 100644
index 000000000..b42516b7d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "An implementation of RFC 7049 - Concise Binary Object Representation (CBOR)."
+DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI[sha256sum] = "43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

