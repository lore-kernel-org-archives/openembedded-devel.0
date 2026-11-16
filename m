Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33631.1794851669118459345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OvnWHvbS;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so5724011c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851668; x=1795456468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2nJVNEHikMl1HyBm58qfgrrPbn77gJg2zmnyYbYYUM=;
        b=OvnWHvbSO5U1tZ+4CxPXIgbHHRw/Bn8QwyN1lzu9qUWJ7VQ+IeCjqxsTzmUednfMhX
         /kfDz7+XFAzuSBJebBgum1keTqXf9qbgy+h7bjh5WSf0UiyiBr2buZP+hjnAvrA482KM
         SxUFW9ddtyWqMrKwSgicFjluhZkU5JhmblwGtBIPFdlLQK+IrZnmb9qvWRohbE6pdiOn
         wim2AGL+wVn13mkDVtCg4FyYLp1v3D1pDxvbbJhImclp+0BHzFi6j5gMsUPKBfTnp+WW
         9WtUGfUq1Uyf/cjRU0/EcWX0Uw++5cuszThozv5NOQa3KtxDFtv8bEnesqmHEuE+Z1fz
         Pvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851668; x=1795456468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2nJVNEHikMl1HyBm58qfgrrPbn77gJg2zmnyYbYYUM=;
        b=puWWf/lDmf6V4T9Z3bvvWfjbmtI80u3GgYG8Ul99RqONetA/dAtVKxFW9PJHxhqkuv
         zXbvpShPiJOddiZUbnZOYjXEMnkOub7kSpsyoYDfevPJFQWV4cPkw1sQBxFf8nBO+Tpg
         mGttKTsYX37CxiQbYkZVPYH9CzQpzhVPKlwv+LrzlRv0L/M6Jw54xsfRCrC7oO0QNd2v
         3DfcUBu/wZuk+5pxXNf1muwlzS3aTj99sCFeRD0dmq+Povq7ozn/qbzYjj3VtSkR+TEq
         PpmanvbS/sYohQ1S9IWvhbXuM9sbTZWf3dfVLlVHEkztNvLAu2AZrQmi2q9EcUMkz6Nh
         DkbQ==
X-Gm-Message-State: APuU4Z9K+tLYNO65IlBDFKXEBUbAD4Z1KTPW7jNhvSwkW3sOWYeRAWJH
	IwstgXCHa5KwFyIeeMYtEzG7mbog772043Jw5LypxkwHHRA0KfMk61O9XqorhP4O
X-Gm-Gg: AYBFou1ur8rgZB0jRZ9j6pYGd333tgpA6nq7krulFxuF21sBKGVUdUtU9ZvFnaqUrbs
	zpDaLTUjiojvWo00B6Mn6P0zrvyyqq7CZY8esSSrqc3UAuqxLHUjJ9saV0DQxrCCyL5lQNnWRuM
	rBLZKLN7Zh4nzKcabtxBNzPBSwDkmdlA0tnHj3e1ZpMixMKk0qtCqoTvfRYno3g4lfdXywr7aeC
	XwCFZ0ZEVk4ehU5BZHpCFFx7T/lxLkYggM6melzpQxw+XUDgqOTEQ8bMw0sNHQUyy3tDKp/GiL2
	7ELxbMFfp9A96D7a6Uu7gzrUcZGzYi3Oge5KzCYm/vnJN4dhKulQj2+XgBfc3A1jl29BUo4qcjd
	XWqHhe9d38gx+hxSBYt6Pi3uBxpffU997QijCx/r/76Qk3dUq/SHwMk0VSVIoG2oXRPixNw/lPM
	LWzrJUuP96J1cEXp99DxL3Qv9v8fm7IZm0pm0Azev2arRgH5rFj/RQTvRwnttt+85DhM6WEX4sf
	l3quKkOyujPvPevgliopcSujmK+rE0RMDPyRMc+kRHLorXKqxig3L0g98UZS/p+dJGsqLi+3WGU
	iOCY6PCGWNg2Qc4RBWw73SZKVf4XALjq75l7Y89aCU7AgIM5eYq1X/XpDw5Px2aKZRBM7OgSDTy
	U4XJuOpmUem9eBzKRln6tukEyWP7R9s/f22lmU8Gehh+kmBYuategB3P5n3Xfll/tnmH3ApP680
	FLbcjxhEbLa/bOLP6KiEhxYLxG6iTc2NWjieyrggAUGqNSjal03GaCV7BbqQ6ZBlLf1VSFe1LIG
	DZVwU5IjGSHn7BV8qgcguNUDp5ZkwEhsTknTugzckmxz7NQeH261BycH6e4XUtlGh8LuZvtBPc2
	cxxn
X-Received: by 2002:a05:693c:8855:b0:381:c15:1b60 with SMTP id 5a478bee46e88-3810c15228cmr174050eec.32.1794851668248;
        Mon, 16 Nov 2026 09:54:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 015/105] python3-cmake: upgrade 4.4.4 -> 4.4.5
Date: Mon, 16 Nov 2026 09:52:27 -0800
Message-ID: <20261116175359.342679-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132471
Content-Type: text/plain; charset="utf-8"

Changes:
- Updates the bundled CMake binaries to CMake 4.4.5 (see upstream CMake
  4.4.5 release notes); also CI runner and build Python updates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-cmake_4.4.4.bb => python3-cmake_4.4.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.4.4.bb => python3-cmake_4.4.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.4.4.bb b/meta-python/recipes-devtools/python/python3-cmake_4.4.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_4.4.4.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.4.5.bb
index 4aa0b8b208..9734b0188d 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.5.bb
@@ -10,7 +10,7 @@ DEPENDS = "ninja-native cmake-native python3-scikit-build-native python3-scikit-
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "f337d18e33b116cabae9a7a8ff423fc0bc3f389da0acefeb724e1397128dcc34"
+SRC_URI[sha256sum] = "88088f35743b423482408ec9342ade6299fd01f48f56b2066f51c624cada69a5"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
