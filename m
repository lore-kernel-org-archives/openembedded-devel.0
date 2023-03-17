Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2677C7618A
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 07:25:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.13818.1679037954106072477
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 00:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EgygobkP;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x3so16763734edb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679037952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0rEw5cZmVlSaxD3aJx6Uan9IiizrEjlkUl1qATlVjU=;
        b=EgygobkPq20kR2F24Of0SkS3izDxYi+chBttqJfACdYOaiPAsGEIXqReSbu3Gae665
         +pHm4DXs/k7NP5uexWleHdDY+JmNK/bSJmidyOw5eBBarSnQYBicJ5l9E/B7IW9NXyOy
         AMHiwAxqrbKMvD+5ogEfK8LGnohBPHVZi4isjJkTB/GBtyUIOKJ9lIJjxTk3gkx4W9ym
         Vk374deaauMc1tb5J9lvcjQ25mBoX3Ft5vr8srzxhd/lIj4PDVpetime3qBaTS1AopIc
         vl2QwQntKroq1u/GxD/XOmnT3vCS+be/bn9SvVbuqNWyWvtZATvm0McGZNa5KP843rR2
         MfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0rEw5cZmVlSaxD3aJx6Uan9IiizrEjlkUl1qATlVjU=;
        b=Ejsj0qnlERjyg+xnQ5f09pp3g+CLG7CiGjq0C7FlW/gVPZocSUxbgKGqFoieNUvqP+
         36cG4Afybpk05Snt9AxUf+LJZ6MfZyuvaBVBt+iTV/LyWYfwgq4qowjFbZJdCCX3l2ys
         QVnEhUah4EE+QjRsU5lflFssrZc0lxkfkZsNBXJkUj90hW5BLFmrksNa5AkjEaC6iQNL
         3N2FH/ergcOadpIEI2T9eqC2Vuic5rYOOoZj4lXJ+h3X+SEy1SW6noqJqdUP25ICWRip
         C4xcu2U8kcmDtg0bjyywTxVgPp3UWdXs5Wgn27jfU14z+JguEj1a9Y3S1hIg3mYk0GaR
         3DNw==
X-Gm-Message-State: AO0yUKUUgGxBxfEzr6vIJhaz0GjLtcfrbqxyLqmM82CQZ6eEaGJLLJu1
	EKCq+eL++ILA6W16UPzDRGZTNdxaqkprTQ==
X-Google-Smtp-Source: AK7set85TaMnlfNf99xo9brck5p8zbmiTekAgOq2p69i7saVh0x31M+2WTlbKAYDOe19hcjTgRjRIw==
X-Received: by 2002:a17:906:7fc2:b0:8b1:3002:bd6d with SMTP id r2-20020a1709067fc200b008b13002bd6dmr15612740ejs.31.1679037952346;
        Fri, 17 Mar 2023 00:25:52 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm621864ejb.132.2023.03.17.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:25:51 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 3/4] python3-pyproject-metadata: New recipe
Date: Fri, 17 Mar 2023 08:25:46 +0100
Message-Id: <20230317072547.1031123-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317072547.1031123-1-zboszor@gmail.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 07:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101588

Dependency of python3-meson-python.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-pyproject-metadata_0.7.1.bb         | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
new file mode 100644
index 000000000..32938421d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "PEP 621 metadata parsing"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
+
+PYPI_PACKAGE = "pyproject-metadata"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


