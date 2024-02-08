Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F776C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 16:51:51 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.312.1707411105893508554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 08:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q+qBELJU;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a38291dbe65so248302166b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707411104; x=1708015904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Sl3K2KdIj40l9ttCtFsHOZYdW3CA/0KX2A1wIMu1CE=;
        b=Q+qBELJUq7ZdGiviDP15SDNRK/VSk73LyQLpbvuA3wcVSoYteaMlYHxK/LiNgk4k9g
         dPoeYehX8D24uPDJ0XU+xr6GkDIPJodKFIfci3Pmp1twRTMXzkELhy4EXHxmDriJMire
         NQHxYKy6D7M17ICPslQwEi4o+IbqliddE2YQPcx0tXu3pHs2poiiyE4/SHhCKJxFQDkV
         /gs14irS6a4aX4p4v0QntTWtlhWPMQHjKH48WK+MJZ6lSKk9Dg3LjMM9VNFcjf4um1jC
         Ju+NGmZlYKjKkRk+ij6KCH5ZR5nD1a7+D0+mAQRpfxM9r+Zp0E4sNbW4gSql7S9TIMkS
         Iong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707411104; x=1708015904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Sl3K2KdIj40l9ttCtFsHOZYdW3CA/0KX2A1wIMu1CE=;
        b=wfB0Dlitt8J0+C1Vos83iDxcWE3+tvkL6dKQYKfBzVw33YiMDmpIJLpUOSl6G0VFqj
         XQasz88m+uugmaBUvs7T4HoqLJnoLCnF7lNDfseu0XppU8lIw8bgMd1e2Ldlyiv51Lrq
         /LxiGIWTUPut6D63k8QK6DzCBx8I4s9uVj/ZXtxnrLhYKKbpeWmNFrqqoZmvOU7VzEsT
         jKYPMpNvm2s7D3VM1mt9B1ZqFNuRJa5m6/s1Ve813JvMOCPP0p7x1bEpP2B3Sznoj+SW
         upYp9GyiQ1NbQ3zwuLQOykW7CGU8Cwszcf7OhT7/UMEjq3YTIA0oN1hzFzeWBq9TDsxn
         a02Q==
X-Gm-Message-State: AOJu0Ywh1B4fRekw9LHVtYmxc4VaskNYfQ7fmRi1SPIBD4ZBQWgxajA8
	YntgNLJ0nJvP4wet99a7drhbSX90u8LPtmSxwbRi30eMvtu2eVtoXdxL57q/
X-Google-Smtp-Source: AGHT+IEcJnfDnN6B7aFI8pz/e4fSZnBedCtqBFpiB/VFOPVDbejImGxGgQh7UxdFlwClEfEzyDXIrw==
X-Received: by 2002:a17:906:1e4d:b0:a37:5bf7:f64a with SMTP id i13-20020a1709061e4d00b00a375bf7f64amr7718835ejj.41.1707411104157;
        Thu, 08 Feb 2024 08:51:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4lv61ex03eVo2mgyxhPckLdasgoqrnFznHBUftmnuvHwpxcIPvKDwuoDnw0qBzXfLkbvFGLMVJ3rUrQFM//dCIDLk3imvfQyD+6BZYhnK+0MYsMb0sxtfrgzu2wBXQldixt3EQvsX0OmDvnCQ2NsymUWNQtmIt3M=
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id tb11-20020a1709078b8b00b00a372b38380csm236150ejc.13.2024.02.08.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 08:51:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: uvv.mail@gmail.com,
	wangmy@fujitsu.com,
	Vyacheslav.Yurkov@bruker.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH 2/2] xfstests: drop the upstream rejected install-sh hack
Date: Thu,  8 Feb 2024 17:51:35 +0100
Message-ID: <20240208165135.2026155-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208165135.2026155-1-martin.jansa@gmail.com>
References: <20240208165135.2026155-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 16:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108673

* I'm trying to fix random build failure from world builds:
  tests-install sometimes fails as shown bellow:
  cp: cannot stat 'group.list': No such file or directory
  ...
  mv: failed to preserve ownership for 'group.list': Invalid argument

  whole log:
  2023.10.29: http://errors.yoctoproject.org/Errors/Details/752403/
  2024.01.14 http://errors.yoctoproject.org/Errors/Details/752404/

