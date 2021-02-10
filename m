Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.12181.1612990559150083191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GIoBqmJs;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id y134so3142073wmd.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7W9n3uqbs25RtoOnrHyJohSexjPtN1lPJcdF0w3+HZU=;
        b=GIoBqmJsuyGstfAaxi4ObD8+zfkPxCTVmL/f5LXDyDGLjx2VEklqABHKoRW1hdAiv6
         ioT/AMCbsmLKxVZKe3zb7HwZKvwE6BhejxHMcZXVpOGqT/5VDV6yGZXAxb9KzarXBlEL
         4C1+rEtdNhgto6Rv95aC8ooZUkHyGejwKJrsZNUCdsCnBpaC11suB8w2CdZVUEbzUCDT
         8b92rIA//lLw4UMKw31f3oDAjxcERubVpkW4pm26os5v0c/WY3wIABlbfJkIRgPGuoI4
         yBe2o2XKU/b2+4GDGYEV9CYohzbj6xCklPAORqrj9biBNhX2LS32xMDHnhtWeZHdyhzy
         Ni+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7W9n3uqbs25RtoOnrHyJohSexjPtN1lPJcdF0w3+HZU=;
        b=OOGftv+OLeqQRyCVBMPepDs5LwnLsCTl0osoufxa+MI1lxpnQedf9tJZNm3GbudofO
         CzgWKcKhn2zUftRXStNKbvArVw8fiB8AFXIcqy51GP8eAmto14ePB8vQ2E5wlS9LYVUR
         nbI9irna9ruaRlTWbOe/LCp0bMbWEELfLHYDOE/TOPXNxA3FOIg9k1wo2LIE8APh/SwH
         +MNPIItNeaRWnZTmxuH/n0lnflSPlS9K4CRe4+uYRakroSZRoYlQQKo/YJ03OdVfbg5O
         Dd1GLQluFHrMeSCWC4JTxwpWdl2TCEtGWnHRM8C1n4yKTRMajp7tz5R0FGODSToPXqJt
         zTuw==
X-Gm-Message-State: AOAM530RDP5jEZkeLerBxlzJ9SfdH1tPN3oO+uXL8mTYOiwwf93dopK4
	3uYblE+hKVoONSgo8mbdHe5kAeUqSOE=
X-Google-Smtp-Source: ABdhPJx6bQ3vtpkr6mePFQDgpr4toVuA3XTCAExtqFCPHyqWtO0blIDQe83jfGS4VMjTq5MVM9sZjg==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr850081wmk.163.1612990557691;
        Wed, 10 Feb 2021 12:55:57 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:57 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/13] glibmm4: Initial add 2.68.0
Date: Wed, 10 Feb 2021 21:55:34 +0100
Message-Id: <20210210205538.690009-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-core/glib-2.0/glibmm4_2.68.0.bb   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb
new file mode 100644
index 000000000..33f0645b7
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "C++ bindings for the glib library"
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+BPN = "glibmm"
+
+inherit gnomebase
+
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+
+SRC_URI += "file://remove-examples.patch"
+SRC_URI[archive.sha256sum] = "c1f38573191dceed85a05600888cf4cf4695941f339715bd67d51c2416f4f375"
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.68/include/ ${libdir}/glibmm-2.68/proc/ ${libdir}/giomm-2.68/include/"
+
+RDEPENDS_${PN}-dev = "perl"
-- 
2.26.2

