Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.7166.1587883692206567207
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 23:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=In+jQ3FS;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id h11so5600452plr.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 23:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0fewEMkw3fsxI4eW43flwuzJWhConRQCEv6+zTGSgkI=;
        b=In+jQ3FSmMyOS7fCtIM8U4FLEvbsaYtvzSPsRTQcU1jxxGqy91A+Z+VWOx8ggBQzPS
         j+l2FIMyA3lAzUhTQhValYreJQGqKlyaOuJZhoSqc4M1Im7KSoUVyzENa6bG/EpfPFdD
         VfrOT/Uuj34DUdSgu9bG4OfBesLARsmjPbk0ZHQoHf3/iR0daD0pEqmVPGU+oc2uJwun
         lvxk8YDnV64OIZzICKWqqcnaxEzzNKsfBSfEzLN/wQXwxELLpwK5hgztZpLiNzaLyu6s
         hqK9do1kJhh1Pq9uE7NhSeX7vDBofE4wGhEfegko+LOo6CC8oMleIgMcLTpzjj5cEb3T
         t1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0fewEMkw3fsxI4eW43flwuzJWhConRQCEv6+zTGSgkI=;
        b=P4/uLQGkoBrmRxCptxycJvEkAP/nXwlwyGXURitgXkZsiY1m0tm5nRCcdSHG9u1hpZ
         0CiKvec+Gwvfyay8Ra8BOwO3FsQlfLlkwPKJSETD9kAlW2jTsfgt/UyrXZL/LWYcWWqs
         bjzUrkfRSRIwM7XQp7VEJnJz7cnKuMBNIHzZ4ZlfZDX5J7Vwr/c/G5Qe1jXS2Yks3d0n
         7KVIVV9hq6BNb6R2LGppvVHNKmdElqjgPD4bimQW+7n+NvasZrpKhZWGUHPi3s6VzryT
         hMNIQbEBS/bQbiVXUYJZ7gwXyYzqUz9EzfiIBKZKxyCvz4K64gR7TSjYb5sRNhvrFpOf
         9BqQ==
X-Gm-Message-State: AGi0PuZqbTbOZRGM1dHiHB+Pc76imiFvt9BwOOoArLsIF8XlJSVrrqUB
	4ZNWAgkyWVdmnAhHE+fahePiNGqoFe0=
X-Google-Smtp-Source: APiQypIwq5c1KowkubIjs8nYYP4jVAY/I7gaT8Txc239bxdCdSuMqA/PDUvXNay6Fi0hPlWHjvVxJw==
X-Received: by 2002:a17:902:50d:: with SMTP id 13mr17246094plf.170.1587883691547;
        Sat, 25 Apr 2020 23:48:11 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:b0b6:9555:1795:f958])
        by smtp.gmail.com with ESMTPSA id w2sm9390281pfc.194.2020.04.25.23.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 23:48:11 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-cryptography-vectors: merge bb and inc
Date: Sat, 25 Apr 2020 23:48:03 -0700
Message-Id: <20200426064803.31911-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200426064803.31911-1-ticotimo@gmail.com>
References: <20200426064803.31911-1-ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-cryptography-vectors.inc    | 18 ----------------
 .../python3-cryptography-vectors_2.8.bb       | 21 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography-vectors.inc

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
deleted file mode 100644
index 10af48c9fb..0000000000
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Test vectors for the cryptography package."
-HOMEPAGE = "https://cryptography.io/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
-
-DEPENDS += " \
-    ${PYTHON_PN}-cryptography \
-"
-
-SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
-SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
-
-PYPI_PACKAGE = "cryptography_vectors"
-
-BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = ""
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
index 58994ffffa..49a5664dcd 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
@@ -1,2 +1,21 @@
-inherit pypi setuptools3
 require python-cryptography-vectors.inc
+SUMMARY = "Test vectors for the cryptography package."
+HOMEPAGE = "https://cryptography.io/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+
+SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
+SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
+
+PYPI_PACKAGE = "cryptography_vectors"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+    ${PYTHON_PN}-cryptography \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = ""
-- 
2.25.0

