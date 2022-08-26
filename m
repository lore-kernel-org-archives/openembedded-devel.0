Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E36BECAAD6
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 20:03:18 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.41607.1661544196481961680
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 13:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hoq7vMxb;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t5so3359415edc.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=BP1xzmuchi3X98UBd5HWxgrtA1OGUpVLERTXAUxTl9U=;
        b=Hoq7vMxblhAfBTPFl9+MvNGED2BFc5zcpLygiO4lqBbswl1nKodJLOIeM1pjxzROUj
         2P37jTzp5g+4kAuTKsIMyJCL3C1WfFDxwVLbunIYMAeCEznxvOojYTIQWB/y5+Z34i0M
         cMIFva2AQpa+1+dQZIXxiAb3Cw5F1hugygq79yUwYoKPH2VOJqkC/OE36/cgop3o3xgL
         0mbWUSZnFFSSwQQtxVUsZ7WX+Z/UfpUFGJVIEPZyZ86z7XFZ+oIyGP0P2O29ouUO8vBr
         06ZYA/oT+qj2i9HilThfOdEGc9mzRCwY+csQ9pFqQHwhMacH98lBWxxYMymJ8LUyqczn
         egGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=BP1xzmuchi3X98UBd5HWxgrtA1OGUpVLERTXAUxTl9U=;
        b=gcaGZgudJf9ZXHkE76tQ/hUlRhpjBd0Xe1IAp/FJ5agnE7j3ABQQKB+WkVQGyZ5r1N
         1HYQ6GQNcjB1GjOlIZ0AukDmvFyEJuMiiA/HKJXiq5Y3a4Gu7TCkBja2kx4mZPTophGS
         wzs94JYOfQO6PHFvWZNrT51VMqyBrabdhv4zhIsGsU6butFz01YQG36fnnn13HZG2qFz
         oYGRK64sjYTNimrY6yDQIBxApFrXk59At/HtjfRgGDifm/t/0uhYMwzMmeZMmNblwuyR
         GSqipWeXwd08g3f3c4f39O9s280rBpYK4QVdPfq/AsYAgUm/bo3RFoYn1SNiOeb/sfPc
         nU2A==
X-Gm-Message-State: ACgBeo0/N8rbKXfPKmhCzcpl4jaE2qaFqEcA5MYz7/95jxncbbZChaYK
	xlor5FPZ1ZGsdH79iRnzMXtbGkuFYXg=
X-Google-Smtp-Source: 
 AA6agR4RP6LoKRqP91WndX9FcBoWVMg6JzE/Vi1yDRLmdTamtJg3MBCrrpqA3GZiUVdPJrGCYCgZrg==
X-Received: by 2002:a05:6402:5190:b0:447:284c:b3a9 with SMTP id
 q16-20020a056402519000b00447284cb3a9mr7848621edd.428.1661544194632;
        Fri, 26 Aug 2022 13:03:14 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45qzr91atxjqk147.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:dfc2:a4c3:b2ef:18a7])
        by smtp.gmail.com with ESMTPSA id
 w17-20020aa7dcd1000000b004479df2ff82sm1752884edu.51.2022.08.26.13.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 13:03:14 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] makeself: added makeself as new recipe
Date: Fri, 26 Aug 2022 21:54:03 +0200
Message-Id: <20220826195403.893639-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 20:03:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98482

Based on the older recipe of intel-iot-refkit.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../makeself/makeself_2.4.5.bb                | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb

diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb b/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
new file mode 100644
index 000000000..e0dfc3dae
--- /dev/null
+++ b/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A self-extracting archiving tool for Unix systems, in 100% shell script."
+DESCRIPTION = "\
+    makeself.sh is a small shell script that generates a self-extractable \
+    compressed tar archive from a directory. The resulting file appears as \
+    a shell script (many of those have a .run suffix), and can be launched as is.\
+"
+HOMEPAGE = "https://makeself.io/"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "\
+    git://git@github.com/megastep/makeself.git;protocol=https;branch=master \
+"
+
+SRCREV = "5742be6410bfad2c619fb1e98bf795e8fa0913c7"
+
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/makeself.1 ${D}${bindir}/
+    install -m 0755 ${S}/makeself.sh ${D}${bindir}/
+    install -m 0755 ${S}/makeself-header.sh ${D}${bindir}/
+}
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


