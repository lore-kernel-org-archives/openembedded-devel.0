Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C685CCA471
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.18546.1758896368180095266
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0V8Qzvg;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-634b6f67742so1904588a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896366; x=1759501166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdGnl4QDG8wTNTCyBwXqm1ZaImb0RGOAyDdwNcorwZM=;
        b=U0V8Qzvgtn9jOPbrWR14VlyFEhRLl2eiAWgVuDul0Vx7pXz5mqDGACLZELU0D2yG2F
         5YT0xnjPQEtpwSu+p/xOIccZGNSOjyffepyxzj+5Pw8UW7k2VTijr5xOshhCai+HiIHB
         OCU7wg23/nvIG4v4ZrQ6TU/EIk6G5OnPrgwRGOJCiKRo0n9LSyiWqFIdGOUyjwNeZB9n
         7OZXgDN1nTaprFqFCaQPS0gr27pPIBt5hf5+TvKPmKiaC6NKOojnIGHlyzU1AEyqDnBz
         12G6gEzpgnetLWyFETJ7G8Sn8+n8SdFuxgPjtEr5qAMX/uYDbjvW+NyBZNzYP5s3VCkT
         k3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896366; x=1759501166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdGnl4QDG8wTNTCyBwXqm1ZaImb0RGOAyDdwNcorwZM=;
        b=X4TkG340wWSS/aS3HcQsNT0+ZiSYsCRm6Zlafqtbm/ufy8Z8ECZGBIxWqEHzT1HdWX
         Vvmi5eiTtu6WgffolkwPTnNiILDolUJslKTn2EZCVZSKSE4uJ68eBqyKoo0poCURZDMQ
         9MKG80rtoewr4UnNAi1lMB/0pxYCqnCn2I7RJO39fYLG5H9CkvAFnCSTuk95i81nH5+k
         XgZV+wd8VBuwmt0WOZM7Z19XXHZGdPGRTX+6o5T84y9ljxKbn9ILoiPkxB2xoGB/D6L+
         nC+msevr9BSXint3pKTA/bkwAtSG4/TXDlqJnDa9miOGgciyar9iWzeuU5TKh3QhlPDp
         sbGQ==
X-Gm-Message-State: AOJu0YxuP8Gh5c1/w8i+9GyD8o7RdxV6WfaJg8GXBBS3n/kL1cxkXVQJ
	zX9dy+Vv2TRYe+qKmnZmHPfA8y6hYdH834hb5Q6v6xZ2qdiOKRDuAe/+duP3dQ==
X-Gm-Gg: ASbGnctDZD4gTmCU8DCURO1bhs/BTUyGyONyOLzp4ZUlFeyampe+EHA2A1GFPEZhPVd
	5vg/xsEoUKvsiWSigJBK+U00K/KrMd2P0oc938ncuwCBJgdY8uCeJKVUpdDvMgF41SIhr0J7rO3
	Pm1BdgwCPgI/MjFT27X5PML469jgDKwF9IEn3szyxTCK2pJCC2Wfhgq3FW+zpy0WwdEPerFpN8m
	VUtkqcrb/EeJMhqGQd+kocJ5KB9BDiGtXPXXzr4P2oRd+zerh+j8vxS6R0YOdkg44lxhuhTEWpK
	cMjx76Ce9g65gHQyHX0qAMECkcvCawks0ymPG4rJmg8ZNQotA0IRzM1ggr0qTShyKcedQqJL9er
	d80+F8N4m33CAfO1ZRCVHUkonjOGOF9w=
X-Google-Smtp-Source: AGHT+IFd+oQ3YdPULbszLEvTe3uGL0Hw9Z5/FYNqQ+kqPd5R81SMKIOOVBMxYtHBRvvvIWyD+2a8ng==
X-Received: by 2002:a05:6402:184e:b0:634:3531:d4c7 with SMTP id 4fb4d7f45d1cf-6349fa9173emr6139729a12.26.1758896366362;
        Fri, 26 Sep 2025 07:19:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 05/20] adcli: use https protocol for fetching
Date: Fri, 26 Sep 2025 16:19:04 +0200
Message-ID: <20250926141919.2010846-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119914

From: alperak <alperyasinak1@gmail.com>

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c74cdd43f37f8c5709250e88489dbd1870544568)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
index b9fefa8589..f40cb56ac3 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 
 SRCREV = "1b1528038e084a9f81ea108cffca9c2707623b9c"
 
-SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
+SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;protocol=https;branch=master \
            file://Fixed-build-error-on-musl.patch \
            file://0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch \
 	   "

