Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C9FC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:20:58 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.4973.1742469649712478562
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8QBlH2t;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499659e669so800473e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742469647; x=1743074447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qY1FB8oHI9o5hcUlXjGs619p1XvGbvsERNZS00dhLAg=;
        b=Q8QBlH2tIpgeJHZmeCIEMKZEUqZJa/URi+6nHySA4nk2V8BlsEyZzhxHTHw7shT9Zt
         rKyexGXrH+CZjiJC/1ZqGFqpZAMr/eTKv7VoKplEBMZIHRbFsTdLqDvdBeeAIluJI8cv
         nICriiFUtjqMew8QH+B7HEPa1b9xCb3AHKgmRIO3X//lb6aHavdJ7nzNVHK/Qgsvcg3y
         B9OQE0cYuRiY+myv9Mt4RzrHrGU5WasvQ4QYZeIelzO3aSIjBFGYTGGBcwyAycr8doFI
         EYTvn6VGLH8v3RW5vwDXFVCxVFLFWOYhfeNgPcR8Uq9gV1rdgxNRHHb/xZIwpkyz50N9
         jQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469647; x=1743074447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY1FB8oHI9o5hcUlXjGs619p1XvGbvsERNZS00dhLAg=;
        b=DOuaQvLVcHchboh5qxLvprEFgXQDqxQ/OOaSEqN2glZSz4ExsyY8dlQhFqIyAOvwYa
         PeCCRdfSj+8gjjZDsgnG5mu2AjlNUMzO5rMyxO5TU6q6LDkPXk1zC0pyhr/syA3B+BQt
         iJND0a6h3max2dbJWAqn4zn2r0eVX4mTiGMhtOkys9DuORsNVyD9WJCeUroWq/gQX4Fs
         gF/Ojhv0/0htu4WCnQhvFtyoLKkirGbU3Z+OLm4ifEmPr5q1jByShmA2BzHL3Rp3kb03
         X4nrPlkAyzki101oS28iysTgyju4jLmuhiyvVttWSgy0mCgFDMs/G96XTzZCQQtGRIx1
         YFRg==
X-Gm-Message-State: AOJu0YyF1t+78ld8OgiZRtvXG10RCIGjYbNnxPRaZ7KH18S5cWCOGvhZ
	iWAmLU56o5ZafPcWZQrjsNsWEGhc87Ikj0dOUuNrkzr49aN0uGjd/biNgwlx
X-Gm-Gg: ASbGncuEkSl9+A58duIUi+rrJIOIP/fE6kPyhWG6xp4px6+E9jGsvPsRQttcX3PGnKm
	pL4mwd2aNb1S/tOZn2W5UwA9MZJOqvsXoqsJ4jIBTT2S29fqLiSmvolPjYxoqamBtJnA9N7onpg
	bZXDNPe2rbAja3p7ue9MfJKMRLxiEsAMFckxFz0o5Zkg+aIbz7NW9EhszfBuXQ3AzZD7oxG3dCs
	0mHxAq7Q/K/mt3uc6NkFyKPLNG3Guo2xLofmMI2U9BRYkK2YOXhFTR41BLlM2F2UCnf7m7nUPwE
	V02E4quSgyZHPMzN7+UotHiqplF+iPxs/NuLekQSQXvLRX6Q7hGlknSrjZGotE4dGr7lcRx0xqE
	8fcv5rjLPwTvgHX2qY8CVklQwZ0s=
X-Google-Smtp-Source: AGHT+IHo9V8BC/fjtDCMDSIr2w7NDYMR/A2Cr8cTLsN27Igzx1xu4AWvnyHEcNMLXO+Y7RFaHrH9Cg==
X-Received: by 2002:a05:6512:2311:b0:549:5b54:2c68 with SMTP id 2adb3069b0e04-54acb1be80cmr2186281e87.22.1742469647216;
        Thu, 20 Mar 2025 04:20:47 -0700 (PDT)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a93b6sm2190871e87.219.2025.03.20.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:20:45 -0700 (PDT)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [PATCH v2] python3-varlink: Add recipe
Date: Thu, 20 Mar 2025 12:19:20 +0100
Message-ID: <20250320111920.1426531-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 11:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116132

Add a python recipe to install the python implementation for the varlink
interface.

The recipe is using the current master head, instead of the version from
pypi. This is done as the pypi version is 4 years old, while the master
is continuously maintained in GitHub.

The runtime dependencies were created by looking at all the import
statement in the installed files of the repository and looking at the
relevant packages from the python3 manifest file in meta-poky.

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 3a1fb13ba7..40df4f08f3 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-unidiff \
     python3-uritemplate \
     python3-validators \
+    python3-varlink \
     python3-wrapt \
     python3-wsproto \
     python3-xlrd \
diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-python/recipes-devtools/python/python3-varlink_git.bb
new file mode 100644
index 0000000000..8b5e01cf44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = " Python implementation of the Varlink protocol"
+HOMEPAGE = "https://varlink.org/python/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
+
+SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta ptest-python-pytest
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-netserver \
+    python3-shell \
+    python3-stringold \
+    python3-unittest \
+"
+
+PTEST_PYTEST_DIR = "varlink/tests"

