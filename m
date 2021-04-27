Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.8852.1619532015043300830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 07:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=B+YFEB+7;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id l2so7247032wrm.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Apr 2021 07:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBs2WFRkJIB1+KJsHmquWGR9T2eA1DGCzUvM1+vP43Q=;
        b=B+YFEB+7OouilCQiqgsFWY3xKXLxaUT12MiFBSv2CJ+GRrAwaE68d9JjzqxJKtIX2V
         Y7qWtNTsFIg8KF2H47gCGmI7rMPCPZBNht+Ud+uf1AGVEGptUJ3qUbhKmsqciSlk+D47
         yKUeZTImw7heaMho1cfHvPZEdy5XTIMg2cB1Y3NwxIMdVwnTxwJABl76hHSBgpft5CQG
         he6pfqZuFo5Gjc7jfDwddWxwJUvgam8xFqSS5ejCJIxohGGf0MwtkBDDXhWSeqTgm15k
         soRlZP6hsbaS+mwAHvUdRNCZw4tyKf9rxOqkrG6QBz0iapkkVK12tRtM7WPNX4VTcznX
         HdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBs2WFRkJIB1+KJsHmquWGR9T2eA1DGCzUvM1+vP43Q=;
        b=idCUC3dYW7Wpozs95hGTsC5tzax7iikkbnN66H94BuS1OCY6rHjkJXLN+ZEBZc6HEo
         tq3VXUf7H7Bbj+CD7zw35nSwvwUZRobSKjW/irNHzCeipT2A2voJCUPD8dXRj1iFviMF
         3uLgbaBlFm0wUvTTrPQLsOsYXa+SMVFjMY/j6Sc79s3wQjG5qcz5P1EUdKpJGBOQkq2y
         d0OhSAX3QN7JuXMziEFtpusSvQQ9sOm79bKyJNh1fAULd+HkfEESF76Tvk9A58YUoo9d
         jEg14uzj+4yf8cKX6PY2Cs3FPYO5+UTW3J5pu6a8xSQHY9XG3S4RyrHBDcWD7awY6mqh
         D5Aw==
X-Gm-Message-State: AOAM5337fENSe6Uhnljxa6hC7zvCVw4zLyPPM/DjLCNl7EpUiK68z+1l
	3DTEE1OR5QocB4gYeshsjAtdtQ==
X-Google-Smtp-Source: ABdhPJxgR2QonBGwx36P9SrBaGt7CbcutVBby+3EfhwAor3JA1d5kVAoiXHS/XL4OEVKRwCHprWNAw==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr5962359wrw.355.1619532013580;
        Tue, 27 Apr 2021 07:00:13 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id t2sm2950066wmg.38.2021.04.27.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 07:00:13 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-txsockjs: new package
Date: Tue, 27 Apr 2021 16:00:09 +0200
Message-Id: <20210427140009.10771-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This adds twisted python support for SockJS.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../0001-setup-fix-syntax-error.patch         | 27 +++++++++++++++++++
 .../python/python3-txsockjs_1.2.2.bb          | 15 +++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-txsockjs/00=
01-setup-fix-syntax-error.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-txsockjs_1.=
2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-txsockjs/0001-setu=
p-fix-syntax-error.patch b/meta-python/recipes-devtools/python/python3-txso=
ckjs/0001-setup-fix-syntax-error.patch
new file mode 100644
index 000000000..f5de64221
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-s=
yntax-error.patch
@@ -0,0 +1,27 @@
+From 7b6323f467dc4f2ff4421350ac5fbf3a73c66764 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Tue, 27 Apr 2021 14:20:41 +0200
+Subject: [PATCH] setup: fix syntax error
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+Upstream-Status: Inappropriate [Project's github has been removed :(]
+
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index d67320e..13ac3c5 100644
+--- a/setup.py
++++ b/setup.py
+@@ -70,6 +70,6 @@ setup(
+ try:=0D
+     from twisted.plugin import IPlugin, getPlugins=0D
+     list(getPlugins(IPlugin))=0D
+-except Exception, e:=0D
++except Exception as e:=0D
+     log.warn("*** Failed to update Twisted plugin cache. ***")=0D
+     log.warn(str(e))=0D
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb =
b/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
new file mode 100644
index 000000000..e5a86e013
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "A simple library for adding SockJS support to your twisted ap=
plication."
+AUTHOR =3D "Christopher Gamble"
+HOMEPAGE =3D "https://pypi.org/project/txsockjs/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc62063068876fa826aa4fb6db49fdf7=
a"
+
+SRC_URI +=3D "file://0001-setup-fix-syntax-error.patch"
+
+SRC_URI[md5sum] =3D "fcdd3f68021abc6034223b5b36f43128"
+SRC_URI[sha256sum] =3D "759f5571e276e70c1ad20919d27cf2e8eef8751594892bd107=
d6e88dce4a5db9"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-twisted"
--=20
2.30.1

