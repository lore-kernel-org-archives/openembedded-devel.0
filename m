Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1F7CE79C2
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:29:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.34507.1695205761108971172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMReukEo;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so1640705a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695205759; x=1695810559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pa/nmJeC5IbKefxLUp6DHfA9U0mgKn5Hu4ha2xwq65w=;
        b=cMReukEoo06oXpxDEofynKOok2kShe9q59CvhwyzUML2xtT9fb3qOg+HS8F7N1lIh8
         1nMqOI70kVIWLQgHzpk7c0NDudrT2+8c7w05f16jiTcTkEz5xvtfuG3nXnzb5bi9AcaN
         gpATSM/dUiDkrD1YCEqYInQcr+AaawiCrFfP+MstievzU+K6XlBiFhTRRtB+GQlcysSf
         +PqSIuKgw58TwKsU9VhhlNJlFGsAc8qSOuhpt1IP9MfA/EchIbeo18LOPGbjnem3qAxH
         JOO9fbnDwxY8I/+hP56RfvFIOaGsTdLfoCHS/CgbRxAukJ7KXor8Sni2MoR07HXK6EEe
         k56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205759; x=1695810559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pa/nmJeC5IbKefxLUp6DHfA9U0mgKn5Hu4ha2xwq65w=;
        b=RR6S0o2fpF3NOkp//tOz9rSzoe/8PgHzljy9x/JjBthGf86pvU+/wMt5w6+h5MOGD0
         DD268iuDwEC6ozBLPTa9geQIPTxr8quYpwYwtkBvu7g1E7zaZHpMqSHrqcz76fNmIO+4
         KCFXmA9oTdZZ7tqIynLgrS+gNuxnMovg+9xBXzdR2B01jEZZBB3UWMpY1QLuKoYzK+lw
         j6FBWkDk3dG97J1C092pc0TqGD1poWBEL6hsahz+BLTu5SyyiQotkiRUyI4Ahi6P/dlI
         R/JfUAk/9ob/N5jCh6F1LG/W+afhFJgR21pGoZYsVeLsq3FEBjTapCEX/Nnau9lM36hd
         y7Mw==
X-Gm-Message-State: AOJu0Yw21eX/yacyw8H4QskVmdfi5mkJuzopFTx8d9VU6GbUreB+oP0F
	5CoA+QD60rHyjAoCprbPL4B9OOnmnwM=
X-Google-Smtp-Source: AGHT+IEZMHTDjB4JJjy30ZkbqaafDMobNcCvYtwNnQKTZk0LNtfMZRbIhSA0ii3pMXSKHvyNPtgXxw==
X-Received: by 2002:a17:907:1c1e:b0:9a5:7dec:fab9 with SMTP id nc30-20020a1709071c1e00b009a57decfab9mr7023741ejc.9.1695205759305;
        Wed, 20 Sep 2023 03:29:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g21-20020a170906595500b00992f2befcbcsm9054201ejr.180.2023.09.20.03.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:29:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/6] btrfsmaintenance: move btrfs-tools dependency from build-time to run-time
Date: Wed, 20 Sep 2023 12:29:10 +0200
Message-ID: <20230920102915.1269280-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105008

* it doesn't need btrfs-tools at build-time but I suspect it needs it at run-time

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
index 5761844f81..2f4eb9e58e 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 SECTION = "base"
 
-DEPENDS = "btrfs-tools"
-
 SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https \
     file://0001-change-sysconfig-path-to-etc-default.patch \
     file://0002-add-WantedBy-directive-to-btrfsmaintenance-refresh.s.patch \
@@ -20,9 +18,9 @@ SRCREV = "be42cb6267055d125994abd6927cf3a26deab74c"
 UPSTREAM_CHECK_URI = "https://github.com/kdave/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
 
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash btrfs-tools"
 
-S="${WORKDIR}/git"
+S = "${WORKDIR}/git"
 
 inherit allarch
 
-- 
2.42.0


