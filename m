Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34331.1794851715449422956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qKyLnE/O;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37628596783so6271208eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851715; x=1795456515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJWZzvoHwnrHErSydOKEDj49NkPSOwQQzkloXd54mwI=;
        b=qKyLnE/O1/g0+BlDptU0XL4/aCPiiWCmc1vLfUO69+jbvzHYx0m5reB1wADr4orCJg
         WCiGppKkZnItUSyJrCvzj3C61Sxf4sFpjA+P8T1jAJISazSav7BB1sHDkavB89RFFg5u
         3fp6rVhw33hbKykxzfIZFnkwwBzoyVdaE+bRdzJV2BqYSJucRViq5B8E2Kttd+HZkjos
         mwglNWj537uLMuc4JxMewFD8XyF9eoVy7IUZYP5tm0Q7nOJGv84yJlNXhoquyM88m6Lr
         s6qFb0yEptxYeSZy5V8VSS72uzy0rdydavK/KD774H4ebq1McXx93arfk3/winXSMezd
         zv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851715; x=1795456515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJWZzvoHwnrHErSydOKEDj49NkPSOwQQzkloXd54mwI=;
        b=AM8frhZBLxWYi8nuO/wpG1QjZDw6hidzDmldvPy5hhsc1zFWpgleaVNlgT+vGGZsXu
         fmx9vpW3stkMNtBE9kC0ICOAg6BFOgebcCHSab49uS2gFIxRAPUEnE2yjdAf1nQ+F8Zc
         2eLSnndc0CNGlgEZKKQ6I/T/o3jGJHS1YVG1EG1Nc1j5QJIfuKlhY/zbbyktb+rUvEPs
         +Em+1zXdQcEf2yaO2jtCA5Gg9csZ6DEaQV81UWTU8+khXW8BdWURywhUBQ9k67r4LXit
         VJaQpYCGqKRTcEuGNucFls4NOXWzEvVYIeQAZYO3B2uOEhTU20O7bRp1Ds33lPgFywWT
         M08Q==
X-Gm-Message-State: APuU4Z+eshsW3u0eFnaBjCOSVNJw2i6z+vWMSvCA5fSbs9K+Ug66ajf1
	5+p26q4uvE+XrhTNf0RuBegbnRfmu7LbzwFo+26KnOeuBlL7h4IdHem1vfQLZnj+
X-Gm-Gg: AZFdTZcM0fenmhau3IeTYusnhrD9LXTRyuiWf0rA/GVCYgGfsQyPmQrUs0YmiRlhwRQ
	euLULmrCjZggI/UEMe370SVB4wmUnNyuJVob47/7TXm1U+iY2Y8Cj1ydRjBijFHOwjvkEw9PtP1
	rFX9O08aT8fyXbcW8464s3F+E1RSupGJ1jobBeu1cQoNzj+11xGGVN5ivPkKQkxfqESWZ6i6nK3
	yiAnuR3qQBPzBu7bMiwAmo14yp5b/CB3lXVlJy5Vs7Lwh1TOrz6EvnfBcfx3Gi9UFac92C0E2mw
	TbTjaEx+180YWmCS86q/PE/zz+eqQGx3QgVPSlN/IIClw0+SSPHomZ3eFStB5B7n6OiKLxsCMJh
	rHHHPq1biN8oSJX/x6jS2oO+ZxP0XQIvkJslTCv4sdRCdOhtW51YHfWy/SLGG6gMJBDzVc1i83U
	3me4lIXLkzvraeYnjzeaIeGN1ysx0l0DoDkPvULMM4sV4i8RjvOwjcIU/2Hcjz6T65reqUX1Xze
	KHMi+fpB6YqaFqyP/a6MNOw+ZNjcvyC5PK0tSA0jXiNQYiFs844Mpa20pUy7j3z8N6vqz/o9yIa
	JkUrZvyuZ8KvIqrP6vrSjF/JDIfH0XrTRXvO1bGDdoTpgfWcWmXrmm5dujWe1JX/j6SqGxeimAQ
	uhXABhccj/d/dr+9XehTVBVn19sD41k83PhoQcc9X3lBEGKQ4eSx32QvFHAdkG1b3Rk/hpETFKW
	pueNK7l/oshrGpZsVe0NpegCY9PMQ7/+znFkxEORcuvwjLJ9Oa47T91Z4hWaLNcA6cbNQc+K72G
	XMdKcfvRjY95//+Jhh72bnmgNYQDhJOyQU4NBiyI8ZyuiHS4/klZyYBshZoca+k/jISj+LFh1e6
	Hjg1C6urxMHWhdXuSgmfF9rfUbY=
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3798df3d361mr10427252eec.13.1794851714742;
        Mon, 16 Nov 2026 09:55:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 050/105] python3-m2crypto: upgrade 0.49.0 -> 0.51.0
Date: Mon, 16 Nov 2026 09:53:02 -0800
Message-ID: <20261116175359.342679-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132506
Content-Type: text/plain; charset="utf-8"

Refresh the setup.py patch.

Changes:
- Security (0.51.0): SSL.Checker no longer splits subjectAltName on
  commas; a URI/email/otherName SAN containing ",DNS:<host>" was
  accepted as a DNS identity (CVE-2026-109087, as listed upstream).
  Hostname checks now use X509_check_host()/X509_check_ip_asc().
- Fix regex injection in TLS hostname verification (no CVE) and
  out-of-bounds reads in BIGNUM conversions.
- BREAKING (0.50.0): TLS 1.0 and 1.1 disabled by default; RC4 emits a
  DeprecationWarning; legacy ENGINE bindings disabled with OpenSSL 3;
  OpenSSL providers isolated in private contexts.
- Add AES-GCM (AEAD) and AuthorityKeyIdentifier support; OpenSSL 4.0
  and SWIG 4.5 compatibility; many memory-leak/ownership fixes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-setup.py-Make-the-cmd-available.patch           | 9 ++-------
 ...on3-m2crypto_0.49.0.bb => python3-m2crypto_0.51.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.49.0.bb => python3-m2crypto_0.51.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
index 12216ce46a..ba03134414 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
@@ -22,14 +22,12 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  setup.py | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index 792d7365b6ed..5b8a5d791793 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -208,8 +208,10 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+@@ -234,8 +234,10 @@
          if sys.platform != "win32":
              # generate src/SWIG/x509_v_flag.h to overcome weaknesses of swig
-             # https://todo.sr.ht/~mcepl/m2crypto/298
+             # https://codefloe.com/mcepl/m2crypto/issues/298
 -            with open("src/SWIG/x509_v_flag.h", "w", encoding="utf-8") as x509_v_h:
 -                cmd = [shutil.which(os.environ.get("CC", "gcc"))]
 +            with open(
@@ -39,6 +37,3 @@ index 792d7365b6ed..5b8a5d791793 100644
                  cflags = os.environ.get("CFLAGS")
                  if cflags is not None:
                      cmd += cflags.split()
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb
index 454893884d..edf38afd2a 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=8099b0e569f862ece05740aef06c82a2"
 
-SRC_URI[sha256sum] = "604b9cdd7c1bb9e73e54a189643d56d08bf841691775122962430ee2ca3506fe"
+SRC_URI[sha256sum] = "5428f6601086a8f5e41aa70248b3b983443e7badf263551c5104ba2ec0c9d955"
 
 SRC_URI += "file://0001-setup.py-Make-the-cmd-available.patch"
 SRC_URI += "file://0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch"
