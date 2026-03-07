Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8078BFC9EFF
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 13:46:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9174.1772891190868603748
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 05:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jx43/jzW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48375f1defeso76383595e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772891189; x=1773495989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQyN3gS0u2yOHtNHQJimo2p1EoJWK0zEKQ6HtY/nRLU=;
        b=Jx43/jzW8q55QIXplcWNGYO4MN1ogH50Oy0jgNyc88uwk64AFvRTwJnTDVtA2usyU9
         50qPPlJRo7lzJIlu2jOc28Ee4aUXZkqXL8D+G22RrpggdF4tvW7opUT1VEeoZ3fVUore
         IwXtMZ+qhZBrnSoMpJCWdLYDg8OIh9lIku4+k67GFYJev0rEa/EW+hEJ/rhWByL6JJvg
         d/30HAIT3fNuQu1O5bKmOk9Nx0YoXWWAW6NmxFvcFAnpd4vAbAF7wzFR2my7FStmBeKY
         FpJVgQDjvyFJY1YFqDFNaa8gG3p8s1e8h+UTRJq78e6DXbH6TxcRShmiFNBtmSm7Jn9m
         T0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772891189; x=1773495989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQyN3gS0u2yOHtNHQJimo2p1EoJWK0zEKQ6HtY/nRLU=;
        b=eTdKs4S6TOMITX96npqeUdp3BrQ+5islaJNnAjWMkUBouVfrydNcUAxqjPoLknLKQ4
         qMHKNQ8GlPdXw8jQIGByuQo6W9n/Ak889ZdgPtgPzMSlxTPLtf+ygchs91JtpPna+eZc
         Vb2qdoivEoGnVcINkquREd+F0dGPSB2XBdEtWH0FJdj8HEUn04tAD07ec5Gd6o7Gu1p/
         EcagEnjbFPgV+eu9CDw3wPaY8evW9VaItCLlBOMsYKhLC9Qay7yh/qXJbA6rlaJg3zQi
         roFFotQqDkL9zsroiWcmDB8zfceLRLSC/i+3+LCSBp6mf5hXkYsrARfZkDHIr5ARY67u
         UvTA==
X-Gm-Message-State: AOJu0YzlOEcdE63sJeD25jqJYphUyELOIBrqQN5Yv+eOk2WwLpjSVYca
	cnuH7BkX41z4vn1yZPdLPL7gzQK9Gmm+B58UjtPEusie3qj5NlGXz+jpGOd11A==
X-Gm-Gg: ATEYQzy+j+Jrup6ZcTDuKKtGTBwDCuQZlq1DA7Zhj3wNeGKGlRPxnv9mv8dS29yDfIk
	0gZ/tZ5gk3bDA84swUo6IVLs37NGxufS8bPw9QH0KZUNtsrywUaOBN+0rXDZIGMuBqdETJGyEvV
	uJBsMHp9IeelPWweO1vpmjl145ksyW20YbXXIZ7E3yExW1b7bz/DYxZE/AIETvPSuM7JCqMEN+/
	S0yr5R6h7y8Dl0eyma3lntimTEqLa+/T5x4QQgIjdNOUE0PGKpoU8OlOtDGaBjXN+GhGEu8MCRR
	870UebPzHLEkHJG/wy2jZJuW+0+/QWYVCJ7NOjmu9o06E6Shs8LlVfc0yFnIKWHYsT+Aq/LlVqA
	nbjuN1MHpUhn6286YRzp4dF1OWXpU+Io1uEUwbPxVO21hj5t1o0o37KCSQoZDxqVpVFZs46ys00
	2UTX9+/lGVF0sZX0vLJzqn
X-Received: by 2002:a05:600c:45d1:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4852697844emr91400225e9.32.1772891188750;
        Sat, 07 Mar 2026 05:46:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad27e6sm211907935e9.3.2026.03.07.05.46.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 05:46:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] arptables: remove unused checksums
Date: Sat,  7 Mar 2026 14:46:26 +0100
Message-ID: <20260307134627.4068333-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 13:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124930

It is fetched from git, so the checksums are not doing anything.

While touching it, switch to the project's own license file instead
of using a generic one from the COMMON_LICENSE_DIR.

The license itself has not changed, still gpl 2.0, only.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/arptables/arptables_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index be2cfb0816..201e9e16b4 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
 PV = "0.0.5+git"
 
@@ -11,8 +11,6 @@ SRC_URI = " \
     file://arptables-arpt-get-target-fix.patch \
     file://arptables.service \
 "
-SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
-SRC_URI[arptables.sha256sum] = "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
 
 SYSTEMD_SERVICE:${PN} = "arptables.service"
 

