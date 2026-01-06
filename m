Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CEFC47BC2
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85415.1767684819742062763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 23:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIFu9IiI;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb5810d39so355580f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 23:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767684818; x=1768289618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9R3LCE+al7V2RxdBjZ5ZKfabEAklgA+pTYHqbANOX5w=;
        b=UIFu9IiIFR0CgzaIz4Oi9s4VHWfQc37VY1CiIn5Hr98jFA/VWAbJUd+0HpnoBxX5Uo
         IyKHJVTVKb1dwrtK8nUdf/meQ7MaeoebMSFSOWC8jccuifqS+MG/F8m+NZaIJ/FW0UVr
         2bU7ujoXXI0RvQ4lDbXBnQZMD+HotmIMsf9BRRVgYADlwJMJPUX7wWF21kU/up/DGiso
         7q0krPgCaa05HTOudjBcYe8hU023T+V+yrWT5BlGtAxmzg2lkzxQS62ophlOkXfKXOv8
         h3JqZN8tSgSzV4h02e6AAbbQzEawS01Oli/lCG5D6k1nj20fKPMtiaeGEZoeILpemHRG
         Q5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684818; x=1768289618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9R3LCE+al7V2RxdBjZ5ZKfabEAklgA+pTYHqbANOX5w=;
        b=GGOx9Y0FgZD9oJ8Ng83m0zaJCnLqiB820Xykaz/X+jFrzzNsTrc8c6uSkIUykpbeBe
         CrEzue6uBs+Dql63Qie21sv3r9sHBa3kuoo8RApsXIMqwURbjQntoiArgzBfhgbl43J1
         RtcZtEVZg5KGwnhNuUwjqzicMZoQr72z+sbHWN1igziT4gC8RhLBkx8i4NpRKgWI4/a2
         tCXrScVpyxFaADJMvkHTBCBR5mavoHj1PBQQBHyz+DJ8O3+1jty0cn1CuLrIAfXXAYR6
         Dg5HFOqNKfaFyNxJgccWQc9gv0sKpqw8WNPpPaEPIqRXOXEeu4O8sEuCtZTKbobwg/M9
         dhWw==
X-Gm-Message-State: AOJu0Yy3LS74kUwnKLU1oVNv6NBoHLHRxyA+D1W4P3l6HBqJ4uv+C7+N
	pA6h37+tI/PzKuoS7zkQgDz+XHRu+xsl+Rlx9ILCRBd8bFVf3vdbUkT1WaymkA==
X-Gm-Gg: AY/fxX7fEGKXa27NNa1BjIZ3hVrcvJdKqhuj2leCHO3QTmQfNc0qXugmyrMMJhFz7PI
	9ukkK6V5ijX71OcQ+0SheeGkkRhQ9pC2NaUKGNWpWL5OI5WucKpQdtQ+S53s2P9JDBps8hCshUg
	yviQNEk1tT7XBO/iDdTNGiTI1fG4TBu6E9ueAy/iyMUE+62+I5UFAKwjKh1I7wPvGYKjtrN1I/U
	5lfD6SyETFNkJ2jheHkO3ULKs0iE5/HE5QOOx41yt28ex9mIdGAsNcvDr018Jh3FhEeJ4w+nU8a
	+2/QNflFV3lNkgxOTvZ644DsY4RNaJBIOGeMGwV4XbY9K6+rqN2qmAYRr1SnUtp8qWsvWovm9z0
	NVcrMpbhi3iAKQiWi0hAy17P0HaY/lxVaiU5tCY60F7Ky+vAiM6u/xAQfhzImmho78lagpXJOsA
	amt++HqIWr
X-Google-Smtp-Source: AGHT+IEYQd4DCULc+Ed5wq/rCGycg885IhupfUIdkVE05hOzg544yqCz8GfKslu3blrNcDhGoELXkw==
X-Received: by 2002:a05:6000:3111:b0:430:fced:909 with SMTP id ffacd0b85a97d-432bca3a273mr2633005f8f.24.1767684817834;
        Mon, 05 Jan 2026 23:33:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm2811251f8f.11.2026.01.05.23.33.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:33:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-pyjwt: patch CVE-2022-29217
Date: Tue,  6 Jan 2026 08:33:28 +0100
Message-ID: <20260106073334.3462222-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106073334.3462222-1-skandigraun@gmail.com>
References: <20260106073334.3462222-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123166

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-29217

Pick the patch referenced by the NVD advsory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-pyjwt/CVE-2022-29217.patch | 295 ++++++++++++++++++
 .../python/python3-pyjwt_2.3.0.bb             |   1 +
 2 files changed, 296 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2022-29217.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2022-29217.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2022-29217.patch
