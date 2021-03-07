Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.22435.1615130547730722577
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 07:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=Wi6wk/jy;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id w7so4552221wmb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 07:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w90ku82jz5g6a0XExEhUyI+YxSpG2TXG4I0UTKxmYzA=;
        b=Wi6wk/jy4y7VsxG09nnvsMW6qAqxxtgnNqmPpxtCbOsE7mVLVf35vPyq2utf4irISA
         H6LlmFBU+K0fBpDRYFaCTFFZdepcUv+k3ADATU8uPCwzfW8Di1nbJRLTNG5rOcMER5kd
         cIF3E0FiCc7cj3pH5rbeVfUr+VB+k894MLhPwaOK1S1G+nOrorQGQi4SS+s1TcFTNELx
         v2kpRQobh3J9Q0NhtJwZG91o+wp2pA3JFy4hv9/NxEgk2kgI6vSFjohV6eUrCbIb8swP
         xPmJf8lszAErdT76RBQQ6cykh9jJX2i8QbLAQTB1Dyk1zTJ7uhImjjt2uJRac3Sd1p2m
         O/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w90ku82jz5g6a0XExEhUyI+YxSpG2TXG4I0UTKxmYzA=;
        b=Z4wwgXhV4dlSvQ0bGei+tSm/qYRKZzQSJyH/HsK49nWHTmC89HN8Bx/Fq5DDKHCjBq
         LFKl1WvjxR+hdEz3bhWruSs+GYI8/YapnYr/4ZUTlLBzjLBIrD6xAvNwnPMRvEj/Yews
         I98N9dFk0fD/Wkd4N1Jg4ySVzs539m6LaEC3S/fgFX8YT23rT5yN/i2M5Niuy55mnNIV
         9yraY2Vn7H29aLZpGQEAIXSQMd4P49ZPaAa6/HitcMcq4UeuoQmrIO3wjDac1G+n7GzZ
         z+xatPnbnige1nbfZd3joXWQUirwjh2inEWBgSLeeOPA4x2ZXcRtylVq/h+NnYsTWTAa
         iXCA==
X-Gm-Message-State: AOAM533RkqrZ2g0t1Z7X4BjuFT4n8zw5IBe0Rh/TJmEotulbI0SmwoJN
	+6ktEghoOoh57GQrbmLiP86ATg==
X-Google-Smtp-Source: ABdhPJx1zzJslQWCC/8OaTQAKbCOLkxhCpGdApgMOLUPjtDF9xHPpXiC4cb99dGNiMDooKe/ILq9xg==
X-Received: by 2002:a1c:5416:: with SMTP id i22mr18141387wmb.146.1615130546328;
        Sun, 07 Mar 2021 07:22:26 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id h20sm13160624wmb.1.2021.03.07.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 07:22:26 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-python][PATCH] python3-wpa-supplicant: new package
Date: Sun,  7 Mar 2021 16:22:24 +0100
Message-Id: <20210307152224.31148-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a recipe for python3-wpa-supplicant - a package allowing to talk to
the wpa_supplicant over dbus using a convenient python API.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 +
 .../python/python3-wpa-supplicant_0.2.bb             | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee194..c8bb2020a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -507,6 +507,7 @@ RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-uritemplate-ptest \
     python3-webcolors-ptest \
     python3-whoosh-ptest \
+    python3-wpa-supplicant \
     python3-xlrd-ptest \
     python3-xmltodict-ptest \
     python3-xxhash-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
new file mode 100644
index 000000000..a62ccb72f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python interface to the wpa_supplicant D-Bus interface"
+HOMEPAGE = "https://pypi.org/project/wpa_supplicant/"
+SECTION = "devel/python"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://README.md;beginline=171;endline=199;md5=462586bcbebd12f5d0ac443be0ed3d91"
+
+SRC_URI[md5sum] = "c21c7841f5e03ff709a0564b2e094010"
+SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045f94776"
+
+PYPI_PACKAGE = "wpa_supplicant"
+
+inherit pypi setuptools3
-- 
2.30.1

