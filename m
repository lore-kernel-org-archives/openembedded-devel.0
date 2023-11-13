Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0B0C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:34 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.1182.1699905869796564615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ou+T8SuO;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-359d27f6d46so16634425ab.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905869; x=1700510669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9yVNZtL42iUW2IVuQ4LCH3ceG8sHe+PkEEv9WMEchw=;
        b=Ou+T8SuOtZq/IwNBQnZGU2Yqo/pJXlqLoqBj2rvaHmwU7q8nuxH4GSgguft0ajGRUQ
         ltgptLEBuWlCbVgCz2dLYaXtSrH9zaviJpgqXveAKcC8UWWMyd+NzFafz1Ak5QAltMGh
         DWPHCErDLct4XE1chPSdELA6wB/3a8caQ3Fb9ItCQFYhuAxH+97140RRm72TYX5HuCd8
         bxM09f84cesPtaXsanQL8XRTudbM3bHAkkzFDkP0QGsBFPGylXrKVx+QjOiw7OlPHEiI
         xZ3cMNSXbQ/xSgxQt8AAVP3nYG7i7EOg0UKyPQpRlcJ+4+jz5WSZ2RB8y/WiYg0UvnKE
         APLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905869; x=1700510669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9yVNZtL42iUW2IVuQ4LCH3ceG8sHe+PkEEv9WMEchw=;
        b=r7WDmZhBh9/koPOyh3jmoEIB9/2O5Gi2xFDH/uwjPlZR6XmMJy8ux8T2wCwh0ecun/
         HGMXHyuS1206spoAfwE5QnM+V1e47z6X4HBSwDdC9CIlBsgx0+pD/iEFWyFQzxn9pAmr
         aC7Fc3zo8XQBhrNil/6PJhL738z45NzZbfk5VWa2LLSnNScGzE1yLnSmTW+6TjyJeBI6
         uzZ+CgXHIG5/3loYXy6UGgQt6bCI8CY8nJAktE4EeSpiXnYnhSabi7aEgbl+SXVa6nMu
         n0qz1qetL7NjKU0ySQ0pJQv9fkEyV50TnGASvq0GqUA9hb1pVbxx2XybFoi5ff/n6NZj
         xzGQ==
X-Gm-Message-State: AOJu0YwVLmTgGXQI4dzAVGQSd3ctmD3uBMQk9tUz/p4RmEODu/zX3tot
	Ruk2lB2Qoy4RA7zqwdh4q40MKddSjtpVpw==
X-Google-Smtp-Source: AGHT+IH2y06hp1MhSenGfrTCLbTnyGih/Qtb2Bn/wfgA3lXI33LJeFBuFtt4iv95xLmE0I0lZLi/zg==
X-Received: by 2002:a05:6e02:15c6:b0:359:3b32:1715 with SMTP id q6-20020a056e0215c600b003593b321715mr13771013ilu.18.1699905868791;
        Mon, 13 Nov 2023 12:04:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 6/6] packagegroup-meta-multimedia: Remove dleyna recipes
Date: Mon, 13 Nov 2023 12:04:19 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-6-a2b88b041141@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106680

They are skipped now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb   | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index fddfd720da..b18ad6ad1b 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -25,9 +25,6 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     bluealsa \
     caps \
     cdparanoia \
-    dleyna-connector-dbus \
-    dleyna-renderer \
-    dleyna-server \
     dvb-apps \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faac mpd", "", d)} \
     gerbera \

-- 
2.42.1

