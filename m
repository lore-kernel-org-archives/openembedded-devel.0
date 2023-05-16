Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F99C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 00:43:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.8028.1684197799135481612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 17:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D1aw0STc;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1aaff9c93a5so91679525ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 17:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684197798; x=1686789798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgpJd+7WnCVUecZ5ncdmRWTlkLbPtM00pjvhxJgK5po=;
        b=D1aw0STcv1wLYBnMzMs0iIQpXlQTe0j7CCH01syHjc3ibUX/eExUOKlSPQgqP3B9Jc
         oLB+ZANpf2If/pgckqNfOQQj6cS6A4vUYUy/M+CSyn5qLRRutsfWQePv0jIiTiAqLh0q
         bNvFQHWMaA0e0QlfQ4Pp/6sEFL+ZXPxbs+aA2kNSiZCjpTiQ/U/PatPAIxKlJSngvzO9
         pmyCamVFh5L9TJ+V/BSaBwcjmr1Qy1mn8AHp/1ABNYDHtNoktzuQo48LJyOqrT+DAsnF
         mgJq52BALqa3mwaU09+tnQw7qrnkMKhsuEl7aqnu5are+cnLIHUT37F8qJkjOq++sxGy
         VXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684197798; x=1686789798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgpJd+7WnCVUecZ5ncdmRWTlkLbPtM00pjvhxJgK5po=;
        b=WNNUjgxeXvouaFdI2a3n3X1Fp+flddF8mbQ5HEJLfyhfzClvAgVYex7gggpFjy75nq
         dqaLv+oNYVA8pjGq77yZnuECYrZvJNlRaMxIrMsyRb+YYRtME087E449RiKRp6BeG49h
         9ovpBG5/81HZG2i03Pf8V/nyCt/unsedf42XQVKzn5NgciYrxwxs0STQPvZ8ZBX4Vu3y
         A2a1I4nfouzlvt6jL9Q0XAKgFW7/23KUs8oXQ79UAnMqBwh5TZUAJvHoLdRGDs+Eup50
         O+ETl1fMst6oFW7QJ03x9m74gZbS+66wVvRuemzDkunTGlVkJls4mk8y3yo7v/1SNbeE
         SMnw==
X-Gm-Message-State: AC+VfDxEv9gGO0L2HvnVZm5/50A+IZTDjUwuU61YI0mgY3tKzsLXL1XH
	btnEgKZiKDUhvBgNreUaZPIFtDeGisI=
X-Google-Smtp-Source: ACHHUZ4zT0sEx4ZoWRFY8L1id2DyeoHNEYkBCpS7kjV942to4TJEEQVqwUZMbywZf9CEHQyR/KN8dA==
X-Received: by 2002:a17:903:124f:b0:1aa:d292:3814 with SMTP id u15-20020a170903124f00b001aad2923814mr43188953plh.67.1684197798245;
        Mon, 15 May 2023 17:43:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id i2-20020a170902c94200b001a988a71617sm14119125pla.192.2023.05.15.17.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 17:43:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libiio: Do not generate lineinfo in lex/yacc generated files
Date: Mon, 15 May 2023 17:43:16 -0700
Message-Id: <20230516004316.3866952-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 00:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102608

This avoid buildpaths being in target packages. These are emitted into
generated lexer.c and parser.c, therefore ensure that lex and yacc are
directled to not include lines in their output.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index bb253f421a..c8ff0d34bc 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -24,6 +24,8 @@ inherit cmake python3native systemd setuptools3
 
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
     -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
 "
-- 
2.40.1


