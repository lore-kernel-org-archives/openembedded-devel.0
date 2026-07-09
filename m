Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CB7C44507
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 13:09:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8825.1783602568770534077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 06:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VOFAUSR/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bab44440so5787365e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783602567; x=1784207367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3ryHJNTNvL2hQSFNVNxCV5LhtNrq5X8A7gQcMZF+Ps=;
        b=VOFAUSR/AilTG5HlGPCcjj0GWvpukSjKFHlmzfb+a/PxzY1JsjsWNqvivuKhwNhBGJ
         Wpm3C60QS5V1EAqIi6g12BC3/smYuW7+c4jsXTtbj3HFU+xyLVFFNHZ0UeGNe1LaOooV
         0htWNmjk0sUReFSbzRSoXs24yzKi/LG2QPflY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602567; x=1784207367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3ryHJNTNvL2hQSFNVNxCV5LhtNrq5X8A7gQcMZF+Ps=;
        b=VAvnxXqr0mSzEvPw1qqWvoq5MYhotJNh5yCoqhkDQ7uWY1vRqRuxzgfeFWmIC0gC34
         /TnrObYCfXV0wRKG8ZHBszBmWKkTlhD5pR8RrXq9dP+XF+r6Gk4a1ROKXJPvy79ldafY
         jHg/lRGKUvYu4dkzHu8cpn3tsfOAlkuTKY+4hr216JeS89Zd4gdftYsKrZ8xKf7ttXgo
         cGcYvsj1hHCUaSLS7q7ld2/qbidkucCHyL9++QQEUOIxFeYA31j/V0nsTeRy0LvmHRs0
         0suII0IdZz5yNTNfbSqf+HxGaZsyUEYB8K9VLuOu9jVtQ6H39k3xZFIjMVUPWNYoAaaC
         4Jtw==
X-Gm-Message-State: AOJu0YwtDOLvGOGyCoc+kyOWe1lDiNMYMqdEcij/MKw0FT9phgT7efcv
	9SH/uLwmN9OWRLzbsHiYamLZq52zdo/EXhY366e8XfNh5OkaiSPPQImE+wBF7xBJWiU4cfFvjzt
	1/wtJ
X-Gm-Gg: AfdE7cmWlrn0+HJ+/IqT8quuGAQtcjyETSYVQJ0r1jaNaBrHZv6PohmBp0HtSPKu1a7
	vwX/SlYXI3kaNw3Deqz09891YL4AxWHrACyTGWJE6EDf1JYSThyBXnkwR8FS+w0I2JLFUiBFzfi
	LiU3KfdEwNyBjs4ZELQT6h7E4sWX2hA1qHzy3TZIDEvDtYMERfrDhK9haBaajVAU5IZDPUmE/iO
	lxyzPF3L1oRr/h/F4omFIKerLMU4WUWVhpH4RuFUV5R5OUoI7vWiHYLt7q1VeyF2AWLj76Hn2P/
	LqRka/CgvhqfqxPeOSkspJEoPezasvPToxlrxyoljSkKQsjnWRQph2d+W32Y1hRqfvUbKFilJWJ
	b4WbeQrSRbC10Kyt7fa0sxmET7W98YNPe5Wk4YKPzxaGOwIhYsGJd+x3q4m9OPdt/rPMbpYhhMD
	L9y03XMOo/dLyHo4ol4hJSXBTx917wTvIDS/PXD7n3q7HSS2gSd+J5h8KexSfolG8xaUeiYBKNY
	ksQ5oa0uUUX4EwdLb7e0kP7OQIEXpSTc8gBRIc/TQ==
X-Received: by 2002:a05:600c:c87:b0:493:e963:e671 with SMTP id 5b1f17b1804b1-493ec56137bmr28225765e9.3.1783602567024;
        Thu, 09 Jul 2026 06:09:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm61032835e9.1.2026.07.09.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:09:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-screeninfo: Enable tests
Date: Thu,  9 Jul 2026 16:09:19 +0300
Message-ID: <20260709130921.4185087-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709130921.4185087-1-leon.anavi@konsulko.com>
References: <20260709130921.4185087-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 13:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128123

Inherit ptest and include tests for screeninfo.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-screeninfo/run-ptest       |  3 +++
 .../python/python3-screeninfo_0.8.1.bb        | 23 +++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-screeninfo/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-screeninfo/run-ptest b/meta-python/recipes-devtools/python/python3-screeninfo/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-screeninfo/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
index a7a20707ef..4e1da84c66 100644
--- a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
@@ -4,11 +4,30 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a23813181e06852d377bc25ae5563a97"
 
-SRC_URI[sha256sum] = "9983076bcc7e34402a1a9e4d7dabf3729411fd2abb3f3b4be7eba73519cd2ed1"
+# The PyPI package omits files for testing
+# so use the GitHub source instead.
+SRCREV = "0cf3055ccaf583a00a7a3a049f85a7c58dfd8884"
+SRC_URI = " \
+    git://github.com/rr-/screeninfo;branch=master;protocol=https \
+    file://run-ptest \
+"
 
-inherit pypi python_poetry_core
+inherit python_poetry_core ptest
 
 RDEPENDS:${PN} += "\
     python3-core \
     python3-profile \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -f ${S}/README.md ${D}${PTEST_PATH}/
+}
-- 
2.47.3


