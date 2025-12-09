Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8530D3B983
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12062.1765298155934177646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 08:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OY8Tmh95;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so4381059f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765298154; x=1765902954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWuXRLSK/K8AIAuXpap7znoSJ0/rYdWhpU/ZldWQd8A=;
        b=OY8Tmh95DFp/eHJVmswgKhOhL6cPIblsfnpBhCFgNP6g6OV5YZYBnf22rZ0d0DYN93
         7YFfiUn3K3943TE0aQoI7KEvoUrcGe6g7W+umDfS3EfgxoZOrvshy0Lk5lzSQ0K5OImO
         3wnWAdGCGcyYQqoZphP2Rpzfab3VhzRaC2XyGeGonnsQlt/PPkbtDncGiiS18hMkLB5x
         l1wkJRk10T6lluXcoNqAc1RY7QB6KBuBYSIS3DtU5ea87TDOvGph51lB3gjT1DymCW8J
         3Hk40OrJQ1kJjSgQRDoDfFqO5DnthYHR6FDmJlNcLUWTPk9PC7Wl5/MXUZ0SqbAX7LjQ
         /rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298154; x=1765902954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWuXRLSK/K8AIAuXpap7znoSJ0/rYdWhpU/ZldWQd8A=;
        b=cpFH2KADVtcmSncCwsJEj5M8o1x6Zp+1TPPm41rfomrk7FImSubzQXlxQATa/evueL
         9bH8JpTcgxDTOhH66Uk8rfRYFoV6wpy1S/6Z9c2Qvc5/uZ5dqgDQ81Q66PtzDBz75Drz
         la/zU9kG3oU1trf7o8l+2eglIvJ0AEC0qAFeJSwOWyPEoxrRUp8/HUfa6gKsb1G7QxXG
         OLNplKy/Wr8EUEjzHrbgzO+4l2KEHOCvrfLROp9oH32ukUlcVw+j5UJt3EOaqWeIng35
         8TMB3Re/5fDFg8JEONDeZO1JTkX7L+nbbxAyIJVKYZTy2w0AVzEsIVYgGsTFVJIklllm
         WisA==
X-Gm-Message-State: AOJu0YwMvt+DbZbphjOqT8g6jU8NGY4h5VI/ZESA5WG+/Lt7gkyGRvbu
	qxF3GesnyT5j29LbbC7z//ed18X+3oXZlNAakVu4TjhVKbDxRwdNUrqvV0xDHQ==
X-Gm-Gg: AY/fxX6UeVdaclQdwWAXv5octFfxCqDpEIg1ditkk4v9L1JuswiYm3updcwnzWLsDaV
	X5rWfHdkeWF97m5pz8EjSRRuHkhH7M/hxWGwEw2ml0X7yW8ohNHLETcVmBeWttEniR15x0L9EwM
	5xmo6gR1HCqAZzzCyiH0sk8yvFw+3Idhnh+mKLq6MCb2c7aNeyiervjF/9sYLrZky4/CiGIltxC
	e3Ck/aSsuZOp1pdZIVz7/KSUWabep8d/cGDVVdrFYoXzNrj/6Hw0dSMRHuELRzKVpYmLIY0yNGc
	f7QUemOXavO/7gGuO/MncA1HPDa5WYVo1ph1jTib+paLA0IZSQWoZYq9xQB9onTk6i4Lw+dZfTD
	r5AuuNv8fRQ1N1ghaZd0gBo28woZp8luVMD692Ttf09byz/nDc0eml0IdxWJ2Z65A0nkdKvYVtP
	prH6rumqn0cTRbPTVPP2U=
X-Google-Smtp-Source: AGHT+IEJ9EyRNcefLI/wp0HgHjuJyDLquUQaBkpjIh2HHHXEL3RT/6OF2exFUjkla5yc8RP3h3KsIA==
X-Received: by 2002:a5d:4dca:0:b0:429:b8c7:1848 with SMTP id ffacd0b85a97d-42fa090e631mr2000336f8f.19.1765298154076;
        Tue, 09 Dec 2025 08:35:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm33030154f8f.17.2025.12.09.08.35.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:35:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 0/4] Drop dleyna recipes
Date: Tue,  9 Dec 2025 17:35:48 +0100
Message-ID: <20251209163552.1419590-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 16:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122466

All these recipes have been disabled since at least Scarthgap, due to being
unmaintained, and they fail to compile with the latest gupnp. The upstream
repository has been switched to maintenance mode in 2021.

Could not find any dependendees in the layer index.

---

Gyorgy Sarvari (4):
  dleyna-connector-dbus: drop recipe
  dleyna-core: drop recipe
  dleyna-renderer: drop recipe
  dleyna-server: drop recipe

 .../dleyna/dleyna-connector-dbus_0.3.0.bb     |  19 ---
 .../dleyna/dleyna-core_0.6.0.bb               |  21 ---
 .../0001-add-gupnp-1.2-API-support.patch      | 123 ------------------
 .../dleyna/dleyna-renderer_0.6.0.bb           |  26 ----
 .../dleyna/dleyna-server_0.6.0.bb             |  23 ----
 5 files changed, 212 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb


