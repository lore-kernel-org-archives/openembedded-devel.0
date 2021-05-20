Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.9261.1621521421725449717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 07:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=LbQ78NMQ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id d11so17897499wrw.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IXo6zlnZplKLDJ53FikKETZTIHUn7H9+PTB3ElI4iJw=;
        b=LbQ78NMQ+aOT5GPdHmTIH2E6KZmx45lgD1YLb/g75XUMEQPka4BzaNvaj6cxQzshXu
         zZNg47ixAmk3dflf1FYpsb2cfMkLX+In3eWiHzH4C5sfhweBcUdyf08Rqmfk5A+ay3Uf
         rqMOUN+dv0FrwUx7xJjtOXCPHBxUS9onrjSenA3pmhphqGYXDB1GhSaAc5WjGoScLZ7M
         hsHQqVYvgKKevne0NgVMEySoZtpj9jYmkKXKn7sNageUrYKeZuFzhhbRyWjqNVtwJXss
         ID83VeMgyJJ7xganzeKfDHbCnJDwOs8ObDZW5O6DLr7aE6HhyBuBr7SfUdQYYevOJBtp
         aORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IXo6zlnZplKLDJ53FikKETZTIHUn7H9+PTB3ElI4iJw=;
        b=SPl6mXZatTDGMLyyg2PqxvQ3Oe8P/oGl4twy2EoP5BMEQ033NCgM6Jt2eAefmzw+ns
         1Hq2Jc4uuUN0uPzmIrxmQXnp42JOkzvQ+lpnV688XvJzZEe1NbkMhhbtlDH/OH/ppqnl
         GtdqO3zwfmCOulAxaDDa/uf2RQax/mRvY1/xnleZ3j8Z5Rm1bYhqXLNfFpt5D9aLbPRb
         EmJWdHF+0jckRivaeqbowAZpbLgXGBDeD2K/5dD8P+gwNcuUulMeqpmi0+v6e26WKPQD
         dbF65yoV3PYIcbXCpRwCz4ncQjDgaPlNtpPE5Ce5XzbmV9C3hxWNCpCLZgdF96TqFnKV
         3PWQ==
X-Gm-Message-State: AOAM532dhsXr5bBBT/6h1BqQKgVMIJP8aEYmjvGQOCF+UWWGQTcxZdi0
	RZ85G5wMQKl2mnZcZLyXxn9sEQ==
X-Google-Smtp-Source: ABdhPJwu6xF6nOBRMUsMSznVu/jq7/5CySH8tf8M0WJrO6pS8Mp567caUHgMVWMfeX9Hu2S3oc4rdQ==
X-Received: by 2002:a05:6000:184a:: with SMTP id c10mr4968018wri.244.1621521420167;
        Thu, 20 May 2021 07:37:00 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id q62sm3074618wma.42.2021.05.20.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:36:59 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-asyncio-glib: new package
Date: Thu, 20 May 2021 16:36:54 +0200
Message-Id: <20210520143654.1258-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for asyncio-glib - an interface between asyncio and the
GLib event loop for Python.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../python/python3-asyncio-glib_0.1.bb                | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0418b5930..d3f98dedb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -38,6 +38,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-astroid \
     python3-asttokens \
     python3-async-timeout \
+    python3-asyncio-glib \
     python3-attr \
     python3-autobahn \
     python3-automat \
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
new file mode 100644
index 000000000..72da6081a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "An implementation of the Python 3 asyncio event loop on top of GLib"
+AUTHOR = "James Henstridge"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+inherit setuptools3 pypi
+
+SRC_URI[md5sum] = "60153055e76ceaacdfbaeafb03d61dd9"
+SRC_URI[sha256sum] = "fe3ceb2ba5f541330c07ca1bd7ae792468d625bad1acf5354a3a7a0b9fd87521"
+
+RDEPENDS_${PN} += "python3-asyncio python3-pygobject"
-- 
2.30.1

