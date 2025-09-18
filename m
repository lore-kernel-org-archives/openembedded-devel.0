Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83785CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:10:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.8794.1758183045612002622
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIcboQom;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3dae49b1293so285710f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758183044; x=1758787844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/elPKZfwwe7nS/5ffr73ancp/PqZhoLKclBROkOEMGE=;
        b=DIcboQom162IXn5g9ifchssPnv63NtsCxeG70gSMvzd5cw0u2AqbLtPyjxKZ60ItNp
         UYahr/q0P7626tmYCMIAm5bwtq4WbWezS1pAmaetHk4jtDS5CHpJPDh2+s4oq7nWvd9X
         ov4kwdd+wmFhS0cLuG+noLM6sweNZe60nL0nZj4CDl3OKG7/00gs06hS2BVtBtFkC24i
         jvB+fVCQ6AcPQ17UVj001ycF5Ouip//1OVm8ij+QSmTkr2CbpEGNYgU5Mbz6cit+dBEU
         FxD7XM49zyrvVEF8056CckAGe89nOFhxj/wziTtX/wf5VlIanKfoIyjpR+k7h6csG5Do
         Q6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758183044; x=1758787844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/elPKZfwwe7nS/5ffr73ancp/PqZhoLKclBROkOEMGE=;
        b=HKj1BO4Rme+85Dhs4aRtqKHUXohlymMuG6vVojIqxgZxjwE7wm9JoHp1oUB+A11wwW
         kJUgBwuvhL5QXarUQ+Qd0TcohvpOc5D+sFQiRB33zZOpiVFJpPw82eYXlJqXrEN5MG6i
         3lVuNrQswkWtUp9qZ6eHpi9g200S+sCjUQMQgBHSSKG8A+v39pW/rJAS8ij7chmo8xv2
         sMyLNgsaWC7uGvJDGrz2/9CEUHxRUvPqF71y3CbAuwTtfvRXkd6ZlPYIArrtYqe94ugK
         f4f5wqBuCIBFheHsOPE15YweRhcWCpjIlHiXQFCL0i4jIoVdiZtvkKyNukH8YmIqzFC4
         jmqQ==
X-Gm-Message-State: AOJu0Yx/Xt1Hh+LspLyh+3gl+pFK2howLByoXUshnlz6xymbBSSoijb5
	koKisqGC8RBcm6IVfuUHeKWu6c986xFnr36uw7+HufnOBp8eD286E+SwOc77HQ==
X-Gm-Gg: ASbGncu9LczoiXvYhjbQisFB0qbEu/aYTPDVVohomXXM+TgECvHyiae226r49A0fO0R
	7YafZ28qABrgXfBd53Zv5i6jFW2aLvXjAwZqbjuKUbqKq1vXZHIMRrtY4nnWiuB/MlrxsbjDgWE
	GdwnBMN+oNrNCroANVb4PIE3iYNJlzk+x7WALStYeHWdw7eoWofUOie7CchSG6haWlaMALF07Fe
	DdksJwLlLUc/X4vKkBLjOWz9Qsb37jPHMHiXhqRfzNOLRFoDHul0ll94z2sitlsSzFuS30f3e8g
	ZYIjGswgUlaQFKsjpFFR6uBiaBDrhCT566lwm33l60Ejue6bmO7OjKLldf3OS7NSd5RPsegejyE
	0ta+4N6hMslI5K/NY2lad3yO2j/EoFNNHm/lB5pfP4xKI
X-Google-Smtp-Source: AGHT+IFqOME08rfwj2np5/HZY19vSexNpmuIGDVlU1tR9ztfROMhjBSUW6aHluDpIgSbBpj80xLqYg==
X-Received: by 2002:adf:f3d0:0:b0:3ed:e1d8:bd68 with SMTP id ffacd0b85a97d-3ede1d8c0d4mr1413744f8f.7.1758183043753;
        Thu, 18 Sep 2025 01:10:43 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7410sm2512786f8f.35.2025.09.18.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 01:10:43 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] python3-icu: upgrade to 2.15.3
Date: Thu, 18 Sep 2025 10:10:33 +0200
Message-ID: <20250918081033.1229869-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 08:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119538

From: Martin Jansa <martin.jansa@gmail.com>

Drop 0001-Remove-assert-checking-for-trivial-type.patch
which was resolved in upstream by:
https://gitlab.pyicu.org/main/pyicu/-/commit/82fa082b149db81c894e0d887c0fff67c3d2826f

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ove-assert-checking-for-trivial-type.patch | 26 -------------------
 ...n3-icu_2.15.2.bb => python3-icu_2.15.3.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
 rename meta-python/recipes-devtools/python/{python3-icu_2.15.2.bb => python3-icu_2.15.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
deleted file mode 100644
index 4c75eb5f7b..0000000000
--- a/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 3d58fb48bb1cef2177aab8e291167638993495f4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 3 May 2025 21:27:34 -0700
-Subject: [PATCH] Remove assert checking for trivial type
-
-This fails with GCC-15, is_trivial is deprecated in C++26
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arg.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arg.h b/arg.h
-index a493d11..6cb232d 100644
---- a/arg.h
-+++ b/arg.h
-@@ -853,7 +853,6 @@ public:
- };
- 
- #define _IS_POD(T)                                      \
--  static_assert(std::is_trivial<T>::value);             \
-   static_assert(std::is_standard_layout<T>::value)
- 
- _IS_POD(AnyPythonObject);
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.15.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.15.3.bb
index 8331f9175a..1f5cf6d042 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.15.3.bb
@@ -10,10 +10,9 @@ DEPENDS += "icu"
 PYPI_PACKAGE = "pyicu"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "561e77eedff17cec6839f26211f7a5ce3c071b776e8a0ec9d1207f46cbce598f"
+SRC_URI[sha256sum] = "f32e78e1cb64d0aeb14f027e037a8944861d3114548818a6adf0081ef51aefc3"
 
-SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch \
-            file://0001-Remove-assert-checking-for-trivial-type.patch"
+SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
 inherit pkgconfig pypi python_setuptools_build_meta
 

