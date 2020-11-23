Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.31130.1606112687463957422
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 22:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iGui6wIs;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id c66so13961364pfa.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 22:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2uRVP3wfVsxffBcNl0PQDm7w7gbGIhypTMJaESl7fwY=;
        b=iGui6wIspCPe9bXpavL3ePwIDKAdTUaUldAo4W9ZjJIXaC6ZwxFnqiT5+4NLbckQFE
         ZtRaRCok52copzXYWfcNF/sTWoU7AIeTeH8YHo14fnKaufohcWH2zbfZP2In1K9pawtq
         u55gDihFXacIzIHatqF86jAedjZegYriQcW9Vv2aoyreMjpxwRrNjXSC029LzjPdx+Hw
         B4yCkufjnlwW1Dqnw7+Ml6lP29tcH+bhIOv9hIN8ny4btz2h2OFa0htCyK5jn+H+GjpZ
         xGFFM6L2SaMU0b6M053zrrgj50cQ2PGtCBNzdIE1BeeZTgBz9VfvU9C0GjxZwqu6LHOB
         lNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2uRVP3wfVsxffBcNl0PQDm7w7gbGIhypTMJaESl7fwY=;
        b=IxAcyGxmrbPU+7lzTn5+ZIbl9GhnP7x3EDXtxMhv9Vvbjk45yPVOuwEpCn9sDRArU+
         cQFZjd8+v2UvHRXshYnTcdpOS+EaFMKlrje+2FPO66UEC6dXxZSfBlRVOAZ6VVibwUjd
         XhsM/XpiR4Hv+BG23HMikXhKKmRChtXk38U1kCb7xsFcHtZAJIwgJiMbeQaXkfjvvUGK
         AnyTbmia4PrC6Jy25xWPeha6jEQLsjfv7Uz06qmrAIhBmwNlMAMmBCr5zhcU7DVBLmom
         8imbzvx5jxKRnaxZpJ3+o9sGaCEhw1BbWkAjMLihlEmS6f11KVmDmh3glDPLG/VFQUNC
         okIQ==
X-Gm-Message-State: AOAM53180MFAeyKxlsukodnag3WCA6bANTQqKoOKFwIMlLoCoUe2Ql19
	z3S+/RsyUqH7bcgdgJvJFm2fvaHLavyAFg==
X-Google-Smtp-Source: ABdhPJy3XOkI7lPfsP6V5+dGXhzQq1iekKfbL6X/l0N6lm4SQx0EKCnhADDhC95yAoAZAwLEhAoVNA==
X-Received: by 2002:a65:64cc:: with SMTP id t12mr18380700pgv.126.1606112686809;
        Sun, 22 Nov 2020 22:24:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id gx24sm12110239pjb.38.2020.11.22.22.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:24:46 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-sortedcontainers: Add recipe
Date: Sun, 22 Nov 2020 22:24:41 -0800
Message-Id: <20201123062441.2998158-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123062441.2998158-1-raj.khem@gmail.com>
References: <20201123062441.2998158-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its needed by python3-numpy pytests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
new file mode 100644
index 0000000000..6060c03723
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
+HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

