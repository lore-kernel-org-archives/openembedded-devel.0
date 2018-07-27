Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D8FEC78CD8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:45:56 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b66-v6so3937784qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lmU8EHEBYIsr0Hnk9hYluCy79a40gi7gKVTEJyE830Q=;
	b=hqnPWjW0eW6K1HIrHxB07+80Y6j1ccJKuDwrgwbTmnqtGjCrEe+IZY3HJB/pf3vBgs
	6fctwhH2vLwBSZXRmfJ47sR7WKqkbfGpOXJiR2fNNW6HNOgOmijexXZYnPWUTES8mOmV
	SxbU0FR0zQpDzeFMaFtHAE2spEEkJKSLYdIVyZ6p11UESm5qe4TS6IsfKkXc0tmuU1nK
	yM5DKjsBmIE9OsMVQXM1NsihJcVSEmEkr/XokXVsyMPIM7XjmG+KkpV5bSsH6CLBkA/2
	hGOV4wjL8hkb47rA5htGEPY3zCXgnLPz41FCc3xhCpvOXqXNLyXRN/Yj1SczKKXWG3eL
	MpJg==
X-Gm-Message-State: AOUpUlHNbACfZaxHFrT7Wb97wUJxACJEQfH4T8Y5hJxQRByGXnOPHJS8
	A8PQGT5N2ifYO6LnFSbcedc4GZHiL4w=
X-Google-Smtp-Source: AAOMgpf7XoDgpAVas5YX1jUjk8b0wkWu6FYwjZ7wItgNR71NJvfhI6Vsm0LJJ1ggMAT9p/GsPxjblQ==
X-Received: by 2002:a37:1701:: with SMTP id
	i1-v6mr7137731qkh.201.1532717157505; 
	Fri, 27 Jul 2018 11:45:57 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm4226466qkh.60.2018.07.27.11.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:45:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:45:48 -0400
Message-Id: <1532717148-965-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-greenlet: update to version 0.4.14
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
X-List-Received-Date: Fri, 27 Jul 2018 18:45:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
 .../python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb}   | 0
 .../python/{python3-greenlet_0.4.13.bb => python3-greenlet_0.4.14.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.13.bb => python3-greenlet_0.4.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
index 7a42240..fcd81f6 100644
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
+++ b/meta-python/recipes-devtools/python/python-greenlet.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "6e0b9dd5385f81d478451ec8ed1d62b3"
-SRC_URI[sha256sum] = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"
+SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
+SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.13.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.13.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.14.bb
-- 
2.7.4


