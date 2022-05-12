Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97E0C46467
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.1862.1652344927358569220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=esqfYvzC;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id i5so6174437wrc.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lJZu+HF9LSMrneYTj1CNH7Hitf+kwT5SOW+38mfLfg4=;
        b=esqfYvzCiko+ILz1zL2RmM1hwM8RjqENswqbW6EzeA4FUcwQkIDCF9jNP1QVKysRTV
         sB34Y4QDddt0wtKmll0LJnIUXNfrI5aIP6vIeTqHH5BLK2jtFKMpSD2QOIEZVhnSZACh
         UXjjpvcinJfqKcqVzkE3qwR+UhQU7tj3Xn9203uX+D4gcfA06w/vbwd125+xNy3OC0dr
         3uB456SC+XhChdJRqvoJiQvAI0+JwYlrb1FCAHKeLdC8CyA22s2nxWCT96uQdUGrSO03
         kHrE5PVpIh5c1RKWDIPoh4zyxD3L4N7OWgyMYAgbQyRixIbh4WkPrDF/U45jkwXJby3X
         DX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lJZu+HF9LSMrneYTj1CNH7Hitf+kwT5SOW+38mfLfg4=;
        b=6ddxl/sjYobV/tmHf/4GNfN4ptobt3s9FhWKRdo/rtkx959J3XWLFQov/OVRMCCJ5b
         +sCUJMaCvkYFaVVeojHwvHclExNt0nlvD6QSzt95byOegrOz2kxxaY39N0Tot0Cymcmf
         1JsoJ9EnYLDJ0BKQLJb5Uo4Vk9VC0b8sJLpphk9MlyF7Ftih0QhSiE+0xLYIk3lzd8Xp
         r4B903xq48ujU6mwaiT3XmT2sX9AfxpPa6awzpZzDUmNXJ4YCOXbTL6j5Uq4ZGYLZVuF
         PEsKAeC3pbUJSGaF3qWjnVzRjBVeXUqeFwpu/eEvlHeX1R2R6PP6eXrv1CDtMXg+fej4
         UMLw==
X-Gm-Message-State: AOAM532jSwpsvptveP/6HQq3yzvAQqX9gCXiSn1cNQRrxaQEFruySChl
	AvqrYc260f/Gg60D6X83UK+B+43J081rghvD
X-Google-Smtp-Source: 
 ABdhPJzKbeBw67QMlKQypaT42QTeiBvlj3OoS742gkKqp/B8pGxNpL/f7X4RZr/AT0t81apBJPu6jQ==
X-Received: by 2002:a5d:6792:0:b0:20a:d352:10de with SMTP id
 v18-20020a5d6792000000b0020ad35210demr26716786wru.326.1652344928048;
        Thu, 12 May 2022 01:42:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 11/16] python3-eth-rlp: new package
Date: Thu, 12 May 2022 10:41:47 +0200
Message-Id: <20220512084152.1388464-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97058

Add a recipe for eth-rlp: RLP definitions for common Ethereum objects.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 +
 .../python/python3-eth-rlp_0.3.0.bb               | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d7d119d18..41a98ba05 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -113,6 +113,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-eth-hash \
     python3-eth-keyfile \
     python3-eth-keys \
+    python3-eth-rlp \
     python3-eth-typing \
     python3-eth-utils \
     python3-evdev \
diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb
new file mode 100644
index 000000000..d19a65755
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "RLP definitions for common Ethereum objects in Python"
+HOMEPAGE = "https://github.com/ethereum/eth-rlp"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+
+SRC_URI[sha256sum] = "f3263b548df718855d9a8dbd754473f383c0efc82914b0b849572ce3e06e71a6"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = " \
+    python3-eth-utils \
+    python3-hexbytes \
+    python3-rlp \
+"
-- 
2.34.1


