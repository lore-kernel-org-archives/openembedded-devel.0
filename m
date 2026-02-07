Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAC4EE0ADC
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2754.1770460444333591618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PJn2WQ1J;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee07570deso12996205e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460443; x=1771065243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEyz1L87sM2JTy0ZZYzaDSsgoWVpgPX6RaXr6Hl5d2E=;
        b=PJn2WQ1Ja8Q4xi/Srokl0nxsrRT76k80aT08RT90/6Pw8OlfoTEuRIzA8knetfBRQg
         wyF15wtxKVp+NmS8IDDYmxkUYcw4Ma4QLKP+/2+5BnnFNmQFnh3U3fjuGCHUf4SfuRBr
         BR0cAeBjT+5cXeRxTVXMi3ISItD9IoiYDjGkT1izAaCR4A6DEOSqIEszV4+EdOImjTW/
         nfJ0dw+yaoYFGruPTEw2X+QYk4KaDsB3rh80Avin/0w1liZ4rrix9GKLy0cMVs2owfuh
         I25OxExsWznA1tW1jgXiLywifgfQxwEcPXlyaQ5IGLJ9BXe2dolSiJKT9T5puT0P8VyI
         ZvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460443; x=1771065243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aEyz1L87sM2JTy0ZZYzaDSsgoWVpgPX6RaXr6Hl5d2E=;
        b=fTxVA5PhfDGTzImiMwb+a3/u783zp8Pz9XULCrUPrfGV+osqCsKdwM6S7QXt6Rkdm4
         TJ666KJl7NFvWiwR703ZICDmMyx2z2wMVzceBeLV+DaMegwq2G4pEBeoAJRyAQON6zh5
         LKaIjY1xWJitqm7dIwbLsjA9Yy3KdXZ5QmBiOgc6vXrhqJFZlEieZnSo+atGo1hyZAZH
         kCFFoQJ9CTU0jJEMkgYruxrD8FKdN7bCFfKc04ryp45BvNzukHdb4uFIaaxWF95wT3nb
         oD9ty8Oo4dIpKBVQGydeNIRommpEBWERnGDnoX3UoBDoSb1vhEWkeWVLf407+edccnNZ
         f8SA==
X-Gm-Message-State: AOJu0YzHuhIqVU2yHoI/3cpD0hdocLoM5zXCtmbQ2+dvjOQut720EoZm
	xzDi1Nt+5eWGCzGcVcEK4Mc8TorA8qmkmeNp3Ref6po+SYNbItt3cD+TA+JRcQ==
X-Gm-Gg: AZuq6aKhntiwO/x1+oks9Umif3KEE9sHzDixp1OTalX8AFV8T6Gv4oBYwJnrUKYTXOB
	syPKAMO8iMWn5YlGVOgsKZRS1yLiHH33uJV9e2T0CC0/dxKaHq3zLf77G8pY+Rfzaf+8lA9MS6g
	u0+o707QOTMCcqexnKqLuqKkNIRma5mamuW0tlGaNRkE5/KM6G1+OT+YXFh/Y41FHd0kNUzg3VC
	tua1iU149RP28jsXK2S4RFQ8aru8HNHjUGyIH/7Y968xQ3uDtn5Vf0L1SlW/BhbbF1xhT6Md56d
	X/GtVrPcLOXOkWaoQI5IQTugFbZhDPTSTI0v0I0OE89RiugENRKgU1Y98v4znnIZDe1xU9EMHgo
	8fwo3+k6CjFmNPVbl+4Lqq1Q//SCzNMRUDcGpQw91EV7m+s6Mga2xTMTeFr0N5d0iKHjV9qk0Xs
	kjEsTHJRt8
X-Received: by 2002:a05:600c:4e8c:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-48320212d56mr84392445e9.24.1770460442563;
        Sat, 07 Feb 2026 02:34:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 03/15] mongodb: upgrade 4.4.29 -> 4.4.30
Date: Sat,  7 Feb 2026 11:33:45 +0100
Message-ID: <20260207103359.4177243-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124244

This is a security release to fix CVE-2025-14847:
https://nvd.nist.gov/vuln/detail/CVE-2025-14847

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 5d904dd4f9..48bae85179 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.29"
-#v4.4.29
-SRCREV = "89d6ffe6fc67b36fd47aff6425087003966588e3"
+PV = "4.4.30"
+#v4.4.30
+SRCREV = "1ae4c9990dbc5711f3500748f0c3f8b5d375d8c0"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \

