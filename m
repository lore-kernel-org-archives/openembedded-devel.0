Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC23C7EE32
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:13:17 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.14793.1751033589688708461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fSsa2ucY;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso4169366a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033588; x=1751638388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lofbvcDMGqdJ46UJwz05bjvf/kiBMrgGBF9SJRbbsfg=;
        b=fSsa2ucYLQjl7TODvfNkwpkMSQhpheRxH63O9ZmSd55csm6VQyf0ztmZZgSGNPh7t5
         iOjmYSOE8OPU0mS5TwMio7eJPzdRB/HYcrNO+gbk5WAFitjV2eQillCh0xi2lmAhA+rx
         Ij6D1tFGPBIS4/P7UGLZwcVheJJQ9jE2dK/MEVshDA/+5XbwOKWiir8JY+DB0fLa3jEn
         dLszOPrb20Ml+CvWoIFYzCoeyc7iiqfso0FwFH4z+7z6lXx2ocASB98LTK0nzHddNg0r
         YWI9wWR5GOfLLmimcNebJwDurqX/c8e9DTnCliQkfu+eTGU49arnMCjSE0ddtHNXw+7Z
         u3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033588; x=1751638388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lofbvcDMGqdJ46UJwz05bjvf/kiBMrgGBF9SJRbbsfg=;
        b=qWlbdr6lRuT0sqYn7sKM5Qud7+l0dzRqCrRaG2Z85+89wR7ZD/+AqYncPIrhJdodMA
         d2id1mAmCRgEJ1ZhIduYOld6RSPfPQfzIInAbM3wbcJZxDQ5uR5gpN9F61BwLXpaw6zY
         3TIK8MHm9cdYnD+GzaPAGdjD8tKLn/YaXzprljkFUL0W9ieOnfR4KS4XY5nF6UEnFlTA
         fYygb+/pnTT/OTDopwQRr5egZnyCjzKxj/ctBFtdAGAqWzPe5nbYnS82gO50im9X1N3/
         bxHur+/D6qegjX/yRIL9KiduyjIvZ+9BCk3YKBGZCkNxaphTPwOYbVIUTD89m+qIOJAZ
         lrYA==
X-Gm-Message-State: AOJu0YwaODSFLV/e/9p5cciNUsBwSiv/mnbEwMxhtR7EenkaYJMgC74n
	1I6YYzN2VH2UzNBU4AzTS7b6gS6DcAfHlc8x8l6INwMgw4B8lgGcRVBQXDyO7Q==
X-Gm-Gg: ASbGncuKdpX99eKsnvWzFG0+EthoeVpXLkPycDB2mPD6rva85ziwMuYBJj4UH+RiVfq
	EdSZAZQ0T7evWhwcT7g+kTOscbicNq8tP3H9uc7UVYMVdYX2b5laotzy5+0ZnTBgoHGSR6q/ND3
	5TntqUXLzxzBOmw82myIMhZvfmIG8ddhpd35CL6LzIjdXW7n8Sr48mHpYEwl57hOgTGqvs7psW7
	rjnV5pvsQx9znVOHiTr/yNOkWT0ConvtRDcuxs2zhwvNFI+6p4Hr+d4/PZ4Ec4IJpAFI9fC4wXc
	XsXekqz/ikj8/plY1FsHbNqfYS6QXRpEZtqCQAMx4V8SQY6wGdxmv4hJ4zk=
X-Google-Smtp-Source: AGHT+IFKBu1MuG9Fgrbr+TFBebf9sqY73WZ969Jour72IukyceHoOD+Jr7BK26e+e2Bkh0QjD3Rsew==
X-Received: by 2002:a05:6402:274e:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-60c88e46d49mr2922757a12.31.1751033587637;
        Fri, 27 Jun 2025 07:13:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831aa9basm1521764a12.45.2025.06.27.07.13.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:13:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] nodejs: inherit qemu class conditionally
Date: Fri, 27 Jun 2025 16:13:05 +0200
Message-ID: <20250627141306.354886-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118156

The recipe unconditionally inherits the qemu class, because it executes
some target binaries when it is cross-compiled and the bit-width of the
build host and the target host are different.

Since it is unconditional, it also means that it is inherited for native
and nativesdk builds also. The qemu class uses some qemu options that are
always derived from the target machine's configuration, even when the
recipe is built for class-native. This means that some of the variables
used by the recipe changes (e.g. QEMU_OPTIONS), and the shared state cache
is invalidated when the target machine changes, even when nodejs-native is
being built - and it triggers a full rebuild of nodejs-native unnecessarily.

To avoid this, inherit the qemu class conditionally, only in case it is
used (when the target and build arch's bit-widths are different).

Also, inherit qemu-native based on the same condition, and move around the
qemu-dependent code a bit, so it will be only executed when the qemu class
is inherited.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: forgot to remove the DEPENDS:append:class-target from the top in v1 - it 
    is now conditionally added from anonymous python script below

 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 4bc829f140..679acafabf 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b4f41dcacabc8f07b9ca7dee2f188a00"
 CVE_PRODUCT = "nodejs node.js"
 
 DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-native"
-DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest siteinfo
+inherit pkgconfig python3native ptest siteinfo
+inherit_defer ${@bb.utils.contains('HOST_AND_TARGET_SAME_WIDTH', '0', 'qemu', '', d)}
+
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -108,11 +109,11 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                    qemu_libdirs)
+    qemu_cmd = ""
 
-    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
-        qemu_cmd = ""
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "0":
+        qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                        qemu_libdirs)
 
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
@@ -209,6 +210,7 @@ python __anonymous () {
     # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
     if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
+        d.appendVar("DEPENDS:class-target", " qemu-native")
     else:
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
 }

