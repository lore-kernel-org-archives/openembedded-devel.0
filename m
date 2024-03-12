Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE8DC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 06:02:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.2216.1710223358301265934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 23:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X+Mqa4OC;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dc96f64c10so40638425ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 23:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710223357; x=1710828157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UcRh+ACcuUveLfI8yBvVzEFP1BnhLhLWY/NNVC/4/7g=;
        b=X+Mqa4OCi+FUwV8sYwzuunAlyk5PnEvVsBai/cgKXV90p4Gfg+TkgCYCvrDfM/2KlX
         myp9r2kpmnC2r9FSkBZR24ahKQ2t4Eek52sFIY8mQBeD8koUcf3RXcgAZlh0bqvq7SyT
         9WNMtQZM0BqUEE5i6FfojZ/8lMS9A9A4xIa3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710223357; x=1710828157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcRh+ACcuUveLfI8yBvVzEFP1BnhLhLWY/NNVC/4/7g=;
        b=DtyelQeNFHkgrK2qQQUIgOVs/UixOYabJ1DPvRF1kKYFldPezedlnZx15PwD3Bhakm
         i6Nt9aUVHhyyBRk3uCxlvturcKV6TyDdM8RuJPavhjbJkqF2rX36RQ/eg260M+kLu8jf
         q1AZ4LNfL3dlNjoY+tnA0Wni6PTyqVUNC5q6bWhy0yj4RrRxDZZKvt2WXz7zhZsJQ2yk
         rnOyA0SJLU+rvOhPAJ557sbuwFnbN50kGs1C5KGqJVH80+h5OPLveczst9KU6GjfcaPW
         k0os6AO27yh+hcHWP6VzGUv64mzj3bCarMnfzxL2a/Sbr9XuwS3+QXor0xxZQ1/x1pfy
         PjSg==
X-Gm-Message-State: AOJu0Yx3JQEIN3or4a1+/jfMJ2SDWXNyG9BYGG6qKYVvLLV92H5ZSFze
	SsoAc2taAKR7iJCLno+romyYAyJBygtBz5LwVdXw2oG5DGwnWVHL9VSurkW0ke+FMl2R6BXX3oy
	E
X-Google-Smtp-Source: AGHT+IHVMoivc5N3CEkua5PPS18Nno2Vcx+ie86g4qLrN2IaCX0oXEaRSbt0wj2el5Lr5wLZyiqIHw==
X-Received: by 2002:a17:903:496:b0:1dc:6152:7c24 with SMTP id jj22-20020a170903049600b001dc61527c24mr6533573plb.43.1710223357497;
        Mon, 11 Mar 2024 23:02:37 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.133])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b001dd6c0800b4sm5740737plh.188.2024.03.11.23.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 23:02:37 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][dunfell][PATCH] python3-cryptography: fix CVE-2024-26130 NULL pointer dereference
Date: Tue, 12 Mar 2024 11:32:31 +0530
Message-Id: <20240312060231.19776-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 06:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109275

Upstream-Status: Backport from https://github.com/pyca/cryptography/commit/97d231672763cdb5959a3b191e692a362f1b9e55

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-cryptography/CVE-2024-26130.patch | 66 +++++++++++++++++++
 .../python/python3-cryptography_2.8.bb        |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch b/meta-python/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch
new file mode 100644
index 0000000000..c0acb9066b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch
@@ -0,0 +1,66 @@
+From 97d231672763cdb5959a3b191e692a362f1b9e55 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Mon, 19 Feb 2024 11:50:28 -0500
+Subject: [PATCH] Fixes #10422 -- don't crash when a PKCS#12 key and cert don't
+match (#10423)
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/97d231672763cdb5959a3b191e692a362f1b9e55]
+CVE: CVE-2024-26130
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../hazmat/backends/openssl/backend.py         |  9 +++++++++
+ tests/hazmat/primitives/test_pkcs12.py         | 18 ++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/backend.py b/src/cryptography/hazmat/backends/openssl/backend.py
+index 7e9fa20..ce3fc8c 100644
+--- a/src/cryptography/hazmat/backends/openssl/backend.py
++++ b/src/cryptography/hazmat/backends/openssl/backend.py
+@@ -1046,6 +1046,15 @@ class Backend(object):
+                 raise NotImplementedError(
+                     'Extension not supported: {}'.format(extension.oid)
+                 )
++                if p12 == self._ffi.NULL:
++                    errors = self._consume_errors()
++                    raise ValueError(
++                        (
++                            "Failed to create PKCS12 (does the key match the "
++                            "certificate?)"
++                        ),
++                        errors,
++                    )
+ 
+             ext_struct = encode(self, extension.value)
+             nid = self._lib.OBJ_txt2nid(
+diff --git a/tests/hazmat/primitives/test_pkcs12.py b/tests/hazmat/primitives/test_pkcs12.py
+index f084d57..c4160b0 100644
+--- a/tests/hazmat/primitives/test_pkcs12.py
++++ b/tests/hazmat/primitives/test_pkcs12.py
+@@ -17,6 +17,24 @@ from cryptography.hazmat.primitives.serialization.pkcs12 import (
+ 
+ from .utils import load_vectors_from_file
+ 
++    @pytest.mark.supported(
++        only_if=lambda backend: backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
++        skip_message="Requires OpenSSL with PKCS12_set_mac",
++    )
++    def test_set_mac_key_certificate_mismatch(self, backend):
++        cacert, _ = _load_ca(backend)
++        key = ec.generate_private_key(ec.SECP256R1())
++        encryption = (
++            serialization.PrivateFormat.PKCS12.encryption_builder()
++            .hmac_hash(hashes.SHA256())
++            .build(b"password")
++        )
++
++        with pytest.raises(ValueError):
++            serialize_key_and_certificates(
++                b"name", key, cacert, [], encryption
++            )
++
+ 
+ @pytest.mark.requires_backend_interface(interface=DERSerializationBackend)
+ class TestPKCS12(object):
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
index e4d69fa5aa..63bc0e0d6d 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
     file://0002-chunking-didn-t-actually-work-5499.patch \
     file://0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch \
     file://CVE-2023-23931.patch \
+    file://CVE-2024-26130.patch \
 "
 
 inherit pypi setuptools3
-- 
2.25.1


