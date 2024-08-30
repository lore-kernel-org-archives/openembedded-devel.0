Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BC5CA0EED
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 08:18:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.8193.1725005915870636712
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 01:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GPMfQVhj;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3f163e379so24568221fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725005914; x=1725610714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SYqkuZSTfQeRQysPPrqFWiwLzVTjDj2FAwd2d3gwO4U=;
        b=GPMfQVhjnuXPFbdJNTzPIq2Rd12RqfO/4yiYyncgqwK9CsDGO49koLX8KFp5Vhke5E
         vgSbqrON+QpW4ouZG3vmcOjRkx+h4+wTURu5xqfAKSYy5na0cTKAGbz3VjA7FLqln7eK
         2ihTizvdTtvzYXGA1irYSno7OVZq+xRy94Xp0kE7Kl0hZELv4fVlvpyA+Npjx2Prt6mX
         XX67fH7IBZVdo6vNqdnYVz0tH/bvpYDesHnQsJ8y52TTA0NqQyEnHIPmFRc056BZGTWB
         OFeuRZG5NFa9SOskcj3wOC6jz/vCtOQ3vyA02nmNSmqO9MvgDj3+OY7axxE+3C4m5Bdz
         u79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005914; x=1725610714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYqkuZSTfQeRQysPPrqFWiwLzVTjDj2FAwd2d3gwO4U=;
        b=nu8TW5wWQQ58LpEqckmq5XbErHKP1ElRbVYBC1MFDtZKz0R9U60M0+4Ga50/9PiDAK
         H/DwZqv+sZx/Vn/j71BLfFS+/2+WWKdYAjXS4eGaTTT1YDshVV9lRYgkJoIUx2yOa173
         Biu6JK/9/Bs19pTz0AA9WvjsQxtPKd2qC21nTzB0O5hAM8kd5ndcMZ6pGCcc0j1aGc8r
         m5imaNawlBNdySdZ8UZCuIgrR0pvimDelwpjAB4d/mHX+ZhfKld+FrV6Z16lMy5Gg7h5
         IvNy2NC0iViIZXPLhenB+Hi8fm4sDRGEXxZrcVcz/8TIo5Z28S1G8QDJ2sykNScZn29Q
         JrVQ==
X-Gm-Message-State: AOJu0YxHSdVsCHtt51xR8v8Yo4wnapu9fI4Qooy4Mz64Ilxi/ETvNthI
	oNjl6ei5+hSVTKWS62EMXJGG3Tw2b24rPK4Wm+/XCH5g2DqJ+dXcWLCEXA==
X-Google-Smtp-Source: AGHT+IEnpOS5sRrP5YbBUpiFFIqkL03HByzLte/L6r7GVtcT9deXke5h+UACrnelucO1KJdqhed2Jw==
X-Received: by 2002:a05:651c:19a3:b0:2ef:2f9e:dd19 with SMTP id 38308e7fff4ca-2f6105c4e5bmr46852751fa.2.1725005913197;
        Fri, 30 Aug 2024 01:18:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb592sm188204666b.13.2024.08.30.01.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:18:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] gcab: keep buildpaths QA issue as a warning
Date: Fri, 30 Aug 2024 10:18:19 +0200
Message-ID: <20240830081819.2635680-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 08:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112049

INSANE_SKIP:gcab-src doesn't work with multilib where the package is
named ${PN}-src (e.g. lib32-gcab-src) and it's better to just lower
buildpaths from ERROR_QA to WARN_QA instead of skipping it completely,
because it's still an issue which should be fixed (at least to improve
hashserv efficiency if you don't care about reproducibility itself)

The backport to scarthgap from:
https://lists.openembedded.org/g/openembedded-devel/message/111739
should IMHO be just reverted there as buildpaths QA issues
aren't fatal in scarthgap.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 49c64f0ba6..0d9410b4d5 100644
--- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
@@ -24,4 +24,6 @@ PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinst
 BBCLASSEXTEND = "native"
 
 # meson embeds absolute paths to generated files on purpose
-INSANE_SKIP:gcab-src += "buildpaths"
+# ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c in package gcab-src contains reference to TMPDIR [buildpaths]
+ERROR_QA:remove = "buildpaths"
+WARN_QA:append = " buildpaths"
-- 
2.46.0


