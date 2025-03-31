Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18939C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.3924.1743454882757718705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0O4clsw;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so9128238a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454881; x=1744059681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf5aOjoPwOW6LmtZgp2VxfuS7SgHeHwy+vgC+kPG5lk=;
        b=E0O4clswqidTT5CQd2Y5CbSdKUtbRl0cAHFjLiFjnf8ETyQaqH6VlXfU6+Rh7sw7Ij
         roNKt+QpIcePg+ZEbwRd5o5dXwYIBlVMGXYs8naUiCwqELVHHZZGexX8Yq+0p+KpXWJF
         GGGUb/iGfAVaoMBEFRKEFM2+Fgb9b3bEEpTevHUPf6U0ru8nlIo2ZlqXbgMVQ9mfRyV2
         2wxsRMwRoIXL5/hFoyJuaOHLI5c8UIQq5WkhjvZeMTeslprjjJh1t883Us1xH6CnT01E
         KIpdLcuKOqzcDVFBq9MDCyTkjl0kg5yKN9YTRCbIH7dQwQcHwlD7esDjHZYk/j+xwe4W
         tPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454881; x=1744059681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mf5aOjoPwOW6LmtZgp2VxfuS7SgHeHwy+vgC+kPG5lk=;
        b=DCGLApPtcqR3ry3ieFipz0YuZl7AmSIyP4v+Ftu+JufsgpR2i4MP+N7BBNMuqV1Hl2
         1UiugfewnyleqdMJUVa0RrO32R/KGPbCXFRX9J6cK7TtZAB2wOeFqj3eW9ibb2kO7xg4
         og5Igz+qCH6qN3/nrbrVmFM+F2bxftbtEQ7ZUrpncQmnQKRTy6Wd+OFV5GX2TVxEsaJg
         Q4ox3RXuQqTXn2YM3h+kuQsLYfGwMuGiOx3LJWLE0k2p7x25nfC+wAlDBMtmztjWZ+mt
         nku1cMa7kE1aGe+zCSMHO4iunokOSiyHrcmWlYQ/8d/VnZwkngSo4Ho4Ee/qLJn4lx6c
         Vobg==
X-Gm-Message-State: AOJu0YyCKsYuuNeUP1xtgA24YhF41WcMtlJJmGllpVvubLCEmvYq5e0P
	mifoKL39YDIiVBkIWgwrFbBbD9bzUkc3QUyvqeSirqwFvpute9P7Fnnp3HYj
X-Gm-Gg: ASbGnct2JLCIaKN6W6Z+vYoP7bz4ljHdDkArwITv+I3RTDu9HrMsHqsJD1v6uAjTnQt
	X3gLCXjlrmvw7NAdG18vhWHUBLyowuMdhmRkTwRVlxa/tD3B0xN9Bq0ptznBp74rztZZR0XzZD+
	F+P60kX5Xr7I7Rvo1R2ks1vI7uJiTEvG/4IYsBPrY7e/VPlnujx/L8LAxAwvEzJIq2JkV/Vh36M
	SwmTdUCf1J+MTM/qxuV+vcaxMfIfNnZhfRIbGrQoLmSamT1WdN5WOh35kW7hUN6JnISJ3UEn2d4
	FhoPww7AHz5EUrENu9yKdchaoi3L7NqK7D3poGYSb2mSovQ=
X-Google-Smtp-Source: AGHT+IFoCs+6+lfeb394J4m22iDzTfXXQ1mPrra4WDXkFwTqh+Hab78Hy9V6yEsu7LnEMzHOP+Vq2g==
X-Received: by 2002:a17:907:9721:b0:ac4:4b5:2433 with SMTP id a640c23a62f3a-ac738c1c0b6mr989016266b.41.1743454880935;
        Mon, 31 Mar 2025 14:01:20 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7192f0acesm663348466b.85.2025.03.31.14.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:20 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 09/21] python3-pyproj: Fix buildpaths QA Error
Date: Mon, 31 Mar 2025 23:00:49 +0200
Message-ID: <20250331210101.3460858-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116445

From: Khem Raj <raj.khem@gmail.com>

This error is due to absolute paths leaking into ELF files due to
-rpath option in compiler cmdline, therefore patch them out.

Apply patch [1] from Debian

[1] https://sources.debian.org/data/main/p/python-pyproj/3.6.1-4/debian/patches/rpath.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pyproj/rpath.patch          | 18 ++++++++++++++++++
 .../python/python3-pyproj_3.6.1.bb             |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyproj/rpath.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch b/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
new file mode 100644
index 0000000000..347996a808
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
@@ -0,0 +1,18 @@
+Description: Don't set RPATH in libraries.
+Author: Bas Couwenberg <sebastic@debian.org>
+Forwarded: not-needed
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/setup.py
++++ b/setup.py
+@@ -194,9 +194,6 @@ def get_extension_modules():
+     ext_options = {
+         "include_dirs": include_dirs,
+         "library_dirs": library_dirs,
+-        "runtime_library_dirs": (
+-            library_dirs if os.name != "nt" and sys.platform != "cygwin" else None
+-        ),
+         "libraries": get_libraries(library_dirs),
+     }
+     # setup cythonized modules
diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
index a4121c3934..681678306f 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
@@ -8,6 +8,8 @@ PYPI_PACKAGE = "pyproj"
 
 inherit pypi setuptools3
 
+SRC_URI += "file://rpath.patch"
+
 SRC_URI[sha256sum] = "44aa7c704c2b7d8fb3d483bbf75af6cb2350d30a63b144279a09b75fead501bf"
 
 RDEPENDS:${PN} = " \

