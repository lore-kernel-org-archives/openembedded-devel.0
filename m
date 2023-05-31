Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1412DC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:13 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.11434.1685531592240771762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=e4MyhdjJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-561b7729a12so12290257b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531591; x=1688123591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjzkXBp0cdKErA72NC9e20oHsPJi7VkKGwA2E6OGKEw=;
        b=e4MyhdjJ6QPZHqXDGw3Tay892x/1YHNfEKBUrGcQN608Abk9/RsC8s4z1ba40AS1b/
         qVF+76HXrSzwD6yqiRYOLFR3P8TDeXfOQsq4mSAKHL+NsZYTrp53u+PO4ZoUZUmBR4nZ
         XotHKlGOFnaSmwYqvxLj1P6DqVU/5lWVM9P0vN0H/Q7jiXA+UuDE1J1ETcr1MpKSnobt
         KgBO4VLAVvRb8LeMlPli9PEiP7vpMsBXYukqPzGm61j8k+NuzQk5XQvjvYZCcRHt43JE
         uBv8tKduQpG860t3yDY5km+S1s9PpU/8pMT2Qx7nZ2zyEhfT4pt9p8z4y8FhmQP0Mj+S
         pnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531591; x=1688123591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjzkXBp0cdKErA72NC9e20oHsPJi7VkKGwA2E6OGKEw=;
        b=b96yBZmW/LUhaIF7XNMCTar5enWoDrYKx2gQ5MTHBGP9JB2ApdwcQB6RmtLHMyVSBh
         1FNypwWOYa8VwJWacQADs9UE3EsJAdQwZP0NyjQS+tb+YIGgbSKPS8wzBcfLpezbOpcY
         YiueLHU7jaqptE/u+ycO1/45OAr28GjOoe2kTXMiONQbBo2LcSE9vpIA5qnniXjUYYQR
         /Ir41m7AY92MIqs1vqCRgSlVXfKLcQUyxggQp4psaVpieCvTGYjcUNTvLXIqkpAjwOwM
         tCqWgLE4JJDbSMP524ELmh0ygaP9wG5f+tOO8jKW3W6ygtSWZEQvbfmk+QqPILp60Tny
         p9ng==
X-Gm-Message-State: AC+VfDxRUEE5m1obHMMLYr3ye4JxRPEuMDpnpRoQgyz2xR668CK6p0qR
	SQms0WYIPNlf8gYcaJWq2CTTvWI8EdY=
X-Google-Smtp-Source: ACHHUZ7eCab/eaEvxg4/xHD/RInTONLZmVtNt2248YnYZB/ye1L5NGjzuxRw8VUU1ws4dfjMIo9BEg==
X-Received: by 2002:a0d:eac4:0:b0:561:1cb6:f3d6 with SMTP id t187-20020a0deac4000000b005611cb6f3d6mr5591874ywe.0.1685531591133;
        Wed, 31 May 2023 04:13:11 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 01/36] libencode-perl: Remove buildpaths from generated .exh files
Date: Wed, 31 May 2023 07:12:34 -0400
Message-Id: <20230531111309.2454603-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103030

From: Khem Raj <raj.khem@gmail.com>

there are generated .exh files which has the absolute perl interpreter
path in comments, which is caught by build QA, therefore remove the
absolute perl native path prefix

Fixes warnings like
WARNING: libencode-perl-3.19-r0 do_package_qa: QA Issue: File /usr/src/debug/libencode-perl/3.19-r0/def_t.exh in package libencode-perl-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8e110d9c5cf22520af4b69fe4f6b90709f2c7545)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
index 352517ca67..79934e2229 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
@@ -21,8 +21,8 @@ UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
 S = "${WORKDIR}/Encode-${PV}"
 
+#EXTRA_CPANFLAGS:append = "PERL=../recipe-sysroot-native/usr/bin/perl-native/perl"
 inherit cpan ptest-perl
-
 do_install:prepend() {
     # Requires "-T" (taint) option on command line
     rm -rf ${B}/t/taint.t
@@ -32,6 +32,10 @@ do_install:prepend() {
     rm -rf ${B}/t/use-Encode-Alias.t
 }
 
+do_install:append() {
+    sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native||g" ${S}/*/*.exh ${S}/*.exh
+}
+
 do_install_ptest() {
     mkdir ${D}${PTEST_PATH}/bin
     cp -r ${B}/bin/piconv ${D}${PTEST_PATH}/bin
-- 
2.25.1


