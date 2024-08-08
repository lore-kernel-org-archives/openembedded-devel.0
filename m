Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFFEC52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:38:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.64584.1723135130563512141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rZk75Azc;
 spf=pass (domain: konsulko.com, ip: 209.85.216.51, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cd2f89825fso974987a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723135129; x=1723739929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAo4Wu0f6sYzBeVg88P8DzhF2MYlQsjJoiH3P5BIjIQ=;
        b=rZk75AzcT3jjke0dn5D/9oMtjyX4SyUvTOzoyCJmc8C+bB90LcSwgC8jYvbUqVoLJV
         AU2wmkkpMuFArJNt8qkk+94qmnlaTvL4FlAXyByiZHURlEx/eA4fGfkSIzjYfH/cIg4d
         6AM0WNfgR3eIuFjQfYK9gR8fQNdFSIPP3gDF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135129; x=1723739929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAo4Wu0f6sYzBeVg88P8DzhF2MYlQsjJoiH3P5BIjIQ=;
        b=KxGkxvVhOqMs99rkiw1H0fteisQ4Oh16Qj1IS31pCzajej9IwqMCtJGyC20jXJfPXC
         3Xq+GsvDOejKeKSGHmdYRvjAKI0BdseaDmbYUH86f9UeP0e66s1m/aRoHsIvOWbKvZhj
         CNZM9C1WK5xGab9195s7IIx4DLBHjPbCl49tJwrRBTHt2wr8Cyi5miIeCLKBYlqQ936q
         LQEVDZ65KWhzVABt9ETLaCJ6sN6v19OAEM21qzkoygFC+1/OnkQepoQd156yqCRvBMYs
         SIngDZhIKLLO8+C3dtTSJ+SKTgV09IlZlX4EDewdY93sC7dLOrDHE4QE2fFEfHHiiXMf
         pV1Q==
X-Gm-Message-State: AOJu0YyuQXirf8I2v5oU+o2JTgU2ol1+7z1wYhIcsNDcQ/BJ3oWTbVbn
	O1ZeShgklhbHNAK0j1kH9luZV5LbGIEkl8gp2Q/9R1c3akVmpQinsRxe7izky4jDGl/RBMkNGEC
	8pjM=
X-Google-Smtp-Source: AGHT+IFhlhSTQ9HLtG76FxUokigBsi2OBxTwMOaep3Odpp3oJFpBm5nVdLydZs3tDlXEeWHII5U0Og==
X-Received: by 2002:a17:90b:3e8c:b0:2cc:ff56:5be1 with SMTP id 98e67ed59e1d1-2d1c3373414mr2845093a91.7.1723135129456;
        Thu, 08 Aug 2024 09:38:49 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9db0341sm1341991a91.39.2024.08.08.09.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:38:48 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-tzdata: enable ptest
Date: Thu,  8 Aug 2024 09:38:39 -0700
Message-ID: <771bd809df2cccb45e6553aa7c60bd476ea2a3a0.1723134758.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>
References: <cover.1723134758.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111671

From: Tim Orling <tim.orling@konsulko.com>

Add to ptest-packagelists-meta-python.inc META_PYTHON_PTESTS_FAST

Install ${S}/VERSION to PTEST_PATH for test_version

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../include/ptest-packagelists-meta-python.inc     |  1 +
 .../python/python3-tzdata/run-ptest                |  3 +++
 .../python/python3-tzdata_2024.1.bb                | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tzdata/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 56a5cf2f09..aa918aa89c 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -74,6 +74,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-tomlkit \
     python3-trustme \
     python3-typeguard \
+    python3-tzdata \
     python3-ujson \
     python3-u-msgpack-python \
     python3-unidiff \
diff --git a/meta-python/recipes-devtools/python/python3-tzdata/run-ptest b/meta-python/recipes-devtools/python/python3-tzdata/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tzdata/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
index d73b27a4f6..f4454f6dff 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
@@ -8,3 +8,17 @@ SRC_URI[sha256sum] = "2674120f8d891909751c38abcdfd386ac0a5a1127954fbc332af6b5cea
 
 inherit pypi python_setuptools_build_meta
 
+inherit ptest
+
+SRC_URI += "file://run-ptest"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-pytest-subtests \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+	install ${S}/VERSION ${D}${PTEST_PATH}/
+}
-- 
2.46.0


