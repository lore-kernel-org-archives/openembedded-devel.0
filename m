Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248B3C678D5
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:42 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.46813.1673191296640712688
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mBjwoVKr;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id i26-20020a9d68da000000b00672301a1664so3852303oto.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utvza1uGRXVF0BA0QAEaq97ycyBQijphxjWK8/5gtx0=;
        b=mBjwoVKrIa7D0wOjd47Mp0gZTmnT6ihLFkaj5rFywwZUl83LaQK08NmjiJZzeaUwuV
         uTAGC2dOHP90WzZuv+w5ZhYCLEyd3Urj+bDQaqFD6L6dpFfVW2xRUO0agS8hW2qC69RM
         57ZQo18jk3OTrI8fgPkM+sB0ALAY1t3ZFjjtfUSClj7gReHEJ8wN78X5TmY49GFfA9XE
         mLiKoDdUOat3nqkSxmDVZtRS3tU8/x2unH1tWTF+EtYMfTNR8rU0MG7mtXtvmIYxFITS
         5Pm2wRZcqgP4qs9uXf2L96QSKCVjM/aoDVVEN9nhutqzsw8yM9hBMuRC+4BpHoZfzUZB
         5FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utvza1uGRXVF0BA0QAEaq97ycyBQijphxjWK8/5gtx0=;
        b=7z0Pguw9FDd5feLQaalUoHNXOS0KXQJlJx89eoJtuKzwiqTiAhUNb9s6Lhh6CseFoF
         k8Bn5gJDnlYii4wZOhoX+/M2vBMqTBmLbv6hzjNoYI9sk6XE3f5jgM1J6KW9zWmX0PEL
         HW+OhUYZthYk6SY00tzkrfZqUXtZKFaZqnFICMeDgLvag1cY/XqXhGnI+JYZ6r0/M9Xs
         PtazblVkCUVwqCSrNNQ0sPAdr2U0cScp4P53vitFv/7WxWKUvmyDLVfuIsJYAYaxB33K
         TQlDlIdjzYn+Bh3T34iJT//EkgGb/Q6g4Chuh3tT5iaNN8+LuHT0MLSnZuURKRRMhYBO
         L/3Q==
X-Gm-Message-State: AFqh2ko6Pu0GZSbI3DXp6hRv7lAJ6FtpJJGmtuujUcN31Rzz33Fnv1mM
	wv0gi90YqGcNB/PP9C8Om8BrbuIsZ+c=
X-Google-Smtp-Source: AMrXdXvpVSx4ys9AeKHPyFBDO0V9gWklDyBHKldJ3/MDX1FdQCys135BOgoIo2h6kerFZE+pK/jObQ==
X-Received: by 2002:a9d:62cf:0:b0:66e:9542:3b1c with SMTP id z15-20020a9d62cf000000b0066e95423b1cmr29776953otk.34.1673191295833;
        Sun, 08 Jan 2023 07:21:35 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 18/26] waf-samba.bbclass: point PYTHON_CONFIG to target python3-config
Date: Sun,  8 Jan 2023 10:20:53 -0500
Message-Id: <4b063f93a731cd6cc486dfcbc2c2f403fd29e7f3.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100463

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


