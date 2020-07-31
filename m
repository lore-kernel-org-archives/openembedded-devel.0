Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.19540.1596205439382887999
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 07:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gL7FkvjW;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: miroshko@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 184so9423425wmb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLr8c9zkXcdgamtFgJgrGM+qVoLvj782nagA2wVTERw=;
        b=gL7FkvjWT2v5Kxr76Vqu+Byk/wi9h27WNP6vS6mY4gd+KI5tlSXxqg6Qy+LTgqCRme
         EQ5mzdwOd6hIKBrDUMJIR7wEgYWFGAnCC8nsjC65mt0QXUWeOwPxCQDyEod6QnbE4T0h
         FQWf2zrOjYDw++m8rcmR0+j0qG75PolLFDz943vCyqM9Z08WzMDtOlfBPvxDtjgyxbfb
         ccRLBidIJv62704HSVVDwBIBZHWSXXqqc454NKIRmnCuFCbJIzsh+JlXCknKexZanfK5
         hNJLttlAyyaCuwZP9qWos1FBn/kcHGJVNjf9AsOHhgz346t9nNsFtlBedr9uKWasbuU6
         /PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLr8c9zkXcdgamtFgJgrGM+qVoLvj782nagA2wVTERw=;
        b=djGsHkbV5SK44QAVIHjUR4fKxxUUjkdYY8pwPvpR+hiK6m3BTv7KDQBCSspuB7nIXt
         60zeS+WWhrAPCSwKexWbsAdLWgWFQ++HBgW59mfZmE3yUqaxFYpDIdSi52c3vIB7KYUm
         7JRyelR9y49lHxKelpCFv2cbgpj8ug+xbbMZmOSkAkJeP4boQgc4bk2+IC9DuIL9N01p
         IST3igGl/TidLooLHymdUXKJRQEYfZF0/Efsnf/MsDa6+UJ1IBSDqGHip+qk/V7klpoF
         Av/cDldr5D5EMgn833pmbmNdMvoQsyzPpxekXKgFadGQReawJBqsEGKlMZTBanPYY1me
         DRSQ==
X-Gm-Message-State: AOAM532GTBt+CDXCmWCGKDiCKBoY0AD5D9x2soji4lRAi+h+Vua4ZKbw
	TD+3V6sQ/uUrfzjuVOQJqXEB8Kv1bnQ=
X-Google-Smtp-Source: ABdhPJw1PHpXo24cWvsrxB5l4hxnxQsRE3OnJfOjztjiY4Blj7Ur094fwQXkflIJzBlxauDzFjXkSg==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr3992548wml.35.1596205437536;
        Fri, 31 Jul 2020 07:23:57 -0700 (PDT)
Return-Path: <miroshko@gmail.com>
Received: from localhost.bmw-carit.intra ([2a02:8070:d1ac:b300::abe1])
        by smtp.gmail.com with ESMTPSA id i9sm12776296wmb.11.2020.07.31.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:23:57 -0700 (PDT)
From: miroshko@gmail.com
X-Google-Original-From: Oleksii Miroshko <Oleksii.Miroshko@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksii Miroshko <miroshko@gmail.com>
Subject: [meta-selinux][PATCH] setools: Add native support
Date: Fri, 31 Jul 2020 16:23:54 +0200
Message-Id: <20200731142354.1428760-1-Oleksii.Miroshko@bmw.de>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Miroshko <miroshko@gmail.com>

Enable using setools for analyzing the built SELinux policy
during the build.

Signed-off-by: Oleksii Miroshko <miroshko@gmail.com>
---
 recipes-devtools/python/python3-decorator_%.bbappend | 2 ++
 recipes-devtools/python/python3-networkx_%.bbappend  | 2 ++
 recipes-security/setools/setools_4.3.0.bb            | 6 ++++++
 3 files changed, 10 insertions(+)
 create mode 100644 recipes-devtools/python/python3-decorator_%.bbappend
 create mode 100644 recipes-devtools/python/python3-networkx_%.bbappend

diff --git a/recipes-devtools/python/python3-decorator_%.bbappend b/recipes-devtools/python/python3-decorator_%.bbappend
new file mode 100644
index 0000000..3bc71e0
--- /dev/null
+++ b/recipes-devtools/python/python3-decorator_%.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/recipes-devtools/python/python3-networkx_%.bbappend b/recipes-devtools/python/python3-networkx_%.bbappend
new file mode 100644
index 0000000..3bc71e0
--- /dev/null
+++ b/recipes-devtools/python/python3-networkx_%.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/recipes-security/setools/setools_4.3.0.bb b/recipes-security/setools/setools_4.3.0.bb
index ec73f7c..8fdeeb0 100644
--- a/recipes-security/setools/setools_4.3.0.bb
+++ b/recipes-security/setools/setools_4.3.0.bb
@@ -8,6 +8,8 @@ SETools."
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv2.1"
 
+BBCLASSEXTEND = "native nativesdk "
+
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/SELinuxProject/${BPN}.git;branch=4.3 \
            file://setools4-fixes-for-cross-compiling.patch \
@@ -21,9 +23,13 @@ LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=83a5eb6974c11f30785e90d0eeccf40c \
 
 DEPENDS += "bison-native flex-native swig-native python3 python3-cython-native libsepol libselinux"
 
+DEPENDS_class-native += "libselinux python3-setuptools python3-cython python3-networkx"
+
 RDEPENDS_${PN} += "python3-networkx python3-decorator python3-setuptools \
                    python3-logging python3-json libselinux-python"
 
+RDEPENDS_${PN}_class-native = ""
+
 RPROVIDES_${PN} += "${PN}-console"
 
 inherit setuptools3
-- 
2.25.4

