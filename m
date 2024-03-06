Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BDEC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:17:58 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.384.1709745468510869895
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 09:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kcIPaT0s;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-566adfeced4so7660956a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 09:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709745466; x=1710350266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=747OxrTR0dltzhL4rDfiPYiDkS8IyBzPagoWzN/hxJM=;
        b=kcIPaT0sN8xtyhYbONbY+Rszxtd8uNRWDb+HNPHtyDgjrY3PlE5BhKFgVNjRVgVjip
         yE1XX5hePD2CjxVI2UwOU9q2+yerS7kLPaJyrxvFB+hun9hEjcefMlOGCRcuG9kclQd4
         yCcAUyz5sMANQ1UqX8clRr2dhryTk4TfvXguNo7R+aQ1hhduKPNLQw9uKNLt/uvCF6d3
         yWg5RNvqPA4zvKqQjpb8oGkvzWwlO2wP5X9oHtkpJx32Ozwhi9Ur5X6geqXHZYJzF/ta
         xT7wUoDo72rgdJc5HH0hL4nEaoq5pTkYpGPi9e35scme9a78BjiHgcAEd5vTP+H6ammJ
         Qj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745466; x=1710350266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=747OxrTR0dltzhL4rDfiPYiDkS8IyBzPagoWzN/hxJM=;
        b=nFf5LhxHYYiDP3IwucFWY7U2Xyjfzvv0wfRYYg6DA0Ad8V3ft/OqXvNzRgV/ml/3zS
         xL6Chtj4qSlN5/Ka9X/tIWLHnlThgtInnN3h7jYVS5KDOTJcbFGLtdgfqIfhCioo/fR9
         pUfT0cVLkzXpknLRv3gSFcXsV3QOD25FOSn1TBEtbgEIgYGKvCnY7asjCOD5Unizsj9h
         jkwH4+OrZmjf9S062CCM3f+HNLGQ+YvPf+Xt1n8yXT5JUhS0w6QSA+IOQapdJgBXGBYN
         xWZ0Lx3Yjdq/2p8nL8jYZELrg9nuC54WeLELo6PsXF5zmcUK3Woi0MrqNUHrAqmmn+X0
         e8Ag==
X-Gm-Message-State: AOJu0YxojgLy75VR1YObCeYUBerK44Ts0j1DNoQD8i1XsNfYgb59aULc
	4r2ccoPG6Bwxyee6+p4mJZGPdaFNrDQMxzCNy7u0riEaa14PDMJ9g+dMVLR6Zfo=
X-Google-Smtp-Source: AGHT+IECRgFP6bN+oOGFeD8yllP68cd6465bUFj12YSGTFR1UryRCjfWHwx6Vdkl/BYE6+1frd+9cw==
X-Received: by 2002:a05:6402:22ae:b0:567:29d9:99ae with SMTP id cx14-20020a05640222ae00b0056729d999aemr7615380edb.28.1709745466424;
        Wed, 06 Mar 2024 09:17:46 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bo19-20020a0564020b3300b005653f390f77sm7091687edb.10.2024.03.06.09.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 09:17:45 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-icecream: add recipe
Date: Wed,  6 Mar 2024 20:17:40 +0300
Message-Id: <20240306171740.480830-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 17:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109174

icecream (ic) package offers a more concise and readable way to debug code by replacing print statements with simple function calls.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-icecream_2.1.3.bb            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb b/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
new file mode 100644
index 000000000..ec3a4b90f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Never use print() to debug again; inspect variables, expressions, and program execution with a single, simple function call."
+HOMEPAGE = "https://github.com/gruns/icecream"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
+
+SRC_URI[sha256sum] = "0aa4a7c3374ec36153a1d08f81e3080e83d8ac1eefd97d2f4fe9544e8f9b49de"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+        python3-asttokens \
+        python3-colorama \
+        python3-executing \
+        python3-numbers \
+        python3-pygments \
+        python3-pprint \
+"
-- 
2.25.1


