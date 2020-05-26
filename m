Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.50033.1590498969425775726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 06:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qh4/JCOt;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l21so23765787eji.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 06:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=qh4/JCOtptrwMgtmzGOqXWChW+k8Cl60LaKNFh8RTT6WkBz6egSbmMXLFZlHyOhrXo
         wRnl7TbOfa8E5oowbDs67j9q/f8oqGatn9v5pt/O5Db7v/n9A5Wu7QrEeWrwXnnoznrn
         bEV8DpcYRGibjq+V2VpNUx7Krnx8FF4AJl9dS1JVgXgKehfnZwYh6NUpg16Uc3DJPrEi
         t9mq4cTcwNP9M8gIwRCHI5WM02jFPacMrrnF7grNBiPlY8fmdqtsXq1DMEXIzSPGG51b
         fiABp21DYZtbOssEq47mjG2/SInMoZ2pv+/IbJpqsdfNCjiDdgLA5V/wwCfqCp9lAnAz
         ZzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=VHM+nh74+THXTw6GufHBYHemdvmJBLLWT6KMCy6mbGWmkYm4BIH5fzPMP6qfQs+WJg
         DikSoS3YhIESKyfLk72i0dpuBNK4j9q6vb4UHD89VhFhZ17g9uQ7mjJFMzNs856GbReC
         M1M0EBGNZxBrDTmPfb7WzKJWvolizcsBHTXd7PluBgUasZ2dSXLumXHFZ6t/73fr5M7x
         brrfMFKskqCdBAqLwyhYkptaofLDXPmA1XY2sh7P6Y4aKyJ0rJffo3uJpvBCJAKr0V7k
         UU7vpJgOtS0sPE1FWAVOTU1y1XAK8M7pQXPAMfvNj+KukNok+9bXhXIjUY4WJXN0eNKE
         b/wQ==
X-Gm-Message-State: AOAM533v4trjmo0bQ+s7wzIeUiejJ2j4RW/DBJzAEhMzow6NBKh0L7dj
	YavieYIaVE8IO+OJYIuCaMCJQFu8
X-Google-Smtp-Source: ABdhPJw+iXxEyl2itqx71YaKjVErCWZ0ExM5ARnFiymDHFXYYj8Ub8boSlpNAFWb71aJowON1Gj2YQ==
X-Received: by 2002:a17:906:2455:: with SMTP id a21mr1030416ejb.73.1590498967863;
        Tue, 26 May 2020 06:16:07 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int ([2a00:801:42a:e319:603a:b692:6de3:bf7])
        by smtp.gmail.com with ESMTPSA id wr20sm4330761ejb.27.2020.05.26.06.16.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 May 2020 06:16:07 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V2 1/2] u-boot.inc: fix some inconsistent coding style
Date: Tue, 26 May 2020 15:16:48 +0200
Message-Id: <20200526131649.6318-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526131649.6318-1-liu.ming50@gmail.com>
References: <20200526131649.6318-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 44 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 80f828df52..718435f13f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -91,19 +91,19 @@ do_configure () {
 }
 
 do_compile () {
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
-	fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
+        sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
+    fi
 
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
+    unset LDFLAGS
+    unset CFLAGS
+    unset CPPFLAGS
 
-	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-	then
-		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-	fi
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
+    fi
 
     if [ -n "${UBOOT_CONFIG}" ]
     then
@@ -130,16 +130,15 @@ do_compile () {
                     unset k
                 fi
             done
-            unset  j
+            unset j
         done
-        unset  i
+        unset i
     else
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
 
         # Generate the uboot-initial-env
         oe_runmake -C ${S} O=${B} u-boot-initial-env
     fi
-
 }
 
 do_install () {
@@ -162,9 +161,9 @@ do_install () {
                     ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
                 fi
             done
-            unset  j
+            unset j
         done
-        unset  i
+        unset i
     else
         install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
@@ -219,9 +218,9 @@ do_install () {
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
                     fi
                 done
-                unset  j
+                unset j
             done
-            unset  i
+            unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
             ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
@@ -238,7 +237,6 @@ do_install () {
     then
         install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
-
 }
 
 PACKAGE_BEFORE_PN += "${PN}-env"
@@ -275,9 +273,9 @@ do_deploy () {
                     ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
                 fi
             done
-            unset  j
+            unset j
         done
-        unset  i
+        unset i
     else
         install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 
@@ -346,9 +344,9 @@ do_deploy () {
                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}
                     fi
                 done
-                unset  j
+                unset j
             done
-            unset  i
+            unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
             rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
-- 
2.26.2

