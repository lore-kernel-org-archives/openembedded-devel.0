Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F90C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 08:47:48 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.16553.1742546864173012865
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 01:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cavkXaEi;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-307325f2436so17530571fa.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742546862; x=1743151662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJpC3rVwPL9URNRRPXEgntzNpUQgltXMWKeqa8Yi7DY=;
        b=cavkXaEiwM78WL8SkOkEjNu0Wn4j0ucx3AbYkF0p4KVfyJDvr2CToo62kF+0lZhL3J
         hvmck/HQa6Pmam+nEDkpbWx2V9YMZRcR8m/vF9kMnt7jRPTQz+ohElTjeM9RHhLfIBZ9
         XBiSDeAy+N71PvJyG/lUoi4gEJk4nT+BaWduoWmFJzq1moVA9dreXZn+u/IKo8Hsjz7m
         +3nsXpoD6tMOAnz1mUjxwGkw31O4hjUf52ZdnhztJgPsoxT45pyBNccmVOf+Tw/tiYZr
         inljYvUtxLHQRDKOXPy8DamLyuEwxItViUKgZHzXd4Zij0Se3J2MjMKDpqf2EfdpMuq5
         aM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742546862; x=1743151662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJpC3rVwPL9URNRRPXEgntzNpUQgltXMWKeqa8Yi7DY=;
        b=XXY0S9WRdgINot2OG7TFNANOOXJa9K8BR8qD8IIRh7PK7xwSCfTSfIYSVQYwTLchKX
         IXfLYHQwgV5LGTGhiH5SnHUGcI6tr2Dti0zBCzAYAAgn6Y2tYTUEF6hKNCPEQt1024iL
         IWWu5UMmhmgKSGa4n6UPluzp9Cf+hMdijlqKYH7zcWDmR7KnAMDafm38roHyIK8yHFDU
         eej4AhUG8xtUXeQ2UJ1uGl73ShiTGY53fZ2l4h0kowBwy8eUDv4E3/EyqLMvsJfSd6Cn
         o7qd3iaweGL/bGl1sIIbqnTQnltu6tjsRl/VTXrZX+v+W+9waKVZzqx3Hkl/S5ROd1nB
         RJtA==
X-Gm-Message-State: AOJu0YwAvwbfB53+pnJcxwe9Wq9WIonJmPoal732Qtor44o3cUDcFxh6
	6BLYgcwYzfvFcwZASr8eqz7WidhLfq7lIo9dR3bJfOsxGogEGN8tKMhuvXM8
X-Gm-Gg: ASbGncsArl9GbrKs9298GulmhOKAMjqezcjeAkeP3/OApoRsGuHa8XR+SQBJCkSUOZo
	/4qBnSoEfvvI2u9wju32f7s5t1P4WKATc7jlLKEEoLbdx973RwIXP+weA1qdBsuS6xcrhYrCZQD
	ijsRjk/KZyeQmQVgmFTl6a5Y4Nnl5zxhKvIfWqMFB9Vp2FHLBaMhKGtEEvaz8cIaiQtg9C27UfE
	sSGKGgpQOrshw4Hvtj4KOhYXGFwNEJ1wS58YLqtnQxTkC0Fpn0NxtWB4tr+WNO4AVhOBdEto4r9
	1vYfIaPsq5sonIAlTw3OXcBzlkv+sZzJjlczI03D81vOkPoRFkgxk1h/Fwt7hTMbf1GaveWg5Pd
	UnYRTkSfGEjtVKdN8jzzwzHzctdc=
X-Google-Smtp-Source: AGHT+IFx+0Q89sV07lCU2fOn0pjv+Jw1RJ4HTNd2r+UPcfViXDq6CqvCugdsfHjH/l9rdyvG0MNY+Q==
X-Received: by 2002:a05:6512:33d6:b0:54a:c835:cc58 with SMTP id 2adb3069b0e04-54ad650d593mr846944e87.50.1742546861347;
        Fri, 21 Mar 2025 01:47:41 -0700 (PDT)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbdedsm128794e87.144.2025.03.21.01.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 01:47:39 -0700 (PDT)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [meta-python][PATCH v3] python3-varlink: Add recipe
Date: Fri, 21 Mar 2025 09:46:32 +0100
Message-ID: <20250321084632.1889809-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 08:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116174

Add a python recipe to install the python implementation for the varlink
interface.

The recipe is using the current master head, instead of the version from
pypi or a tagged version. This is done as the pypi and tagged versions
are quite old, while the master is continuously maintained in GitHub.
The version set for the package is based upon the last tagged commit in
the tree, with the addition of git.
As the last tagged version is old, the recipe name is based over git,
instead of adding the old tag version to the file name.

The runtime dependencies were created by looking at all the import
statement in the installed files of the repository and taking the
relevant packages from the python3 manifest file in meta-poky.
Unfortunately, python-varlink does not have different installation
candidates for testing or example code - meaning that when the package
is install through setuptools, the test code is part of the target
system.
This causes the runtime dependencies to contain some packages (like
python3-unittest) which are not needed during regular operation of the
system, assuming the user will not want to run test or example code.
However, as these files are installed in the system, and are used as the
reference example, we've decided to keep the runtime dependencies as-is.
Future work on this package can be done to split the runtime
dependencies to different parts (main and test for example), and modify
the installed files on the system according to the user wishes.

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-varlink_git.bb             | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
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
index 0000000000..b50bfac379
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = " Python implementation of the Varlink protocol"
+HOMEPAGE = "https://varlink.org/python/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
+
+SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
+
+PV = "30.3.1+git"
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

