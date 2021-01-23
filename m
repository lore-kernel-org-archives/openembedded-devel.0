Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.11407.1611429931380114360
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 11:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s3DTIr1F;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r9so1681150wro.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 11:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2hHxt+6wmaInir/ILQ/pYu3aE5tVPCKDFxVegagXKs=;
        b=s3DTIr1FaaloKBbzf1WePP0vBQH34xpw5wb34rkKsY6Y0q2igez6BMysU1eOZ2nE9d
         C8tA2ltte7R7Hisk8q2lTarLcrSeYPUQj7tr02KZq6eMT0+jphbaiMDFDvoPHtSor+C0
         wix3GNL1LBdCZ6UL7k/x+w0+rogN3XlLj1Xs0t7J+wCw/JpvmWbNHlkyZjIHCSAdlFQP
         d5Maa6FcRPLgMGQAlw6H9QF0m6IhzyYHJec+HCxHhXqKWWDRw0BkqBqaoYUJ9Z1EuGzi
         +ZK5k5HvW7E5XLpZ2KUX0klGCrtJ0jbfzkme7IoskS8dN4SqBVfzU13BCCaRVzDNDsGj
         gU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2hHxt+6wmaInir/ILQ/pYu3aE5tVPCKDFxVegagXKs=;
        b=KsniZcF+x8/rfUzmz6RxtBlXPnZ07V5AqSNFE4qSEiNL7f2VIgl4o+ywmj0RRbPNTA
         mHPHQRpnXxaXzPvWAsKClBHyKzf+aodOrVbHF7jGvnFcAqIvwtCUOnSA+GlW4TpKYM11
         DEvmteipcmLTFAJDZjYoQ6MkHbhWpRMaBhOLb31vgkfNBgC0x9TPpS60F2sXZrRTyY3A
         93YakT0+uRmlLC8dy7Z9zgsu2Hh1w03a5Y6OAxxOUvV/zsEDid0cFJZvHmCSLiaU4Zqd
         sUU8jb1hypujUwxRXDO4KtOnzAYChKhGFKHwoL/8LxHWKrGqm4KYR2ntrEj3ku1nR9Jg
         cHjg==
X-Gm-Message-State: AOAM532xFi9AtVI/1cN7vqcKcnn+NWmgrgx9WF08mfSm6uEd5kJHWDut
	vQeHuYbX1estf8SgRUO3m8VIQgsTHYrIbQ==
X-Google-Smtp-Source: ABdhPJyJtvxda7b2rKjgYfABlJ5g5YjznIQFS/7RUo6eAyERLmoK2TYJ1UocOahtBQCKu1FXUt3hxw==
X-Received: by 2002:adf:902a:: with SMTP id h39mr107362wrh.147.1611429930083;
        Sat, 23 Jan 2021 11:25:30 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f38e5532665fa05402b8466.dip0.t-ipconnect.de. [2003:f0:7f38:e553:2665:fa05:402b:8466])
        by smtp.gmail.com with ESMTPSA id n11sm19159740wra.9.2021.01.23.11.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 11:25:29 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: trevor.gamblin@windriver.com
Subject: [meta-python][PATCH 5/5] python3-typed-ast: Initial add 1.4.1
Date: Sat, 23 Jan 2021 20:25:13 +0100
Message-Id: <20210123192513.2663547-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210123192513.2663547-1-schnitzeltony@gmail.com>
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently it lives in:

* meta-microcontroller
* meta-ros-common
* meta-sca

Seems important so add it to meta-python

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../python/python3-typed-ast_1.4.1.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
new file mode 100644
index 000000000..2cc9f6c43
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Modified fork of CPython's ast module that parses `# type:` comments"
+HOMEPAGE = "https://github.com/python/typed_ast"
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=97f1494e93daf66a5df47118407a4c4f"
+
+PYPI_PACKAGE = "typed_ast"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "8c8aaad94455178e3187ab22c8b01a3837f8ee50e09cf31f1ba129eb293ec30b"
+
+BBCLASSEXTEND = "native"
-- 
2.26.2

