Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FF4E7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:11 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.679.1736539750405624149
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso165833539f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539749; x=1737144549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYaR5rEy6+UWK+9iTlu4fddcCLaUUHw7VZBgwJ8Q30I=;
        b=klGeTYKHi+3vS9yE5RELacXjKCSD3KQy5rML0ae5pd9Eij4o0cxBPtrFsgRatuD6iW
         JG0nknC+/hS8ix5Bv3Y72Sj5ovqwjGhaEAFdJUNLcPGa3A581P7SxsTnrojaRtfZgQ8O
         Xk8yzeAo3zWFur9Y55VkPY+BnjXnLwDZVXox6+Mbf0z5CaIGjHA2PyLhwfui1Ge+hX13
         dKMwF1VgiWBQ917K7AQIM4clhaWazLnRzD4o2AMaLxagC1dt/TiaK0TagOt+4OOsB9+1
         hJG6+cRGYnTRLodv7UVDqiM0Jb1Mx+JNQveQ+SrreTzbrav672T3WroPL2CRsha3gE6o
         cNMQ==
X-Gm-Message-State: AOJu0YxOK8W5Fyh8jjVaxv9IJVmssL2gEPwbqvw34PebXXHaN7s9ox+U
	JiTWrbVuzbWT2IDK4mSLoi66m4fOPCHYQGnpeYoEr+xiwm8TW8b64W/8Ew==
X-Gm-Gg: ASbGncuO5nfUCRaNtVvvTIyXobZhE7oUrZFuEMtOMpJJ3s5GP4U4ixlmz2eiTJ/Xv1g
	8nBpFhwsQs+G6VAmZxir/zfjhm8DvPoHLvISHDF8B/gfIn6VUttUEiR2vEMUFi+NDRupCE1bcHH
	efNRfKesfTF+NijrHWQRV1/XeiUiiF99GjsaCddMfipqgH3+joAOfE96jnarmX5NQMX73Ay3n/P
	ZbEQ1Vnyh+qSMHWU30Wp/Ck5eD22bjCN8w8ERQA4ZeHiGbyNwzFupPhz6FnPPM8mCRkWK/FXH6D
	0MHshDDORE1NEEZtGbyZVFEqmw==
X-Google-Smtp-Source: AGHT+IFP29ehQFRT2tCdrKhN5TPLxOBeH6k3xQHqTy5Uhu1KkdGtpBFkrCkPY96wj/pc9uoRqSCOdQ==
X-Received: by 2002:a05:6602:418c:b0:84a:7906:d988 with SMTP id ca18e2360f4ac-84cdfddfd3amr1181205539f.0.1736539748788;
        Fri, 10 Jan 2025 12:09:08 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/13] python3-validators: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:15 +0000
Message-Id: <20250110200822.3958062-6-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114796

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-validators/run-ptest             |  3 ---
 .../python/python3-validators_0.34.0.bb             | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-validators/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-validators/run-ptest b/meta-python/recipes-devtools/python/python3-validators/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-validators/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
index 41ead5c05..5bbcf4d5a 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
@@ -5,26 +5,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
 SRC_URI[sha256sum] = "647fe407b45af9a74d245b943b18e6a816acf4926974278f6dd617778e1e781f"
 
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
 	python3-decorator \
 	python3-eth-hash \
 	python3-isort \
 	python3-pycryptodome \
-	python3-pytest \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += " \
 	python3-crypt \
 	python3-datetime \
-- 
2.34.1


