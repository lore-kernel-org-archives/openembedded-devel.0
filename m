Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B507C61DA2
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.44851.1674653492172135514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eM9tR+0S;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 123-20020a4a0681000000b004faa9c6f6b9so3130017ooj.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcmnyskcS0IHwABudZQfQCmYgijx5SQw/jojumk6zZ0=;
        b=eM9tR+0SsurZuI5XEdi3gUEgGQepPAyG4yRoTA+f9r1RmJ6f6O5X+0h0OvAhxUapxM
         3MNkdWAY/KXR5v5eX7NPmdNcknIVDpzTAfOK6TzoSfc+3HpcgKNgJk0wggS0Y/R70kWf
         Q7b1fa6hXzEpMtgU2OJSKAgM8alLJ/MJUgyEJlyF9lbEi850uAOgVbHVeUduM9aaWo6H
         x8HwabevgbuB++G+oTzRfvY4EgxORY9PaqaXEzaM8KCkVPxN74GBZ5PltBPRoDxWznHS
         Zwp7S7I+qUCTyQPzeLENvbSxx1bTSaAKA6+jvW+d384dhgiv1h3bOTcv2GNSC9MjPRcq
         oyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcmnyskcS0IHwABudZQfQCmYgijx5SQw/jojumk6zZ0=;
        b=HJuqeQ0PedCr7Yt1Bi4aqv5iL9KIJPYD8M1RuHJmlm1HAOOtuzCLCxuv2Sg//SsKQU
         lCAC3xPB9rkOPWdmRQ36xuZf61TQes4fA9qNlbVEDLAAi2TEbUGICOx1oNLMYeKhzwhy
         P2YPM33ALAAIl67zzCW4t/OMrj2FSrxSKEA0a1D20WsDxMzn7SAcgu+FMt0ab3NjhFoK
         5y+6CIkmGB1boBJMNeGZxf+suSYk7cwCKnOk5YH8rP4sKPatFW+jVyrqwjYzlzToPin8
         IVp3ooM1tpByS5nytWdums6u09/GjnT6Xy4JpF9PUxfL2I2IfJ+ifc6s/uiSInfSAETc
         Q+Mw==
X-Gm-Message-State: AFqh2krEA4O2y6Sk7uarBY5KJvuzZ68TbRwbW1s6ZkZx/wafWqSUEO9C
	eUID1Jhfpoyva0uN8RaqG/OctmFVNMo=
X-Google-Smtp-Source: AMrXdXvAqKn6kOb6X2J/FFbJUbVcKJjUB8tg5/S7JMA6jmPoSA+7M0qFIVLazt4EBKzTQlgIaLnXUQ==
X-Received: by 2002:a4a:af4c:0:b0:4f2:cba3:8929 with SMTP id x12-20020a4aaf4c000000b004f2cba38929mr18061141oon.6.1674653491318;
        Wed, 25 Jan 2023 05:31:31 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 05/41] ettercap: Add missing dependency on libpcre
Date: Wed, 25 Jan 2023 08:30:47 -0500
Message-Id: <91a4036f8d6a76632e35c42ccbc2ddf1926efb39.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100740

From: Khem Raj <raj.khem@gmail.com>

It depends on it, but it was being pulled in via glib-2.0
which now uses libpcre2

Fixes
TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/recipe-sysroot-native/usr/lib/libpcre.so: file not recognized: file format not recognized

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8bc689ee73fa0f497294cc742660766c7ecd8c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 7d37f41096..b0958e6975 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -10,6 +10,7 @@ DEPENDS += "ethtool \
             librepo \
             libnet \
             libpcap \
+            libpcre \
             ncurses \
             openssl \
             zlib \
-- 
2.25.1


