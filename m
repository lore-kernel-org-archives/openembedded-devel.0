Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D43CC3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 03:46:09 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.38680.1670298366417101669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 19:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OoImEExG;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 82so12316326pgc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 19:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jTdsIv0Vp1pr82JWRldCD26wGoqf3LumC/LoU6DRAg=;
        b=OoImEExGNmvRQojuzmZpdixba0L6I3K2l9Z2jWW0ZC3Z0pheXMMOoE0AzFqiMxq/l2
         4gHq2wj92mRYSjRKFXIZGNb91oZx9eL7h0mGmlwz9QgoE8T7n7vRu16p+Lyn/b4UveOY
         dxG8lhDNp0mE31PcZP+8Kx9dTvx72KsKEmMZ8mWtCh/eveX2jHmgZnqpFefVsJuNSqw8
         IcUZwzJdM1cI+J5zrM+m1n8Wp8yNSVLasawpTQKX0yhWBrlQ1+SsC5IimMYXOArZCzUW
         +5VgqDd3lqavZ8xrWgW+QfWkWwQrqUtk1UiweeAv2zlp5UWjKzZRMxp0D7/GLuY0tMYB
         JGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jTdsIv0Vp1pr82JWRldCD26wGoqf3LumC/LoU6DRAg=;
        b=uCnJAH1OHaKslh3LjHOzA6dv6VEq1Ht3KWlf8FBy4KpP5h9Ptd5mTwQBKAzidKaqUe
         0pyCOIhGh2Bs26Lyd7PIrlViEJ0s6OmFQx/2uVSW3AElByKj/snuDRQkgtoIKpHKPXeu
         KsVnMnDYv8jnhO3+J5eiNYryyVekq8KxXeQDNR3hVV0x3E9uUQZ0n5RoteBZOylwrkp9
         cGDiva2Xm0O44MOgTpqyhNOdZC/TrcVrDkdoKghSIG5tVIiaSkXdyota57yPCC8POm5r
         6XaxkBzFQINJtnN7w14ZbwGFW9cKuA9VosWPUN0fKfF5dUATGbkfkBTYCDLshVOvDqjg
         PCnQ==
X-Gm-Message-State: ANoB5pm0o1VnNmZMVnTIwe4D9dckYuKp/2sGqSlbkkj8Kd4pwPzITGJ5
	EJ0//NrPnSlVwOESxkev0rBdcoV2a+o=
X-Google-Smtp-Source: AA0mqf5FNg3dVf7D2RBj8FNGMzit0w1YpDr8aec3twvOyVps04S+em67IU55oDIn3rIKretzkqUp/A==
X-Received: by 2002:a63:5254:0:b0:477:6195:34f8 with SMTP id s20-20020a635254000000b00477619534f8mr61557055pgl.286.1670298365532;
        Mon, 05 Dec 2022 19:46:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id 188-20020a6304c5000000b00477bfac06b7sm8963667pge.34.2022.12.05.19.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 19:46:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minio: Disable on mips
Date: Mon,  5 Dec 2022 19:46:02 -0800
Message-Id: <20221206034602.1874782-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 03:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99954

It does not build due to CGO building in shared mode and needing PIC
but somewhere it needs to be fixed to build. Until then disable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index e88ea632f6..63451e883d 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -24,7 +24,8 @@ PV = "${SRCREV_mc}"
 inherit go
 inherit goarch
 
-CGO_LDFLAGS:append:mips = " -no-pie"
+# | ./github.com/minio/mc/main.go:27:(.text+0xd258b8): relocation R_MIPS_HI16 against `a local symbol' cannot be used when making a shared object; recompile with -fPIC
+COMPATIBLE_HOST:mips = "null"
 
 DEPENDS += "rsync-native"
 
-- 
2.38.1


