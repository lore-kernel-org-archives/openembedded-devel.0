Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F67D4A5F4
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 15:02:14 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15671.1768748529818954198
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 07:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNSgzifi;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso6688527eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768748529; x=1769353329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WoMZGwV5u3bIufdnNzMEiRSOKJzuT8Kz4wIVjee2S0=;
        b=HNSgzifiTixwanF2r6GOCJdWC802+W2xN92RJPh1+huueUYW28r0r/jZPT2MlGYW9N
         OqNSKvVJwQt600JEP/8o0CmdZwMP4fW8mNy/k4pbssUfaRW0wRCkc2M1Yq/CAzHXgpYV
         R4uRGYY+SgAVvR1QsSZGa4n1c0gBkyzrzQgo4IG5BPriHmzwYs02z7uOhG+x/QR49dhc
         DzwWxWPg3MpR0FhBC4tHwNMkdoGgB/iz5pYeYorjtT+UHeEf2Bnn1nU7aE2oovb+4lcQ
         v5+spr7DbdmE1KE8v3/LBD/9i4ShBDhIX2Fx2Q28jZ7b/gBKbbaB6NU6WPyUVnQ766Ck
         66wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768748529; x=1769353329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WoMZGwV5u3bIufdnNzMEiRSOKJzuT8Kz4wIVjee2S0=;
        b=oTzbLh0GJ4jYWpjZpGkjNGvw33N3EiFOXCkWqjB/Mq+R6ccpYjJaVl1GIjofWAl5ru
         4oG2BvwdHFJR0UvFHyoKo7E1836tAMAb0PP7HmE/g2qAuksm6ulmGH8Wcq1pBKPLlSSt
         9PW9blz8/3lpKsxs+LMaCg8cWs1Z35faQM/NrErlk0TjUk3sZLHr/Cg7OidSRQ2MrkA2
         1FnipigFbjROS75MDoM55g2XCak7F8F9yD3owK/ikTlP03tCMNYeTs75F0oYduELI/sK
         nQ+ANg3wq+KKG9j3Li4pwxtIb1c67/LrdcMhTZiwHcTVwptxEUjboA0lW/Q6GaN58WQ0
         9SFw==
X-Gm-Message-State: AOJu0Yybb83uEkPTVZPbSbMgTBLhOq2Sc7wYPnlkhB3oejg1+hA3pzW2
	FW3Qn/YJUrWmVyoNrbd3N2nVtZYr0ThuRMFwndFzLgZurRlPDdxu+G+xbKJf9A==
X-Gm-Gg: AY/fxX7p3/Ac8H9W+AJ76v6hRjgHAARktgMyOdvUwpS7c1BlNOigg7HA0Dp8fwsAuVS
	1JGDy5tvBufZHscsxiXr8yGXAB3eCCKnhRruckPbIsrKm0i2yWW9WzengudO/3oR1RBtcNvfy+r
	TXznC6r/2zl/wyZF0MP/fVlcyS9MJA5sgJiZaW0e0+rSUVSUP75yk67hWxhq8W3XbJ94NnQfsyT
	b8BhN644dZXwg/AtmsmMey+lYvJH0bURlztgQ756g1gv6gl9DJ7rhqA5J/NOJ0HyP6alu9RwCtw
	lNlNx3gnz6RaGuwh1LaNcYId3uyrvmIKKuPaJ036tycI9HX0ZYl774avZ7p9mXgAUUxHfRNujtK
	McpFH1LNP/EHCZwNxajL/NDdj0aMH8GW8wJzq1Y+epK5ZMRc5DLcr7Iggaw3jdA9CTW4UixWMQz
	EdoRo92qNHoPgktRPbfRiMj5PgnThKI+HGgSICUVHTgJC4f/ROWNCod5xnHYwnDiWqMT7SDzU79
	E6xKib02Pcqg6pNVm6z2AlKSwxJWGyEY14/C7iSeg==
X-Received: by 2002:a05:7300:df4c:b0:2ac:1e9f:a0ed with SMTP id 5a478bee46e88-2b6b40d9828mr8625885eec.25.1768748527302;
        Sun, 18 Jan 2026 07:02:07 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac58140sm10152385c88.4.2026.01.18.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:02:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xdg-user-dirs: Fix packaing location of systemd unit file
Date: Sun, 18 Jan 2026 07:02:03 -0800
Message-ID: <20260118150203.2037812-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 15:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123571

systemd_user_unitdir is the right variable to use

Fixes
ERROR: xdg-user-dirs-0.19-r0 do_package: QA Issue: xdg-user-dirs: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/systemd
  /usr/lib/systemd/user
  /usr/lib/systemd/user/xdg-user-dirs.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
xdg-user-dirs: 4 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
index 6b24076d79..2550d4cd59 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.19.bb
@@ -14,4 +14,4 @@ CONFFILES:${PN} += " \
     ${sysconfdir}/xdg/user-dirs.defaults \
 "

-FILES:${PN} += "${systemd_unitdir}/user/xdg-user-dirs.service"
+FILES:${PN} += "${systemd_user_unitdir}/xdg-user-dirs.service"

