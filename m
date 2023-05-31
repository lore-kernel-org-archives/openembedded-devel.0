Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A44C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.11442.1685531601465974137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b3J85lIQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba8151a744fso7582924276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531600; x=1688123600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmYpkc5PVks6rFltwttN6wGUpDPgKy6JAoJ49FoKVX4=;
        b=b3J85lIQq5Tx9ZXq4NKt1CSupxxaj3vU3PS3hInmjAkI0UDYhZbVhJQb0AUAJFKkML
         A+bNtx14tIik56DXktPpelfFc6zc3QtfVnlMCyVesrK7Zc1oE673IiQN0MeBtVxsxBN+
         C6CgXZtBhL/cJFvjl6hxsJOneSPMQccyI0n6pgdjKtH6uI4IVK1AMeQfQpenzV5Q9MR9
         DU0N+MnG4eLbfBL8C5XO6U8mDzUfTQaLBxEte0Rpdx9lBF28Uf5dh9OUdQksRrutZB4n
         zVeF/OV6uSkD2qKThx4nNr8ESCscvgxiyC35dKGstha3YX44iSBXi3nnJEn9sycUHByX
         utkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531600; x=1688123600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmYpkc5PVks6rFltwttN6wGUpDPgKy6JAoJ49FoKVX4=;
        b=AM3/FlqYGsTrjcJeibBPruqkflIGWiPu2FwuQBhrjbm+5qMiHV1LyE5DM9F1rdCx9t
         jZzpWIpGith3DJEMtSY13Kma85QXxhi1BmMhQA19yb1p4dXS4Th9EsUe/xuU2uvkUBMy
         rw9CVTNrgar/ZFNLEl8raLnQ9dbVHHYK0U/bvuF1/Ea+kRijvhAeprG37dp7CXEIc5jv
         QjkIl695XVTeGWKiHREtoUpj+BRNyN46I0xhAZBUY4slFIpqIObNkVww/rua/ZqTHuLV
         T/KC9Ry1WPY/lyxEKOo+bdRjBPne8EW0gWhg6ZbWPzXqoNGiiz6uVKxjnBT9kl5i0rCg
         HDig==
X-Gm-Message-State: AC+VfDy8ec3WPpZzt5VGsBu0XgL7o+qh7wAfIByINYg+4a+ht2FqcZyc
	mu9HlWh10jUgIde1RDOe3cx2j36zQOI=
X-Google-Smtp-Source: ACHHUZ6rLMll2gQc9llM1CmFN2wrWTABdUcW91tnIfmRomEGl/BKHN6Z8FlVVLJrfouKlwY+vpDYsA==
X-Received: by 2002:a81:d246:0:b0:565:323d:8182 with SMTP id m6-20020a81d246000000b00565323d8182mr6706259ywl.22.1685531600252;
        Wed, 31 May 2023 04:13:20 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 12/36] libusbgx: drop hard-coded /usr/bin,/etc
Date: Wed, 31 May 2023 07:12:45 -0400
Message-Id: <20230531111309.2454603-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103041

From: Ming Liu <liu.ming50@gmail.com>

Drop hard-coded /usr/bin,/etc from gadget-start.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 11e88935ef..2fe32a0770 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -35,7 +35,9 @@ INITSCRIPT_PARAMS = "defaults"
 INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '1', '0', d)}"
 
 do_install:append() {
-    install -Dm 0755 ${WORKDIR}/gadget-start ${D}/${bindir}/gadget-start
+    install -Dm 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-start
+    sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-start
+
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 0644 ${WORKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
     fi
-- 
2.25.1


