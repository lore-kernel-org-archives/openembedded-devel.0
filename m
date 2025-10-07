Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FECCCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:06:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.14315.1759828002328841855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HH9U+oxp;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so11850223a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828001; x=1760432801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg260RZdMFzp+ld0RYtRGEGYRUU4oBWabLDHbgkEH3k=;
        b=HH9U+oxpQYQAqQJ5hO6EhgTGy/3HXZCizlyNncl0/VunXFvaE95FQ0AafnFNxvASpi
         nF1n9zHfa+FBN/yo5XpNmHFmi8J2knhdBHrNhMrC3HXcWnBhsSWRH2+mVv8yHn+N08Zz
         SSiehcxxMKnaH9os06TZXUcWxi1TTfYiVGPLMiXMabQ/Hw8SQ3vpGc9YELXTM94WsZOu
         ehHQGFVOktI+RMIlj8M1LJXyWkPk1XrlSwcRfmpZ+MA+TCCWHGGwAGM7cWql8UJjBSKw
         s1wAwF2ADvHqsEO3wWK2k2ezf7yYh+OjVome2a+hyRBoc90CYOO+Agcwh+BmPFb1rE7s
         i0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828001; x=1760432801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg260RZdMFzp+ld0RYtRGEGYRUU4oBWabLDHbgkEH3k=;
        b=FUH1r1tj8WKAZVtpS5sRqmUNsPOal/WR6a55BKTnXS0B1sM9UscDHkY02Qxj9e5IXh
         DKQsfOI12A49BMiRxAHnQJ0GJ7B+3r+rp9KCmdE57yPNa0QBuHEukFSSQ4x6gVAs2hRt
         vZ91PKuumbrk9esp12mjXS0mhmZIlk5bnz44F29yVUuGGmmGYZQprByjSYB8VBDrYQkl
         hlTOFwbXzerQuS356i1jPjvrALFOARFlaXOujPA4jVwf+yPJeIXJADEBlKeu2/6p7Cgd
         a7HT2ztri4QPwubhKY52XZ2jb9uwRp82kDXhCpv0bSI8s6KX5EO2TqWv4igWSOVlYMvA
         SZoQ==
X-Gm-Message-State: AOJu0Yz9xcsWOyqt2gTq7G6rn3SwlruiNWf1XHwJg7lxZIBbtnmxRYL9
	NAuLfy59TjRJ74N9vkZjmh4Pr8X1lTMnj+yUwWSro63ixPosdvFQrj4LYb8b6g==
X-Gm-Gg: ASbGncuHowMOxQC7o6wy61ho0wHSB4ggH6G4Zuf0yiRcw5no9vkBT/29g1bU0qF00ak
	n1Z4I8bi3c2BisxRClrEdTRqbBfb94mKu5ECZl6kosNHMe//iNRQyU3v6q1fL5T0Wy9nDHTZfiW
	cHAhSWReBuo1+5IcAbxWJDJisDyFdcdHJy8YRMcAS7/AOdXBU/G/aQmov/xXNGOkrgL1WIwCMwv
	olnjw3SBCI2A52QhlTngnCRKaqpWPG1gVIPP31pF26fZS0GKFJ+MrSZX1bngqu/+KFj5ejHy2Wa
	c3xRNsLFgdlEh/VZuH9EutTqM//83//dCfuClNKY5ccW/mg3/B1Ug+M6IYDVRKsYr5Jxz1OW2TC
	vWezEfwDkMi4WVmAtJBS5/Cm2tdTKY1JxvUs4ljREI//x
X-Google-Smtp-Source: AGHT+IEUcsO9hG2fL9VqGGb/k9b13Pv55qeqGRQjfti4EqcWbPIfqBKVfn3+tlO6491ROcTYyL+2QQ==
X-Received: by 2002:a05:6402:270f:b0:634:11d7:f6f7 with SMTP id 4fb4d7f45d1cf-63934920867mr15945426a12.17.1759828000401;
        Tue, 07 Oct 2025 02:06:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639c590de22sm839151a12.3.2025.10.07.02.06.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:06:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: ignore CVE-2025-21605
Date: Tue,  7 Oct 2025 11:06:38 +0200
Message-ID: <20251007090638.3857705-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120324

The fix has been backported to both redis versions by upstream, and
both versions contain it already.

For 6.2.20 [1] contains the backported fix.

For 7.2.11 [2] contains the backported fix.

[1]: https://github.com/redis/redis/commit/5e93f9cb9dbc3e7ac9bce36f2838156cbc5c9e62
[2]: https://github.com/redis/redis/commit/42fb340ce426364d64f5dccc9c2549e58f48ac6f

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.20.bb | 2 ++
 meta-oe/recipes-extended/redis/redis_7.2.11.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.20.bb b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
index f2e6175462..8a81f23538 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.20.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
 
+CVE_STATUS[2025-21605] = "cpe-incorrect: the used version already contains the fix"
+
 inherit update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.11.bb b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
index 5aea249133..c46d642076 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
@@ -21,6 +21,8 @@ SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e63
 
 RPROVIDES:${PN} = "virtual-redis"
 
+CVE_STATUS[2025-21605] = "cpe-incorrect: the used version already contains the fix"
+
 inherit pkgconfig update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"

