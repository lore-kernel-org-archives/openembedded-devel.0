Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web09.4015.1622012812527690707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 00:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=Ekm848GU;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.65, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f65.google.com with SMTP id s22so717436ejv.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odRnxbwwzzg4ACcU5IivBs7kjDRGAS/Bcy8QHnS5SNw=;
        b=Ekm848GUzEpzZvMHFTNQEbSs8XZR2+duBe2lh3OvZLCa2ReH5XCwbDTU6Zr96Yy+D/
         HOMttBVP10DyTb9nk+JI72qTTMESvv0RWAX6Zaflb5dIC2etjNRoBUrbqtY2OZ2Fe/0r
         /O5QulzZc9fQevjvmEMlNz5czOwpkPsJwOBIVZAlX8YKxNIcUOQ4cRFreQ0JEzdfF6cc
         OM9tTb/s7iWZLQJ2IFzOXSMBE33J4VhBfSsvUPmQ8spLD4JuaHzxHOBATQlgL7Zid5DA
         VA5tsA8qvUX4L6GrhiLuMZMfAtGbOnxMAlCvPCTdAiLNhSwgFXDza44SYLsM5bnf84fM
         zcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odRnxbwwzzg4ACcU5IivBs7kjDRGAS/Bcy8QHnS5SNw=;
        b=Zrp8chw4usqHGXk38bvovghJp701BIRamVtYJvrSCGA6QFjXnbd80dFnF91uOGz8zU
         pNv+MYl1TGzBmPyJrvKUvdfTMaTLCdh3OeCu5yT35M2FDoco8mFwaFFes8jPhf2tKdlW
         wBl4lSRek4uPgzU0w7tcFyVoC3Xc/fM5tk3bo3oXRViq2jfzBXsljRt4t+iy94l1+FTj
         Jf6tEqtzOQD0tZBeA7Z5vLAI8MbQnD7R1wp7F0yiBK/O++p2B8RdlSKuOR20oLYSVkyr
         UXdxx/AEr4C4B21fkExJLuaFosgTa6Tr7P+t2F88L9F3hMMLKBcG9DkGzHhQL3xryMJK
         yrVg==
X-Gm-Message-State: AOAM532h+ZlBL/chbMd/2VrsTqqFx4ZolTJS3CG2RwCnIKLsmGeHMrsH
	9GnH5cT13qEtSje274+fS5ck0Qws4+sldDRK
X-Google-Smtp-Source: ABdhPJzGsxW7hRONP2FJdm8kPP2AKXtSjJShQD8tzUzqID/2243f43Cgh0DlMZ+9aEVwf2t7f16JGQ==
X-Received: by 2002:a17:906:454b:: with SMTP id s11mr32054407ejq.3.1622012810926;
        Wed, 26 May 2021 00:06:50 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id s21sm11848864edy.23.2021.05.26.00.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 00:06:50 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] nyancat: add new package
Date: Wed, 26 May 2021 09:06:40 +0200
Message-Id: <20210526070640.21126-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 .../packagegroups/packagegroup-meta-oe.bb       |  1 +
 .../recipes-graphics/nyancat/nyancat_1.5.2.bb   | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2bc638ca8..1b0ecd1c6 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -482,6 +482,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     libforms \
     lxdm \
     numlockx \
+    nyancat \
     obconf \
     openbox \
     packagegroup-fonts-truetype \
diff --git a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
new file mode 100644
index 000000000..7ba8f38a9
--- /dev/null
+++ b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Render a loop of the Nyan Cat / Poptart Cat animation"
+HOMEPAGE = "https://nyancat.dakko.us/"
+SECTION = "graphics"
+
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://src/nyancat.c;beginline=27;endline=49;md5=285f7ac87da4a631f348800687d845bd"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "5ffb6c5c03d0e9156db8f360599d4f0449bb16b9"
+SRC_URI = " \
+	git://github.com/klange/nyancat;protocol=https;branch=master \
+"
+
+do_install_append() {
+	install -Dm 0755 ${S}/src/${BPN} ${D}${bindir}/${BPN}
+}
-- 
2.20.1

