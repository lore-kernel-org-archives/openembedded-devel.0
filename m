Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6405AC636D0
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.25729.1675026048864434218
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L/IMtIgM;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id s124so8583265oif.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0Qiv1kf0m4keNLuYyk0LKoHP7v1UgrxJLkFOdlfJ4E=;
        b=L/IMtIgMXGwYY4JIj46tc9HG3XqYVTpOgEvoki09of0Ys3ICUQSd+fqfkSo/uDE7e5
         QacLJz9K1ZDKNXrkPUT77BZ5DRJkNIb9po+Po3fBmFANuYghUNwU7XsuH05JopnarWVx
         9nNtQQNAAKfrKWFwCoHUKo64L9sWFTxouszwrJ9lRA2guKpf0DpAYF7ayAZyxeKH02vf
         e2fQz7vm+oUuBxQzO/JEL1mOtc0+/JptRfUoyLmxGtM28XVhxapwEFcYKOb9OkLM/aKX
         Pto/nD0SgsTFm1zn6qjb3nkadH2sTSRonoAp68WPCQARb4+/xO0st7NqSm6JH+gar6ED
         fnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0Qiv1kf0m4keNLuYyk0LKoHP7v1UgrxJLkFOdlfJ4E=;
        b=R9PaVJjNEJtHe/ILv7c47a/lSgemCOR5+rddvmeWXXLTqogBY2D6oqdQrN02ZVsZwi
         73g9LvFjaatNnEcurRwZjS89sjrxLo8txqU+zByHukUYRoDw0fBUAR0OEo/g1BDbI9tU
         wbP5oc2YZGPiwSoeAQdfV24SGmNcifBJi1A3He8uHiNpa58BLIwg2tC6cNDw3kuVkWty
         /WhSe5JFunUuxOxLywqaKlBuRDAZUY/fBnh749B/njwqAB+mxae1ZLZ4QLRDUChRo6q+
         7HY9m/zronHb45PFqZMa+T8zBhHDZLdwRKbexPySPPk1W/wbc6HnR2dHT8XZAfFpxa3i
         8OQw==
X-Gm-Message-State: AO0yUKV5GAE75mtnfIHWTvQzS7uP4E04LWzyk1uS+XtJRWCtoblS3Wfo
	ZY7hNoS1sND+q+rlXGUcPUrtfKnjLyE=
X-Google-Smtp-Source: AK7set/ixzBZ9HdyMiw0/U8i+D5koRrvzi4Vcho84q3upoYS49CwgOA1luqAhDtfFshaZY0l9kLzqw==
X-Received: by 2002:a05:6808:1b0d:b0:378:5999:ce8c with SMTP id bx13-20020a0568081b0d00b003785999ce8cmr236180oib.52.1675026048032;
        Sun, 29 Jan 2023 13:00:48 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 08/10] grpc: upgrade 1.45.2 -> 1.46.6
Date: Sun, 29 Jan 2023 16:00:36 -0500
Message-Id: <06fb36d33cb35e48c07532a868ddc5ffc2244743.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100842

From: Andrej Valek <andrej.valek@siemens.com>

Backporting the version from master (1.50.1) would a big risk. So use the
version 1.46.6 which also includes fixes of bundled z-lib library.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
index c2f952fc64..7cf27d1e05 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
-BRANCH = "v1.45.x"
+SRCREV_grpc = "af855eb64eea02d2f7b68d49c3d4d7a263649104"
+BRANCH = "v1.46.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            file://0001-cmake-add-separate-export-for-plugin-targets.patch \
-- 
2.25.1


