Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7915CC6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 18:29:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.2202.1663007370532691527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Sep 2022 11:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I3j6qd/p;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id c198so9420392pfc.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Sep 2022 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=uRK+SN1Uip9vtmRaDmZCTQah3k1nyew+61ln1yC70o8=;
        b=I3j6qd/pKgZLAmfkaGrhONoeSqvDiOpOcNYYO0NIjGgh43FAYqzC6p2VXM6tcIC7i0
         BiQKU4FpJUXkW6lqzpuoPVVrZAYQ1p9HoL6QbHSRGlMiXYBycfB74r2yQXqvcwiBPNYQ
         zvwRjZAMeCWuSXAcf5AgBCHAe+qQeqU9cQXohMPDnTR5U4xxcIARo3uX6LN+FIE3f4J0
         CUXnmSWueo8ol9W/oeBGaRcyUgCGqt5MYrIcjvGGp6e4JwwYCu4HPllvWRVs+iJj2fg5
         2Ie19XxQ8cli71ETrvhQFdM2KAOhLGTrnHJZzig3DmDtUQessO7fX+myOC75tBspR6m1
         c++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=uRK+SN1Uip9vtmRaDmZCTQah3k1nyew+61ln1yC70o8=;
        b=D8PlVPx3MMtobaU0rSrxn3YhNvqQovwL1HqXSxbZy0SndpoeVGhW6zLgitLg3wEG4b
         61eH+ot6KxokT2tr3P7toD7vi1d4gk6ntartPibxxXse84RgTa85EEw0FsNrW8uzR/dg
         yFMQbxlDXtyTMQ75Dp2ARbWkgg48v9xAT2qjJtJxKaO4LuPoL4XNvTMoVVqYuy35cVzn
         Kd0aUQ7YwZum3JXV3cdCF2ZJL+qDMcyb785/vESqzAczkcpUbYvYLNK0S0k6kCVPvKWS
         zelgzYbq8ee0FOGHQdzRpMua/+N6dRSJxWk94Eg77xPyO1rdTjoObX2JybpMjiD+RHqL
         k4fg==
X-Gm-Message-State: ACgBeo22+kE3NXxvSQBFU8l3O39DzNlJJRHGhUnCZm0D0yUHyTwLs+dQ
	YXARIXhr3ybkf5ZOd9w4UXY3iClQ2n+7Ng==
X-Google-Smtp-Source: 
 AA6agR4d4ttpTbqvx13YwsPScmd7cmuzp+BMCqNfpSysA29WHWIAfIWkLmCuUR9GOJw0cHtPqDKwrg==
X-Received: by 2002:a63:6a41:0:b0:439:20f:9e13 with SMTP id
 f62-20020a636a41000000b00439020f9e13mr5430719pgc.268.1663007369575;
        Mon, 12 Sep 2022 11:29:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a17090a74ca00b0020255f4960bsm5557002pjl.24.2022.09.12.11.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 11:29:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwupd: Fix tostring() call to not have
 xml_declaration param
Date: Mon, 12 Sep 2022 11:29:27 -0700
Message-Id: <20220912182927.3349038-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 18:29:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98752

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nsupported-xml_declaration-parameter.patch | 33 +++++++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch
new file mode 100644
index 0000000000..8fd0234695
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch
@@ -0,0 +1,33 @@
+From 88a97229350010d73cee0ff38da0dbbe0a449dd2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Sep 2022 11:20:59 -0700
+Subject: [PATCH] fwupd: Drop unsupported xml_declaration parameter
+
+This is not needed on Python3.7
+
+Fixes
+wupd-1.8.4/contrib/generate-gresource-xml.py", line 26, in <module>
+    f.write(ET.tostring(root, "utf-8", xml_declaration=True))
+TypeError: tostring() got an unexpected keyword argument 'xml_declaration'
+
+Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/5025]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ contrib/generate-gresource-xml.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/generate-gresource-xml.py b/contrib/generate-gresource-xml.py
+index 235a7700..4429f988 100755
+--- a/contrib/generate-gresource-xml.py
++++ b/contrib/generate-gresource-xml.py
+@@ -23,6 +23,6 @@ for fn in sorted(sys.argv[2:]):
+         n_file.set("preprocess", "xml-stripblanks")
+     n_file.set("alias", os.path.basename(fn))
+ with open(sys.argv[1], "wb") as f:
+-    f.write(ET.tostring(root, "utf-8", xml_declaration=True))
++    f.write(ET.tostring(root, "utf-8"))
+ 
+ sys.exit(0)
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 4258652744..3b5aa3483b 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "adfa07434cdc29ec41c40fef460e8d970963fe0c7e849dec7f3932adb161f886"
 
-- 
2.37.3


