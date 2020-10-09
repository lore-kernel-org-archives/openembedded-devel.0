Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.5230.1602213349470774569
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 20:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oGXOAT0g;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id w21so5660313pfc.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=4YeU7cBPmgopvsJVKaIQhRjienlvoztxBZhB15HbB8o=;
        b=oGXOAT0gTO7dtMkQn1Cvvoi+uCcS0vr1Kr4Whu3+rpCzoKzYqIsWJ5uC1znddq/LFv
         COXMIjcePUkcV9HKK5PzmS7OHSRsC7ieCWBY6j/w+mILBreY8+KcUn13a73lX6imrgH2
         5L0ksHBoF8ILWGIzg/H7xCc1HgOX6xduYOBQ7LLQ5Cbya7/jXx/IpE52FX+PY2lf84DA
         Pe6/E4fV18tTIjeUDlnVPZ+B2Vihk6QFxeIr36BBj73A3CRvjRP1xVpK7Q1zf3D0U9Fn
         IkZ3yNlK8xc5WvSbgliKVPKoJuPbvJQBjGmJHbbh5R9CglsWr1txvV+4tR/4yK+cZmj+
         1+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=4YeU7cBPmgopvsJVKaIQhRjienlvoztxBZhB15HbB8o=;
        b=WM+8+jjuCrLJi2TrPrw/IMxe9ddD5EXxq0hIWLmI+YJLWd9Z4GuNu8Uayi2VQOhVvg
         6dNLY9G0OuaWoTLIUp7Iz9sndGxNwKIJUnp1DWl70YGkPKVd5NCTPfNwQUI46MkTNVHM
         9q8rhJ0cZcRPM/kLyNl0vRtkUD90sGQczCs9ObaLjg1ILJ8WkImjnW21K5hN8Am7W81d
         e5ePfdItni7eFONvokGa7GBwSO04zvmd7z9oKqrPt9UXtfTirJdQbr8yA6dsbbPD6W7O
         JfMYXaTdIhZXIefZqVVbxD8+JlYgXhb0DyKWu3qEiT/gcz7LFXODGHry/RegxouQtpzA
         Eycw==
X-Gm-Message-State: AOAM532AQHNLwjhGAneUmVPQxAqSnKbmshv9WQk6JA/yWEBSKbsPGgo9
	hioaaaRNYpbIlNKwTBfOm3yXoi1HeXw=
X-Google-Smtp-Source: ABdhPJw4q9LSVnDtVeHR6mtumkltnbEyNVx20UPdHvyRFrVpdas9lYF4A/qqsvCHbYdrHDvxOUzpxA==
X-Received: by 2002:a17:90a:bd0e:: with SMTP id y14mr2275224pjr.58.1602213348531;
        Thu, 08 Oct 2020 20:15:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id m13sm9116105pjl.45.2020.10.08.20.15.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 20:15:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH] musl-nscd: add package
Date: Thu,  8 Oct 2020 20:15:46 -0700
Message-Id: <20201009031546.17121-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
V2]
Drop INSANE.
The DEBUG flag is either -g or -s. Remove -s from LDFLAGS_AUTO
---
 .../recipes-devtools/musl/musl-nscd_git.bb    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd_git.bb

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
new file mode 100644
index 0000000000..374f944096
--- /dev/null
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -0,0 +1,37 @@
+# Copyright (C) 2020 Armin Kuster <akuster808@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Musl-nscd is an implementation of the NSCD protocol, suitable for use with musl and with standard NSS modules"
+HOMEPAGE = "https://github.com/pikhq/musl-nscd"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
+SECTION = "utils"
+
+PV = "1.0.2"
+
+CFLAGS += "-fcommon"
+
+SRCREV = "8f278675e1b6a3a02c8ee1b8ca000f80570dc5d6"
+SRC_URI = "git://github.com/pikhq/musl-nscd"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+inherit autotools-brokensep
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+    # no debug set -s flag
+    sed -i -e 's/LDFLAGS_AUTO=-s/LDFLAGS_AUTO=/' ${S}/configure
+    ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    make DESTDIR=${D} install
+}
+
+COMPATIBLE_HOST = ".*-musl.*"
-- 
2.17.1

