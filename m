Return-Path: <grembeter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3499ED68B38
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 16:38:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.41839.1731602320288196610
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 08:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCove3o4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: grembeter@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316cce103dso9722555e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 08:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731602318; x=1732207118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQzAxLo8jnUOJNtQcO/ya0ieEANwO+DuHbATlF24TH4=;
        b=GCove3o4inVUyNMRndk2aiCcnEQMHGdYsepWNZRQPObNfA1j6KMRQiEzIQT1sEeDLa
         t9ck8tW+J/CYedmv9wGUnRhcBrM1JDSmvJvJh4ErtHlinScCehFZkcHiNzX38V5MWUyZ
         /tfM1ewS1HCQBkJaJOig74HoyZ45HU/kw2/mOxo7CDNV9JXO3LlaUcpVS5ctTHEMXznv
         lpoM+1NHAjU0mNPMkeamj5xmPL76JswHYZ1PVsBuGgZbmkOMmrFvffG7ZSXdfYOSdnHI
         i4I1hMmOsH70Brq74aindfPRKXHbvbDU53KZpniVkqVhbeqGRMoF647LcI3/HKiW0lar
         UwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731602318; x=1732207118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQzAxLo8jnUOJNtQcO/ya0ieEANwO+DuHbATlF24TH4=;
        b=INLg6pGzJX/ppvWecShiNoeNUWDMuWsZU7QgUin8TWG0r2soW87DURtKgug8tpN0q1
         IgIBdXBvgxrz3HMv3WOh++gVdUDaX22yphdP0+Oc2/mrrurbqsk67E/amyvNkAkh5LS0
         PHsrXP7esIaFyrW84Ek0Ajm7cKPtL+Ie0E/5W2PqPl0uw5hJRje293qf0WwoMGssqv9K
         XUXwQtUi4yT5KQHCeQrq78bNKu17G8oln2p9KmGwSryrUV6w3MvRJ6ayYHxKmqSPYMW0
         z/UP3zltbbYxBocq/N/WOzkFcYYZQuqeDUJ20FL4Y98ROk0aOpkxL0bk0XcXEqBxp9tv
         2C9w==
X-Gm-Message-State: AOJu0Ywa3YWLC2G6EcXor2qXufXg6gRa7fN0q98fn4w4E924p9iSoiYd
	LFu8/Bq9e5gVskMMLdVKgA6XPijbXbTHgRCh9d9qGGWQsqujk71iBJ5kAg==
X-Google-Smtp-Source: AGHT+IH2Q84ZkHCv9nspn1oU0lWsy+Y21WkEo7F4T3PgmqPsgrVDgVzMzxDpDDcnOU/9Qx+47HceoQ==
X-Received: by 2002:a05:600c:4503:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-432da76ec55mr25869775e9.1.1731602318319;
        Thu, 14 Nov 2024 08:38:38 -0800 (PST)
Received: from think.fritz.box (2001-8e0-3c0d-4001-4e1d-96ff-fe13-2153.bbcs.ip6.as8758.net. [2001:8e0:3c0d:4001:4e1d:96ff:fe13:2153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d48baa42sm49913585e9.1.2024.11.14.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:38:37 -0800 (PST)
From: Grygorii Tertychnyi <grembeter@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Grygorii Tertychnyi <grembeter@gmail.com>
Subject: [meta-oe][PATCH] libusbgx: fix gadget-stop install
Date: Thu, 14 Nov 2024 17:38:13 +0100
Message-Id: <20241114163813.3918-1-grembeter@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 16:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113823

It was by mistake installed gadget-start instead.

Signed-off-by: Grygorii Tertychnyi <grembeter@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index bc40f029cdf3..41c2e8c2e449 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -40,7 +40,7 @@ INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '
 do_install:append() {
     install -Dm 0755 ${UNPACKDIR}/gadget-start ${D}${bindir}/gadget-start
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-start
-    install -m 0755 ${UNPACKDIR}/gadget-start ${D}${bindir}/gadget-stop
+    install -m 0755 ${UNPACKDIR}/gadget-stop ${D}${bindir}/gadget-stop
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-stop
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-- 
2.39.5


