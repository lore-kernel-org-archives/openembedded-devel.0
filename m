Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0326FC7EE2F
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:36:38 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.3271.1685151397318220676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 18:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZogTgjDe;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-53f448cde66so1217459a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 18:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685151396; x=1687743396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94OstvN65kcQ49dTc5i+WyAxyNmwswWfXFAzUYf+euQ=;
        b=ZogTgjDeesrVLdDHbOxBB7bxlZsFEBRyOCRDK+beWERvJcafs83m1Bcfn6iNO5HXBQ
         FAj1cl8l0WOSzQwgarCYDWfKzgwywjVcXP2v78k4ZGgJ3XBVdPijDuIEAhbbBhDuFfti
         G62B0OB4bo/tR8WGoOz7E3WZMRr7QZZ8PBlip+DVZyEYKY2WWMRpQQJnJVRQwpvWm1f0
         4rDhXENWea6Uj7l2WlhCVjYdZ7WlGMzdeRpwJK4/ClBE2jJfprDlugDnd6yJDwVz9id5
         po76ghp68lH+JCQUtQKJ41EWW585wjzlfR5JXofsW8CbpKxbq1keSL/hBT/py0rSgLm0
         i6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151396; x=1687743396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94OstvN65kcQ49dTc5i+WyAxyNmwswWfXFAzUYf+euQ=;
        b=cMEQfOPLavc/3IGnG9gRBKHAd+wSgxq59tZTknwsr+p3UtKebzr9ZMby5+Q2AcHVTo
         DAmsUGpwBcNGhKmczzip2yAiC/7zUWrTgHxZ1H2oEP9QS/+QS41dpwkO89ljpo2GyEZ+
         Nb5ZKk6QWE88zyDb1Ij0viop//7G30Z2tsVbdTuE7g1D9ArCMN9qbEu3X1nZbCk79nbQ
         /VF4mMV8/dPSr1C1r+3bXFWC5EyNNHQ28E2LsAusmOCKc6DBu6Dkmo1ZAMGP8989fiXD
         Bar2CLi2mk3cYCQ7ayiQN/WaeRt0Tjx9UQXxYHuKB/QdBXn3zdig7XdSRv71JPQpTeLr
         gq9w==
X-Gm-Message-State: AC+VfDwdhpuRHfqepQQGBjJ60euALtIGbK4gQG3xhJa712zh2uJGaF+e
	4mBMLk4Lw83ZvxQ2vw+AdkucTY3E4s8=
X-Google-Smtp-Source: ACHHUZ7C04SjR32t2kIqZB3jMpsWO37O4itkYeZiwpfIbJMiAaseTEjHaJhvxU1+4PzdKKCgY10irA==
X-Received: by 2002:a17:903:1246:b0:1ad:cb4b:1d50 with SMTP id u6-20020a170903124600b001adcb4b1d50mr4894278plh.43.1685151396410;
        Fri, 26 May 2023 18:36:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b001aafe4f9b8esm3802191plp.180.2023.05.26.18.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:36:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] libleak: Upgrade to 0.3.6
Date: Fri, 26 May 2023 18:36:30 -0700
Message-Id: <20230527013632.96030-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230527013632.96030-1-raj.khem@gmail.com>
References: <20230527013632.96030-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 01:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102876

Do not overwrite cflags when calling make on libwuya

Fixes
WARNING: libleak-1.0+gitAUTOINC+ea2bb608ae-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libleak.so in package libleak-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-respect-environment-variables.patch        | 13 ++++++-------
 .../libleak/{libleak_git.bb => libleak_0.3.6.bb}    |  5 ++---
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/libleak/{libleak_git.bb => libleak_0.3.6.bb} (92%)

diff --git a/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
index bbdfa3c960..979fd323ae 100644
--- a/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
+++ b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
@@ -8,18 +8,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 1d70f17..c7e726e 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -1,5 +1,5 @@
+@@ -1,8 +1,8 @@
 -CFLAGS = -g -O2 -Wall -fPIC -Ilibwuya
 -LDFLAGS = -Llibwuya
 +CFLAGS += -g -O2 -Wall -fPIC -Ilibwuya
 +LDFLAGS += -Llibwuya
  
  libleak.so: libleak.o
- 	CFLAGS='-fPIC' make -C libwuya
--- 
-2.30.1
-
+-	CFLAGS='-fPIC' make -C libwuya
++	make -C libwuya
+ 	$(CC) -shared -o $@ $^ $(LDFLAGS) -lwuya -lpthread -ldl -lbacktrace
+ 
+ clean:
diff --git a/meta-oe/recipes-extended/libleak/libleak_git.bb b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
similarity index 92%
rename from meta-oe/recipes-extended/libleak/libleak_git.bb
rename to meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
index a83a11c684..e3e4c01acb 100644
--- a/meta-oe/recipes-extended/libleak/libleak_git.bb
+++ b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
@@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=18;endline=21;md5=de4f705f12cdedb
 
 DEPENDS += "libbacktrace"
 
+PE = "1"
+SRCREV = "1c56b0a2ba643db976f589ec04b246e693b6c0ce"
 SRC_URI = "gitsm://github.com/WuBingzheng/libleak;protocol=https;branch=master \
            file://0001-respect-environment-variables.patch \
           "
 
-PV = "1.0+git${SRCPV}"
-SRCREV = "ea2bb608ae25701692269a37d39d77e966b887ac"
-
 S = "${WORKDIR}/git"
 
 do_configure () {
-- 
2.40.1


