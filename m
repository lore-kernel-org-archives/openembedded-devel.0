Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.99.1615905766152916899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 07:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=fk1cwuJz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id x13so7564918wrs.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsSaPOYF/6t8LwpV0ugK/u5n/S7AUbXFjclZ2dtEgOE=;
        b=fk1cwuJzv3Dsn+SFnhRQWLJ9jK5kgCeCKUQv8CZN52xnRqNn/1WFVRUY9VxWi5v7Sl
         PPw8iN7W8NNmQfMZvXXkQw08lkfZigMKBm3TjxcpUnVXHHSRaW/DZ0AkK0KotdSOsu+j
         1lbkCTtJFt3bkdhUfzOUy3S7ewJUwzyBKFjJWLezKL3btjld+SL8384vBfFWRvxOWGu+
         EJy/G+d3A1+hHQ+xh2YBKDU3CMi54BpEXtiBCY9yGlD2yS37AXtOyFaEgVeBdRYSinL3
         e/jv/S2Az97pfwlHD+Ra6rJnkE+DC44wY4yoibohu9QYJwSCT3uHDIZ53xAlJ+eQLRoq
         8Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsSaPOYF/6t8LwpV0ugK/u5n/S7AUbXFjclZ2dtEgOE=;
        b=fRT9c5KrMyzKbjaBIK29MI+v+IcbEJ8KRPqhqNU0iWBFFr9uU2jfoW0W+hXVEtmM9+
         EYfe83ZDVNCDuG2u6R7zyt32RD9y9NkuzO2MPwEznE0LVp5a67Eok3tLD2cbN9SMbR3U
         bIwWwt9Q3V4/Qv385qM5MEvIdATtMY6NacsdO7fpLNElztTGZg3caRhY256hIzW0tsPp
         GoEYISC/2oMbRu942CYGJDY9msvJnq5H/x1BHgjWBowE7f4VYA7tnGgZ3zN/LJXIWEIh
         l3syTE1K96Rk1+B0FdIvpjkR1aTUT1ccsLywN4QPO70GURLIUuvUyGNG+73fAXwJpnyF
         t6lA==
X-Gm-Message-State: AOAM531xdhOdmbGDSv1uARNeY/9D7YRS6AzZ8N81ETMD+d131M4xRC1Q
	ospxmhqBVguY5uwhH6la379Njg==
X-Google-Smtp-Source: ABdhPJxC1UKXHBw+OjgeXkq0Mb0LytwtcB6bStU9iYO0taA83HWYwUQMfWmc+AFY+MjiMlTcAwleyw==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr5319761wrv.194.1615905764487;
        Tue, 16 Mar 2021 07:42:44 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id q4sm3313254wma.20.2021.03.16.07.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 07:42:44 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-pythonping: new package
Date: Tue, 16 Mar 2021 15:42:42 +0100
Message-Id: <20210316144242.5951-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new recipe for pythonping - a python module allowing to send
ICMP probes.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../python/python3-pythonping_1.0.16.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
new file mode 100644
index 000000000..5affb934c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
@@ -0,0 +1,12 @@
+SUMMARY = "PythonPing is simple way to ping in Python."
+HOMEPAGE = "https://pypi.org/project/pythonping/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
+
+SRC_URI[md5sum] = "9b505ad8a5b8a6a8e57ccf75098ea364"
+SRC_URI[sha256sum] = "d025c8b25952580dea47bc241421e17a5a97f97f50098e1096dd10d845d0f156"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-io"
-- 
2.30.1

