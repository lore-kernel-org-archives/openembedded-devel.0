Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E110C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:43 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.11454.1685531614742872739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WRBfeMa8;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5689335d2b6so35729837b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531614; x=1688123614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyY/1fvrwOAoMTb1jlQ99/3Pv+QR7tbr1L6gXTgn9qQ=;
        b=WRBfeMa83df50qZTtCjv7xolQcjyczowbQ5PXKz/2CaMqN1TYqtm49MtEQHNJHbA/g
         hTh2J4hoWUb7d4rOdV+LZzvliGCeO/lmbQziNDookkFbOAr+8mZWExphMc/UyrrLZA0U
         7M00GkDbW6Ew8bCnz56uOZLuCiyquOjM6xXVXkG2LjqqPmCfvu+3cOvj3P40jlzGTMpm
         0xE/zTC2VaPqrm1AYYKvTLugLLNSeDnww4jZubfqQaKz9bOoJ3i90jv2cvsn4xaB63IT
         QJDdXYlj9TEJ3KDBmljKNgxkz9GZWy0aGk12gsSNbEXo2cBuahPVS2jv1ss2sSxJp1Ra
         17Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531614; x=1688123614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyY/1fvrwOAoMTb1jlQ99/3Pv+QR7tbr1L6gXTgn9qQ=;
        b=brWzk6x2EyRxO8IILlBm9eCD36DDoo8e5v1TLDtpuySkqsszu9bvPf3MMSszuicrZd
         kQkKUFYuUcmHmGL37BUEFGunU35T80DTEBNyG/fBz0PkH7kItXyrT+fyYnNApf+S3ROb
         UpNU4WcN35TBST300nxpqGSDEe2fq5CXOCe9ERLlFQa0zEB5c/abXgQs9OBMJApfHXi0
         DXatVlbttyKJha07FDSm78L+Nk9vGvGmjdgPbVvhNt1FsW7TQYSz/KX5mf/B8Y0I7T+b
         1QLt00C2LAyPdcXo0WH4X3uGy6CrGUViqa6PSb1NFGYLqP/6yBnfFuu34BecLW3UNjys
         vuVA==
X-Gm-Message-State: AC+VfDzEqvyJTerUNHmCrfa6e4OuLUWTULwIEnb8AgxRkjkBvoR/pmBP
	wuJ1B1uQCu6+2jSA11xiIY9H99OcPWo=
X-Google-Smtp-Source: ACHHUZ40cwpzcRjFrDmvCWDqpwBHlsEJOLEulVteyYri34Unr9OpuK6XQf0Sx6ALbYV2OQ+madk5bA==
X-Received: by 2002:a0d:d811:0:b0:559:f029:992d with SMTP id a17-20020a0dd811000000b00559f029992dmr5433864ywe.24.1685531613684;
        Wed, 31 May 2023 04:13:33 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 23/36] unbound: Remove references to buildpaths
Date: Wed, 31 May 2023 07:12:56 -0400
Message-Id: <20230531111309.2454603-23-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103052

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9a06629463ebe8217a30011f9e94127a324d895c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/unbound/unbound_1.17.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
index 24ac6012b5..9855a557a4 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
@@ -29,6 +29,10 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
+do_configure:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
+}
+
 do_install:append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
-- 
2.25.1


