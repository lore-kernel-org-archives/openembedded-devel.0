Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B6BC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.44967.1674653489724429460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3fLq4pH;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id j10-20020a4aa64a000000b004f9b746ee29so3156702oom.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utvza1uGRXVF0BA0QAEaq97ycyBQijphxjWK8/5gtx0=;
        b=Z3fLq4pHm+f6MCzDySWwlTY8WA+YP+oqWSn/EzVmvW0Al/unalxH9t4O70ANaryQwJ
         tcN7Efpac/Oto+XyArVTE1wvwOqtTNdFkgGqXHxCsXJDcn2EsUEGAWfGfXvpYVbiNLQw
         like2/NekUqxQwBEo8hna7Xu7LascyLTqsOxhxL5MWixXaaPrp4IxtNtsOJW0eg2r3wT
         YdWW2SmFn5galqoujVRshfZRJwvtqFQWHI2gGGNxwBms5u2KkteIt9sWFB4XjWEpXS4i
         lMBufCgnZD6aYKyQyf1r2NnrGfY+MS/RHlwiES9RufuxKkErDUbSO0XzJhv6u3TP1Gd0
         xJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utvza1uGRXVF0BA0QAEaq97ycyBQijphxjWK8/5gtx0=;
        b=5WzQ2WZuKkC+6BZPQZ8h7mLAn2M/d3ypcVPjFTna0FqoXPUVPPLHZAqyWy/Wxkzpax
         XD/jYHHjWD361S1lQd5Xdn97IUj/TaaCsrQMOKopblyA8IcjOCQwu5TFtVvZEciNQhLA
         6WKh8xdYrkA/qhSicOxWwy9J+f0fFV2XFCKvFIyk7Z3wWa7NLGUcn/6p2D4R+FwMaj3+
         VeFjbLO6PTbkeXARJZC4Rnw2BLfWT/hDvzt08UzFBs1McciV33itRIQpAvE8G5VW8ZzC
         DKCXwPdAMAb0lRMCnQl1SKVGXMXFgrMG2omMs9IdhKJi8GS+ycyoTkwNcjeOfG9E6+Gy
         IqFQ==
X-Gm-Message-State: AFqh2kqaVahGl4LLUAhe5s3l/MViyWHw08KxUVL3+QgkQdS+jjsHkeR0
	PgxB1urQpZicD4fjCUE6oqOyM9v9kkg=
X-Google-Smtp-Source: AMrXdXuYshELTvqSs6plCSMeIbXYjcyd11MTLbMszLi3G0QvBqgMD7df89qIjAiD84l8jTSezt4CPg==
X-Received: by 2002:a4a:a6ca:0:b0:4d0:1b43:70e0 with SMTP id i10-20020a4aa6ca000000b004d01b4370e0mr13419255oom.9.1674653503970;
        Wed, 25 Jan 2023 05:31:43 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 18/41] waf-samba.bbclass: point PYTHON_CONFIG to target python3-config
Date: Wed, 25 Jan 2023 08:31:00 -0500
Message-Id: <4b063f93a731cd6cc486dfcbc2c2f403fd29e7f3.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100753

From: Khem Raj <raj.khem@gmail.com>

Ensures that waf detects and uses it correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3b7f98f52b58ec48bda9a6a64c0be507ccfb6463)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 9c32952f6a..41909788f7 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -95,6 +95,7 @@ do_configure() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
     export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+    export PYTHON_CONFIG=${STAGING_EXECPREFIXDIR}/python-target-config/python3-config
 
     CONFIG_CMD="./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile"
     if [ "${CROSS_METHOD}" = "answer" ]; then
-- 
2.25.1


