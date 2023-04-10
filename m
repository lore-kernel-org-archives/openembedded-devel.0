Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A41C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.52957.1681153081018382308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nMcltc0R;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5027e589e20so3937282a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153079; x=1683745079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV+JrjqQaNYjJCFtWZm5a0PYsLW1VywsJpQhoPeyjoA=;
        b=nMcltc0Rh0Oi9VXZNdEzPou0VV1BZT1XeRnpsruS8bs9ETv8K0R5CuCqsDQxsabsHU
         RAjsOoPBGoZq/xbAZrLrxkIpq4k7vap9hi4HZOe83zo7gCBP5ZfJS2M/rNkkE9wUVbmg
         fGHLGtNBybdYSfT9k24sR6AT3kXKKzi6Gz5OuNSugQ44iAmKN54f0Vr2/CajBJCMxyKu
         O/JZVf84psVoa42wJAtcZf9gRPHrvIMYYo+rZtCNqKJf9Her6hG3DxOQVOHetA9r3hi/
         w86NX0RjWnx5epzrVvx/Mtnaa2TS516AY7d72nnR9j85cADhPH82TEbs3zqOwRFEBVfC
         AshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153079; x=1683745079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xV+JrjqQaNYjJCFtWZm5a0PYsLW1VywsJpQhoPeyjoA=;
        b=6/S/v3paBtjlnZduAU6RY5kGE+lxifWP+CMf6YAusnSaml6KgY8wUzRi8GtlMd+Wuk
         sBjBmubDWUbAu5kACurCy+FzviT9EIloYieXxGl7GC81nlaLt5vyc3U/AVPCJzZFuMUn
         vsCLxRxPFUyJz5C+mgp6S4ZT5taHCjhvEw8DE/AO6ZQ657sBO8DETcUSRp/Oe6N0+Tul
         Rw3jEQIH0vF4gI/BiPuI2+h1DUUpAL/Nx66L0w7O3umLUXzw0SK7dQX22DXkAD+/7m1J
         QQFE8JagcIm1Zde89mW+YSbWEAtLNdlMtHQkPUhqw/0Xz+Fv1Iy2CrZXeLTZUkKWFais
         dDIw==
X-Gm-Message-State: AAQBX9c3gzNuEZ0GlceU96GlzBR5G/YogzfzYSZRxIlK6Mq0CZ1LRuxx
	Bm5I2V/rQb0R6rru6Kuxr01ICV77T6I=
X-Google-Smtp-Source: AKy350Y5JvM8SRf24Y1eAVtQonVOAV1lyOr5Fayv4GVVsU8GUMPDVfJTpDaFO9CySFFxOyHz4YAjSA==
X-Received: by 2002:aa7:c691:0:b0:4fb:78a0:eabe with SMTP id n17-20020aa7c691000000b004fb78a0eabemr7250543edq.14.1681153079449;
        Mon, 10 Apr 2023 11:57:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z95-20020a509e68000000b004c09527d62dsm5110021ede.30.2023.04.10.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:57:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 3/7] mongodb: fix chown user for multilib builds
Date: Mon, 10 Apr 2023 20:57:38 +0200
Message-Id: <20230410185742.2416583-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
References: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102038

From: Martin Jansa <martin.jansa@gmail.com>

* the user is named mongodb (BPN) and in multilib builds this fails with:
  chown: invalid user: 'lib32-mongodb:lib32-mongodb'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index d040ab160b..ff0938d583 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -118,7 +118,7 @@ scons_do_install() {
 
     # install mongo data folder
     install -m 755 -d ${D}${localstatedir}/lib/${BPN}
-    chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
+    chown ${BPN}:${BPN} ${D}${localstatedir}/lib/${BPN}
 
     # Create /var/log/mongodb in runtime.
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
-- 
2.40.0