* Interestingly I finally triggered this error for first time in my
  local build (when rebuilding it after reverting this upgrade -
  which might be just coincidence), here is the log:

  While looking at this a bit more, I've noticed that install-sh in:

  # install-sh script in the project is outdated
  # we use the one from the latest libtool to solve installation issues
  # It looks like the upstream is not interested in having it fixed :(
  # https://www.spinics.net/lists/fstests/msg16981.html
  do_configure:prepend() {
      cp ${STAGING_DIR_NATIVE}${datadir}/libtool/build-aux/install-sh ${B}
  }

  is copied only to ${B}, but Makefile still has "cp include/install-sh ."
  which was removed in proposed change for upstream:
  https://www.spinics.net/lists/fstests/msg16899.html

  but here it isn't, so shouldn't we copy it to ${B}/include to make
  sure that make won't use the old version?
  So I've tried to add:
    cp ${STAGING_DIR_NATIVE}${datadir}/libtool/build-aux/install-sh ${B}/include

  in do_configure:prepend and then I've triggered the build failure again
  this time with 2024.01.14 version as well by running:
  for i in `seq -w 1 100`; do bitbake -c cleansstate xfstests; bitbake -k xfstests 2>&1 | tee log.xfstests.$i; done

  so the issue isn't fixed in the 2024.01.14 version, but maybe it's
  a bug introduced by our install-sh?
  It was rejected by upstream in:
  https://www.spinics.net/lists/fstests/msg16928.html

    This install-sh has been used for performance reason, I'd like keep it
    if possible. Would you please describe the failures you hit in
    cross-compilation env? It'd be great if we could fix the env issue.

  Also the important error isn't:
  "mv: failed to preserve ownership for 'group.list': Invalid argument"
  because that's shown in all the builds:
  xfstests $ grep -c "mv: failed to preserve ownership for 'group.list': Invalid argument" */temp/log.do_install*
  2023.10.29-broken/temp/log.do_install:14
  2023.10.29-broken/temp/log.do_install.1094046:14
  2023.10.29-fixed-after-broken/temp/log.do_install:14
  2023.10.29-fixed-after-broken/temp/log.do_install.1094046:14
  2023.10.29-fixed-after-broken/temp/log.do_install.1120923:14
  2023.10.29/temp/log.do_install:14
  2023.10.29/temp/log.do_install.1094046:14
  2024.01.14-ok/temp/log.do_install:14
  2024.01.14-ok/temp/log.do_install.1186155:14

  but the "cp: cannot stat 'group.list': No such file or directory" which is shown only in the ones which in the end failed:

  xfstests $ grep cp */temp/log.do_install*
  2023.10.29-broken/temp/log.do_install:cp: cannot stat 'group.list': No such file or directory
  2023.10.29-broken/temp/log.do_install.1094046:cp: cannot stat 'group.list': No such file or directory
  2023.10.29-fixed-after-broken/temp/log.do_install.1094046:cp: cannot stat 'group.list': No such file or directory
  2023.10.29/temp/log.do_install:cp: cannot stat 'group.list': No such file or directory
  2023.10.29/temp/log.do_install.1094046:cp: cannot stat 'group.list': No such file or directory

  So I guess we should just drop this install-sh hack from do_configure completely
  as cross-compilation seems to be fixed upstream already in:
  https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=5d20084fefaf09e86be26d7c71bd1c7ac2a2b35c

  xfstests/2024.01.14-ok/git $ git log --oneline include/install-sh
  fa993e51 include/: spdx license conversion
  da7916f7 build: Use the original install-sh file from SGI

  xfstests/2024.01.14-ok/git $ git log --oneline install-sh
  5d20084f build: allow cros-compilation on chromeOS
  e3ca126a xfstests: respect DESTDIR when installing
  fa6a7868 xfsqa: more sh to bash conversions
  491d467f Add GPL license plate to SGI's files.
  d259454b Update copyright annotations and license boilerplates to correspond with SGI Legals preferences. Merge of master-melb:xfs-cmds:24329a by kenmcd.
  3ef12e38 Update copyright dates (again)
  bc4eb461 Undoes mod:     xfs-cmds:slinx:120772a Undo xfs-cmds:slinx:120772a, inadvertently whacked a previous mod.
  8ce73f86 Update copyright dates
  db6944ec need a copy of this here too.

* buildhistory doesn't show any difference, so all the
  files are installed in the same location as before

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../xfstests/xfstests_2024.01.14.bb           | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
index 33d441e41e..711637a70d 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
@@ -16,6 +16,7 @@ SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
 
+# brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that's not the only issue)
 inherit autotools-brokensep useradd
 
 DEPENDS += "xfsprogs acl"
@@ -44,15 +45,22 @@ USERADD_PARAM:${PN} = "-U -m fsgqa; -N 123456-fsgqa; -N fsgqa2"
 EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
 
 TARGET_CC_ARCH:append:libc-musl = " -D_LARGEFILE64_SOURCE"
-# install-sh script in the project is outdated
-# we use the one from the latest libtool to solve installation issues
-# It looks like the upstream is not interested in having it fixed :(
-# https://www.spinics.net/lists/fstests/msg16981.html
+
 do_configure:prepend() {
-    cp ${STAGING_DIR_NATIVE}${datadir}/libtool/build-aux/install-sh ${B}
+    # this is done by Makefile configure target, but we don't call it in do_configure
+    cp -a ${S}/include/install-sh .
 }
 
-do_install:append() {
+# Not sure if this is needed, but with old install-sh it was sometimes failing with:
+# cp: cannot stat 'group.list': No such file or directory
+# http://errors.yoctoproject.org/Errors/Details/752404/
+# PARALLEL_MAKEINST = "-j1"
+
+do_install:prepend() {
+    # otherwise install-sh duplicates DESTDIR prefix
+    export DIST_ROOT="/" DIST_MANIFEST="" DESTDIR="${D}"
+    oe_runmake install
+
     unionmount_target_dir=${D}/usr/xfstests/unionmount-testsuite
     install -d ${D}/usr/xfstests/unionmount-testsuite/tests
     install -D ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_target_dir/tests
-- 
2.43.0


