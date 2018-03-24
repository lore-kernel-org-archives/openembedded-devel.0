Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id F1D0B7885D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:37:42 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s2so15388239qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 06:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QkpM9PU9H0OL+i0/zzY5DnEnbapPKraHcFmzwS5cbh0=;
	b=ClU50MqvLhBu9HTkklgGTjfSIcTwuyEV1WvuCevkc9hhZ45sEqL8rS6KFDy1pKGQtv
	56hxR+H5QkqCQHZI1oOwBCUOeJ+h16DVMbnIePi0WM0Q38f52DCOsXeePmgyyB5PyPhD
	Y6GkHmPuQOoEv8YyHR9G1vNz5VCPpW0gczb1vnlGg6N+doILamBEOSIKllfEMMWSZiUx
	8YXsRtxaM4i5RZ/zf/F3rK0HLrTLZs4ZHJOeyZRO1qSuxdmsrrlWynGSB4b6tpCIGopd
	fB7trgIKX8now6kIvJ2uFhzf5dpfCUHV3EUiPxnUtOiUv7axnWFntjYMokDBBoOAFs5q
	Wutw==
X-Gm-Message-State: AElRT7HrlP7+mqt+gnNVLVGBxN9QWwWZj4paXHfMQNePWQZucKrIO3/u
	6BZu/Z1DjL3cpX3AIEacF38c+Akd
X-Google-Smtp-Source: AIpwx49v0MFNa54nCACMyGjkowURyeDizTl20XZaWdqOIiYiy0HOYf3gJhIwcgoVgMLkh4++MZhnig==
X-Received: by 10.200.20.21 with SMTP id k21mr5433519qtj.208.1521898663257;
	Sat, 24 Mar 2018 06:37:43 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n31sm8449642qtf.40.2018.03.24.06.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 06:37:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 09:37:31 -0400
Message-Id: <1521898651-18932-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyroute2: update to version 0.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Mar 2018 13:37:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyroute2.inc               | 4 ++--
 .../python/{python-pyroute2_0.4.21.bb => python-pyroute2_0.5.0.bb}    | 0
 .../python/{python3-pyroute2_0.4.21.bb => python3-pyroute2_0.5.0.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyroute2_0.4.21.bb => python-pyroute2_0.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.4.21.bb => python3-pyroute2_0.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index 9ec9866..4c93ed4 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
-SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d00560ed9910203e93f107833b6e8d151171"
+SRC_URI[md5sum] = "9060ae8bfad457671fc3b68450175d93"
+SRC_URI[sha256sum] = "bb02fe5a02fb4e8baad4d7ccf7ba5e748044ee0a1ad7d2fa4927f68f396863c4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
 
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
rename to meta-python/recipes-devtools/python/python-pyroute2_0.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.0.bb
-- 
2.7.4


