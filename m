Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.1264.1591987019358121705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c12so9895876qkk.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=eNvvsWG+1loqPGtV5qccGIc4ovbjPi4aoQbvM2Ak4wU=;
        b=RwwtotP6bRlFDUQfVQVtSKWb3QrZ/a4FcPJWegvPeMZfYH7apoUJSzIP5ySS+S2Hdr
         r4LLIcxrGgmqYlUmjMdCh+IdPRNjTeDcHt+tF6psIxdpysbWIlwnBTdxufMWbl8dc5g+
         lWYdZB7U8s2/bSvYiMt5xywuVae2Gs7Kw/JdZpl5dlHZNbZoZ8Qsk3HQ9JlJrkGhsyGL
         0allrVVTCkDCdH3CvcDnKhlQbIPIR8Wuz+dEv/e8rRIaWNvLww66N525YTT83AlLESLt
         YRh4s24UZF0qtOfzgZHIL6n4iscy6DictVCRXkcCqtGm58d8kTj4be7tYJuxjguHMYTt
         hbAw==
X-Gm-Message-State: AOAM5321ftHjx5DFLDjYVMzUY4OoOUY8LzCvtip8w+kPEyHpLLNylhT+
	QRpK1qJKvB/mU4fLTtjOpvD2ZceoGas=
X-Google-Smtp-Source: ABdhPJwG7GquPtnj3BMwdbCWMGtcLkcHcjhjgXdAXJgxCTpXDIPrj/jSxiL177qSb9J2nDjYWzI7cg==
X-Received: by 2002:a37:850:: with SMTP id 77mr4393606qki.498.1591987018275;
        Fri, 12 Jun 2020 11:36:58 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id s45sm5596929qte.26.2020.06.12.11.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:57 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 12/22] python3-autobahn: Add recipe version 20.4.3
Date: Fri, 12 Jun 2020 15:35:57 -0300
Message-Id: <20200612183607.108989-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6cf47ddf3e5ed023548217b034f6367251e32860)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-autobahn_20.4.3.bb         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
new file mode 100644
index 000000000..60ef57d04
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+
+SRC_URI[sha256sum] = "c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+    ${PYTHON_PN}-zopeinterface \
+    ${PYTHON_PN}-py-ubjson \
+    ${PYTHON_PN}-cbor2 \
+    ${PYTHON_PN}-u-msgpack-python \
+    ${PYTHON_PN}-lz4 \
+    ${PYTHON_PN}-snappy \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-txaio \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

