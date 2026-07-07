Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA97C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 03:33:51 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.167069.1783395227662945013
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 20:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pLFZSikr;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-804e46366d7so55004767b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 20:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783395227; x=1784000027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JniBwmmYWL1+Tw7J9C0mE9SBZXcYrzcuG5B9H9ncyVU=;
        b=pLFZSikrpU+T1OaGrHqRWk63812PebDQu29Rvt8YP4/xIVIO1kI+aOStMFCsY35jN9
         pR4AZ+EzikBWUi/TG3g8ICIP8fToY28rVZghqX6ZI3mPQsoiRrOStAJ/rzlOnIL2dYKQ
         FK+BJTfZgD6WSW7vXbCC+0lMHpRt4X0gZ/kU5mnNIXaf7oUY075i5YMrLNkHqDuPmReV
         MgfqfQ4tkozMBIOt61geeNQrGVHp94ljk8zOk3s2SghLE0JRRgqkoBjN4cdx8oFuK+by
         BZPvu9SpPd03GRlVAAC08sfVrhs13nN7vWIxPgvpubPRhldgcHcOzzR8yjx3jB4vgJRx
         OwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395227; x=1784000027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JniBwmmYWL1+Tw7J9C0mE9SBZXcYrzcuG5B9H9ncyVU=;
        b=TpTCbS0izrg1CyHAinbXRQEEnkHhLqI7EBlLBv3bpNZy5USANt5uoLjKxU2MzNuwxh
         aISva8oJa7eArGHn7S9nrL2hKINt6uu2FizZN65gXLP7fh4q3j8nVp+YpmEcQdqlDSPh
         E9vjL4LlQHBFeqns93+GbHL985BIeJB6RexPAcpNkhnUqokVng6mOOPHy8yAEj5LgeMV
         YleuXlpjJXFoFzGZvHvAEbensfvcdD3EIGUGS01kMOBOMRsLGjgcg6zjcUaLQuP4dwD6
         LatKE7WBDysu5qQwxtMfcQf/6Go0mYn1XITrDtyhq1C/+lpxpUjgo0D55xS9kylryBDa
         rLmA==
X-Gm-Message-State: AOJu0Yxs6bz4n5cEqfvWJtVs+SvLQGl0E+XpFSifMQz+bhU/84wPbFGn
	zLrGYbGu6q9kQV9vMZPbhiCYusGmpUDm8Ot0bHOPKHb2wtVLQQ25mM75g+yLDA==
X-Gm-Gg: AfdE7clvEVNXxYUO8GJT7Qj/nJFToBd+KiWgFxcvL7ihYj3S/wxTeWCwvGOs5UqYZSZ
	VvkOn/GJ6FB3hqGLcahLRwUCtn4Y7CtJgTdNWhlvGIUKbg8xRfXMREz0g4oqPuJ44JDoCHnnJzJ
	8j5Dy+myrYLH8QRErX68Ls19RlPGRnIBkCP4wzdMu3GAPtF/p9pc9mbjqtltDNjpIc+Petw7DQ6
	YBhEgoD4kpGNLSacGlLfHZjQnTlVSeVIJmda05BvEbSx+CpRZJDbkEMkQYSfKjDf8XwbVtwLZKZ
	1BYrhYrk8pdIz7cd00ZUXh19Ei9sUi7s8EwAfAY5d3j36jpuFLFvyDYtLd3OflPWrqmLL4fvLMX
	HE3/gQTPs13CTKRdq/nCZG+XCGrRP7mHrqKNGQSRHEGKRPxxNC2+7c6mfows18T54uW5VG5xNvm
	YogYXUElztKwB+2aEMOruaOvUzyJYDpkytWIDudsFoSaLs8c7SVxlpCCJbEZWVZldLbr4jwNCcI
	NO9zlReNhdlGSJo0XRzTM/64gUwmxwfUfVOpes7
X-Received: by 2002:a05:690c:6a08:b0:814:54ce:6563 with SMTP id 00721157ae682-81be27705f0mr25870647b3.40.1783395226664;
        Mon, 06 Jul 2026 20:33:46 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783efacsm64950637b3.8.2026.07.06.20.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:33:46 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.31 -> 8.2.32
Date: Mon,  6 Jul 2026 23:33:41 -0400
Message-ID: <20260707033341.2404154-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128055

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.2.32

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.31.bb => php_8.2.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.31.bb => php_8.2.32.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.31.bb b/meta-oe/recipes-devtools/php/php_8.2.32.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.31.bb
rename to meta-oe/recipes-devtools/php/php_8.2.32.bb
index e4965bde2f..1eb89a408f 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.31.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.32.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "948183fa04cf261c9b9363c02f428977b9ddf8c0bfdff8e8e1fba816ed570803"
+SRC_URI[sha256sum] = "8f21e988ca4dd5e14dd9fb889884487843566e487280027c4efab6c93188a2d1"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


