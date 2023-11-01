Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FBBC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 22:29:33 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1642.1698877765224016616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 15:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DeDCPBPj;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc34c3420bso2155055ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698877764; x=1699482564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wbnryHIAY99iRylLsMD1wX/JVHTubHLTnoNh89YJbQ=;
        b=DeDCPBPjnoAwTXo0t0aSy0PNs41uHepgvk9wFPavz7TJ1k40H0LTw/Fxb8ZlGHLewd
         Y4r+OOFLzTXKQgb1rc9HrGCPgf5BH2pu997yQL9tdYLTveHEaOF23zs8bOm8t3M7stOg
         GOXyEoEaCQ58PhZLIJjk79pPHM1P1Puf/aqbeEpgdt0871yl4T2Sht0scKMRK6ol7ngE
         BlPpSeecMGXPobHc8yAuIz6k4Vz3t0dV9ivUXyFVBAoyz28iWDQYoC0k2EKxaWYHNQ8P
         R/av0QXMZXKgg6HxyU+FG0SINp3k1NiNYV8ULwUoneAxe1Qwug3WrQM4gZQ36yvq+SMo
         xJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698877764; x=1699482564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wbnryHIAY99iRylLsMD1wX/JVHTubHLTnoNh89YJbQ=;
        b=EZq6taf8hKyzvPWVi6cv2ZUBF1G94FScwhNcdTDLymCqZ1zMltfONsiGUccEBvU3qW
         3k7Le2gJb6NNrDHb0UzUGtRke6m6FyCjuX6Z62SxOZrxOti4RQp72KLS5XIaZWEcHXMU
         9TUTKrvERMz2/FKmlyKXeyKU0FMN4oHWFGFm3wyAa1soUjQNkCxA68sfa1ZzSJ/dPgaN
         /ZWl3BNBhGIHoQ0cLqrTVTp/9hw3g6eo8qf4dOTp4dvzjEK+ddJ62LvaV25felhZk6G5
         d6eO6fSTocLlpQnBG8XQmZk9Yf3dm8CiLM5uDPQDdBYOzOGYMI9jx10C3sYerDll2Zkt
         /cSQ==
X-Gm-Message-State: AOJu0Yw07oL1oZ8ciKSCFNGpILbHcs2apczCsrUD6d9xBvWUul0Mzlcl
	3YuZKgtVXuRqCjWCcy4H/OOVL+vBFlp95g==
X-Google-Smtp-Source: AGHT+IFUFH3j2RaNKJtsD4eOuPuIbInbZfgX7u8WodoJSoT5T3ZsT8SHsoCPnuW7MNSSnl5U7sCOrg==
X-Received: by 2002:a17:902:e311:b0:1cc:2151:2b36 with SMTP id q17-20020a170902e31100b001cc21512b36mr11234104plc.55.1698877764214;
        Wed, 01 Nov 2023 15:29:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001ca4c7bee0csm1747831plc.232.2023.11.01.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 15:29:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] wireguard-tools: Add runtime dep on bash for wg-quick
Date: Wed,  1 Nov 2023 15:29:21 -0700
Message-ID: <20231101222921.3382598-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 22:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105827

Fixes
ERROR: QA Issue: /usr/bin/wg-quick contained in package wireguard-tools-wg-quick requires /bin/bash, but no providers found in RDEPENDS:wireguard-tools-wg-quick? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 44b9eb2f7d..56cdcc6cf4 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -30,6 +30,8 @@ FILES:${PN}-wg-quick = " \
     ${bindir}/wg-quick \
     ${systemd_system_unitdir} \
 "
+# /usr/bin/wg-quick needs it
+RDEPENDS:${PN}-wg-quick = "bash"
 
 RRECOMMENDS:${PN} = " \
     kernel-module-wireguard \
-- 
2.42.0


