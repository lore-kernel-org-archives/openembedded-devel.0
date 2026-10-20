Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6263.1792499557658534990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TRltRfh9;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so5621495e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499556; x=1793104356; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W+9M+CtaBYEWsWQuLDC/Q7MRJcTSKHssas7vgtMaEmo=;
        b=TRltRfh92NIXUZ44dhCS3MbscKaTxIqaY6sKt7HJZ5/he5fUjKkTrATkRJV07h//dC
         YdWvqTyGVmEyyY0Si4bQIPYJqYp7q5yNJxQXVbzqRw5HITp+2pkJ2NqUwxRzBEAk3nFo
         +HAwh33flx3v0RA7VIURGJh6KHl7+MoblG58c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499556; x=1793104356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+9M+CtaBYEWsWQuLDC/Q7MRJcTSKHssas7vgtMaEmo=;
        b=nzuYa1YcdrDh9k0kIqf5Klsxw9Of6r2uZg1fXOhMpycI+UIKobAqhmbrfQyKcDc3w7
         zDYFrFuf2Ij9aVz6VEUGXJlG7vxboQcH1gUCeawo4cg3vVjdtc5QCr9R9+wf5/SmI/S5
         QdyoDSfqbfpNV0wWDdwRxIik12DJC+GWL/9enrUr6wxp5bMfyXhDIUejPQoUgLHyUO6p
         AyYmhzG7/fWsbbpOH+8HpqTs19hLJnwn0XBC0E1/mzWvJPjYPFrK4cLxjX6Ud8izuR4a
         PiWWJ5q2Yo/SJwgwvuC6zgEaXTEBMTZJQdZ+BrXeozj50Of+j2G2eaF6FSqS5uc4xY7J
         ZkAQ==
X-Gm-Message-State: AFq9FYKId3SoxoYGzdmQ0pOLy/rPDa3R97K5tJaZG+PK0amRLs7sRVhd
	aXexzIT/qxjAFbE2e/RgJ/2FQ3nGz2HAW5D1UuNA1jUI+qihtmwzckznSVmHcfP4ZS6/LIKZMSx
	oVDFT
X-Gm-Gg: AYBFou3kWxvkcYBF853Dr8UwqRp8HY45Qod2a4rLBnCzzLUoFA44JOofw9XGIYutXTQ
	6yGO5w3C9fL5EivhLZ+K18iczWTmoTnJt63prgeYPyXKSFh5KHdSocK9DO/uHN255RvHZRRW4ZR
	bHGMeR7wjdJsjMT9LjCcuTp/Py0K0T8FDft9MkrfQMLM6jwQWGzA7+nGEGIahYs7pOcztGXN8S/
	CRO8I05/Ny4g+bEuuboZiQN65ut3WVNt8tiS8z1WqJoQFTaJxNkkq7ocrBoQHRK49VBUI36jlP4
	FetMM3clq3F1/9k1Ymq5+Ze+lN9c5+e51EDhkKZlSKDERnM6i7KzBCtIMpa43iIDDYZ4qYrRn1a
	gKN3BwQBlt7n4qcjMI9Vzn5ZdmThpIszYxqKyNbKqsab4CbSr3OEbRuNYSjdJkLmTItK4rqGQjv
	31aJ1LBmoK4NesPp3bTzx3URFlHTuE70iCi8gD5rvE2/Gj8rj01mHnFUBSBYHnyzpfXPu0yvF3Y
	zy6t3UQECHRS+wHdFEyRP2qPRA/v+q5PQES3S/AiZLBDR+1aj85bO4OOr7huLJIXfFX/3ot10aV
	Vl5G8pDUvmWTGC6vsHjfvsY=
X-Received: by 2002:a05:600c:638e:b0:4a1:e489:f8a1 with SMTP id 5b1f17b1804b1-4a1e489fa67mr150668575e9.2.1792499555881;
        Tue, 20 Oct 2026 05:32:35 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/14] python3-stdnum: Add recipe
Date: Tue, 20 Oct 2026 15:32:20 +0300
Message-ID: <20261020123226.4033600-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131166
Content-Type: text/plain; charset="utf-8"

Add a recipe for python-stdnum, a Python module to handle
standardized numbers and codes. The changelog for release 2.2
includes:

- Add modules for the following number formats:

  VÖEN (Vergi ödəyicisinin eyniləşdirmə nömrəsi, Azerbaijan
  tax number)

  Belgian OGM-VCS

  Leitweg-ID, a buyer reference or routing identifier for
  electronic invoices

  European Excise Number

  n° d'accise (French number to identify taxpayers of excise
  taxes)

  RCS (French trade registration number for commercial companies)

  NUIT (Número Único de Identificação Tributaria, Mozambique tax
  number)

  NINEA (Numéro d'Identification Nationale des Entreprises et
  Associations, Senegal tax number)

- Fix handling of decimals in Application Identifiers
- Update list of valid Chinese counties
- Mark more Romanian CNP county codes as valid
- Support Latvian personal codes issued after 2017
- Provide aliases for Estonian numbers
- Add validation of country code in BIC
- Add function to convert a French VAT number into a SIREN
- Add a function to format a French SIREN
- Add extra validation of Belgian VAT numbers
- Add support for nace revision 2.1
- Support the new Romanian ONRC format
- Support new format for Brazilian CNPJ

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-stdnum_2.2.bb              | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-stdnum_2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-stdnum_2.2.bb b/meta-python/recipes-devtools/python/python3-stdnum_2.2.bb
new file mode 100644
index 0000000000..8753a5996a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-stdnum_2.2.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Python module to handle standardized numbers and codes"
+HOMEPAGE = "https://arthurdejong.org/python-stdnum/"
+LICENSE = "LGPL-2.0-or-later AND LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+SRC_URI[sha256sum] = "e95fcfa858a703d4a40130cb3eaac133c60d8808a7f3c98efeedac968c2479b9"
+
+PYPI_PACKAGE = "python-stdnum"
+
+inherit pypi setuptools3
+
+PACKAGECONFIG[soap] = ",,,python3-zeep"
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-crypt \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-lxml \
+    python3-numbers \
+    python3-pydoc \
+    python3-requests \
+"
-- 
2.47.3