new file mode 100644
index 0000000000..8bb80f39a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2022-29217.patch
@@ -0,0 +1,295 @@
+From 0ab93eb55a182f190dea55cc048dcb50bf97724c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@webapplicate.com>
+Date: Thu, 12 May 2022 14:31:00 -0400
+Subject: [PATCH] Merge pull request from GHSA-ffqj-6fqr-9h24
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: José Padilla <jpadilla@users.noreply.github.com>
+
+CVE: CVE-2022-29217
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/9c528670c455b8d948aff95ed50e22940d1ad3fc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ jwt/algorithms.py        |  39 +++++++-------
+ jwt/utils.py             |  61 ++++++++++++++++++++++
+ tests/test_advisory.py   | 109 +++++++++++++++++++++++++++++++++++++++
+ tests/test_algorithms.py |   2 +-
+ 4 files changed, 189 insertions(+), 22 deletions(-)
+ create mode 100644 tests/test_advisory.py
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index 1f8865a..1aa30ed 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -9,6 +9,8 @@ from .utils import (
+     der_to_raw_signature,
+     force_bytes,
+     from_base64url_uint,
++    is_pem_format,
++    is_ssh_key,
+     raw_to_der_signature,
+     to_base64url_uint,
+ )
+@@ -183,14 +185,7 @@ class HMACAlgorithm(Algorithm):
+     def prepare_key(self, key):
+         key = force_bytes(key)
+ 
+-        invalid_strings = [
+-            b"-----BEGIN PUBLIC KEY-----",
+-            b"-----BEGIN CERTIFICATE-----",
+-            b"-----BEGIN RSA PUBLIC KEY-----",
+-            b"ssh-rsa",
+-        ]
+-
+-        if any(string_value in key for string_value in invalid_strings):
++        if is_pem_format(key) or is_ssh_key(key):
+             raise InvalidKeyError(
+                 "The specified key is an asymmetric key or x509 certificate and"
+                 " should not be used as an HMAC secret."
+@@ -545,26 +540,28 @@ if has_crypto:
+             pass
+ 
+         def prepare_key(self, key):
+-
+-            if isinstance(
+-                key,
+-                (Ed25519PrivateKey, Ed25519PublicKey, Ed448PrivateKey, Ed448PublicKey),
+-            ):
+-                return key
+-
+             if isinstance(key, (bytes, str)):
+                 if isinstance(key, str):
+                     key = key.encode("utf-8")
+                 str_key = key.decode("utf-8")
+ 
+                 if "-----BEGIN PUBLIC" in str_key:
+-                    return load_pem_public_key(key)
+-                if "-----BEGIN PRIVATE" in str_key:
+-                    return load_pem_private_key(key, password=None)
+-                if str_key[0:4] == "ssh-":
+-                    return load_ssh_public_key(key)
++                    key = load_pem_public_key(key)
++                elif "-----BEGIN PRIVATE" in str_key:
++                    key = load_pem_private_key(key, password=None)
++                elif str_key[0:4] == "ssh-":
++                    key = load_ssh_public_key(key)
++
++            # Explicit check the key to prevent confusing errors from cryptography
++            if not isinstance(
++                key,
++                (Ed25519PrivateKey, Ed25519PublicKey, Ed448PrivateKey, Ed448PublicKey),
++            ):
++                raise InvalidKeyError(
++                    "Expecting a EllipticCurvePrivateKey/EllipticCurvePublicKey. Wrong key provided for EdDSA algorithms"
++                )
+ 
+-            raise TypeError("Expecting a PEM-formatted or OpenSSH key.")
++            return key
+ 
+         def sign(self, msg, key):
+             """
+diff --git a/jwt/utils.py b/jwt/utils.py
+index 9dde10c..8ab73b4 100644
+--- a/jwt/utils.py
++++ b/jwt/utils.py
+@@ -1,5 +1,6 @@
+ import base64
+ import binascii
++import re
+ from typing import Any, Union
+ 
+ try:
+@@ -97,3 +98,63 @@ def raw_to_der_signature(raw_sig: bytes, curve: EllipticCurve) -> bytes:
+     s = bytes_to_number(raw_sig[num_bytes:])
+ 
+     return encode_dss_signature(r, s)
++
++
++# Based on https://github.com/hynek/pem/blob/7ad94db26b0bc21d10953f5dbad3acfdfacf57aa/src/pem/_core.py#L224-L252
++_PEMS = {
++    b"CERTIFICATE",
++    b"TRUSTED CERTIFICATE",
++    b"PRIVATE KEY",
++    b"PUBLIC KEY",
++    b"ENCRYPTED PRIVATE KEY",
++    b"OPENSSH PRIVATE KEY",
++    b"DSA PRIVATE KEY",
++    b"RSA PRIVATE KEY",
++    b"RSA PUBLIC KEY",
++    b"EC PRIVATE KEY",
++    b"DH PARAMETERS",
++    b"NEW CERTIFICATE REQUEST",
++    b"CERTIFICATE REQUEST",
++    b"SSH2 PUBLIC KEY",
++    b"SSH2 ENCRYPTED PRIVATE KEY",
++    b"X509 CRL",
++}
++
++_PEM_RE = re.compile(
++    b"----[- ]BEGIN ("
++    + b"|".join(_PEMS)
++    + b""")[- ]----\r?
++.+?\r?
++----[- ]END \\1[- ]----\r?\n?""",
++    re.DOTALL,
++)
++
++
++def is_pem_format(key: bytes) -> bool:
++    return bool(_PEM_RE.search(key))
++
++
++# Based on https://github.com/pyca/cryptography/blob/bcb70852d577b3f490f015378c75cba74986297b/src/cryptography/hazmat/primitives/serialization/ssh.py#L40-L46
++_CERT_SUFFIX = b"-cert-v01@openssh.com"
++_SSH_PUBKEY_RC = re.compile(br"\A(\S+)[ \t]+(\S+)")
++_SSH_KEY_FORMATS = [
++    b"ssh-ed25519",
++    b"ssh-rsa",
++    b"ssh-dss",
++    b"ecdsa-sha2-nistp256",
++    b"ecdsa-sha2-nistp384",
++    b"ecdsa-sha2-nistp521",
++]
++
++
++def is_ssh_key(key: bytes) -> bool:
++    if any(string_value in key for string_value in _SSH_KEY_FORMATS):
++        return True
++
++    ssh_pubkey_match = _SSH_PUBKEY_RC.match(key)
++    if ssh_pubkey_match:
++        key_type = ssh_pubkey_match.group(1)
++        if _CERT_SUFFIX == key_type[-len(_CERT_SUFFIX) :]:
++            return True
++
++    return False
+diff --git a/tests/test_advisory.py b/tests/test_advisory.py
+new file mode 100644
+index 0000000..f70f54b
+--- /dev/null
++++ b/tests/test_advisory.py
+@@ -0,0 +1,109 @@
++import jwt
++import pytest
++from jwt.exceptions import InvalidKeyError
++
++priv_key_bytes = b'''-----BEGIN PRIVATE KEY-----
++MC4CAQAwBQYDK2VwBCIEIIbBhdo2ah7X32i50GOzrCr4acZTe6BezUdRIixjTAdL
++-----END PRIVATE KEY-----'''
++
++pub_key_bytes = b'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPL1I9oiq+B8crkmuV4YViiUnhdLjCp3hvy1bNGuGfNL'
++
++ssh_priv_key_bytes = b"""-----BEGIN EC PRIVATE KEY-----
++MHcCAQEEIOWc7RbaNswMtNtc+n6WZDlUblMr2FBPo79fcGXsJlGQoAoGCCqGSM49
++AwEHoUQDQgAElcy2RSSSgn2RA/xCGko79N+7FwoLZr3Z0ij/ENjow2XpUDwwKEKk
++Ak3TDXC9U8nipMlGcY7sDpXp2XyhHEM+Rw==
++-----END EC PRIVATE KEY-----"""
++
++ssh_key_bytes = b"""ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJXMtkUkkoJ9kQP8QhpKO/TfuxcKC2a92dIo/xDY6MNl6VA8MChCpAJN0w1wvVPJ4qTJRnGO7A6V6dl8oRxDPkc="""
++
++
++class TestAdvisory:
++    def test_ghsa_ffqj_6fqr_9h24(self):
++        # Generate ed25519 private key
++        # private_key = ed25519.Ed25519PrivateKey.generate()
++
++        # Get private key bytes as they would be stored in a file
++        # priv_key_bytes = private_key.private_bytes(
++        #     encoding=serialization.Encoding.PEM,
++        #     format=serialization.PrivateFormat.PKCS8,
++        #     encryption_algorithm=serialization.NoEncryption(),
++        # )
++
++        # Get public key bytes as they would be stored in a file
++        # pub_key_bytes = private_key.public_key().public_bytes(
++        #     encoding=serialization.Encoding.OpenSSH,
++        #     format=serialization.PublicFormat.OpenSSH,
++        # )
++
++        # Making a good jwt token that should work by signing it
++        # with the private key
++        # encoded_good = jwt.encode({"test": 1234}, priv_key_bytes, algorithm="EdDSA")
++        encoded_good = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJFZERTQSJ9.eyJ0ZXN0IjoxMjM0fQ.M5y1EEavZkHSlj9i8yi9nXKKyPBSAUhDRTOYZi3zZY11tZItDaR3qwAye8pc74_lZY3Ogt9KPNFbVOSGnUBHDg'
++
++        # Using HMAC with the public key to trick the receiver to think that the
++        # public key is a HMAC secret
++        encoded_bad = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0ZXN0IjoxMjM0fQ.6ulDpqSlbHmQ8bZXhZRLFko9SwcHrghCwh8d-exJEE4'
++
++        # Both of the jwt tokens are validated as valid
++        jwt.decode(
++            encoded_good,
++            pub_key_bytes,
++            algorithms=jwt.algorithms.get_default_algorithms(),
++        )
++
++        with pytest.raises(InvalidKeyError):
++            jwt.decode(
++                encoded_bad,
++                pub_key_bytes,
++                algorithms=jwt.algorithms.get_default_algorithms(),
++            )
++
++        # Of course the receiver should specify ed25519 algorithm to be used if
++        # they specify ed25519 public key. However, if other algorithms are used,
++        # the POC does not work
++        # HMAC specifies illegal strings for the HMAC secret in jwt/algorithms.py
++        #
++        #        invalid_str ings = [
++        #            b"-----BEGIN PUBLIC KEY-----",
++        #            b"-----BEGIN CERTIFICATE-----",
++        #            b"-----BEGIN RSA PUBLIC KEY-----",
++        #            b"ssh-rsa",
++        #        ]
++        #
++        # However, OKPAlgorithm (ed25519) accepts the following in  jwt/algorithms.py:
++        #
++        #                if "-----BEGIN PUBLIC" in str_key:
++        #                    return load_pem_public_key(key)
++        #                if "-----BEGIN PRIVATE" in str_key:
++        #                    return load_pem_private_key(key, password=None)
++        #                if str_key[0:4] == "ssh-":
++        #                    return load_ssh_public_key(key)
++        #
++        # These should most likely made to match each other to prevent this behavior
++
++        # POC for the ecdsa-sha2-nistp256 format.
++        # openssl ecparam -genkey -name prime256v1 -noout -out ec256-key-priv.pem
++        # openssl ec -in ec256-key-priv.pem -pubout > ec256-key-pub.pem
++        # ssh-keygen -y -f ec256-key-priv.pem > ec256-key-ssh.pub
++
++        # Making a good jwt token that should work by signing it with the private key
++        # encoded_good = jwt.encode({"test": 1234}, ssh_priv_key_bytes, algorithm="ES256")
++        encoded_good = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXN0IjoxMjM0fQ.NX42mS8cNqYoL3FOW9ZcKw8Nfq2mb6GqJVADeMA1-kyHAclilYo_edhdM_5eav9tBRQTlL0XMeu_WFE_mz3OXg"
++
++        # Using HMAC with the ssh public key to trick the receiver to think that the public key is a HMAC secret
++        # encoded_bad = jwt.encode({"test": 1234}, ssh_key_bytes, algorithm="HS256")
++        encoded_bad = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXN0IjoxMjM0fQ.5eYfbrbeGYmWfypQ6rMWXNZ8bdHcqKng5GPr9MJZITU"
++
++        # Both of the jwt tokens are validated as valid
++        jwt.decode(
++            encoded_good,
++            ssh_key_bytes,
++            algorithms=jwt.algorithms.get_default_algorithms()
++        )
++
++        with pytest.raises(InvalidKeyError):
++            jwt.decode(
++                encoded_bad,
++                ssh_key_bytes,
++                algorithms=jwt.algorithms.get_default_algorithms()
++            )
+diff --git a/tests/test_algorithms.py b/tests/test_algorithms.py
+index b6a73fc..777c108 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -669,7 +669,7 @@ class TestOKPAlgorithms:
+     def test_okp_ed25519_should_reject_non_string_key(self):
+         algo = OKPAlgorithm()
+ 
+-        with pytest.raises(TypeError):
++        with pytest.raises(InvalidKeyError):
+             algo.prepare_key(None)
+ 
+         with open(key_path("testkey_ed25519")) as keyfile:
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
index 19ba30780e..ad84e59d57 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
+SRC_URI += "file://CVE-2022-29217.patch"
 SRC_URI[sha256sum] = "b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41"
 
 PYPI_PACKAGE = "PyJWT"

