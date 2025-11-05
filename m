Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45621CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:28:19 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21227.1762378098250459581
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NA+kKxgN;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so387332a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378096; x=1762982896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydWNDGpOD8l+7FHtfBtacIf2gqvICbSXF9h+/Ddbnm8=;
        b=NA+kKxgN0xHf1tO0vFYG57FiXuEq9a4yOzjQn5KOyj2T7wL8D51lZiHGtelDVb023j
         pXcrJzWSg4hH426AGYjWzSVeCnXDnQANlrXh2JWgzCp/zbNchVCVfiE5SjS46hBg3oCz
         Y+q3W6kLJhpJoxdkUK2jp3lzgpgygHI2s20UjsXsSm+JQ8VCQawr3Bt3bHUZbEshd3KJ
         YxhmaeFoRLdwTkLjwkhIiWyFhFke4KThjyT6qRHZ5/azTuJbkchTeqhzAFdTURXq4NE2
         v6Qb3OL8Piw4pIzu4/ECM2NCNogLcplkKW2Xs/emwqeV2ABnrjJ4JCgsh1316sujvwNw
         X47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378096; x=1762982896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydWNDGpOD8l+7FHtfBtacIf2gqvICbSXF9h+/Ddbnm8=;
        b=HfZjLUDICTdBEM8+J+aHXxbLiiKDuB3tgNDGKTE51N4tJSDjdFPow5ph9YD0NjvT4t
         HWDO4cRqqxYhn3koyRLYPGntC0/KSavdtSueHkCL2hQv2Hbiyj/KOKMo8PWX/SsCVWFe
         Fa6i9zYw6XGpOK8bj4AkCsJ0gSDMKC4+iY88VXwzVGhE6ws6/qsArG+490PbWHMZ5iFw
         yxUfs8ml/Y9lkF2jzh0K8TkpsmFfjmtsDuq/iqbq3fO0wwFGvgBJaufDCsczgdJRUn7B
         fj3s36nP6mC0iqOJbwNZK+sgBz2/bSNulB/hW6d/j8/2bivgtlieHzLjuAa2MNozEKu/
         ntuw==
X-Gm-Message-State: AOJu0YySPU9JLuwsRPQx3Cuo+PG7aaKykHNQb4wNKWfHBy9Wgt9cyFRC
	MXy82VAVLnlcFj0q25XQH+AbI7lCtPiNFCCGK40cLNwpa0fQkJ3H6ghkMm/DbpNv
X-Gm-Gg: ASbGncuJbvCkB2pTVsrkWm53UBP9P5pOmuKR2vXhqXvd4w9cT4dwiYcoYTGQ47oHwKh
	cIr+CHL0l3/ti7uomUvFVkuE1Ffi7VcI6fV+KJM5DG68OSuOopXZ+uQRaTXbjgcbl/5GMrRwdRh
	qTD35H5B5H3vG1gxBXA6DU9wB6OBcMyEdgYSD+s6siR7OoZt6AX2VcqDQ4IMtxC1HhbcTRw6Zeb
	5Gkf5fc18IhqwVIzV4oArSRbCrEE0d7YXFDgUskQ71RYpUbdBkPzW3E1VbcB5oCVAAc5PcCXMuh
	OuBG0xOknkoDFp6kv4sz9Fl/04y/Uz49SJd0IYWP2Q9BoPipqudHcAt/LfkFUW/YE7D32lZRaQi
	uEPw4yWTb6Iw8hmXzNhgaJZevLheqyb7wDoDcUzg6vWptqJpBegEEi6162WpUVTVfSkiRSfhu86
	hQbLYa+bbl8vBAizL0RqAPTTPZ73tDhuwYHUwAzf2GTfyk3lDNmII67iac8DDGPiAXHQ6huDib6
	1gebdh1K6/PZ4MiuoIP8Pmw
X-Google-Smtp-Source: AGHT+IFo1ACFO7wrfLKCSCsdDLWSLsniT634xPP1jmz4AkCAHr388s7UEUnoOpW0Pxk1lOYI+DWbKA==
X-Received: by 2002:a17:907:9721:b0:b6d:5bc1:4859 with SMTP id a640c23a62f3a-b72653cb70amr419196466b.29.1762378096280;
        Wed, 05 Nov 2025 13:28:16 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:28:15 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 7/8] new recipe: python3-pytest-picked
Date: Wed,  5 Nov 2025 22:26:34 +0100
Message-ID: <20251105212631.386242-11-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121336

Run the tests related to the unstaged files or the current branch (according to Git)

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-pytest-picked_0.5.1.bb          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
new file mode 100644
index 0000000000..5bea05a036
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Run the tests related to the changed files"
+HOMEPAGE = "https://github.com/anapaulagomes/pytest-picked"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d374a27c85c3fcc979009952ec16f1b"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "6634c4356a560a5dc3dba35471865e6eb06bbd356b56b69c540593e9d5620ded"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "pytest_picked"
+RDEPENDS:${PN} = "python3-pytest (>=3.7.0)"
+
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


