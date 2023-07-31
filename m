Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4018EC001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 06:29:05 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1929.1690784936933543868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 23:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nYp2CnaX;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68336d06620so4180873b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690784936; x=1691389736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3ko9uVpGdr01Cj1LSrkzyCJNf/ZZnrRBzIKNzMbgzA=;
        b=nYp2CnaXWYGPtXV1GzsF0jo/On8sURSfkhbTIQgUccAIWHcaw5P7oE9kpCJa0U4qCD
         bYKQbij01S4Rnan05JllC034lAVLgkK+ByDrkCttw4sGpRtQcj9jUNsupYQz+H67ybw7
         2XNws3qyfSTixZCVwTr9O6/CWHyFRMbk2ZjMY9rliFlEoQhXap3CrhqJOBab1tW9/FGA
         GzaeVjZToaCq8JAIb+jMBFTOL5JM3P8pFyu5htzNpdwwz5hNWAQxGEGcuaC+wIFSHjVq
         LWP5zAoI6JPuahP8cUBZ2vX1ERSuiF/CIkVHremBERTjRgx6NHKt7LOE/TLRyk2GzPZg
         36BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690784936; x=1691389736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3ko9uVpGdr01Cj1LSrkzyCJNf/ZZnrRBzIKNzMbgzA=;
        b=GNChDHIdCg8KX1wWVVGPBFSiEe5sK2dPN7nMT6K+f7fm4Laq9bqkte1TYn60IaNsMj
         HwH2U3Cpq7/hiAqhIqQZiUNgeFjtBL+LvdFvavAnfEyqfRbkNDa2xN3g8WqEMwwO32f4
         pNF4qJRi1ng3UGKKXQvxoh8bGobveOAY2W1HMmho/okJnuJmC6UYxdmBigPL02StZ8M1
         6wB6UAYviDpJes83EhUbLFVRJkkB5YzJB//uj1c2FmCg6NuSWW1MOeXCmBnaGZsL6w2n
         RELiK+9aKhiUSitLTKtxoLfCU5l24BGC/SX3J/TX5/PS81IJEMr65TxyxKj0RJ816/5G
         ApyA==
X-Gm-Message-State: ABy/qLaPIZxhE+dwT8ip+LgUpVuH9qTPdhlqE80whp6AifTzIKZbDS6a
	N4SIhQHwFSPhtAONVuwdWXdBgh3SZ2HQ5g==
X-Google-Smtp-Source: APBJJlF8rffivVGLdIk00G39RA6euPrbVOcOMXdgZARGTIlaWvG261Y8/acv6i5jB7rNVFTOg0qu2Q==
X-Received: by 2002:a05:6a20:a121:b0:13e:1945:8873 with SMTP id q33-20020a056a20a12100b0013e19458873mr698216pzk.37.1690784935893;
        Sun, 30 Jul 2023 23:28:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::141c])
        by smtp.gmail.com with ESMTPSA id x26-20020a62fb1a000000b00686e6e2b556sm6768406pfm.26.2023.07.30.23.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 23:28:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Fix ptests
Date: Sun, 30 Jul 2023 23:28:53 -0700
Message-ID: <20230731062853.239280-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 06:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104155

testrunners file was coming out to be empty after anon python was turned
into a prepend to populate_packages which is executed during do_package
and hence POCO_TESTRUNNERS was not populated when it was used during
do_ptest_install now. Therefore alter the logic to collect the list of
tests to run into testrunners file. Also package the ignore file which
is platform specific, here the lnx version is packaged and specified
using -ignore cmd to tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 2 +-
 meta-oe/recipes-support/poco/poco_1.12.4.bb | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index c9896eadee..521cc08a75 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -3,6 +3,6 @@ while read runner; do
   oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
-  ./$runner-testrunner -all
+  ./$runner -ignore $oldpath/cppignore.lnx -all
   cd $oldpath >/dev/null
 done < testrunners
diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 51bd5611fb..47dac1a89e 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -72,17 +72,14 @@ python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')
     pn = d.getVar("PN")
     packages = []
-    testrunners = []
 
     def hook(f, pkg, file_regex, output_pattern, modulename):
         packages.append(pkg)
-        testrunners.append(modulename)
 
     do_split_packages(d, poco_libdir, r'^libPoco(.*)\.so\..*$',
                     'poco-%s', 'Poco %s component', extra_depends='', prepend=True, hook=hook)
 
     d.setVar("RRECOMMENDS:%s" % pn, " ".join(packages))
-    d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
 }
 
 do_install_ptest () {
@@ -90,7 +87,11 @@ do_install_ptest () {
        cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
        cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
        find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
-       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
+       rm -f ${D}${PTEST_PATH}/testrunners
+       for f in ${D}${PTEST_PATH}/bin/*-testrunner; do
+            echo `basename $f` >> ${D}${PTEST_PATH}/testrunners
+       done
+       install -Dm 0644 ${S}/cppignore.lnx ${D}${PTEST_PATH}/cppignore.lnx
 }
 
 PACKAGES_DYNAMIC = "poco-.*"
-- 
2.41.0


