Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54824C6FA90
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:13:09 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.1899.1663726386227618144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YPatd8DS;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id w2so4550031pfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=rhaWZx/TFf+aThhzLVtMOheE7QrwOvhxVvR0RExE6J8=;
        b=YPatd8DSxNiltTKiLEv24FAbo15esNc1rVnzOiK2qnBwTHhQBrU7GVG9G5c/Z7ltn4
         9qz25ht0WnTrmcUeveEZ55pAVglVPR+zYkdq3KXZwhwHOOVyoKFH6Jl9NtXzVyzWAHQx
         jTINpqhaLZspV5ssHpv4azS106K78F+LkCZ97hRnVlyhkdYAUH+bMRvCoD2tLkYMdbXf
         vpwIbjlEPiV9kms3hMUAbziehzFv0oOnBG4JJ2hGdUALevRVY/J2IfGUyb6Zlt1DHsIX
         4VDbRAtr6YTKnGP3FCgTMADQOI6LVcXqgBamACOJXcvlbcQv4ybEPlhThxpTfB2MtwLR
         b/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=rhaWZx/TFf+aThhzLVtMOheE7QrwOvhxVvR0RExE6J8=;
        b=Zo/nJFqsrIeUSal4/aVAHmcaAk4H0+PMijeX9sTEA/zpiF6Zt8QucAi4r9Wtk2s/Hq
         uUtGapBt1zANUrkOyO2J0QaCgZKf2Xy/qUy4+TfGJsjxeZUrGO4/KH0gxWqYJy7YT/Ge
         UWLy2YFYc8zEacJ/9KOeWDTt0qhdit0LGguctasuIBgRvlNTmsXTaxuNpNcD4JQGP0Bq
         FGW7Go0z1M/KArlNbrXfdj59kRmHcknoij5wsnC7uxyK0/EFs/33H2K8mGYrUvtq7StY
         1svJeCF9YJGh6iDhh2177dLi5RNG/7gThhUJnpb7rBV9AkxgxJQMMy9Q3OBu7Fh/jW+k
         HhIg==
X-Gm-Message-State: ACrzQf372AFMJRL4aqTb7AQzBOwxpTAZITRjvsivI40b+yz1RxS2oYFk
	K4Pwq5E3hIPBJiaM/MwPR44TyLB8VlrI7w==
X-Google-Smtp-Source: 
 AMsMyM5C5FjFJDolatyuGx8gBovuVdDqHvt1LpspSu6R6aEa/z/RsW4NvNEFJAnPiKV7U1H1+Dh3Tw==
X-Received: by 2002:a05:6a02:20e:b0:439:3c85:b2df with SMTP id
 bh14-20020a056a02020e00b004393c85b2dfmr21914532pgb.540.1663726385464;
        Tue, 20 Sep 2022 19:13:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 q4-20020a170902bd8400b001782580ce9csm572167pls.249.2022.09.20.19.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:13:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwupd: Replace python3.7 patch with upstreamed one
Date: Tue, 20 Sep 2022 19:13:02 -0700
Message-Id: <20220921021302.3888181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Sep 2022 02:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98911

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nsupported-xml_declaration-parameter.patch | 33 -------------------
 ...e9c524998e449b822feb465a0c90317cd735.patch | 26 +++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb      |  2 +-
 3 files changed, 27 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822feb465a0c90317cd735.patch

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch
deleted file mode 100644
index 8fd0234695..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 88a97229350010d73cee0ff38da0dbbe0a449dd2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Sep 2022 11:20:59 -0700
-Subject: [PATCH] fwupd: Drop unsupported xml_declaration parameter
-
-This is not needed on Python3.7
-
-Fixes
-wupd-1.8.4/contrib/generate-gresource-xml.py", line 26, in <module>
-    f.write(ET.tostring(root, "utf-8", xml_declaration=True))
-TypeError: tostring() got an unexpected keyword argument 'xml_declaration'
-
-Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/5025]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- contrib/generate-gresource-xml.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/contrib/generate-gresource-xml.py b/contrib/generate-gresource-xml.py
-index 235a7700..4429f988 100755
---- a/contrib/generate-gresource-xml.py
-+++ b/contrib/generate-gresource-xml.py
-@@ -23,6 +23,6 @@ for fn in sorted(sys.argv[2:]):
-         n_file.set("preprocess", "xml-stripblanks")
-     n_file.set("alias", os.path.basename(fn))
- with open(sys.argv[1], "wb") as f:
--    f.write(ET.tostring(root, "utf-8", xml_declaration=True))
-+    f.write(ET.tostring(root, "utf-8"))
- 
- sys.exit(0)
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822feb465a0c90317cd735.patch b/meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822feb465a0c90317cd735.patch
new file mode 100644
index 0000000000..947c764030
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/c54ae9c524998e449b822feb465a0c90317cd735.patch
@@ -0,0 +1,26 @@
+From c54ae9c524998e449b822feb465a0c90317cd735 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Sep 2022 15:10:26 +0100
+Subject: [PATCH] trivial: Fix compile when using python 3.7 or older
+
+Upstream-Status: Backport [https://github.com/fwupd/fwupd/pull/5051]
+Signed-off-by: Richard Hughes <richard@hughsie.com>
+---
+ contrib/generate-gresource-xml.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/contrib/generate-gresource-xml.py b/contrib/generate-gresource-xml.py
+index 235a770020..569c804937 100755
+--- a/contrib/generate-gresource-xml.py
++++ b/contrib/generate-gresource-xml.py
+@@ -23,6 +23,9 @@
+         n_file.set("preprocess", "xml-stripblanks")
+     n_file.set("alias", os.path.basename(fn))
+ with open(sys.argv[1], "wb") as f:
+-    f.write(ET.tostring(root, "utf-8", xml_declaration=True))
++    try:
++        f.write(ET.tostring(root, "utf-8", xml_declaration=True))
++    except TypeError:
++        f.write(ET.tostring(root, "utf-8"))
+ 
+ sys.exit(0)
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 2e9921d37d..72f37aea85 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch \
+           file://c54ae9c524998e449b822feb465a0c90317cd735.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "adfa07434cdc29ec41c40fef460e8d970963fe0c7e849dec7f3932adb161f886"
 
-- 
2.37.3


