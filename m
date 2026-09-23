Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E1CC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 04:29:17 +0000 (UTC)
Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138.1790137754587565271
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 21:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j/aRvA5s;
 spf=pass (domain: gmail.com, ip: 74.125.229.164, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so569924c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 21:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137754; x=1790742554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlSbcyrLd5VO/TwwZ2H+u5hzkXT6xIqk/LWJPNG8M8I=;
        b=j/aRvA5slyNCj6LXkA6KfX8wTwo5wx4mYfjew3UVCwWDqyXaB+QIv2Jw87XGbhyPi+
         eAN7rux70DBSQbgQvMTHOO9cJ++MAe7/UA+nphDKUgrxGGY6ZE1hGJYOHiHfS9wtrwtp
         bNffCMDkll4NjjOmD4VIOzjcQsiEBCnG+8aLnON2P/6Fri8XardSW/oU2eC5u8GswUvt
         +BDmF+evEy2WB24wQBKbkknLnVZtPKjoPiuR2KZzoBcW3q4objFTxjV/9Yv6nCxaoyJx
         0f3l4gi25OxbVvbP2TQBtCNI3DqN3oy0UaWkQ76h1LT9ycme8lVE7kHTD0LsOz2sctXR
         mdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137754; x=1790742554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlSbcyrLd5VO/TwwZ2H+u5hzkXT6xIqk/LWJPNG8M8I=;
        b=dAh4/MpAGNv/YmV0CzYOfGtK0YjMWMg8NTK6TUAXjC4o9fBtlytbSYuGmk+Wg3gfNA
         6bs4a0xwdwt9Pf+Ucs9zXNTf6RQ4OkTQcSzGb4z5EHIBFPLjgdpYzBKBa46Zncz6omnP
         UMtMTpqVY2YKxB3IBGXc6Y/PpMTJ82VgJcsFN2F7MBH1xNKUHWHBFrkCreP2tB8eJHMl
         OuctGZFjUwUYYsMC2uNsNXAu0qLQNaU+kxlrPJlN7VjU1ZQjwXBiNvm13Ckn3jEQfQSX
         f2io3BZOkxOkmqc1fN7FaPPIVXhd7OhJ4SMtHxRwJm5OqbaVMKMTtgY/JSA7k3unck5n
         9XoQ==
X-Gm-Message-State: AFuF++lYn0D/m1+mhrKW+KQBfOuHinxRo8UBNGLDo2JCyDkY/EWJu6CF
	OzJkisi7g91LYAovPPBLFsHcg2/Vag9VNxfIvw1liZH8iJxhwLWkX0lUH1RIpw==
X-Gm-Gg: AYBFou2F1LXvCHy26znkDZknZqg1gCK9eG++eEg7DeCS3nS+BtUPSNhfl2xxldZTWDL
	s+qGGawmZF2y78Jzir9fBliUj5GjLO9ft8Jfc+jvRSyEBbDZ891eBShYyTW8UAGdQVFSC035zYu
	I4PVCWQ5GdX9hJyrfdXp87S+1Kj/6c6LXGF3hKlHn/T6Uf5qUixfs6eZ9kIB1XPHxOTdbD41P6j
	zRGeovbWwrjE172ZpHK0essQRR7o5Vhv4gSLQtHqb0XyAaaRjs0xUX1H7QVNV4nI5w7ddtaQgkU
	VMsXKJUAo68lqDCun9UklhS9wjgo7BmZ9etnrw1fjSfwuXLL4orY3HufkdaAmZ8RgGfpO97V5KK
	GUWZbdB2t8zN7owCSeQU+buGacPd0m7xQtrsAfhIdDABZlswSMYshvwhkb7w9uttf+2rVP6O6S7
	aU4tlsMCS4mWbl/0szLzBhdguA2zEv0uZJR+j4y0BbrMd5ZdQ8L61uX9lOlXkfb5lhZapg79Ovo
	oj2ltcbZRFzrWj05ijWFnpMe6oqQr2a2shG/BMHra0oppcGEQ8dLkzM9JwADQ3C+nz8i9H2CEew
	a8Wb/7KLwdQaryZh+rFtmbZGAT44qmIZABELqZBrc9A7mmYjxedFWnh2dZpkdwMK5zd2S0lKHkP
	Xz3L7NbfVlZmjyGZy3dYx6QhRmZIrrBI3qm0sHOa0wLLfVbjyD6J+WgI7aGawyhUH44+Sh7+W8L
	7kILgA6JpiXBOpXysmh3ShAXt1k9NGT6NOjmA7HA==
X-Received: by 2002:a05:701b:4546:10b0:143:7001:7640 with SMTP id a92af1059eb24-144f915d512mr1706844c88.39.1790137753439;
        Tue, 22 Sep 2026 21:29:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98bf501sm2773178c88.14.2026.09.22.21.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:29:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] floret: Do not use AUTOREV
Date: Tue, 22 Sep 2026 21:29:09 -0700
Message-ID: <20260923042910.1549997-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 04:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130180

Add tag info in SRC_URI whole here

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/floret/floret_0.10.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/floret/floret_0.10.5.bb b/meta-oe/recipes-support/floret/floret_0.10.5.bb
index 06353fe034..c178c99623 100644
--- a/meta-oe/recipes-support/floret/floret_0.10.5.bb
+++ b/meta-oe/recipes-support/floret/floret_0.10.5.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce16d1d2b4c556959d654417007b713"

 DEPENDS = "zlib"

-SRC_URI = "git://github.com/explosion/floret.git;protocol=https;branch=main \
+SRC_URI = "git://github.com/explosion/floret.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-PATCH-floret-Adjust-CMake-flags-for-cross-compilation.patch"

-SRCREV = "${AUTOREV}"
+SRCREV = "775638223bee4fabc420cc8234632557452558e0"

 inherit cmake


