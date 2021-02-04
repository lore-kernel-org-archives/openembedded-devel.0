Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web09.10073.1612454569224142036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 08:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=JWJoY0sc;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id a17so4041731ljq.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 08:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36679R10DPn38ldm9bHoy7O67pKtkBvzRWuv7gtXXOQ=;
        b=JWJoY0sck2RpwAcEJpj00a+FS1ve22491weqUZIlILyG9aQgn2lQDTBbSBze7p1pv+
         uIeFU64lDNAsoMROWeo2uFTFKC8iUvXFn8BUWgj2VqNafNnK6gCzJPGsqHYiHYAR6aId
         vsh5rrLtp90NxbxpgCtdXEi2/1mYpDcwgnbLBzT0qNIkR9u0mCsy5pqHj2RZ66SEEAmC
         7vy8gElS0JavfzMVSDtGR93t3f2u1i55lUUyL9e3KPTV/y5Pr45tZpqf9qvMielu2EL1
         H6efe7lE+82TAoh/PMJUiGfbPT5D0xE0yo17/sqk4RCda9VpWq71wukwdIVxXO1CGug7
         QrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36679R10DPn38ldm9bHoy7O67pKtkBvzRWuv7gtXXOQ=;
        b=mS+2d8CbwtejwerYGsfWtpfv3Ena/h1hUMCc1wdlPCfDbK4ds5zhaDqWz/JbcKMECV
         buUG4miybtI9uDfq6uqU7mY4528yX1m+jtvfUC49o4o2AmZWgjYEibUMdVIb+Yf/g2tV
         LtmSYcC0ILlJUrBnB3fyh5LfprvWo8V4oxwBlQRKBx7tPmUD61FpHTk97n8P0dJEZvKv
         MXIQAw2OYeWmJXW+lM+9YeIBM8qQUadr1FGhSZkXZ5c+r0sEHKl8geiWQ8ZKefaCkyvl
         ue6jYWe5dMy/25XIMrhcD04wj9l7hti0RXFiXbQAZ824afyo/izC4qIiBb4wVMPNhj6a
         P7TQ==
X-Gm-Message-State: AOAM532bwtCLtSu0AwtWWs/NLEJlbEeiy5QhW6CsloxWp7iiI6rYT6q4
	TGXXZFAFE06XsAz5a9RXHjFBVYuYu4rvHBm/
X-Google-Smtp-Source: ABdhPJwpiunlAnLBMdw+F+30Kb0inaRgxQEZrFmmkrl+Ko1hyT5SDFLHzxPS7i999j+PI8ph5AvCaw==
X-Received: by 2002:a2e:824b:: with SMTP id j11mr35059ljh.473.1612454566787;
        Thu, 04 Feb 2021 08:02:46 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h7sm669219lfc.200.2021.02.04.08.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 08:02:46 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] nano: update to 5.5
Date: Thu,  4 Feb 2021 17:02:44 +0100
Message-Id: <20210204160244.2176375-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_5.4.bb => nano_5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.4.bb => nano_5.5.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.4.bb b/meta-oe/recipes-support/nano/nano_5.5.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.4.bb
rename to meta-oe/recipes-support/nano/nano_5.5.bb
index 68c326b52..29ec00a79 100644
--- a/meta-oe/recipes-support/nano/nano_5.4.bb
+++ b/meta-oe/recipes-support/nano/nano_5.5.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fe993408b22286355809ce48ebecc4444d19af8203ed4959d269969112ed86e9"
+SRC_URI[sha256sum] = "390b81bf9b41ff736db997aede4d1f60b4453fbd75a519a4ddb645f6fd687e4a"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1

