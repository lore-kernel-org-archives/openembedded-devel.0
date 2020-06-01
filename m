Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.48785.1591047962770350941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jmmN48XL;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id q11so1330588wrp.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ICDy0umBr+S6W1Mr2Mq5XybOJS8fsMTA2cxebaATq54=;
        b=jmmN48XLmhuM3THR0p4zyO9W12OwIrlBUbkpG2gwKNtHf7i3shBsd8UqtMDPXGO4xC
         59asU30vl/V7Q+q/e2mQPbUAzCB0R7MeVLQ3blhbDbq4/7KE9PlcKmEH45cABMISbAZv
         jqqvO8Zy1cTwzVZXuQqVxFWKqKekHAl9T/cRC97faQlf6cPtbe+b9M7FmhMZo4b3teql
         hkNQgCO3nl/B+UR4cJ2Eoz5iErrY0Jicc3uHtnKOtRH6FEuVFjGu1meN8HrfPigmUEDk
         tibUAwKyi3Jt001ePsKYaE8LkqpyIKeNe2G9sAc+rg17ArkKl81rLAIv3GpHS5SDVhGL
         5aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ICDy0umBr+S6W1Mr2Mq5XybOJS8fsMTA2cxebaATq54=;
        b=Bnl4iOrABX2BJCYrJaWjwsfEMF6HcRmx67+TW8GL95lY35VQ3TuO3V2CWJ0hXeZQdJ
         A5M947xnbUrGytFxNKWn20C/IX84AAhMnFMv2FQuOuNfmSZzgUWGZmfO3eMDBZAIxiHn
         8MyWFPfvFTF5kG5TWAGvLzdGmO40blIdPkwQC6jsoAVRgayUojYhnT5i15rQY5CowMqa
         SjD4c402SWpEvhmvA9C566R4JdS3om1YLWF0zlvMIXL7w9uxX+r+qVaqld/RgWM2utwF
         7m17Vb5baSQTYCL6i/b/5+zp3YZQaj+onFmYtQkyjXZL5iojQZSPVuHrJfGi79/7N8bz
         fnnA==
X-Gm-Message-State: AOAM533aql+hKeR6GPjQg8P6euGcRHu2Y6WiTQJSfRHAYJ2/eIygskGA
	H4KuhzborvgcB3f/E44ol3YgvkpXl7U=
X-Google-Smtp-Source: ABdhPJzRf2XxcR0j+KQgyOaaXLxCRXcz1KsbuKWt0k7hubtjxtIag9Ty8hQHgLLmitsu+vdQ+9v+DQ==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr23764519wrs.356.1591047961129;
        Mon, 01 Jun 2020 14:46:01 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.46.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:46:00 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 34/38] graphene: initial add 1.10.0
Date: Mon,  1 Jun 2020 23:45:12 +0200
Message-Id: <20200601214516.26624-35-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was on my TODO for so long - now mutter 3.36.x depends on it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/graphene/graphene_1.10.0.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb

diff --git a/meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb b/meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb
new file mode 100644
index 000000000..f715dd23d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A thin layer of graphic data types"
+HOMEPAGE = "http://ebassi.github.io/graphene/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7d871d9e23c450c421a85bb2819f648"
+
+#DEPENDS = "gtk+3 iso-codes enchant2"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gtk-doc
+
+SRC_URI[archive.md5sum] = "07f72436bc7a85d12f5edd9fcedd0184"
+SRC_URI[archive.sha256sum] = "406d97f51dd4ca61e91f84666a00c3e976d3e667cd248b76d92fdb35ce876499"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+EXTRA_OEMESON = "-Dinstalled_tests=false"
+
+FILES_${PN} += "${libdir}/graphene-1.0"
-- 
2.21.3

