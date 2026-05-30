Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21048CD5BD0
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 12:12:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5612.1780143167712014375
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 05:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dc5EUDBk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49068493267so45955675e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780143166; x=1780747966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eb83jv49yfdQgmIijTuW/pCUOHFy80TShfMD1oCQx7I=;
        b=Dc5EUDBk4UUmps9X8icJJzAmSq2K0F/zeLvJfNYuNCmiW5ReaoouKBsMqbvV6zdlnQ
         w59LJxapStl/JvxOgTwKvLOTtYL1IurSM0fXg8PYCIebFtl7QIqHnnHK6ZspRO7JPwMv
         Q1dJaUMeVLhJFFS+nWkpV7vsv5WlR4wmDXabs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780143166; x=1780747966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb83jv49yfdQgmIijTuW/pCUOHFy80TShfMD1oCQx7I=;
        b=bj14b67SL5K1BdzPCN8TWa13BXXSyMl02ZSrya/mf8j7X728r2rbMADcnntzPPBV5N
         7Q/HoD2CRJvs2dBTAw98+hgnVTNQjYQJrWC0AzDUr4dLJSzha1xdPkODtm3NFSCnJQn8
         Z2Y0FGmy2G64XYwgU127UpTEiErboN6PdZAOJS4694jpry30Ul9f8icWH9fqJGHcQeXS
         8WFnvOz0H96zDqW4uE4yIphzUJVqNzjc30vkjfJS6juzPhkMkEdQ/0xO7CuJpydWyPa3
         D2FiPscnqp/0n8a2E/cHBdCdQ9zV5qel3pXmQD9ATrmel54tpbxgH28WE5nSdp7Ect3T
         2NpA==
X-Gm-Message-State: AOJu0YyX770kXr9gQn+ESJ+h9P7bxqggIMbe3zmpD0hPSGxg5e1fAOZO
	WISFo2+OiAMmH+o9rLNytEEWXuYtiPDZU27gHK1mIbksKn9d5zu2tAi+Mde22ov4normYtM38cH
	Nfm5ESaA=
X-Gm-Gg: Acq92OEzJ9wDyhaMC6756/rWoY/cZYfn2x+xGPV/J7YHbUMDW3+2VFYr63BL7MwJbja
	P3S/HD8zduraDwkClwg+WGMfJzsFhE58peerbdwkWsL/cCsk3A95RrXi12pDODGglZUdIEIdaV+
	QFBI1w6dd2IasVkMFOOziL9/6vJMaqv69bgNArZ90d4Rz+nOldJ5EZlSmCOBkecSgDbw07j3l3R
	6mgJuHJDT8ZpzvjLWclz4bqRpWwMUF75/VnaTcUf/rP/UZYIWr8DtHKEnZcfjPvCcaCJAWBa0pq
	PaKpkTPYysRMtO6+2yoQYht5TirIZQg9CD/YsWpMyoiA3RqJQkYIXkSuWDzipgKUDqXBfXrRiD0
	p6v21vhbAP+Xx07tiz0tarUwEOnQVLp8YbNni3ljRQsbVeUM3cKcZoJFNMjfzFKrYMk4kiO2LdJ
	Rtfqtwu6YvSOPoV34holwtKZpdBq8KdARPkKt5L7Ng1npd
X-Received: by 2002:a05:600c:c48e:b0:490:a646:9d75 with SMTP id 5b1f17b1804b1-490a6469ec3mr18039625e9.9.1780143166000;
        Sat, 30 May 2026 05:12:46 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm11018594f8f.29.2026.05.30.05.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 05:12:45 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-oe][PATCH] lcov: upgrade 1.16 -> 2.4
Date: Sat, 30 May 2026 13:12:31 +0100
Message-ID: <20260530121231.3939854-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 12:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127300

From: Filipe Pires <filipe.pires@konsulko.com>

Signed-off-by: Filipe Pires <filipe.pires@konsulko.com>
---
 meta-oe/recipes-support/lcov/{lcov_1.16.bb => lcov_2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcov/{lcov_1.16.bb => lcov_2.4.bb} (95%)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_2.4.bb
similarity index 95%
rename from meta-oe/recipes-support/lcov/lcov_1.16.bb
rename to meta-oe/recipes-support/lcov/lcov_2.4.bb
index a889b3fa82..210cae45f6 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.4.bb
@@ -51,7 +51,7 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov-symlinks \
 "
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
-SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
+SRC_URI[sha256sum] = "3457825c6b2fe4ef77c782b82a23875c84a3c955243823f05d8f2dec0d455820"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


