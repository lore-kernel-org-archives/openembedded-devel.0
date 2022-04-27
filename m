Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2261C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 09:49:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6201.1651052991797811849
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 02:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=msx5fSvx;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.48,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f48.google.com with SMTP id
 bi24-20020a05600c3d9800b00393ff664705so848163wmb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Htl+mzHwuviRFWkUfYSx9UkHyZveE6CMKpl1pdhVhA=;
        b=msx5fSvxgBTqLerDX+fhumNl6UtjyLBTIvpiiKFNL/ihh+cp2zIVBDTGqNix/HS8A8
         KNLUUPCnPh9SHrtradjbUbeDWMnhtnu/ovu/2GF7LwXE1Q3XS2I6lzMnQgya/I1Ga2TT
         KBZ2nO14T1Ut8t3Pah9r820GUxjsd7W1ic3TEc+vaUStcVMxQifgi2cNOK93Fb0pULop
         RX+z1pRvqMs4A5RFOshTfVjqsDBoQG2pvmVBz9NjMRZXdz/dTnUnVfTZOXZ8R4vqmcWP
         JJp8KF/RhGNz4nPHJMUdYCVyTIVZFCRQqRSNo0GHm+9oJ46eQbhSY2uKaEVmXP6oykgJ
         t+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Htl+mzHwuviRFWkUfYSx9UkHyZveE6CMKpl1pdhVhA=;
        b=eLeA21imAYw3GkEIvs1aSE+2Dx1unCeigylpw7cnfxe4LDKo37/9tcJYK6OSx2v7wh
         LPPAvoPsy4ScnfC7ZuO8wxM8X1WrM8RfMV6fdzcnZK1X805O5GyzBhOV1fMdwGrJfKRu
         ukQneihuS8mMLZuMwXjiImKhxUGqRBdrD84wXEA+/n/+EexfyBgsv3G8u8SV/eXskNYK
         cP/A1t/KBrEipvxJAALtgVlBCDzaOkVjwCdpLxjyD2Ch7mlJLNaRy4kCR7dkvi2uokka
         SJA4KJletwtBBlGiFpSAO2PWMjwAxFCv7BZ1tndQh/banW65XmiFQHjRxwhpng1SoHvC
         e+Cw==
X-Gm-Message-State: AOAM533rTR9eJyZx2APEygtngyYoerkVBRYKyByHF6btC8556iy0qMUv
	8Rv/xyvVxq4y4pExLWfHf0pwLw==
X-Google-Smtp-Source: 
 ABdhPJygu1pcoHZwdHjBvtZvoo5UhbIqUHqItPEhYA6Eb+A1lxrnbl6idoDANgu188G5POz2Mas0NQ==
X-Received: by 2002:a05:600c:240a:b0:394:18b:d722 with SMTP id
 10-20020a05600c240a00b00394018bd722mr2488173wmp.177.1651052989742;
        Wed, 27 Apr 2022 02:49:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3abd:445f:8c08:579d])
        by smtp.gmail.com with ESMTPSA id
 g25-20020adfa599000000b0020aeb9e5bdfsm1845968wrc.43.2022.04.27.02.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 02:49:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-pyfanotify: new package
Date: Wed, 27 Apr 2022 11:49:48 +0200
Message-Id: <20220427094948.834984-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Apr 2022 09:49:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96811

This adds a recipe for pyfanotify - a python wrapper around linux'
fanotify interface.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb   |  1 +
 .../python/python3-pyfanotify_0.1.3.bb          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f7bf36519..d2d9dcd18 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -300,6 +300,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pydicti \
     python3-pyephem \
     python3-pyexpect \
+    python3-pyfanotify \
     python3-pyfirmata \
     python3-pyflakes \
     python3-pyhamcrest \
diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
new file mode 100644
index 000000000..7458fec43
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python wrapper for Linux fanotify."
+HOMEPAGE = "https://github.com/baskiton/pyfanotify"
+AUTHOR = "Alexander Baskikh"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
+
+SRC_URI[sha256sum] = "0efa73922fd705b4e8f8f0b51cb88198ceef66cc309e1de21674ef44c879029d"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-crypt \
+    python3-datetime \
+    python3-logging \
+    python3-multiprocessing \
+"
-- 
2.32.0


