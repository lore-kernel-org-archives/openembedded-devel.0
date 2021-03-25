Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.524.1616684855019740905
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=nr0FPipg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so1356134wmf.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxCyV/4zsIr4VB8lwj8Xx5jw7dgWP81pxMQybH7lK8c=;
        b=nr0FPipgXa7sdZcpYBEfy9XSup/eZYtgJUoa7iqlpgFhcYJZgKo7GMsAXlgpU0G3Nn
         u+hGtcJlT5HOOr3BWayCD3M73fd1dCUfnchvHE6AQISwpqELNwF+52MwxMr5jXrOIyiF
         KSRglRObir1Nv21JyJtGYf2VA3i4121HNOR5YOaMB5TnV1N8zeikN/TEdrAxQfaqyUxN
         GpIjoYgGe0BACkvy6H9VMR0Hxn2Y935gs54jPYNQEgAFV/8ntI9fyZFBnO3mwkxL+0/Z
         V1KkLDNc5MXVNwHMqz8gKuDuCKYEBO1nDiCk1mN85hWsxg/bk17Y3UblqtmfCRLx8i/F
         LU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxCyV/4zsIr4VB8lwj8Xx5jw7dgWP81pxMQybH7lK8c=;
        b=OMqXqs+YBo2fpS+ryJkDYAJr/6x0mHEnNNd46hIJql9MXUFr7v39q0Sc7tWh/zMATx
         KoS9wIeK/hJANRLFTJjG7sQdPwUifT4Wmlq64BXJbk7mIMmtCHvCpgU5Hnf3id3hxQkW
         qlFqrDoYDKvSl8WvCDyVdlXitaW4XLcT5tMYUuZErizFHjJxDFscaC67Q1zvn6ZnRsuw
         KDaazXKr05jN/pb5isX8CQgNI7jtr2FcpiCCwxin1VlbxuJZrxEwMcV0KB6O1yYXGzbI
         itHYlL2WA4sQ4A+C4hcQylapHflsEQakDtgc6t5GmRJfCjHVfBfjgcUlloAfu/rw92sy
         WM8A==
X-Gm-Message-State: AOAM532mb52pQpQH4VPY1kek46CMFygODhh+JNU9/FRoNrWQyu0z77mJ
	VDzZ1VMvkv/WfbHVqyI8kr+9sg==
X-Google-Smtp-Source: ABdhPJzDUivc81aWaIgYshN8fvYoFIDu5XxvuiPf+mWJ7LHgrg31j3tmwESa7FuZ/JC+Pq8VpZ8o4g==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr8516194wmc.59.1616684853254;
        Thu, 25 Mar 2021 08:07:33 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id e17sm8108496wra.65.2021.03.25.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 08:07:33 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-docutils: new package
Date: Thu, 25 Mar 2021 16:07:28 +0100
Message-Id: <20210325150728.18134-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for python3-docutils: a modular system for processing
documentation into useful formats.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
Note: RDEPENDS_${PN} was not forgotten - this package really doesn't depend
on anything more than python3 itself.

 .../packagegroups/packagegroup-meta-python.bb          |  1 +
 .../recipes-devtools/python/python3-docutils_0.16.bb   | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.16.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 936053c69..e84bf225e 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -104,6 +104,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-djangorestframework \
     python3-dnspython \
     python3-docopt \
+    python3-docutils \
     python3-dominate \
     python3-dt-schema \
     python3-dynamic-dispatch \
diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.16.bb b/meta-python/recipes-devtools/python/python3-docutils_0.16.bb
new file mode 100644
index 000000000..44b7320cb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-docutils_0.16.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
+HOMEPAGE = "https://pypi.org/project/docutils/"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause & GPL-2.0 & Python-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+
+SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
+SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
+
+inherit pypi setuptools3
-- 
2.30.1

