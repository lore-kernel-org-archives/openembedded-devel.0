Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F497C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:56:09 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.12822.1647359769070620711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pp9yXQmO;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id t5so20391127pfg.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ra44ZLrnCg9c1FUP6ShHG2tS8h/fA35rTvw9r4a/j30=;
        b=pp9yXQmOszJcz1+6AiUq371eBbq+B7LUL+YC3D4SPv9kE4F/Uho8tp4sjz6/wX82wt
         1iXUjMNL2QplrtP9myHl1CcLW/vZXV/JlB1qAa47JnfV37J3VVPe4jNLMZb9MPCTlKgO
         4vlhF+p+kDG6goSO4aKTnXWj6GWE5UMHyq7eUPEqX9h391/R3LLKeQSmEiK3iomLxKMz
         9qbIUMGcLh2LDku4yI3OhjJLTbOMMqYebRVtLHNTeHBGBeGOYBU9XHimMwhSjOm7MzFj
         xMLJD9FDxboatG9Sx80ElYuWD9vWoHNKVsh0MrrToFGBS5geqPvoHIQ+BlE5GiVscKvj
         whYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ra44ZLrnCg9c1FUP6ShHG2tS8h/fA35rTvw9r4a/j30=;
        b=32lvAdLpImydEEM3BJRFWcuQc4/WbQJXiyfAs1zAb0ypo8rLa/c0igkvg3DOoiredw
         /mIXOq639+FD+Q9Arse4mYdGvjJxQP+XYIuYxTT0WcsOPDKCN8rOnOg3mrR85tqS9tYF
         YwRzkq79hj7gGsrJO4iLK1JZ3oJu1uI63JJEbIu3bmwxs/LtaxLDM5BIi5DznXq/qsBd
         eBJ8bbCMhgH4vFax5yl9Fa+P8tiexAjh3f0AuKj2G1E8s3RFQmiVl/dB+dofnwGFApqk
         f/Hr9Whfxl7tuiyzGLOFSl0EwxtZpAQzFaiOxegamSeqDjghufuTYD4qmdGzEfblYfie
         hOwg==
X-Gm-Message-State: AOAM532n6ZHlYLLu1dGM/d83JFlvXnDEnHmwL9tUF91N7cuofvKHWCsl
	eeKeatZy5r++YRHCdwfdjEu3arRtozk=
X-Google-Smtp-Source: 
 ABdhPJyE5OTBLfegfJXkZVqNHWSBJsYKRjEYlqa8Xisbj0bJU9IWMP/VVUSCk9XEJYh66LyUd+4DJw==
X-Received: by 2002:a63:1b42:0:b0:381:6ff8:76a0 with SMTP id
 b2-20020a631b42000000b003816ff876a0mr2056977pgm.220.1647359767967;
        Tue, 15 Mar 2022 08:56:07 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm3912101pjb.51.2022.03.15.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:56:07 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-ply: move to oe-core
Date: Tue, 15 Mar 2022 08:55:54 -0700
Message-Id: <20220315155558.969249-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315155558.969249-1-tim.orling@konsulko.com>
References: <20220315155558.969249-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 15:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95995

This recipe has been moved to oe-core in support of
python3-cryptography.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-ply_3.11.bb                 | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ply_3.11.bb

diff --git a/meta-python/recipes-devtools/python/python3-ply_3.11.bb b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
deleted file mode 100644
index 99c037bb73..0000000000
--- a/meta-python/recipes-devtools/python/python3-ply_3.11.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python Lex and Yacc"
-DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/ply"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
-
-SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
-SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native"
-- 
2.30.2


