Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AF0C54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 14:16:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.10510.1708179399995816574
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=UD5FcK2F;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4125e1a6a96so2401755e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708179397; x=1708784197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYfRMv9SaJVilUYP3rFdMhPdpJBdN1GXxsptbmL1/vc=;
        b=UD5FcK2FZtI7jnR5GxZhnZgi+RzM9SmihwaCtObyQ2UKbOdgCzudkTW+jcpZZnFnlO
         m7zJibraD1nJTVSudqVeQG+UAp6nKA4ZaBZUe/PJChbaYSiqiS795id31nhzyDV7O3HI
         gjzj5UhaV3TYdkaf73uy8lI6BsPp4O1HE5g/RZNs1746FgejX2kysRYNDgyGuM6d1d4q
         q3MJ1NKgLK1IL6ylfw+kOW/Ac5TZnsMzIQpuPYRo/YNtlnfwzb9wjK12y5SasAxzC6um
         57cgjwAzcRKCcyIS/DW16cUoVNNN3Y/4vPft9jhTL5qjsky8n8SbP79EQ+UryG1dNKns
         ZDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708179397; x=1708784197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYfRMv9SaJVilUYP3rFdMhPdpJBdN1GXxsptbmL1/vc=;
        b=gdO4mFKixuOO+Evj7mOBgE0jRyL/f8e+Oy5pfhAl3OueluL4NXvtwqAv/aSEuvSRC4
         W1wgSRseTduJJ/bKFtU1IkNjfgH2I9vUbNbaguOikYi0bZYJ6fk7CCiIXl8Kfe5bA2wz
         LZaSnOxpCVu9aj5ML1cuQoQyeTff4FTtKFYoL1zeStXghMYKxLZx/OXocNOarYq90j3b
         zxhZeVSO9+98Fu56EJqw+/fKRNqPgJRUf8cyjcAKY8NUSm+ArX/e65UE074Mk7/r6nQ9
         w04LmM6ulAIYK4Xz4qlRtOorHsE2gcYp8GjsUvPM3xR18KwhOv8zAv39R4tkBFs2XbdT
         ewrw==
X-Gm-Message-State: AOJu0YwYWG2sk/7x7uIKQoUM09zMDHxsW4kRGFJPyyEh1qcnvCWUwZnU
	Xh8pfqzscn3vpFk6j2dDLbn5Iwihtw3Q8xKiWYKm8ceavI8nVCa1/JukjD3CKB+IIz8riQ/XqSw
	yOe8=
X-Google-Smtp-Source: AGHT+IFEFV4no6GWas8DVosDwQs/Q53Olb3rTatjxt0abUA5+QYgpMHK8iQkXjDQcfkpr4duAY/Eww==
X-Received: by 2002:adf:e590:0:b0:33b:6099:5951 with SMTP id l16-20020adfe590000000b0033b60995951mr6601189wrm.7.1708179397532;
        Sat, 17 Feb 2024 06:16:37 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb058e286b009d8a6db98b186dac.ipv6.abo.wanadoo.fr. [2a01:cb05:8e28:6b00:9d8a:6db9:8b18:6dac])
        by smtp.gmail.com with ESMTPSA id 14-20020a056000154e00b0033d10bd6612sm5091979wry.81.2024.02.17.06.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 06:16:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH 2/2] ntp: Add missing 'ntp' static group id
Date: Sat, 17 Feb 2024 15:16:09 +0100
Message-Id: <20240217141609.625329-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240217141609.625329-1-yoann.congal@smile.fr>
References: <20240217141609.625329-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 14:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108832

This fixes build in reproducible test environment [0]:
ERROR: ntp-4.2.8p17-r0 do_install: ExecutionError[...]
| chown: invalid group: ‘ntp:ntp’

Also add a missing newline at end-of-file.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/12/steps/28/logs/stdio line 12221

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/files/static-group-meta-networking  | 1 +
 meta-networking/files/static-passwd-meta-networking | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/files/static-group-meta-networking b/meta-networking/files/static-group-meta-networking
index f654c55e3..dbdc7a5b9 100644
--- a/meta-networking/files/static-group-meta-networking
+++ b/meta-networking/files/static-group-meta-networking
@@ -12,3 +12,4 @@ rwhod:x:641:
 lldpd:x:642:
 opensaf:x:643:
 radiusd:x:651:
+ntp:x:653:
diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-networking/files/static-passwd-meta-networking
index ea907cb42..bca257bb2 100644
--- a/meta-networking/files/static-passwd-meta-networking
+++ b/meta-networking/files/static-passwd-meta-networking
@@ -12,8 +12,8 @@ opensaf:x:643:643::/:/bin/nologin
 tinyproxy:x:650:nogroup::/:/bin/nologin
 radiusd:x:651:radiusd::/:/bin/nologin
 nm-openconnect:x:652:nogroup::/:/bin/nologin
-ntp:x:653:nogroup::/:/bin/nologin
+ntp:x:653:ntp::/:/bin/nologin
 nm-fortisslvpn:x:654:nogroup::/:/bin/nologin
 nm-openvpn:x:655:nogroup::/:/bin/nologin
 squid:x:656:nogroup::/:/bin/nologin
-mosquitto:x:657:nogroup::/:/bin/nologin
\ No newline at end of file
+mosquitto:x:657:nogroup::/:/bin/nologin
-- 
2.39.2


