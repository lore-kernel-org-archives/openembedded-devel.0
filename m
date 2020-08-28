Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.1704.1598641298866108136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 12:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mpCyZgeG;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id d26so543071ejr.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 12:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1loPXZ1LOq4wQ6yZkeLBCUrcYvBYpndq+681FI4EHrA=;
        b=mpCyZgeG5qiAUHhB+at8RR9lAU0nQfcm7bCu+PuqfGQqgZrHUTcTnB6b2eJM8aLS6M
         N8jNQlTRxgYNQR4pVP2ib53b58O45aow5bqWJ3aLw9xUpo2JcfzNQr3Raakd9GsVliEq
         vw3+z8kJRL80/+8Zzhh1DFs0xQyAdwjwVNn0LvBMZQyQrAdiNBpS+kOvSwOZNh/Bn8qX
         9uIPkoeysGr00Rh6aOI2R/MmURGOlfSrVGv0epAinA2Li5Ip5Wm67DLxMcQBBGoXrf7G
         jSpw3/9fTTCpnGEhIVdyxuYDBtSEAXW24sImVeEj7pO69dcLMUW9lqVkemB5is+FhRYz
         p27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1loPXZ1LOq4wQ6yZkeLBCUrcYvBYpndq+681FI4EHrA=;
        b=oGRfrwp7cj3N4u8e6mWdHmFKlrVUaOJE58IESYlaD9MPjoLjtsm9S8TbM2GPhizyUZ
         ia1CLhEjlxBQLmnA2QJ9jEo9rVBbwB8KqL+fnxH56x8hCJs0202PjvT8mG2dFJLE2kmY
         UqeQbvZzoVvf9QwevVcG59iZWkk4NgZxbZXiL1zhDgcHL/0Ew0PU6TNCLTxH0QKuvX8u
         AkgSC9ch9329HPeo36w8ExIO+JKWrWIOTUSvPe2gPeTT6+7bFlubMzz2x6Phqd1rfzNM
         cOz9DwExX/FhQrnMqjfABoZJXBXG7wE/d7Q4Mp6aQWfi98rYxGG/eH4t5lsJLR0OfAhz
         iDHA==
X-Gm-Message-State: AOAM530zsUPjeoNLwAj139EQxkBFALyvQu4UGR895lE1oqJyg6HnbbrZ
	AeWVtKButKjoJ4Lk3T3lvuKnD7/TRjs=
X-Google-Smtp-Source: ABdhPJxtcwWgZ731ZMQOQnWxzm2L/G4iRk3S/WAdpXJxICQ3+OVMh8lrYhqmGTrsHEphsPdOY0r0ug==
X-Received: by 2002:a17:906:c1d7:: with SMTP id bw23mr46139ejb.315.1598641296794;
        Fri, 28 Aug 2020 12:01:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f5sm100618edv.4.2020.08.28.12.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 12:01:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nss: fix postinst in do_rootfs for target
Date: Fri, 28 Aug 2020 21:01:34 +0200
Message-Id: <20200828190134.2359034-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162F7E2FF7270601.30808@lists.openembedded.org>
References: <162F7E2FF7270601.30808@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Partially revert "nss: fix postinst script for nativesdk build"

This reverts commit 31552510b15c1c97aa6cbe180c2bb53d139efbcc.

When running in do_rootfs we need to run shlibsign provided
by nss-native, otherwise it fails when /usr/bin/shlibsign
doesn't exist on host builder:

do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.54.bb | 26 ++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.54.bb
index 882145c1ef..81b2538813 100644
--- a/meta-oe/recipes-support/nss/nss_3.54.bb
+++ b/meta-oe/recipes-support/nss/nss_3.54.bb
@@ -240,19 +240,19 @@ do_install_append_class-target() {
 
 PACKAGE_WRITE_DEPS += "nss-native"
 pkg_postinst_${PN} () {
-    if [ -n "$D" ]; then
-        for I in $D${libdir}/lib*.chk; do
-            DN=`dirname $I`
-            BN=`basename $I .chk`
-            FN=$DN/$BN.so
-            ${bindir}/shlibsign -i $FN
-            if [ $? -ne 0 ]; then
-                exit 1
-            fi
-        done
-    else
-        ${bindir}/signlibs.sh
-    fi
+    for I in $D${libdir}/lib*.chk; do
+        DN=`dirname $I`
+        BN=`basename $I .chk`
+        FN=$DN/$BN.so
+        shlibsign -i $FN
+        if [ $? -ne 0 ]; then
+            echo "shlibsign -i $FN failed"
+        fi
+    done
+}
+
+pkg_postinst_ontarget_${PN} () {
+    ${bindir}/signlibs.sh
 }
 
 PACKAGES =+ "${PN}-smime"
-- 
2.25.1

