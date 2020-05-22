Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.11768.1590149624581208247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 05:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=rnHkmMQl;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.194, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f194.google.com with SMTP id z80so10485364qka.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y0usEcGrAKLWgPOLOzjTC/QsBgW97xfhYodJZTzkHS8=;
        b=rnHkmMQlSzLP0x6FbY8pQ+RiZZX9H4j0Am0G1ojVmgegXCnE9Zu9k7tZ1UEcxpbq3b
         rtxaffRJErqC8qI8gV7pWm+bgItIbq2WzasPbiMlWvyF9Rw4t6S7S7yHtP0r2ngi5Id8
         lccYxtBaS/205jWGh20DyG3jls7TxSaGb+7OumnRashjyeOzuyP+aZxxVvOLxcqKEgyN
         2YL4tzfqxHgSV1duLZnSny73CLujUKcupywQL8ArCmW/neu8s/mlxkEMnkmTjeQUb270
         qW2mtDhSryN88AHz10ESsDuvgNYdamd0iRsoKEMsJJmllCcsYd/1QB63e97TQ+RPhm1b
         Tkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y0usEcGrAKLWgPOLOzjTC/QsBgW97xfhYodJZTzkHS8=;
        b=mCkmwi+/eEDJQrfsxk93XRiOGz6ZLiqIftgDGm9ThulTqdcOjbDvf9w15SBgQy/WPa
         sDG//0bJlN7xQRyAXZJc2sKrafdzLM2+Zses4JbGm97ipcCSLC43C9WL7rz196hjhx5w
         d5T4hsxwfz8CAQ6Nj1JQssXmjgqJsPKmrCbOJFh1hd/HGbS/5Us16kH7k/NmBnchy7va
         grGQh61V9Sg5iJsxdbsaZr8k7Sw5+uldGEhhqinrBZHE103FCRyQOVA4NMgC9AQIQ2tv
         XGnxXCJOvpPL9NZpfl9tfYcevdDTQoQNfo3j11wjCpGHCP3CmQ7tCmdo47aXrefT1u83
         5jpw==
X-Gm-Message-State: AOAM531H0kcwP5EFclqEcGnH9dpL4OudPGGijASiImqIYpJG1omFl5Rv
	LVFxCnmBVUlMmeZTDbaADAP9ko0sIDs=
X-Google-Smtp-Source: ABdhPJxZbuVZhtJzH+igygpNpVx/Op69fT6bRC/dgT46GkrvClKG2mXk7HHS+PqvzJRjmrvGUdPP2g==
X-Received: by 2002:a05:620a:1312:: with SMTP id o18mr14909263qkj.277.1590149623536;
        Fri, 22 May 2020 05:13:43 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:24d8:1ecb:250c:14de])
        by smtp.gmail.com with ESMTPSA id g7sm6309813qkk.44.2020.05.22.05.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:13:43 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 2/3] python3-pyudev: Update 0.21.0 -> 0.22.0
Date: Fri, 22 May 2020 09:13:32 -0300
Message-Id: <20200522121333.25045-2-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 ...hon3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb} | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
index f39847ffa..d5bf058ed 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A libudev binding"
+
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
-SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
+SRC_URI[sha256sum] = "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
 
 inherit pypi setuptools3
 
@@ -12,10 +12,13 @@ do_configure_prepend() {
     sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS_${PN} += "\
+    libudev \
     ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
-    libudev \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

