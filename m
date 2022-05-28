Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2908FC433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 08:47:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.13171.1653727626508874441
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gfHoKBsg;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p19so3808011wmg.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8tZz8yeOflIuQxpujspKyGfF9rhrDSAmOCOIAwyYOV0=;
        b=gfHoKBsgGTjlcQuy+Lmcj9XgASoDS/GEXXuIEw6nga6AZXN3VSB368UMZjDfybViPO
         x8L7AYGRBuUmROsEWJJvHaeqa10ZZaCeKNa2RaFmJ5JW4ptoXHDrH8XmvXkRtYNk2yS7
         KgWlp9EX8ksD319cSHYIZYzczDXJ3JwqiyNDUw/SmTn+zjR9XoS4f1XoMSfPeHUITqcW
         lk8upD8dJThN4jkBDPS0rAMjCXd/LnzU9er6JXg2Ea16bUpY5lE27pMJRvkHrHMmiOya
         GqlRTGqaKJX0ATTfDTpsRBqjwiWLoj+KONhkonJtYyVZmcl6sJWwijm4zDc6AIPNp5lh
         mFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8tZz8yeOflIuQxpujspKyGfF9rhrDSAmOCOIAwyYOV0=;
        b=iOfxpwpu0Puy3E5nxMG3EHJed/whjLyFFaYWa5ddorjEKLc2nqfK2ueXMX5G2jz6YS
         DAozm0xJLEKKqgxs1bikq2nyuG1kbObh42HHjREdEVVX2KXcW2EL9MtqoCm6rwz6diSW
         r2a+If7JR1DRTUlgzQpCSb50SbuhWugv5widmLZtvycBSri0hcVF7t93/Id2tet8wMju
         qCPjSNh2j9HCtuVGwh79gjYmdlnyas6uA8R7d5aX6xGkCW2TGakZaDmdNgub8F+FjFy5
         MIM3+fUVwUI3jYIqlSy8wwU+SC1jvdSzItgyLWllNav1ulmF4C81twNMf9ucM1WcXqyS
         O87A==
X-Gm-Message-State: AOAM530J7TLP48SW0ZGraFJH8CzkALGtVBm8V2qVJKin7XaGWfrspzKE
	9NsFbdEf12JEmlwLvcIrQRiBTSGqpUrKOStO
X-Google-Smtp-Source: 
 ABdhPJw7mxgHu7qPJGzekjX5Vkeo0zRSQpHcMrGI9v4bNR9slwx9fPphzClDy23duE8DkQJbtXR77A==
X-Received: by 2002:a05:600c:358e:b0:397:7042:17a with SMTP id
 p14-20020a05600c358e00b003977042017amr10715058wmq.4.1653727624552;
        Sat, 28 May 2022 01:47:04 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-234.002.205.pools.vodafone-ip.de. [2.205.7.234])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a5d6385000000b0020fcf070f61sm1191764wru.59.2022.05.28.01.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 01:47:04 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH] xfstests: add new recipe
Date: Sat, 28 May 2022 10:46:48 +0200
Message-Id: <20220528084648.3641611-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 May 2022 08:47:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97311

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

File system QA test suite

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 .../recipes-utils/xfstests/xfstests_git.bb    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests_git.bb

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
new file mode 100644
index 000000000..238dbf889
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
@@ -0,0 +1,61 @@
+SUMMARY = "File system QA test suite"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
+
+SRCREV_FORMAT = "xfstests_unionmount"
+
+SRC_URI = "\
+    git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
+    git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
+"
+
+SRCREV_xfstests = "37881397f1aa62df3c63468049c80b301b0e89eb"
+SRCREV_unionmount = "cec4c51a3bf8ba80bb99fc74b302749d4e3d2f1d"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep useradd
+
+DEPENDS += "xfsprogs acl"
+RDEPENDS:${PN} += "\
+    bash \
+    bc \
+    coreutils \
+    e2fsprogs \
+    e2fsprogs-tune2fs \
+    e2fsprogs-resize2fs \
+    libcap-bin \
+    overlayfs-progs \
+    perl \
+    python3 \
+    python3-core \
+    xfsprogs \
+    acl \
+"
+
+USERADD_PACKAGES = "${PN}"
+# these users are necessary to run the tests
+USERADD_PARAM:${PN} = "-U -m fsgqa; -N 123456-fsgqa; -N fsgqa2"
+
+EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
+
+# install-sh script in the project is outdated
+# we use the one from the latest libtool to solve installation issues
+# It looks like the upstream is not interested in having it fixed :(
+# https://www.spinics.net/lists/fstests/msg16981.html
+do_configure:prepend() {
+    cp ${STAGING_DIR_NATIVE}${datadir}/libtool/build-aux/install-sh ${B}
+}
+
+do_install:append() {
+    unionmount_target_dir=${D}/usr/xfstests/unionmount-testsuite
+    install -d ${D}/usr/xfstests/unionmount-testsuite/tests
+    install -D ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_target_dir/tests
+    install ${WORKDIR}/unionmount-testsuite/*.py -t $unionmount_target_dir
+    install ${WORKDIR}/unionmount-testsuite/run -t $unionmount_target_dir
+    install ${WORKDIR}/unionmount-testsuite/README -t $unionmount_target_dir
+}
+
+FILES:${PN} += "\
+    /usr/xfstests \
+"
-- 
2.25.1


