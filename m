Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D4BCAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 18:51:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.22224.1758739881222412631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 11:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AfFSgjt6;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso745465e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758739879; x=1759344679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sh2ictKk4+5T4mH1D6j+5V0LAmMFqYc3YecOZPMpGXU=;
        b=AfFSgjt6r3lPJ03yyRcXWZ2YSnIm2JB69HykBYg/eeGej7zU2REfxFZwHGrPXvABKl
         qIHxBYgcYmXdAuH6GnRyxliAIa/d0EJ1zOl0f++eEIt35X455Q5Uz4k74JnB1SYk/8+b
         OWFQZjVa72TeDy1cre7mckxXhrQtgAm+GvoBEMh+AzukPAHng+D58km/ZBBnN8he3AK+
         meq7iGhWWOJDxFrwA3kssfVDWLxZlqMjfqABnFE1YvCASVP4b92LEArAaDY30iVJM5vd
         EfY2PwOxTLHbUvefx1ZscsNLbVfdBwIE6unrh55XO921WSxm4VkbGDZZlAwCIjNW4X+H
         RbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739879; x=1759344679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sh2ictKk4+5T4mH1D6j+5V0LAmMFqYc3YecOZPMpGXU=;
        b=fRBuJhLg4P++tfXWRSXxqwmmSnd89BmJ3YQkLmzOpkV/Y532NE65QZAzDWYzCLnva6
         7JNn1kgyQx1Y3PImgKUWwe7kompkiV2YWmIlFXvgKct45XJH10Ia3MBXRJuKm1BKGe07
         iIfGCa2u8wNgBa+v6ZEPckEH6HuEdp1e48Z2MnVx/Jbd2TUin1xF0lnNEUpLn6aHorQm
         TnobfbLLAx/G6fkxS9cYr5AlrsZGYGjJ4z5vbEux6oLE3A3Dp2EduwNF4crUyq/69EdE
         TsWR+izZsUPMGJ/UbLf6Jj0kkD8R0O1mQD8aLJdiURpfwOl9vannjV8MnsExEnB2Ns8E
         2ZxA==
X-Gm-Message-State: AOJu0YysEF+92SisDnTpMXM+vMIdjKaPu91UlJrEIMU3dKD2amyksYpT
	C1HFTdxqDDcB0576zuH48nNk8sTwt9vNT27zFLc6OtknhvI0azfLRgzsiuuc+A==
X-Gm-Gg: ASbGncu3w0ZoE6gmperYBdVwSjEB4Q1q7N2xX6UwTSh3A9WOAojUaWdBnQtgHwM3Jh6
	kcMyTfvl1VSZw1dcFGQ3Fdev4pDFwf+oIn5nw5rJEr9xp6uJbYK3JmzFl1+hsS/9o1PjmEGC6ss
	/oUAfkoqk+v89wBOO2sb8q011LOFp1bgHCQnaTwrP6QVRVwxK9nUuKoND2a/odvIsl5Q3a0+fev
	QR3B+tYU7ZjzqobbUXSjW7xyTfo3KeWEfQNnX5pP9h9ffBmC+XBkiflfroFh1wwZWnwb0xbYdVC
	HvLBEI5dTbMjaX+/z1RhxeIotfBTCz4+ika48IoTVQGiJFvnd8lyV2BymdbSKbjSz5InZDIIZEf
	hPPq66zV5INh+ceInx5CohMa4zRs1pxtZA70FG1DXwmq4Qok4fVx3EUhB23zMq+TnWWJVTDa8JT
	hV9StwkEmYMcXVldvSCqFmcNwk6rPkT6yGVx3NfJZQqhZCvCTe
X-Google-Smtp-Source: AGHT+IHDqriGkzJzHDJdYmg3u6xqTtTmdDhwwyuHUJ/fg5fM5NlpDtTkE8SwalCgaS9ZINjq4IzZug==
X-Received: by 2002:a05:600c:45cf:b0:45f:2c7c:c1ed with SMTP id 5b1f17b1804b1-46e3299eee3mr7835165e9.2.1758739878899;
        Wed, 24 Sep 2025 11:51:18 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32b4db71sm3122865e9.1.2025.09.24.11.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:51:18 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-pyproj: added native + nativesdk
Date: Wed, 24 Sep 2025 20:51:13 +0200
Message-ID: <20250924185113.40093-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119829

+ homepage added

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
index b7e6646c97..8546d1e8ea 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Python interface to PROJ (cartographic projections and coordinate transformations library)"
 LICENSE = "MIT"
+HOMEPAGE = "https://pyproj4.github.io/pyproj/stable/index.htm"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f3574263859ef2dc9bd7817d51adbaa"
 
 inherit pypi python_setuptools_build_meta cython
@@ -21,3 +22,5 @@ RDEPENDS:${PN} = " \
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
 export PROJ_DIR = "${STAGING_BINDIR_NATIVE}/.."
+
+BBCLASSEXTEND =+ "native nativesdk"
-- 
2.47.3


