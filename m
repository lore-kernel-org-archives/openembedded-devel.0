Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CC1D35167
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 09:58:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9521.1775037516294051396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 02:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qfN+J3Tb;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43ccda008cdso532172f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037515; x=1775642315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEYZhEBDeZaDaiaKfj7jhAWYkCGPhDG/XrUsZ86z7Qo=;
        b=qfN+J3TbYjNP4LYzomaOS62ekaJIW3Mc3EiGsKELxCFVZlsT9lZaaqMbfAv9Wmpn0q
         j8kquWJ9AsEWjGwsdO7yQ4GBaIJ6anm378Kl9geaUYBXVCaHYoF2Ghwax+9M618tCDiP
         LUMQLl47Jf8fC18z3O8TsixFdo6XLY0zy63DJptATEdEttxX2CLH/cbsGQ1PSgcZrCPm
         arwYECM7PU/0rJ0J3werJNAP/8Qj1iQyHq9Ht84NlYPiqdBP+SkK19yR06cx2sutq/p0
         HZyJ4o7E3P09XRzTJr3p35YEykFeVksezPDujMcsXeWz6/Zu0H+GeGirWV9DDITVMnMh
         AxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037515; x=1775642315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEYZhEBDeZaDaiaKfj7jhAWYkCGPhDG/XrUsZ86z7Qo=;
        b=Yo3PKrgzdKjvGXLOGvY9OXin/8taM9vD7P+JN9jnq7PevDRfwRUkGa5IgDRmsxpPtq
         ZE9ZjELr5G2lID0Wh5cxkDSX1bFSCcuACIAY0Vz4xoWqg5EnMoEu1Q56UuiH6v5/UO8e
         wDXUfVCnEBpbdyG4g6kPJKfAECfcw2iSl4c++Fzzu7ZI+CxXqTVzC3JNG6LyHBArLt08
         Ub5wvgQls8BL7r7IY43AXVaGY8DJvmJMZpaT4+UyBUqZvb1TZC/D368H5Thbh9gU+AW0
         c+tQn9zvewAkeaJNEhnL4poG1pq9wko4mYo0PIHj+Y0qTXbwsoHnZhC6AMlqffut58//
         xhlg==
X-Gm-Message-State: AOJu0YxFKtS2hmwINx/936mOpqMRvEb5GYq5szsfcT4p4pAGi2oP0uf8
	q7L/9mLPXr6SXV4127RUCtHTMBIZHlc6xir/Hr5GNM2RwwhuZ/RXArxIWVW9Vg==
X-Gm-Gg: ATEYQzxgzIA+Wv5cflpqfH1R1HlJVfAYAUItPSygqLHeoso2YV8b93BLmsuOOuFtPK+
	CG1jLebM7tdFUFQkl5wXm36VORDJuN5k/dwpbrLBX4aVood0GnpxsBl2yIHkzw0+byDJtXj9KcE
	mWVY5PVv4LFym9atJF+2SzF2u2HKbpUX9QIsO5D2ozvmXJeEpEyfPlHcRI+yV50gt+SLJ/xDgtm
	2y/T3nDZmSJ6sx4WkcrlKBAtC9LS3X3Wx6LN5wQsPDGb/DAPPK/5LE7HqRU6difxizjqSCfTfJG
	6PVqCke0QeqqGvbAUVQJk6gnLOW4VV0zit+kjaP/0tjQi1zgrMiMroFwrCUKO/s7as9GWMpOE1G
	tos0S3KBB+EXO/JlAUm15ISZfDt13sRdluNKnNX811VDApMZL0JegyS0QpOWRbz9lS8L4VzwsSi
	06GWZSxjR1W6cOBFtvTVz3
X-Received: by 2002:adf:e98a:0:b0:43b:940a:3457 with SMTP id ffacd0b85a97d-43d08262026mr9304981f8f.28.1775037514178;
        Wed, 01 Apr 2026 02:58:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm32142390f8f.17.2026.04.01.02.58.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:58:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: remove obsolete CLAGS extension
Date: Wed,  1 Apr 2026 11:58:32 +0200
Message-ID: <20260401095832.2028622-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 09:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125905

Compilation with musl has been fixed by upstream[1], no need for custom
CFLAGS for this anymore.

[1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/d38b5d92ee66b0243fd5ea6d8fdf58a456e3a5f4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../networkmanager/networkmanager_1.56.0.bb                | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index de163fe00e..85dc51e163 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -72,13 +72,6 @@ EXTRA_OEMESON = "\
     -Dman=false \
 "
 
-# stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
-# avoids:
-# | ../NetworkManager-1.16.0/libnm-core/nm-json.c:106:50: error: 'RTLD_DEEPBIND' undeclared (first use in this function); did you mean 'RTLD_DEFAULT'?
-CFLAGS:append:libc-musl = " \
-    -DRTLD_DEEPBIND=0 \
-"
-
 # networkmanager-1.52.0/src/nmcli/agent.c:88:29: error: incompatible function pointer types assigning to 'rl_hook_func_t *' (aka 'int (*)(void)') from 'int (const char *, int)' [-Wincompatible-function-pointer-types]
 #   88 |             rl_startup_hook = set_deftext;
 #      |                             ^ ~~~~~~~~~~~

