Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10CFCA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:12 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6882.1791371284155559057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DuIn2yxt;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso988109a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371283; x=1791976083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMApjZ/u55Go6kT+huYpAnQDqFuU4TgmThgwe3uvh8w=;
        b=DuIn2yxtoWACPb4kW06TKhH8uhldYL8rjp2I7SrK+TJM+Mjm1WPV0E9DBlcdT5rw3p
         3BxBnwQXpQ8bbtI+rX8sM4/P7yKUYoYpyenDDT5J0C1ElyV/imdSytr6NnaObBi4z82Q
         IJltm1AuqrWS0gf8nEdio/e4t8DaY3ZSU9JrahK1cLOiNkncJOPvoX8OL22wxML+aOYk
         bXpqvW1xV/t1N541d2w26yVezzGCc1FfHQsKqpmsVbSouWt9TN9FE2AFzqwYI7hcBYw2
         x6I3HuTnjc+0IJMO9RaHBmSo1rWtTTBOmyoZp0sepAFJ1QeQ5ggIqJGGuwYjqnpE4S3a
         60jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371283; x=1791976083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMApjZ/u55Go6kT+huYpAnQDqFuU4TgmThgwe3uvh8w=;
        b=LwICwhxdAPkdq+w5wMp6xd2HBOffPbaNn3GdzUeTlQVWbad1x+Elg9tw/OFCnrunoy
         ujl1+YF+QVIaShylkwtnJQQ0+w7Nbqbh868aOVjzu4O3H6zGr8gJ23J8pyp4U0JN8Y6W
         qh3RgWuXZmJFbniKtzjA3wj+7zMoHJpfyKs6t6MR985L6tKcPHGcwg0qtuSpbydmQPqv
         WS7742XCizpnYkDg+ck8iM7CpEvfCQCdTsh7PxKxTY1AyKL0ekdZft7pYeNIZbf+qtpH
         PmqOxXTltAX5O0kOJJE/CpcbBJ99VX+0sCprZ5ZmYVH2ryNwNklWhnYS4gCnecL/n86d
         cKiQ==
X-Gm-Message-State: AFq9FYKeZyMgkhqxQ5+6qBuCKioWPNi+WkhzEZARoUKxo+ZafT51YHs5
	EiZXrrYt6+kOLPjT8j+Wg+DjoyyPCJ4MOmEDbn16OHXe9YrNh0precM5NqZhng==
X-Gm-Gg: AYBFou1rbATFGc7X6znRHe2guGB2Xx4oPcmAs+bstQjOy4mz+PQGIrbOmK6XXDXBdoU
	Ji0AIBrJvbWMuvWcGHr74ajCqLDGmDc0DzKrnzzN1AyULjhV2rafLlZRvQUBIcXYhZ+g85VIwo9
	t7EhkPXdEQgg5R7DW828r4+KrvKt1sS47yJ3k9MPI0EGh+c0beVR6K+Vh1/nhRKVdBC4ldcOxUu
	j0D+PAfHHx9PPyESE2KDsHnE8ytqIl7A1DOWCClGiHH0MxoY4wE+/R9jf6D7TQ9xkYs/PfSiZ49
	N70q4LC83S14nyhv55eKp+RES4tAdAl10ZUhOmuS49eEubmXbGz+XzM2jeKA0uY8CFfG2kSi3NJ
	B4rgrZm2dfmiirWW0yy3dvLdRXS1AtTMXFLdOb91c1wJtqrdZLIWPIVaHDRj8SWP/uPNWQ+enve
	yUkHXdnG/fAcrZb/O5GyNqT7Mr/wHy5p8TEqzmTeNRQtu0xLjCTMFckzJ9iuRGmbj613kPxuQQ6
	McUktdPp3MpZfvtqw9G+HQ=
X-Received: by 2002:a17:90b:3e83:b0:3a0:c20b:2ff1 with SMTP id 98e67ed59e1d1-3a8a1199842mr1030436a91.28.1791371283450;
        Wed, 07 Oct 2026 04:08:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 5/15] python3-pytest-benchmark, python3-types-setuptools: set PYPI_PACKAGE_SDIST
Date: Thu,  8 Oct 2026 00:07:30 +1300
Message-ID: <20261007110740.3179543-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130647

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Otherwise do_fetch will fail due to different source archive and expected WORKDIR won't match.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb | 4 ++++
 .../python/python3-types-setuptools_75.5.0.20241120.bb        | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
index ae4b12c210..b827b62193 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "9ea661cdc292e8231f7cd4c10b0319e56a2118e2c09d9f50e1b3d150d2
 
 inherit pypi setuptools3
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 RDEPENDS:${PN} += "python3-core python3-py-cpuinfo python3-pytest python3-aspectlib"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
index b9f35406bd..200e14c583 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
@@ -7,4 +7,8 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "d3c7e95b0598bf87fede29b3b57b19f5cdcd62a85b9298a7b30f8343f6f21c4f"
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 BBCLASSEXTEND = "native"

