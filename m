Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17.1794851769480193825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RLpOm5hU;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4893188eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851769; x=1795456569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQBRY5gxoxtSXJinPBs/uH4rXkVqR6PZuMXt0AJY1ac=;
        b=RLpOm5hUHMlm9bpcigrEw/KalEHKyGk3Wq+v0rdjPunv4IHQSUagOd7OjPlr9BC/4+
         h4YurABV+22n2Vrk/BtvH8VUIIGsMjcaP5L26ZJt9MXkswrKkkhGnDa0tWrZOCDBQ60h
         wHYZS8bGs6CDsq+5mrDadw4/iT1obRabz3vykLdtLMa6SonJBLkAJLypSRxv2SEFxsMh
         NEi9460acjv6Ezi9MXf5BZ6UELGKaMNcnhABkkzrv1VCm4vDVFEaR1w4oAYIEfrU5Ouh
         HsAXPgvwhO53ctYl+DVpb1p7IAgf9qDg5mk39mmhwCra+PXBNJv4pM88f5e1vk2J2Y5/
         E3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851769; x=1795456569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQBRY5gxoxtSXJinPBs/uH4rXkVqR6PZuMXt0AJY1ac=;
        b=EBLBs/oRAqSNz8797jFHLxven/jIhtRYj142zTq4ON5gxXpDMZx53SZvoTPOsZajNm
         E9owSLYue7VwKommDonqNUiVwK9Z3MUilYBeRgzwn1QSAq+yI2wwbLKLt+7btJLYPrQT
         KxqmI4o9NRcYCPo14RCsz/y9lFfb09G3suENENA0QNyCZuP7mt4qDXyxX55EMqOP9B1W
         87eGB7P4VKfV8piBV6rQK3RvdvU1T63o8u3ly3YBdkdNL7Mr4N/gBhkd8Md77PHRPKXI
         1IRkkw4NNE6FmTgYjC/+/ebLGAIvB1crx0cJkKszdm4oYWMzgDs7dBlJCqNdnuYOwTl/
         9DjQ==
X-Gm-Message-State: APuU4Z8atOGq+N7Mb8NYmnqix8p1gRwCaiL0dTr3Q56MBX64ajWDkwoj
	AZ2ALFF3ZNgM5MmBbNtNl7WIWF9yrgd/NKGSA7nUuLUPQXn6EimGWu4+LD6Ewkg7
X-Gm-Gg: AZFdTZdZNPkE2eMWK19zUEXVN+m8F4Z0hybsBa8TTL+lVN/vC14vhNKbZH0xHzk2z2A
	RYdHzOaEsdy7bFyJya1/CfoQUQfW5kPWGkjzKpRbrzI9zNC13QuY0sByHyzW+++3uDnPUaTXdaD
	ftOLVWhjXGMDqlCPVmzU7/yU8YpFJHAty2MBT19QEuKW23KjL562w6RIT9vZoIamOZOoJwWk3V5
	sIZumibcgaTKy1+J7y59kI0wpOVyTKjaNt5wWjvLyetRtTOVqZeatS/ssld5zMRqdx4PLsU+0mS
	/xKPqUdmMmM4aB/0LIKq4d2+u/nZLHINFFaAIIAzOrNjP2duSnpVv/usXJJBjUaDLlyfYa3uF/A
	AdH1OMwWayImQx5M5PRhpfOrNtX2VNAYXZNL5EeYRkHleSKUHgJTDGYDBKxw1wYbYY02MQnvGut
	0KL5cD0tFEn/OMuFZUO8qpvVWtzt/oxjmF5O4eGwkXZgZ5meHD9A76Pmzo7yKjykhVf24fYBhv/
	a2kAYV3T6I24Y9isYQ4FQPc3VTieOr4Ifx4OQEuW/VhhD6YA9Kf7MSikAtgMp/mbg8gSTJxZD5e
	EQR9hhwBBL3wVrHlnm9ssg9teoRAS/3ZLi2YlOfOuCHlqub4i4mwy1mQY0Hx+wOOKzMotRrfp5S
	ZWZGul5cut5eDcLSf8t3xlYkI+RvyJftvGzh+4dHCxPAaZVdyGRifyv9bDnsgTXW9HrDt5zpieK
	yvI0tM2kNkXJho5QG3BkbS6prznXVjHzumGtiZKf4GruQ1YGU9guIYMDrZWNrFh4E2YhGsUnMFt
	xhfqrHPxzqKBKvAQ6zN2IC3ayLi2aIqEa71asznGGcCfvD199Oo5c2AjFsv2Mwt3isqLwGa7ntF
	WVz+
X-Received: by 2002:a05:693c:4007:b0:379:730d:db52 with SMTP id 5a478bee46e88-379730de704mr10004189eec.32.1794851768758;
        Mon, 16 Nov 2026 09:56:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 094/105] python3-typer: upgrade 0.28.0 -> 0.29.1
Date: Mon, 16 Nov 2026 09:53:46 -0800
Message-ID: <20261116175359.342679-94-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132549
Content-Type: text/plain; charset="utf-8"

Typer now depends on pydantic. Also drop tests/test_docs_cleanup.py from
the ptest, it imports typer's unshipped release scripts.

Changes:
- 0.29.0: Typer now uses Pydantic internally to validate command-line
  parameters. NEW DEPENDENCY: pydantic >=2.5.3 is required.
- BREAKING: click_type removed from typer.Option()/Argument(); some
  defaults validated more strictly (e.g. (None, None, None) tuple
  default now fails); datetime parsing follows Pydantic rules;
  callback parameter objects no longer expose Click's .type,
  .make_metavar(), .human_readable_name, .type_cast_value().
- Terminal control characters are escaped in Pydantic validation
  errors.
- 0.29.1: added Python 3.15 and 3.15t support.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-typer_0.28.0.bb => python3-typer_0.29.1.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.28.0.bb => python3-typer_0.29.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.28.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.29.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-typer_0.28.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.29.1.bb
index 9d80300421..851d3d53ae 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.29.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "69ab84ef79fd601cff071bbd2566d855ecadfd93adbc4b3360b9924359bdd857"
+SRC_URI[sha256sum] = "ab6eb3880bf67ce96147734717f9ec333c06f66e361f3ea947d0be43da39f242"
 
 inherit pypi python_pdm ptest
 
@@ -22,6 +22,7 @@ RDEPENDS:${PN} += "\
     python3-difflib \
     python3-io \
     python3-math \
+    python3-pydantic \
     python3-rich \
     python3-shell \
     python3-shellingham \
@@ -45,6 +46,6 @@ RDEPENDS:${PN}-ptest += "\
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    # references the unshipped top-level 'scripts' package used by typer's release tooling
-    rm -f ${D}${PTEST_PATH}/tests/test_prepare_release.py
+    # reference the unshipped top-level 'scripts' package used by typer's release tooling
+    rm -f ${D}${PTEST_PATH}/tests/test_prepare_release.py ${D}${PTEST_PATH}/tests/test_docs_cleanup.py
 }
