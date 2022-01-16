Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A015C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:24 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.29798.1642310963651688597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmTmSKR4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id t18so16878483plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qvm1ghHXVUvx5TjDa0wEPqA10jJwOoUcKoTh0E/RIPU=;
        b=TmTmSKR4SWYLl7mt60/gJPVsQC+PdTd8v7HspA1WIPtjigpDe1mqX19+VA02FdcJQQ
         WfFOQhOA2zZe2lHQUtZpee57z0SwQ98M8yujTDGNKlO5Uvv6F+8Z76dRTFmEx+/jo+YO
         D33oaYJABjcBc0SyS08KDeL0BKZxMlV+oxu9/cjAx6gEaYOUr+T2h924YhYcghciFH0R
         nJRSXnWC6OR3jG4QqWrSnAIw0ubLTXVw5q8PU2RchZIcwPnzq7EMn64NoiehUG33zOib
         QOEI18SsX4KnvaO4WiuFo7I/h4GyS6y1w450sz7R8TCtkyV7DHpTMwfU/IuCwSplHtCv
         reRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvm1ghHXVUvx5TjDa0wEPqA10jJwOoUcKoTh0E/RIPU=;
        b=AJD7atJVF+Irn+YMLSVSxkeHnZDlLbmi7xuKvGio6zKQD+9zWrBEWQiFBBx4/474oN
         8WJzs3gEyUGczELIYS3cDWEBi3XcFBUqp/sQhzG6HMIS3yEPD0aOVfPCfdxiWAVS5Pg9
         XcbPf4Qca1drMA3bxt7gsoAw/jJRk/9JbJIOhF7NnnX9w90o2TwiqASAqIsolsR0wdVq
         M/1xtWFqnWE23mYcqLAhEePTlZ5kU57q3pqeH4SFkRV83MC7hisckItKK868CGmUkREW
         OHaSsyNN5gSfpZRhLhaAJ2Gxz3Uj13/WWsOpfFPNYZvpsF1IIV/NhyDkBp03YTV6NhsA
         NdMg==
X-Gm-Message-State: AOAM530LA7wWQtRDM0jmzytY0KTjyvdkG2F0C8BKvlvMoiWdwEVPjXw0
	033bMRcdjDK1ucrG70KyEz7cyP8Qife6Xw==
X-Google-Smtp-Source: 
 ABdhPJzBpUO0hcGkKrXw8z5vfjecyRxb6BUr6t38anqnXMIco0LporycXFni5Gv5+9DPkG9TDj3bBg==
X-Received: by 2002:a17:902:dad1:b0:14a:59cd:b0b8 with SMTP id
 q17-20020a170902dad100b0014a59cdb0b8mr16389039plx.13.1642310962810;
        Sat, 15 Jan 2022 21:29:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/7] python3-setuptools-rust-native: add v1.1.2
 recipe
Date: Sat, 15 Jan 2022 21:28:58 -0800
Message-Id: 
 <d8ed38996c92538bf44f7dfa2ce94b8496454243.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94876

Dependency for python3-cryptography 3.4.x+

Only native rustc is supported at this time in oe-core,
therefore it makes no sense to try to build for target.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python3-setuptools-rust-native_1.1.2.bb   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
new file mode 100644
index 0000000000..34ff91241f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Setuptools Rust extension plugin"
+DESCRIPTION = "setuptools-rust is a plugin for setuptools to build Rust \
+Python extensions implemented with PyO3 or rust-cpython.\
+\
+Compile and distribute Python extensions written in Rust as easily as if they were written in C."
+HOMEPAGE = "https://github.com/PyO3/setuptools-rust"
+BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
+
+SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
+SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
+
+inherit cargo pypi setuptools3 native
+
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
+
+RDEPENDS:${PN}:class-native += " \
+    python3-semantic-version-native \
+    python3-setuptools-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+    python3-typing-extensions-native \
+    python3-wheel-native \
+"
-- 
2.30.2


