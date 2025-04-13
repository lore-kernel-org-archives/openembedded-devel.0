Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3C5C369AE
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 09:25:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.25882.1744536339273142442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 02:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAjNmHzl;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2036753f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744536337; x=1745141137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eesnekDjDQGBM19dqgXM3yiS1zctSxfMQrPN8rvhCWY=;
        b=SAjNmHzl+1pPMNiVw4pS3RuWG6sD29/kiKMtPDEroCHzrk6eUOgHFbboHqZq7n7hPY
         RcF7DvNkIiz5FQvYrRL929MPPlKQHhl9+7SCfGerj3Gt2QoIwGbJbRL3CaHG8pTDnd3W
         5gtYrCQ1J15VlGRDPvXraxI6XGSKxsJ8raAIQDppHRDHzhyhmWgoutYisVdEOlB72anY
         4RXXoS/wFxR/o6X2pcbBNuwwVkPG8fneFmrExnsIo+Noy63RpAf2WZrqCan7TzOKhgMg
         NKzD0G6MgyA4BDNcbr6CO3+Y/jRJtr/hMcWEm45X1UoE7KkHozLg4AXYWkIm1Qf1q4Zu
         z28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744536337; x=1745141137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eesnekDjDQGBM19dqgXM3yiS1zctSxfMQrPN8rvhCWY=;
        b=bdgRrNppYL5pO0TC1vVnxrEq+8BhYVWsLzqhwoopPotl0SYLcsgnXljrMt5GsW0awN
         FwQo6AH0sFB7Wi1DramJ1P6Muoy/NdKYGfASmRuarfNnqh37hiRkChs7Pnsox+ttOgis
         udH41AU0qHOWiFGoC3s5r+qoHVggCwwzFra7fRR6y3ik0joKojU2QlP+pZoHBIj2p4ly
         6hPrscY8lAHMcVdl7WJtYI+AwKcVy48mR5gNwUWCIx2WGauDHWK11BiRyTMuE0Tf2KAC
         JIx4oZLnI92GmnXOMLIV0eWMUMo5WZdQkvj2w59Dj5OB7/SJsu7+gcqxiPey3hc0p3p1
         AWDQ==
X-Gm-Message-State: AOJu0YwCgrr/4+42V3w+CaSFNyZbtbZmPQGoOhZpGsrdbchWQn23f8tW
	1vExzTadRUXhhqkHvKoh4xDIF3l6184fi8zcDoi1ZYdejwN9QytxUm7y2Q==
X-Gm-Gg: ASbGncth2Imnpt6GrBohLyqMtmHh2IxW18yl8iWubZUdBb8etXjTyRAhMumyr1b6RIa
	wFmGXdSlzxs8BOGotAmhpsAmHBTVivqKN8I1FmmWWSyVM3sAnwrRtwWa6HiQfDZZRSsrjLX31Ko
	VtDDNxRweiPujJiGoQLkFn9X53r7xEeLZju+tHSK+Omh0vEQSfBWxFb5/ugPdFNtjw+UHf/Rk74
	c0hRyjUxlt39HxV5l7WhQ1RQTDfdNfROBiVbb5Xxsgr3IReHHcUe/Ki/Djv52OH7mtVRZg/b7bj
	On3ZDkpm1LTRPBKPW5BbrWciQZW7Q9RdKVozo30nV01YU41+jnvD98IHvb0jSGl4pb55v2raZOX
	GYsRhttJ8ZEB5/hZaHLUN/FgBbdPT1k3TEWYMPHMymQS0/2A=
X-Google-Smtp-Source: AGHT+IEdVYAZZG1q5n9XJN5FDt910f3HbMSJYmkLzzEY1ChDPGveSQGfFuUte1OejqLyPvmq6wkZtw==
X-Received: by 2002:a5d:5f87:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39eaaebc768mr6963968f8f.41.1744536337341;
        Sun, 13 Apr 2025 02:25:37 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20a303absm101591265e9.1.2025.04.13.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 02:25:36 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-mdit-py-plugings: new recipe vesion 0.4.2
Date: Sun, 13 Apr 2025 11:25:29 +0200
Message-Id: <20250413092529.802557-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 09:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116827

Collection of plugins for markdown-it-py

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-mdit-py-plugins_0.4.2.bb        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb
new file mode 100644
index 0000000000..ef095c74a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Collection of plugins for markdown-it-py"
+HOMEPAGE = "https://github.com/executablebooks/mdit-py-plugins"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
+
+SRC_URI[sha256sum] = "5f2cd1fdb606ddf152d37ec30e46101a60512bc0e5fa1a7002c36647b09e26b5"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += "python3-markdown-it-py"
+
+PYPI_PACKAGE = "mdit_py_plugins"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


