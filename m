Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.6053.1603345812147483379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 22:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=LK5JnzYB;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.47, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f47.google.com with SMTP id c15so498474ejs.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGIwosjqCnId4J2ph8QWrXpZ/91iN8CEKpIyHNjG/RM=;
        b=LK5JnzYB197BkdG1oXgbBXRpBVR9fAFH1mMOd3IDueJcPKXl7eCC6sbbWh+7lBwf78
         vdXrCwJZUUI8SFQcEmqzVe9cH/gfIWItVMLnabTRWdtPENqIJK6zcxml7LVKc5BTd4EP
         9n3rlYuGMKM+wShoyJFc10VCb7Pd2qQcbbpKfZ8zAaaKdgUPwUZdbcz4hqo6XkpSFje5
         vmOXem2eFDxtMSFCCmfZgzChKHHztIGRA9Lxqm48cNRZ0MPAfAP0EfUnsYKU1HRClo/H
         NMgf82qcYgDN7ulmV5cjSrLuyX6sabI3FiOZ0mINexAQ6PIjCYi16ZO1Ufh8EYd28jBg
         Xpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGIwosjqCnId4J2ph8QWrXpZ/91iN8CEKpIyHNjG/RM=;
        b=jMjLkNbL3z/msLRizpgcnkT+G+eYu2ycVuCM7wQriiG2GaYqx7XN3QNuhhMm/pXjSb
         9ny+GUHjExTMmqfcuryAdSIKEPtuxb5rc1SBjz/tgOxbtUi86Xyq57xvz0TL4jrL2dU+
         yPDKW/7Rj12VpKfKJU09UloTNAcaFyCSZWt3vejncKDNYxCeVIYKUy8l9rm0Z7WeVNMW
         oJmaRFRd9xjjHjDFKjNrML+Cc7Bz5nFCK90rVuPE5wcQ8uvI4dOyAACnWDp7rZtH9+Rh
         wWJ7wtx3rqV4o1zCrBjNjUoKrj3BXneyDkhGKq5OGMy+qykF9foOQHiCuThFwoo+N5lX
         KisQ==
X-Gm-Message-State: AOAM533vDvAWgHevi+i1Bil7meh+KW7UXK24rXZ/akdsenYPwd06LJBt
	QZOgUmr57uD8/eka143wq108hvszel4uzNrC
X-Google-Smtp-Source: ABdhPJyUC/Z3sJn45kQkmG9yggaicjhvhWbAR4hdjcKBYpLLWWoQuurnusSJIMgQ8wMWz3rIzxERoA==
X-Received: by 2002:a17:906:a282:: with SMTP id i2mr726043ejz.39.1603345810519;
        Wed, 21 Oct 2020 22:50:10 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id b6sm171891edu.21.2020.10.21.22.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 22:50:10 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] pcsc-tools: add new package
Date: Thu, 22 Oct 2020 07:49:44 +0200
Message-Id: <20201022054944.6373-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
v2:
- tweak summary
- use ${datadir}

 .../packagegroups/packagegroup-meta-oe.bb        |  1 +
 .../pcsc-tools/pcsc-tools_1.5.7.bb               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 92190c838..45cfe4607 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -840,6 +840,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     tbb \
     satyr \
     pcsc-lite \
+    pcsc-tools \
     sharutils \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "toscoterm", "", d)} \
     sg3-utils \
diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
new file mode 100644
index 000000000..bc82e49ea
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Some tools to be used with smart cards and PC/SC"
+HOMEPAGE = "http://ludovic.rousseau.free.fr/softwares/pcsc-tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https"
+
+SRCREV = "34ac207adbba0d1a951b314c1676610a1d0bba01"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "pcsc-lite"
+
+FILES_${PN} += "${datadir}/pcsc/smartcard_list.txt"
-- 
2.20.1

