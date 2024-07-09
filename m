Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605FBC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:01:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.7140.1720508477117499518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O8CmI/TM;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b0116588cso341863b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 00:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720508475; x=1721113275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8c9fN7NRUcDEXB9gtvRRxOjcYoelvwzur9d0VofK4vU=;
        b=O8CmI/TMsuKbC5/qGxQXW97QaAsxKZe89XndXhZKU8S92zYM7Ki/DFwPALaIaGyid6
         N9DkfpupO+gZwytJsobAJpGWbKiNZGzSXj0wGligFcbm56uO0evcEgPofdamhBCtXBKT
         Oo+0pZPznRapgYHcU5eN0mmJ2SdUgXtVbG2QO2XisUgZIOOp+7joTSkYGFmfwZK8vf9c
         tmlNW605h82PPWPn1VX21lrvBtn3zwvsw881b5zpX9UwcO5QjzWOtwlrPEYc5DAD1co1
         NYUG4gFGxsnBzDr2c99seu1HY7F4eNosiR2Zzn4/vtrTUZMEuqiEfLvLqrsFDYxApldK
         9GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508475; x=1721113275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8c9fN7NRUcDEXB9gtvRRxOjcYoelvwzur9d0VofK4vU=;
        b=VNnQ7zwMlEGVv0baZp28GPZgrj6sN9dEFmsgMQMo15WR7y1F+FNjhZkCauiMxMCZvR
         w85fYnrUDq4Jb6cJocJhWH/pXJgDHnHK8MVqPkzDxP45WHKqSl/38wDFpQGkOGpeQhbd
         PR1H8LArngE5OP8h99cUF1ODqfOD4wT0ylyccauDfLh5k+9iMabc9Krt2TrulQV1j9wK
         vVQYRifYWdFoMx8IKaIbpWmbpqXVq5JnWAIWchCO5g40myz+kIfzZhp5koQDDvzjcooO
         5XCFVmvizKRMLgSLguhXruG9My9cxWZ/VI9wRLupBNGYJp9+JU6RFNVKGfHjpgWepLiz
         +y/g==
X-Gm-Message-State: AOJu0YwUFWv9u3lYeJs8ZLlE/cXRzmk8cAuwow51YtB5vWVdtpR10ZAs
	gdCmkEWwpnqDTOhX1ZFTL3StQTEwudjpEVieMtLWp68EhB1NQ9lmL6jJ/g==
X-Google-Smtp-Source: AGHT+IEaWbGoLHnVZCu4xBOLFe+lHSmUkIXjXZBc0GQU3TXYNkTiCaP1/jGJAAnowbcAzclnpMOr1Q==
X-Received: by 2002:a05:6a00:218f:b0:704:173c:5111 with SMTP id d2e1a72fcca58-70b437520efmr1952674b3a.3.1720508475420;
        Tue, 09 Jul 2024 00:01:15 -0700 (PDT)
Received: from L-18010.kpit.com ([116.74.193.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b5585sm1040829b3a.188.2024.07.09.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:01:14 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akash.hadke@kpit.com,
	BINDU <bindudaniel1996@gmail.com>,
	Ivan Stepic <Ivan.Stepic@bmw.de>,
	Armin Kuster <akuster808@gmail.com>
Subject: [oe][meta-oe][master][PATCH] flatbuffers: adapt for cross-compilation environments
Date: Tue,  9 Jul 2024 12:30:59 +0530
Message-Id: <20240709070059.179927-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 07:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111277

From: BINDU <bindudaniel1996@gmail.com>

Flatbuffers contains a library and a schema compiler. The package
contains cmake files to discover the libraries and the compiler tool.
Currently, all of these cmake files are installed into the target
sysroot. However, the compiler utility isn't installed into the sysroot
(as it is not runnable on the build machine).

When an application that depends on flatbuffers gets built, it uses
flatbuffers' exported cmake targets to configure the project. One of the
exported targets is FlatcTarget.cmake which expects to see flatc binary
in /usr/bin of the sysroot. Since binaries for target don't end up in
target sysroot, cmake configuration fails.

This patch addresses this problem of flatbuffers' build infrastructure
in cross-compiling environments. By removing FlatcTarget.cmake for
target builds from the sysroot we essentially skip this step of
flatbuffers' configuration.

Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b97dbaac6629e22138f71ae19eb421d041447619)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
index 183554e2c..3103fd009 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -23,6 +23,11 @@ EXTRA_OECMAKE:append:class-target = " -DFLATBUFFERS_FLATC_EXECUTABLE=${STAGING_B
 
 inherit cmake python3native
 
+rm_flatc_cmaketarget_for_target() {
+    rm -f "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
+}
+SYSROOT_PREPROCESS_FUNCS:class-target += "rm_flatc_cmaketarget_for_target"
+
 FILES:${PN}-compiler = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


