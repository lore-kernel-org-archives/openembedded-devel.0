Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F703C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:34:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.5260.1742470468654665784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHgeXwxF;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549963b5551so763502e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742470466; x=1743075266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qY1FB8oHI9o5hcUlXjGs619p1XvGbvsERNZS00dhLAg=;
        b=kHgeXwxFZSQBesZPRAfp3vY2pw539bzxiXiIndAPj/dC/SHduhSEkXnxe2ULntqibY
         rMBXv7C8TumON3eBvH3yN3pFN9iSy/kdluVJfzsd+DDnPDQnFdDYqtoExNiJKKaPaV9U
         Hvzux9iw9u/5lD+CH+Fk2TC6oj8I/40mpfmQ45jho1Kq3IddZkaLqpzYVlKC5frQ3F2M
         4DIUrLT+IlBIKhz3dnl/35NQdCiD7geEf6d7raGgOxgcaDdwypSYpULG79thPTaNBY2G
         GLHxdL8PECZBCgsWPXzxp/9wmndu0/pU4cm7rjDcA9y0d+UfGBbQxLmeBAGpQB3F/sa/
         lPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742470466; x=1743075266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY1FB8oHI9o5hcUlXjGs619p1XvGbvsERNZS00dhLAg=;
        b=i/k1izjI8MoVlwkv9EPg0t5ktz09jhirI4Q1yTKfGW4oeBUd28gNkPU5UVqvDMdFZk
         BpXXXA1qsppdGsZPfj0PjZmViwY2b7NYHHytCFFsXH1e3QpB3GKmXEtL9ntCFW0JUtoE
         TfEkeD4Y/VjPtXrgaBZEe7LNL+v02QL7RE0RdEZ1MMapt9wXeTE2MGVrBybiVoi4l7c+
         QXLuhdwsoz7H+LHj9I7I9xZZwetJVnSSIOfNAbdT0FclxnGkqEWj7TezpSNrQB3kI17X
         EWUJ2sPiiMZ/82XH0QvYSmLRZJ2g/t1nC1yxvR+R5dizDHsLqAuGLU8amuf5+2p2VdgY
         nOMA==
X-Gm-Message-State: AOJu0YzLInMhvyqOyy/5Z6BCwB2MTv50WwGaBSOmL9tHCnqg4pdSbvm/
	1bcR2Ix2N3x5EEmkXSHwGYeQm2pEYrv6deqAfZLU/MRTsBl/zrUiiIQp+Aah
X-Gm-Gg: ASbGnct6V09YaBl76GjGUsTW2jEzrRczxXtbPu2j8/Ae2rQ5A8enoLtQ+OdjYemx3iU
	zxJro9sOs17igLmqpeYIfajXOBotQkARaajXYrKsQGxypQKqbVmZbFUALSukTyy7OB/hTP3QhJL
	ryoVUvZ+tPXVWNbiZEHWAdu8hwj25q333YvvrE4G3x6xJspYoyg+f/zfTcrJ7w7yvkR8BKBNCY1
	Pko06b5+weqhs1C6CMSJpEd0oQR03tI/qur0gpRuZjLLqjhW6lSFx6yFDnD8mJUSkRSux0dNcnl
	YYQkfodIAK4tv3xMyVuaVReLWibelr6ECyHcZt6mplzc6H3hZbhS82CLlHymsPmOR73aPYS4dHz
	m2d1HbwgkNE+kvgqhXPbUIBYkvNc=
X-Google-Smtp-Source: AGHT+IHFPDQ8ZoKGaeTmPUsZzjReeRe+pVRxQHdHJGZxRPJaTf2w8R8j0Ag+DbTZu0ZCYfe7zVOylg==
X-Received: by 2002:a05:6512:1288:b0:540:206b:c355 with SMTP id 2adb3069b0e04-54acb1b74b1mr2706969e87.19.1742470466200;
        Thu, 20 Mar 2025 04:34:26 -0700 (PDT)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a86c1sm2248076e87.21.2025.03.20.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:34:25 -0700 (PDT)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [meta-python][PATCH v2] python3-varlink: Add recipe
Date: Thu, 20 Mar 2025 12:30:10 +0100
Message-ID: <20250320113010.1428716-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 11:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116134

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

