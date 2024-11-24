Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA21ED72A04
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 19:57:36 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.414.1732467313715790960
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Nov 2024 08:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AUSPFknn;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: ethan.twardy@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-84198253240so7367739f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732467313; x=1733072113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86LcKlU/XTNhk1XwkIWYw7lMfVrcyfemlbFyZoKnG94=;
        b=AUSPFknnFMAzjAeKXdGLP8y0AC9k0Ygq/1HXfzTJw9XmCFIz83MXwpP+LfWG2dKd6t
         +1xwp6CJlRmpZdcH6RaCMTWgmdGuSflhr31RnOIt6k4avQnKmlu8bMsBwMHbq5NdBdCF
         0k6syp5wmLIrCELz167zMJzy/KyFHby3W/+iF0hPHuhkoMf6a4gPm+YQ+F66PUDpnhNm
         KA2to3uJC4kt9RNdc6DxfhC+zK6PumGAx0S87Nc0C9ANgsxdqsWTSofyeXmrxHtAhhcN
         3lRtoyBbh4ienikSNzfyMl4YphPbZ4puLo2ObJo0YOkPx7nqrj8YgU/LhOlD0UH7zkYm
         mXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732467313; x=1733072113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86LcKlU/XTNhk1XwkIWYw7lMfVrcyfemlbFyZoKnG94=;
        b=wnfEpGCEaP48hoOPlTEudbFDrbQl3LIhnnMcMLokGugYloVIVz6a7zSXHiGflhMY0H
         2t+dYE9fs6/4/lhTXIyT7HbGlINbvP3A8dR+27SX3gsrNFQ+EA4NvrkgCrlBRTlslvoB
         0oB/tlfuNC2cYdn0aKsPR4ipGcluU8IQwjSFb9PD38eCG4BD4LSd/z8/+IWcakQtDHCY
         t/I9CDD+WwosE3S088s9o/9JlCOPFtKCV+A5LANbOT2xCv01oMOlolgd/jJtxEntppg/
         w/eQNMyd5j2IlhVyV8VgdVw8KwnjiHKCTRW0/qj5j/D2BZB+hj8rVPd8epZ4Doj1NXZ5
         MeDA==
X-Gm-Message-State: AOJu0YyGva5fNRcse4sFqemIsOH4GAm5s4g3UVlIoRxLy+LRLfKff2kF
	2wDPPwbd0zAt7inr4Pw78RGoBn5lB+tlgFn3uQraSgtEU66YxSpI775L9Q==
X-Gm-Gg: ASbGnctqqtsAnERkt3Z75hJpHrq98IvZeeiDgThBkgULlmQRpAmHHjy3JMMY7//pHll
	ip7OqCEjjJ9nv3KNCAsu3bd2EUMOkk+L1vIFG5eYtFMVkq+7GqhVq4cKf6AMiZD+SxRk+EoSZ98
	I0fUw6yVTXgQFUo/I0ADwe8q0rispOq+b4AbJUze6WdzIgLACNRWhdTYuJMQ1/v4A2qkTsZb0jQ
	3qw//awBB2PXLFt5GqK9oW4h+Y3VyObWQwQ30EATwnSYbichSHFlLUqOgit34AUyGc2sOdJFiNO
	rzXbEZw3zP9ymEs36em1055zgYSgK7/mleYfZyFEX0D3
X-Google-Smtp-Source: AGHT+IFeiEWIulj0kUxlfjE+hFERZqOLQfckbq4m5dEylyEkYKtCcDieB92zzMKsmmBvdF6t1YxfaQ==
X-Received: by 2002:a05:6602:1345:b0:83a:db84:41a8 with SMTP id ca18e2360f4ac-83ecdcf3ca6mr1049039439f.10.1732467312538;
        Sun, 24 Nov 2024 08:55:12 -0800 (PST)
Received: from localhost.localdomain (h135-135-92-85.ashwwi.broadband.dynamic.tds.net. [135.135.92.85])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84180e319f9sm39507339f.0.2024.11.24.08.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 08:55:11 -0800 (PST)
From: "AmateurECE" <ethan.twardy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [meta-multimedia][PATCH] pipewire: Add glib-2.0-native dep for bluez5
Date: Sun, 24 Nov 2024 10:54:19 -0600
Message-ID: <20241124165419.24549-1-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 19:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114119

The SPA plugins for bluez depend on D-Bus bindings generated using
gdbus-codegen at build time. Some PACKAGECONFIG combinations appear to
pull this in accidentally. Add an explicit dependency to ensure that
it's in the sysroot when PACKAGECONFIG contains bluez5.

Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
index c8ac04d59..1c51fcc15 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
@@ -96,7 +96,7 @@ PACKAGECONFIG:class-target ??= " \
 # as being in conflict.
 PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev,,pipewire-alsa pipewire-alsa-card-profile"
 PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
-PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc"
+PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc glib-2.0-native"
 PACKAGECONFIG[bluez-aac] = "-Dbluez5-codec-aac=enabled,-Dbluez5-codec-aac=disabled,fdk-aac"
 PACKAGECONFIG[bluez-opus] = "-Dbluez5-codec-opus=enabled,-Dbluez5-codec-opus=disabled,libopus"
 PACKAGECONFIG[bluez-lc3] = "-Dbluez5-codec-lc3=enabled,-Dbluez5-codec-lc3=disabled,liblc3"
-- 
2.45.2


