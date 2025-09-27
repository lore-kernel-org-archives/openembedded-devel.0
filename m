Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47483CAC5BF
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:16 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.6894.1758954794548567146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJId/lnS;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-42480cb42e9so13301105ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954793; x=1759559593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdzi3vkLNlqms196EpVccEmMGlC9YkEarXKTqZkY5KQ=;
        b=cJId/lnS9fto17tTeeq1oHmEXlccQCMHcJlgMfrqN3bPvjLaaqDb3gogdpErcHUoAF
         rKbxceNJZjlUCG0Lnn1Rks+hG1qMW3nkOllaD60onvQRwP84WdwVVPp8njDERXhI4gYe
         YsUZRucR7yXruFaVD6ltZ7GTI8rbfUO7ZaAV4zPkwLBb9ajVCXaoHfK7LZCDZ1hU98cL
         y4t9iGAjJZdZv6mZI1lDTT1mebkDaJBn9zuCn5q40sZU5v3XkeXxeWk4D8J8663rk/CR
         OI3XgOhw0q+JegVMjY5i2AocJDWAz7O9mZjEYLLav4PBHnp5Ahomy76hJSs/HxHF5vfa
         b3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954793; x=1759559593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pdzi3vkLNlqms196EpVccEmMGlC9YkEarXKTqZkY5KQ=;
        b=WCWnkQ+Db60YzUCq2GPGKOizcodCZd+BgkFDTWVLl2mTDmYeidyKz2act9L4E3HR8N
         DGNlIuO260Z+harcxeJ9VG80RmNxFIxQvm+DjrPfA0poqhjm05wDGuDilY1lpG1Vq2jn
         4D155axxiGIpK4nzv91hIinXSnwuEe9KJ0ZPzxxz2FGBjTox60RuU59QLUaaga+hnZFj
         sSxFbF3IH+Eihpoga0ps4vzOJB9NL2/7VlVeoJ/Wp1REyrQ35Rr652pgfRXOZ+SXAuVl
         xOxC92YddcOQNhR6QEv0WTQGFSImpCu3MFwJS+np3oun/1J+i+0pbLNMlq6BISK1katg
         GAEw==
X-Gm-Message-State: AOJu0Yz4t88RDjxMC1h+j2W4a0yy1+jzVe2OLR5NAtWSNZ+ZAC+YDUS+
	srPjJritjbaddLaQLA46l0/Cl7jW1/WRRe9ETcVun0cXbSkvKtzOP1htB1fXa9Hl
X-Gm-Gg: ASbGncuv3XSRkkZq3JjLkXIicBsrRsTMvTAZE3LFdT1A5zF2F2ldww3wXF7bkeDiHMa
	a6IA8KVjU9OWg+3t9psO5Mm6GNgYUMZgM3gHG/YVgB5Sq5HVkSpXcBrqpOY2+rwMUgNLlvd2TSu
	ANfqzxDQXoXUbFatR9xWox+EtsJuUNaaWnc64+pjBP/QHjEP86HDU/Z1gn297i7/NHHDRvLEqny
	lZXcikYlxCpkaiihsXO4gfKRi9qxfl2zB39sb8IhjIAKtEYJ9px0ZubzVvaT5k6ogv/qCJS4f5E
	AJDb5NVuMm7nZUDQEdgq55Q05H7+5n1lJHjaHVbCJk1drbI5vhz62BqXOy0jMNLBGN6qRrHgs4K
	8BHOY8wlAQ/24bp+y1F+1zD8I18O4WCasZs0C63YANdPW8LlIofE=
X-Google-Smtp-Source: AGHT+IEXmqCdgpC8bh+3s1UALIO6y9Yd+01lXTyrSbIRUapGwlg7TP0Las2AzVmbRCPZDs79xM7Kvw==
X-Received: by 2002:a05:6e02:1fc8:b0:428:76ec:b2ab with SMTP id e9e14a558f8ab-42876ecb3d5mr36265455ab.6.1758954793493;
        Fri, 26 Sep 2025 23:33:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:13 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 19/21] lsscsi: fix versioning
Date: Sat, 27 Sep 2025 18:32:14 +1200
Message-ID: <20250927063216.1865627-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119973

PE bump is needed because previous PV "030" > current PV "0.32"

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 52e78803b0c0c2f6b523b6a6fd4505af25cc6ff2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
index 63b94e9d6e..d999b8f144 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
 SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
 
+PE = "1"
+
 inherit autotools
 
 S = "${WORKDIR}/lsscsi-${PV}r154"

