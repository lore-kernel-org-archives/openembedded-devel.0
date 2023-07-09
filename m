Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C985EB64DC
	for <webhook@archiver.kernel.org>; Sun,  9 Jul 2023 08:20:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.13897.1688890848907169364
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jul 2023 01:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XKxwydbf;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-262dc1ced40so2518244a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jul 2023 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688890848; x=1691482848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CI3/jZHVsVVNq6lirF1caai0OkIBH2Tg9K9IyhZHG4g=;
        b=XKxwydbf9y+tld0YI23ji+QL4FnogH1OosB6f806CiiIT96EQASwWhJxxABCUwSMpk
         AtudXo3SgjSctBN1dKOnHpPTakzh9m96lx0dlltHW0wTLYpQ7eY4MZ3tsCfjAFvqpD3C
         9eDBVsKytwYgm5JpElzAcb9xi0pUvGtJpcfYSCA0XZ/hXFybj4Axfo2IbkTfBu4PzIBq
         nzfEphpKSZuL+i90DECsrGlv57dIBYBT8wPxSMFHuhcJi/qZbj/DXD8J0GMt28hSF0nN
         a9ODYJi3w+LFVKDlMoytjw2Lq3iHTw/4nVSig1kIMNXmgdLZSsEIehHDqwAc1Ar0qMxc
         1Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688890848; x=1691482848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CI3/jZHVsVVNq6lirF1caai0OkIBH2Tg9K9IyhZHG4g=;
        b=Z3LUrUNJ9tb08+/1WrhBGQVunHNeF6xcnc8h2AU5p0/VBGkbs93/uksKwXBiUIrtRx
         gKhAh+tYJtPSHJfR1SZBDGmzfGI5J6zJNH+Vrp8FYxY1aPDApCqQDUXvHYi74++1oSb2
         A3c8/NkiUrul4EI/eI6gbL9/0+8LOqjAxPbqd88kg1dHWwa/Mz75xbGucAqcH24GDJTL
         HrqpAK6kzbox7jm2Lijr31gKmjBE5bFimAxpZA1e9zBSb7rg3P3aOEWc0wz6Z2PkXNms
         /WCTXuX+ghayXS/98Z0CA63+XwDZj5q8MfPfzUrLGC/+2r0h5tF82I1Ti/ftn+w2rnqD
         OYpQ==
X-Gm-Message-State: ABy/qLbzjB7CYpHbkDJIZV4FJGyHK7bhhFVqfwcaKBGKqf6yKPDNaeKv
	DWYZgEdIv67KXSsMUmuVpt0MtkM/P0xiuxrC
X-Google-Smtp-Source: APBJJlGTJsnrWNPspWE4lzW2NZ1kOrJXm2kAHr9o66boUIMx7jn0JvwzC4J8eiM3PXsA4ZEuPyaJew==
X-Received: by 2002:a17:90b:283:b0:263:45c3:b17c with SMTP id az3-20020a17090b028300b0026345c3b17cmr10000485pjb.14.1688890847893;
        Sun, 09 Jul 2023 01:20:47 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:2bfe:19d8:773d:dd90])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a004b00b0026309d57724sm4350351pjb.39.2023.07.09.01.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 01:20:47 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [PATCH] python3-argh: upgrade 0.26.2 -> 0.28.1
Date: Sun,  9 Jul 2023 01:20:32 -0700
Message-Id: <20230709082032.1754360-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jul 2023 08:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103718

* Switch inherit from setuptools3 to python_flit_core
* Correct SUMMARY
* Add DESCRIPTION
* Add python3-argcomplete to RDEPENDS (found with poky/scripts/pythondeps)

https://github.com/neithere/argh/blob/v0.28.1/CHANGES

License-Update: use COPYING.LESSER, change to LGPL-3.0-or-later

NOTE: Includes COPYING which is GPL-3.0 but README clearly states LGPL-3.0-or-later
https://github.com/neithere/argh/blob/v0.28.1/README.rst#licensing

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-argh_0.26.2.bb             | 14 ----------
 .../python/python3-argh_0.28.1.bb             | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-argh_0.28.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
deleted file mode 100644
index c02e31a9a..000000000
--- a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Pattern matching and various utilities for file systems paths."
-
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad"
-
-SRC_URI[sha256sum] = "e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-logging \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-argh_0.28.1.bb b/meta-python/recipes-devtools/python/python3-argh_0.28.1.bb
new file mode 100644
index 000000000..2b1cb3ed8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argh_0.28.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "An unobtrusive argparse wrapper with natural syntax"
+DESCRIPTION = "Building a command-line interface? Found yourself uttering \
+'argh!' while struggling with the API of argparse? Don't like the complexity \
+but need the power? \
+\
+Everything should be made as simple as possible, but no simpler. \
+\
+—Albert Einstein (probably) \
+\
+Argh is a smart wrapper for argparse. Argparse is a very powerful \
+tool; Argh just makes it easy to use."
+
+LICENSE = "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://README.rst;beginline=261;endline=275;md5=a8bf3475df7e0d575a53d04c83d5e090"
+
+SRC_URI[sha256sum] = "b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += " \
+    python3-argcomplete \
+    python3-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


