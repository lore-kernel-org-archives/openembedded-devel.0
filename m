Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.31050.1597003330564389118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 13:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c/hce1oY;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id c6so3673721pje.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 13:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ueAw8W5mId2q2wVpB8TpWmnUzrLNESiOEzr5/GEq1uA=;
        b=c/hce1oYT5idN5YUFPSinlphbO4236eBCCNCMrV9bZmPWWWEvyLOxBerBkGsumu498
         L7u90He8CcFD67ZJpQYhgqXnjmVIlhda2W7TD2Ggwc1wlZuoWnhwBKEMy9wYgV9Wdykb
         dogEv6E5bqbepYYN0meNUNdWcK+Rh2B6mhYJFoJLXQ11R87kTnpYSKxqBdCS0jK2Jq81
         iNTELBDWzkDSRwfAUpWrhGFDMCB+SNNdSg6Fju/dZYkrzmV9G8XH41TaeUvK1VTwQJgb
         ecPK73EkYJBgr5GiVD7C86OkADnsFzS4K3AhL3o8AAsIIH9JLSP/e9TiP7+n4gxuQjnn
         JlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ueAw8W5mId2q2wVpB8TpWmnUzrLNESiOEzr5/GEq1uA=;
        b=J3//aKuOUxX8iPMskroQbYUmsVNzTS+wAh8C4j0cgqkyXXMI4/NuZZ3MaZf2LjBKxG
         snguProRKJmseGbod8pb9wyRk/qXyuTaI7EIE+G5/rE3scuJ+0hwsYq45NhNRD2nz1z8
         G+gvHyKoDZUaMEPPCZXnc+JtyPj1dU+qPlFHg5HpylJq96kyn7gFebzDCJ/ID3QO1hmW
         FwgJleQ8HU2tLhpCX9K3kRRJsaqEU4R5/dIBeUlwwf1ncQVwnP6OewndXSeOU38onmOd
         h50RkhBGgYurvmMULmloroTcdPbDxeSSDjBHA+FHnRnR9epHmlPsBsuc9gmQJ1cdTdVy
         cUcw==
X-Gm-Message-State: AOAM530213+etvZZifXCWBjvkrV/VywGNiwFTBCbriyPWwXy02cjdSUu
	jMVx3QyhMe96ofwzU4A0bA1MRYu5inA=
X-Google-Smtp-Source: ABdhPJw9xPxu8TYQPbrfXjvQiN5TJVKNCuUtahR0oxM64MGVV4l/ZcpqJUBwyEm+NlejHP09KATXIA==
X-Received: by 2002:a17:90a:ea82:: with SMTP id h2mr23524858pjz.75.1597003329635;
        Sun, 09 Aug 2020 13:02:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id y4sm19560215pff.44.2020.08.09.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 13:02:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-pynacl: Added recipe
Date: Sun,  9 Aug 2020 13:02:07 -0700
Message-Id: <20200809200207.2328601-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created Python3 recipe for PyNaCl.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pynacl_1.4.0.bb            | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
new file mode 100644
index 0000000000..6fd42ebf81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
+DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
+HOMEPAGE = "https://github.com/pyca/pynacl"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
+
+SRC_URI[md5sum] = "8c6c57893327a694c72510fb620e4744"
+SRC_URI[sha256sum] = "54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505"
+
+PYPI_PACKAGE = "PyNaCl"
+
+inherit pypi setuptools3
+
+DEPENDS += "\
+    ${PYTHON_PN}-wheel-native \
+    ${PYTHON_PN}-cffi-native \
+    libsodium \
+"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-cffi \
+    libsodium \
+"
+
+do_compile_prepend() {
+    export SODIUM_INSTALL=system
+}
+
+do_install_prepend() {
+    export SODIUM_INSTALL=system
+}
-- 
2.28.0

