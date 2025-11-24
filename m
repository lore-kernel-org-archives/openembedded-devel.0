Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FF1CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 11:53:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15097.1763985186023753098
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 03:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NbJ/i5ql;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so27054865e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 03:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763985184; x=1764589984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ejrdun830zT/UOCrRLwFBBRZc2gNAD76rBzfAd/bu4=;
        b=NbJ/i5qlDy6BUqVHU1QlpW3s3K0Rl7sQ9K7sdIGi+6q5oqVha4xvX37vN4qynLOf2f
         9boWTcSgPqEBhJ/ru6XARumxtG0LlAUfPClx0jtEUICr4wT7H7ItaDejjoogIXM1BmnX
         J1D5gtbtsx6qRAejKvcTsNFx39BeCcDfZ2CRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763985184; x=1764589984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ejrdun830zT/UOCrRLwFBBRZc2gNAD76rBzfAd/bu4=;
        b=EQ38MRW1fRmpnj3N3P0Gyk3+6ULXSTf2hCminmlnMauXi3WCEU7qO7nrcbGVx8Ib0A
         /aAnqN80oq04B3z672KP5uqhaKVnBWCKhUfQkeqFKV2eTQh/Pm/aN2l0WMgjKZbZvM/a
         LDM4dV+Iu8Yzzpd6WL5jbiAa3dLc3duCM8Pxi8WhsCVS4+rTdmXu3gK+eyRB+jKj3HTx
         W9xsx8/5zZ6sKLAaEEiwB7lwdA2/szzKhZDp3zmdPfs/NCmh7Teiam3g81qsjgJ5fwOr
         TTqfefVVl+At9wOOgzD3pr31OiB21YKlNjWmU6mP6iCHWndhnv3Q/MR9FkXKYsWeQHJe
         n7TQ==
X-Gm-Message-State: AOJu0YzcN4edchHssfXvdIKT5Xper5/+oVPVG1UQOGW5tN+ob+aTDtYx
	dgnAdh0ikTXTUtB35vlJPV/HLAFShzfjzfZnkVWtIut3XwxcgY7Y5psiChb3ZBNp1emZXRBzYZq
	d/DAt
X-Gm-Gg: ASbGncs5nDzQfsIc+2x143RKTf34D6qw5Wl03QzSCvgQwEWcKMqm7FSG80airoYWm3K
	OT0mHT0GpgWnhT6ETEbxZRcmz+6Orkx+5TnViZ2nrha2+6IN0/mEqa9dMiRzajzO/IwQIxvXip/
	sUvyYi77RpPlOB3QlZu+8yo1kjRN9QyN9FxzIM4FfgBZfsVgry8ISP8oxiKYxcwrZ7GyoK0DFom
	DsgQY+tyKIdGpFHT3HG+1R3nmYGizLEwiql/xSDQvaf67KgzAgizLPEO8TlUNEUtLo9btVeFwBv
	cBuJsaxSg7LU8OJjUik0vAooc3g1NcA9Xk3w3ZMg8u9NLKRxvlmk5hs/NMD2oIYZe8UZULh1koh
	orHughiQf+F/2kvSKmBHXlEesYuUcQFpulggaZe2q07VPvwldJpuUIy88zPWwsZxfoVq6wchYvM
	7HPsLvXFdMW3hG2i9Ejs7gqI80fM9rQIGbbmg=
X-Google-Smtp-Source: AGHT+IG6HRQ/pS4XPAqg9C8J180w197kDlKk8np7aegsXmUqIongurFqajcg6Xn0Bjn1ewBSulrm0Q==
X-Received: by 2002:a05:600c:4685:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-477c10c84eamr112175485e9.7.1763985183853;
        Mon, 24 Nov 2025 03:53:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3b4fafsm195964165e9.14.2025.11.24.03.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:53:03 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pikepdf: Add recipe
Date: Mon, 24 Nov 2025 13:52:58 +0200
Message-ID: <20251124115258.3337453-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251124115258.3337453-1-leon.anavi@konsulko.com>
References: <20251124115258.3337453-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 11:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122008

Add recipe for v10.0.2:

- Fixed presentation of strings using unparse_content_stream -
  if the stream can be represented using PdfDocEncoding, it is
  rendered in that way for ease of reading.
- Reformatted C++ source.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pikepdf_10.0.2.bb          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
new file mode 100644
index 0000000000..4821e273d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Read and write PDFs with Python, powered by qpdf"
+HOMEPAGE = "https://github.com/pikepdf/pikepdf"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
+
+SRC_URI[sha256sum] = "7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1c423a52"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "pikepdf"
+
+DEPENDS += " \
+	python3-pybind11-native \
+	qpdf \
+"
+
+RDEPENDS:${PN} += " \
+	python3-pillow \
+	python3-lxml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


