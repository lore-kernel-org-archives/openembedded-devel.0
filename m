Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFF2C87FCA
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 19:29:49 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.2630.1754249385918308250
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Aug 2025 12:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JvGW+j1s;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso6434445a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Aug 2025 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754249384; x=1754854184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66RiX7TupL2OpNj8p5y86oLedbB2oWmkx0gFhHmlhsc=;
        b=JvGW+j1s+3wEqZEWK8RUHVa6+Prl0UESSmlg5whCRJL+SjHBR/YqskY7lXW+8mDgOH
         7jsjdXoGdgkhfXkweayeaSTndYMqBqJHXNxlO4fWCHtJXx0QVgXrgFE1MkibbmO0pgM2
         5wM0PeEa0oWQWrDWf/eKRclao5q6PWFJ5VBGLsLK/xRcPCefsTw+RkTz6EEh/b0vvhw2
         5EfYDRttMYZOMENa/6JOqU4tVlbaUwr1tHVJ4bTe1STky6hABD7WbOn5f9h/8vICk0DA
         SB8FAvcLK94duZGB3Yvaf8pzqxEyYTSOgFus1FT9WCTnD4zG1nRTajuRc0Yb2jvNRpzQ
         IBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754249384; x=1754854184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66RiX7TupL2OpNj8p5y86oLedbB2oWmkx0gFhHmlhsc=;
        b=rRTidJNLt3mi2Be2DqZWuMK+XSRFn+t/qXpaN4J19FUjt1fIpSmXgj7oWM11VsNPji
         rTz32R+FlXnKmgSQN/bWrBrp1oyeWBXClHexZMiQaongVVRuTV0eZ4uFWBdG7vBa/wXA
         lrpK4qds8dNVp/mKix/jVRfZesA0oogvZNePijDSPLtz+ZfRW9oXfT+QvX2xFxHOXO/E
         4BrbQTJitGS5aX6cf/QcjA1kwy0L0mKPWNG2zmn/8gCc+8dTO1Bypb+5IFW/z95rDreO
         2koYeAS6mZtQg3/+vrR3AdcTclbdbAgX2QXztzAtlTpzxqwvE9vBpUSrF6hpbtCQlydp
         P2nQ==
X-Gm-Message-State: AOJu0YzGxsLyoU3NT7svPhlcSo4QVsqbtMTt58ODscE4pFfjpcCuA1J6
	KCjC+tijWjnC7K4lTnQJzqKYVWlgrg2iFBueBYtoxu9Ch9bQQE8KLUMt6ybR6UPP
X-Gm-Gg: ASbGncsBepIN4Oq2mxj13y0YV6n9PEbCxgkK13JwpeoQvOh+ssu4BpVm4FcgCNWqzM+
	6Qw8QRPd/QtWqbllAcpeZO50SULd9FFV0cl6QXF2OsWzpdq+pSno3TSyxpelAN/E16p6EJiGBW6
	vlapKgwAAVE1VGtPqnXF4cx0jqmqMEj1+wnF/8H2ai9ZwD9w8UN/F6I2GB5QEBXUobJeCGXmhy4
	U7xg4sKzp0FzJCev2YzbfLbEO52BkHfJeCiWjRgeTKrwNSYkeZToE20rovggvZvrMLcda6MX8os
	aiOqw/4+Ao4nkH1PYZ9Rs3KStxuSHgweXVcPcjwcHOG6U6+KrjBe346GWABG3wSAn5aHWdGl5hk
	H7/jYslQrXwIWN3z194ZF/ajrFTUjHab6y2XT5rTF1Ws+Cui2v2g6jdhRPHQNK0Qu6s7bP1qrRK
	sf82g/ccpWkPw=
X-Google-Smtp-Source: AGHT+IEUGxrlahZTkh8zFEEqd7pQJubyKsmyPUWUamculCM/jHauBTuFwBwP/m5tE/smaQnSpQu+YA==
X-Received: by 2002:aa7:cb0d:0:b0:615:8012:a365 with SMTP id 4fb4d7f45d1cf-615e715f7a6mr4966724a12.25.1754249383676;
        Sun, 03 Aug 2025 12:29:43 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f25739sm5841383a12.21.2025.08.03.12.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:29:43 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-aioresponses: update inheritance to python_setuptools_build_meta
Date: Sun,  3 Aug 2025 21:29:36 +0200
Message-ID: <20250803192936.122824-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Aug 2025 19:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118833

---
 .../recipes-devtools/python/python3-aioresponses_0.7.8.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
index 1b74b839a1..4fe9577b7b 100644
--- a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "b861cdfe5dc58f3b8afac7b0a6973d5d7b2cb608dd0f6253d16b8ee8ea
 
 DEPENDS += "python3-pbr-native"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} += "python3-aiohttp \
                    python3-asyncio \
-- 
2.43.0


