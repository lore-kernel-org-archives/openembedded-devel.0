Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEB7D767CF
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.12749.1730382091128425930
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X69n0HkS;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso1185600a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382089; x=1730986889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZZLhrPSoqVFPXwNjlpv4rlHsZOH1W7fxHMSHojtKdE=;
        b=X69n0HkSBng/A4w7ZvHHblF31NoCTLolNSjpTleOoJghkJfcu39uYlE4wIjgMuypHG
         qT6DnWfDzpbHtG9vVhhnBQSgXEMEFc0IwYq92SyBsYLXanVb8nEaJdc/kS9JabQVhjye
         XKEPf9BLQXWO0ZT4sKa4qUJZz7WtWjIKyJi47skANm4AKAYuVSen8lqsIfkadaM4OK2Y
         8bLNC227u5U7jRjJ/09pboSAQ/bn5TM17cUFtW811WS9Mm5eRvlcdxSuidqBwJL+tjlA
         5Jis7ZA4lkaiWc8Yxhcc04bBqrc1Tv4RF2LrK9tsssEu67tR7qUzXRm1ZJrdwyCNikNa
         KHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382089; x=1730986889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZZLhrPSoqVFPXwNjlpv4rlHsZOH1W7fxHMSHojtKdE=;
        b=WkEdat+G+2G+5Sqsz6F53kkTvi0lNAKjiNZJwUyFFJjhDFo7VG05FxcnJV9OtXWpwO
         Nwmrt5neF2wp7MJrp9KLtr5cEmZAxuuh2p5JbKkiiI9m2pm90eF5I1DPSRcxgV5rtd5r
         MNChNz1+djXsruNyHs2AgxVpNj1UenlyZgB1270jsLbBw90O+Dcj0CgVkq7WeJHckuMS
         GCd3GBRPTz9En/7IY0CEZIW+IQd6CPoDZSVHF/0HbmT0SFJdgF2iDgG95Y5Ahudl5qjz
         /KLIg9eeHx/cmC+uT9z2oHnP7i4WKALga7YlcsPoGxLhPQ+dPAWby/YTDvPR/nBHTZyI
         2PtA==
X-Gm-Message-State: AOJu0YxVAvJ438wWRQW7GdLfar5jBtbaudR91dwTxsJY9pg+hioM1/Jk
	BIqXKo19wdBRLwmZkON84RStE4sDZYuQRia56LqtM0dwoxcx8PxhkH4tmw==
X-Google-Smtp-Source: AGHT+IFADMk8rhDETdXA24ECTqd/sc4H7hG7CL8iWC/Vr+E7z0I31laQa1Baz2Heet9NT1588FoK2g==
X-Received: by 2002:a17:907:7e92:b0:a9a:646e:d2f7 with SMTP id a640c23a62f3a-a9e3a7f42e9mr689055566b.61.1730382089359;
        Thu, 31 Oct 2024 06:41:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56699200sm69889066b.223.2024.10.31.06.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 06/11] python3-flask-xstatic: drop unnecessary FILESEXTRAPATHS and fold .inc into .bb
Date: Thu, 31 Oct 2024 14:41:09 +0100
Message-ID: <20241031134114.2791747-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113363

* python2 is long dead, kill .inc file as well

* rename python-flask-xstatic to BPN python3-flask-xstatic
  which is included in default FILESPATH

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python-flask-xstatic.inc              | 15 ---------------
 .../remove-pip-requires.patch                    |  0
 .../python/python3-flask-xstatic_0.0.1.bb        | 16 +++++++++++++++-
 3 files changed, 15 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic.inc
 rename meta-python/recipes-devtools/python/{python-flask-xstatic => python3-flask-xstatic}/remove-pip-requires.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic.inc b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
deleted file mode 100644
index 6fc32107f2..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-xstatic.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "XStatic support for flask"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=659968f6ebd4b70b6c3190d20b4a924c"
-
-SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381490133"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/python-flask-xstatic:"
-SRC_URI += "file://remove-pip-requires.patch"
-
-PYPI_PACKAGE = "Flask-XStatic"
-
-RDEPENDS:${PN} += "\
-    python3-flask \
-    python3-xstatic \
-    "
diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch b/meta-python/recipes-devtools/python/python3-flask-xstatic/remove-pip-requires.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
rename to meta-python/recipes-devtools/python/python3-flask-xstatic/remove-pip-requires.patch
diff --git a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
index 5412befdb5..c4cad466ad 100644
--- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
@@ -1,2 +1,16 @@
+DESCRIPTION = "XStatic support for flask"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=659968f6ebd4b70b6c3190d20b4a924c"
+
+SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381490133"
+
+SRC_URI += "file://remove-pip-requires.patch"
+
+PYPI_PACKAGE = "Flask-XStatic"
+
+RDEPENDS:${PN} += "\
+    python3-flask \
+    python3-xstatic \
+    "
+
 inherit pypi setuptools3
-require python-flask-xstatic.inc
-- 
2.47.0


