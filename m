Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3155AC433EF
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 08:41:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.23291.1653813686530338434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 01:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fuH6QMb0;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so4890670wmb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YczZfvjZE9yKil98jGctnL9ni5bh5vcQIkBmGEsiJRI=;
        b=fuH6QMb08/ZbYo2O+0f3WjB6udCsSchhezTAXNLWppXvUW1C7PcetGahZNRsZVgDx2
         ZaY+O1y4ainyOawgr5XJPuvKcTn7KjAtk3qP8DrY29LGtVKRBLFERkTKm7ttA0v6r3UD
         wwL5MieSGg6TiiR+C8AGX9xMzo7VGX26lQp7yxd5Xs8FdxX7aDB+No/2tT1dPshN15yR
         UArWuMVTXLRTJLK4WGDGxb2+Je13FTDEbQM5qRWWOP2lsamq2WywE5uL29RpZqBBmHen
         DhklqXWuJPsIfcAc6BV2WiKCMDWvWZGtHbrXMyOhSStQlNJI67Ent/jqNs5np3reE4Sw
         dZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YczZfvjZE9yKil98jGctnL9ni5bh5vcQIkBmGEsiJRI=;
        b=N/NVQ9alBvGQbPmm6MC0VEMys6Fg/jdxBGB3vlaBFELxaWo8qwg+tqmG4YvhHTPpkb
         +W8LkDOyfRtmeQIETbtwJUT2dFVvBZpqjEUmxoI8KvYHY41sFaw4aOTowa2eY9tJRGAz
         0pNOCsdqFttSeVOU0J0bcMvWgBPKirAoBGe7Qqzh0U5u9JEPNtKt8t7SEOPMio1tLmMb
         3KPAoAowiid8LPc734l8gMJgThrWP42T4qCxH6LLmKLfZMD4A9ccMcX31+Ka+BFc6cPF
         uJbhA9x50R21alvAtooKyc2RRgOebm9mXvhI4o7ATCY7rHS2YLjsKS5jSCehJ5LLUmf3
         6YWg==
X-Gm-Message-State: AOAM533VJCkmgicy3qdxCyV41FnnosaZlSkn82jJ9Rx1PJSkQI7fqMYH
	Pgm5FFfTPmIIlfxS07vGVcWKTuZsbHgLDg==
X-Google-Smtp-Source: 
 ABdhPJzSSMnfaYeQ0bXlvosCKnmi0f+tyEMWwc85mdY5WHWU5s6ojELH990xiOxtihNamm8iUedhYQ==
X-Received: by 2002:a7b:c8c5:0:b0:397:6bd7:c967 with SMTP id
 f5-20020a7bc8c5000000b003976bd7c967mr14086989wml.106.1653813684597;
        Sun, 29 May 2022 01:41:24 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-234.002.205.pools.vodafone-ip.de. [2.205.7.234])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a1c7c0f000000b0039756cdc8e1sm6831593wmc.37.2022.05.29.01.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 01:41:24 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH v2] xfstests: add new recipe
Date: Sun, 29 May 2022 10:40:50 +0200
Message-Id: <20220529084050.3660792-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 May 2022 08:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97316

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

File system QA test suite

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 .../recipes-utils/xfstests/xfstests_git.bb    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests_git.bb

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
new file mode 100644
index 000000000..868fa0330
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
@@ -0,0 +1,61 @@
+SUMMARY = "File system QA test suite"
+LICENSE = "GPL-2.0-only"
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


