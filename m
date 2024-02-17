Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C69C48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 14:16:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10389.1708179399719601916
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=M8eslwHX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4125edd1433so1714385e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708179397; x=1708784197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl7Lf6n/kTU2jFW62hMykzL41KvOwe+p9BFFjPOK5tg=;
        b=M8eslwHXBhFz/9Ui3Xbonv53c0i0QShWA5SVn0lmP+SVJVJ0SEWTM0ESkidMqiRR8r
         IZnpKUv4RP+WB03Vt27N53Kmgvo742LTVmXd1TdehPPrvWdeUmrjFGA33q1klAO8Lufw
         jGBm6Gg5ukzjTT4nYgJmAZombIqrmkxQmX4v8PIlmxeFMUkWtE6oPSC5t2jRJy/f5vpD
         TKNkZBj/2MfGzpYfVEkcWKoepvxXDUq/drqu6yaIa9HJunq2BkUc5utRKSYKwOyawzSr
         YMHp/EHEF9wH1/yXs3HZ6bS96n82AFqcPUPgHdmrF3MYTB0uo+0o2roVAEfhMn7SYPPt
         wp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708179397; x=1708784197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fl7Lf6n/kTU2jFW62hMykzL41KvOwe+p9BFFjPOK5tg=;
        b=ucqVkfUNk5TZi51GH94uZpJk2GHZdnc1WA/dNJtXqFIZ3ULpb8ZXtVFWPu12Ll9TDr
         ATSeKnuZ+5bscpBTbtFRYS7apc0xv/JH+RJDc/T3ssa34xwOfkxmb3MZvwgYA5uaCbOH
         179Vu+a/Sstsu2IQDJktnH4gnxjRhQGcvoITXhyh3nK14AhQaaHOeWi+UvhLEVHlMtEs
         DgKbfVWy6spZYsARBGdTp6bqROnQNm9UM0EXJh8NiGMldTnFC33fycPtn9bMVDoiaIeU
         OZHG0q+LmeFf1VIClyYUSbporwc6xSbAsiE8Uz2pl0jTaKH/gyLlNxl0vuZQ4RHL+wyh
         kBcA==
X-Gm-Message-State: AOJu0YyfIX6bjIXpTlneJeoFCHuAwo62Sonaci0vkpE3i/EXsrDJJ+/N
	jUhLR1hU2JEiz3WZ1J/YV8jE0au6U9YCd6uehbfrjWsKlBSIUSF8U1IwBRR1zBbxH7ytJoV8fay
	+OUU=
X-Google-Smtp-Source: AGHT+IF8VWdKVyXuoLmRJZtxRAAy9hsjKZMWoh6zGmtcvr/sXNg2PQ8ZzHAg455vl2W6E7WmRYo3Wg==
X-Received: by 2002:a5d:58f2:0:b0:33d:3673:6292 with SMTP id f18-20020a5d58f2000000b0033d36736292mr563907wrd.47.1708179397128;
        Sat, 17 Feb 2024 06:16:37 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb058e286b009d8a6db98b186dac.ipv6.abo.wanadoo.fr. [2a01:cb05:8e28:6b00:9d8a:6db9:8b18:6dac])
        by smtp.gmail.com with ESMTPSA id 14-20020a056000154e00b0033d10bd6612sm5091979wry.81.2024.02.17.06.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 06:16:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH 1/2] freeradius: Add missing 'radiusd' static group id
Date: Sat, 17 Feb 2024 15:16:08 +0100
Message-Id: <20240217141609.625329-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 14:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108831

This fixes build in reproducible test environment [0]:
ERROR: freeradius-3.0.26-r0 do_install: ExecutionError [...]
| chown: invalid group: ‘radiusd:radiusd’

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/12/steps/28/logs/stdio line 12830

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/files/static-group-meta-networking  | 1 +
 meta-networking/files/static-passwd-meta-networking | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/files/static-group-meta-networking b/meta-networking/files/static-group-meta-networking
index 1b6de8d1c..f654c55e3 100644
--- a/meta-networking/files/static-group-meta-networking
+++ b/meta-networking/files/static-group-meta-networking
@@ -11,3 +11,4 @@ ftp:x:640:
 rwhod:x:641:
 lldpd:x:642:
 opensaf:x:643:
+radiusd:x:651:
diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-networking/files/static-passwd-meta-networking
index 03dc2133c..ea907cb42 100644
--- a/meta-networking/files/static-passwd-meta-networking
+++ b/meta-networking/files/static-passwd-meta-networking
@@ -10,7 +10,7 @@ rwhod:x:641:641::/:/bin/nologin
 lldpd:x:642:642::/:/bin/nologin
 opensaf:x:643:643::/:/bin/nologin
 tinyproxy:x:650:nogroup::/:/bin/nologin
-radiusd:x:651:nogroup::/:/bin/nologin
+radiusd:x:651:radiusd::/:/bin/nologin
 nm-openconnect:x:652:nogroup::/:/bin/nologin
 ntp:x:653:nogroup::/:/bin/nologin
 nm-fortisslvpn:x:654:nogroup::/:/bin/nologin
-- 
2.39.2


