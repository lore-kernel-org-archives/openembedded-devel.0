Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.3018.1594437577530492394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UY4OYoo5;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id gc9so3404422pjb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 20:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sWyKrTx27o2i2O0XY0OaZWjD2EkRrhJF7OzfBu5USMU=;
        b=UY4OYoo5tFG/KNEVPj9LUp8fUGdwtenMMLdcemUHBaBWZNmC6zEm61KgmcCbj59fxj
         ZxIic2S1igV48rXFeJMJ0RucRTXHPw0hxS3fs3/LPj9o45lMTuMQyrbAzBWlAJRLD5/J
         tdrFLQEgvFD0gPiVSl1IxAOv2VbjgLBPuqf1RZvLGbZPNyeLhHr9jnhsAgTBxSnGWEoP
         h1NvgB1/79Yz19QIgPb4tg0RrS4NmvdRUy8DvQ8mDTheCW75WK/g6jlPUeB7yqoAb3T6
         hWHFWOdihoQmLCX+cyTfN2WNjoYJVqih1By/gV3wX5Fpx2K6H8fcxMu6HBMgV4TEHJxf
         5HhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sWyKrTx27o2i2O0XY0OaZWjD2EkRrhJF7OzfBu5USMU=;
        b=rYugL3VVqISc/VWpVPcPmCF254Ej5hn/zHxw0ISyJ5T+oYkNqxrjGRUwqrcybJ/sxb
         7GOruC7PWmZwVbv0Ro/d6RZdljvci2YIYDVNwT5XCgAmAfi4khUvumJi76yb+zF2TJP0
         7M6hoMl7LFYLSFaUGuJW8qbEQCEFEbz5hfWYCJEcOEr+0AnTgKZdXfXg38+JeHDFhZ10
         UnLGT30oIBOkmeAt2eZk6OAyfhVomJElng0dCmB+ZgFeZ1gg6Zaf74+JjhwqjU909jI0
         RSH1gTa/eQXmlXibHyiiCaaSA+GTW3CBTTMJzuEA/t2D4deVNxY3c0KyaKlrDNSHrdOg
         KGSQ==
X-Gm-Message-State: AOAM530ckSr/7talZpljTw+yIE8svuG+nyPMuPTVVXgdvItIdRmKDplf
	Gyl7IKjzUnKg4raE1iV7K7WUccvDXug=
X-Google-Smtp-Source: ABdhPJz3TU1MWwAzDTWHoOut6DQbNUXZp1Q+h7z6F8UbiZt05xdikViVmGQ2vsX8y6WWV272HiWa4w==
X-Received: by 2002:a17:902:7611:: with SMTP id k17mr62047745pll.255.1594437576849;
        Fri, 10 Jul 2020 20:19:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:94e8:27ac:fdd9:c160])
        by smtp.gmail.com with ESMTPSA id f3sm6925461pju.54.2020.07.10.20.19.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:19:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/5] python3-rsa: add new package
Date: Fri, 10 Jul 2020 20:19:30 -0700
Message-Id: <20200711031932.5883-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200711031932.5883-1-akuster808@gmail.com>
References: <20200711031932.5883-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-rsa_3.4.2.bb               | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
new file mode 100644
index 0000000000..759214fa38
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Pure-Python RSA implementation"
+SECTION = "devel/python"
+AUTHOR = "Sybren A. Stuvel"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
+
+SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
+
+inherit pypi setuptools3 update-alternatives
+
+ALTERNATIVE_${PN} = "\
+    pyrsa-decrypt \
+    pyrsa-decrypt-bigfile \
+    pyrsa-encrypt \
+    pyrsa-encrypt-bigfile \
+    pyrsa-keygen \
+    pyrsa-priv2pub \
+    pyrsa-sign \
+    pyrsa-verify \
+"
+
+ALTERNATIVE_LINK_NAME[pyrsa-decrypt] = "${bindir}/pyrsa-decrypt"
+ALTERNATIVE_LINK_NAME[pyrsa-decrypt-bigfile] = "${bindir}/pyrsa-decrypt-bigfile"
+ALTERNATIVE_LINK_NAME[pyrsa-encrypt] = "${bindir}/pyrsa-encrypt"
+ALTERNATIVE_LINK_NAME[pyrsa-encrypt-bigfile] = "${bindir}/pyrsa-encrypt-bigfile"
+ALTERNATIVE_LINK_NAME[pyrsa-keygen] = "${bindir}/pyrsa-keygen"
+ALTERNATIVE_LINK_NAME[pyrsa-priv2pub] = "${bindir}/pyrsa-priv2pub"
+ALTERNATIVE_LINK_NAME[pyrsa-sign] = "${bindir}/pyrsa-sign"
+ALTERNATIVE_LINK_NAME[pyrsa-verify] = "${bindir}/pyrsa-verify"
+ALTERNATIVE_PRIORITY = "30"
+
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pickle \
+"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pyasn1"
-- 
2.17.1

