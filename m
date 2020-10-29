Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.6393.1603965834167912435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 03:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4LsoMhz;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id 7so3034379ejm.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2020 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rHMkU9+uerESuvOisSgFZQUx9NOGxtAM8LATKvw48pg=;
        b=a4LsoMhzz7uftL/f1mhvmfnxgC7uBIFKYl6hdu98hRUQN+0dptpZW1ANnknAcjvElp
         ip8vXXryWFdQ3e2LGHCfLLwYIWnnt2EPfAj5qgjmY4Bz2rHi8HTlQ7J6mhB2MKsnFEMg
         qdTy5Qvn3cy0UOdASkYZ1Z0BiCC2ygqZFxZ19dGyQncaEfAK9WghAnF1rGLxtiXm4AH9
         cL1L1IZnI4H1H0FlEWplJsdqvffeA/WndlrsWcg1Y3NUbyRbrpSQpxh6g8k1kl2kVf1Z
         CMObxKMhg+OtF4PumY1qPkmP+/fa9Iyu3Vb803ilPTewJA3gaHyFWJr7rP7+lvGnUjCs
         rJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rHMkU9+uerESuvOisSgFZQUx9NOGxtAM8LATKvw48pg=;
        b=GxY3jjwIamBlwBcLbIVUmvSGZ0XP0sSNDIKtAU5JOsEVJsCgjQjRO9R+ZtLyTpfSaE
         i8pdKeHLOC1RJNR3NPJADvec9HqAvXsj0ae/T+hpFLHSMJKZPuRvQ39QHshZpedUheIe
         Jk6rk1OzG9YNh481c//8wInxLuh9MkslWlSkvA1e1hg88QQnB6cvHyziy1lAgXjAsIW2
         0KN61PEdsI+Xp4o8Nyn7Hpa5pQ+bO8JacAefqDCxCsbT+A6YVnCFZGKPtdSoauKuqOMT
         xoe77oFZDFzHQlNMZ8jK7SS8Ydqn5sU2XqJDK1gW66+DBvgr54KqSE7XUOPeZzAex8Fo
         FERQ==
X-Gm-Message-State: AOAM532z3RQWqBSSOhA0uAgOEfSW/70v+7W05aXJW6mL4lpwjiTUXUV+
	ar/OUitCACzl4nt39Z9IVqHxCV5RLwIglA==
X-Google-Smtp-Source: ABdhPJxZ/6rdINzFA3tzK5DE8vTDIIulyquhUCLQyXjSUvVLrnCbqlTsfugxcoLEcBLZO+DlJAXxiw==
X-Received: by 2002:a17:906:3899:: with SMTP id q25mr3458825ejd.0.1603965831820;
        Thu, 29 Oct 2020 03:03:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q2sm1196316ejd.20.2020.10.29.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:03:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] python3-mprpc: remove the recipe
Date: Thu, 29 Oct 2020 11:03:38 +0100
Message-Id: <20201029100339.26698-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029100339.26698-1-alex.kanavin@gmail.com>
References: <20201029100339.26698-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The project has been abandoned for a few years now, and
no longer builds with python 3.9.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python-mprpc/python3-mprpc_0.1.17.bb            | 13 -------------
 .../packagegroups/packagegroup-meta-python.bb       |  1 -
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb

diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
deleted file mode 100644
index 14eef9691..000000000
--- a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A gevent based messagpack rpc library"
-DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
-It is based on gevent for handling connections and enabling concurrent connections."
-HOMEPAGE = "https://github.com/studio-ousia/mprpc"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
-DEPENDS += "${PYTHON_PN}-gevent"
-RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
-
-SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
-SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0f032e65e..6a3061986 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -444,7 +444,6 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
     python3-h2 \
     python3-hpack \
     python3-hyperframe \
-    python3-mprpc \
     python3-priority \
     python3-pyconnman \
     python3-pyro4 \
-- 
2.29.0

