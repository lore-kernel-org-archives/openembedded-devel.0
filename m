Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6C0C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 23:54:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9191.1708214086367608034
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 15:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=C5tduEbB;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-412605d6723so2487785e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 15:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708214084; x=1708818884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvDbEWoSBbjz9HiG8iL4KoIMHyOfFSUM4VHmG5xLIWc=;
        b=C5tduEbBBpytIrtreJHLMUaenuMTzQ0JAuvtzrfEo+aOQRhvMIWfLrlPpSG6vthPNW
         X72SjkOE0kRlhbCZWtM9NpKAvaO9oChsOqdMeIr13YQ8xsrr+oAMEtv9QoHDBBaW99y+
         cDv15Q3XgBUTmVLwzSZpy8F8Z1XdH2CEYJGTP5SyKXq2FvtX7rprQDm0jx3aXilyyDKe
         YY7As0gQNrOVmPGuLBBpGSVHruokoGz1kmaQOSdHw4SnGbXeaH9gyI8GQFF3Ft3j0d9R
         DYtJiadPShggsXemfDFaS15/K3mUb19FKSqRv+XZRXRlKxYwwOKOnS7TLxDP1nZiIWoL
         yuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708214084; x=1708818884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvDbEWoSBbjz9HiG8iL4KoIMHyOfFSUM4VHmG5xLIWc=;
        b=PekIDbHQ1Uz+RxreX2Up1Yx1nY8BibULlNEq1TQRNakwOpCeKcidsOLiLkcnZHmwkq
         wWsyMIgAKoQZviTID0viuGTBCRGx0NHxcGtQusZkrZfeArXhuzoJXdanhN7NyC7idHfW
         MfAulQYKE92ejLWImY2yAv+r+TWEgwopRmJCO0o4ZdOiBwh0imp8MIOvHPdY9IIc/zrb
         sTQu5vODXvcVUh9WQrHlYu9E1QycfKXIV38yvjEa3zulFufh5dhSAx3UdCYmmoyMKzOc
         XDMLYqPwo131OEHnKX7lWw0h+FP0yJWXtJ9hjYjFi2hkj+5JZ0KsaPZDyis5+haraoj4
         TXLw==
X-Gm-Message-State: AOJu0YytLlf0A/MJdeGlLUkIf/8Bv4aomVTB3ZzyN3bADbV9o896JusZ
	HQ2ur48SipSMN0Pp9XMF4TxNZUh9wcoJY/RgOtUni0W0si8eh9x/0WPx+j7Hdv1wGeonw0yuHFQ
	8JO8=
X-Google-Smtp-Source: AGHT+IGUVE4wNfviErspYJwu82KsJLghpeCPB//O622CDWr5D8Ov0uM5TBatduiKNsF+gK8CSGHe+Q==
X-Received: by 2002:a05:6000:1887:b0:33d:3abc:8a4a with SMTP id a7-20020a056000188700b0033d3abc8a4amr671712wri.62.1708214083787;
        Sat, 17 Feb 2024 15:54:43 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb058e286b009d8a6db98b186dac.ipv6.abo.wanadoo.fr. [2a01:cb05:8e28:6b00:9d8a:6db9:8b18:6dac])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c378100b004125f34fd7csm1817628wmr.31.2024.02.17.15.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 15:54:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 0/2] Fix influxdb reproducibility build
Date: Sun, 18 Feb 2024 00:54:22 +0100
Message-Id: <20240217235424.1091544-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 23:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108835

This series fixes influxdb in reproducible test build (See failure [0]) 
* Fix a type on the owner of files in do_install of the recipe
* Fix static ids files user in reproducible builds

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/12/steps/32/logs/stdio line 34799

Yoann Congal (2):
  influxdb: Fix /etc files owner
  influxdb: Add missing group to static id

 meta-oe/files/static-group-meta-oe              | 1 +
 meta-oe/files/static-passwd-meta-oe             | 4 ++--
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.39.2


