Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB856D3E761
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2030.1765388963762530262
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EwzeMUPN;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so64892b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388963; x=1765993763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/tkgeCn6VGktqbLIOjpgJe/8Nquxel5ZdmKTY4gbao=;
        b=EwzeMUPNpAs7f3DAIrrsEszFFVnEYKg6hpdIWHuRlJPo8Hngv5pX86oOBtGNI2X9Mx
         HHW/OOhBbiCfAsX6rA0W48Oq8IKXZeHJY9qf/qF+zgBROnCqoI4MM/AnAql8ZTiQIbmN
         PLz/X8ZfT7GyWk4De+KPzYHVYghw741g531CljTCohJyn6FfIPEX3jwb6Pi3q7yBUjgp
         jHxFzS7XVhau/O/9bboKyjaXfSOKCO4X99ZDvE8x6pGuUq017bMUOb9ICprGNk/x2HjC
         zlM/nKPes9NYwqHzfXmpqkIL7idsh4A+dvNE6FW3OwTJ3GV+NKr1lr0ipd1RjtOKuHpY
         xl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388963; x=1765993763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/tkgeCn6VGktqbLIOjpgJe/8Nquxel5ZdmKTY4gbao=;
        b=MurdbYfWD1w20o53++7qhugJ3wI3kmb7WQjyOmq+dGLUDrx7nhcqmMT+iWdMNTE4w6
         kodWGnI0zj+DKRdW1rF1c5yKxl6rTW8ia57bKVMRQeqHI98SnB2QoTZIuAJfy+q5jqfH
         kQFdOsUIPiSfaIW3lkktThFP6bqydhbroZo/yA9nuo+a3YLD/JZqsTKNaRGnp5tIbVi4
         x1D0WzRn31TVf1lFinL9IEUD2p1qH4dfgxk5jBVb5MxPIJc3MIJ89sFqhEm/rBqncMFb
         3D8nPvU04W1xEJDT0a43bR2W9axUhoues8GAInEkI7P6BJX+MgMkn1NQuMI3QtC9pBe7
         yJLQ==
X-Gm-Message-State: AOJu0YwBXuljUfYbfcPWQTBwexCxQU2/C/WGCO8JNiiNXC6STPHJGvRP
	WvB0PywQfoHwTiXQ8bSAfYAne+W0JEb6KtXJg5775xIssP94dE5vudcjAzwWRaUw
X-Gm-Gg: ASbGncvDxiMPHctYTR51umrv15531BUsxaiC2VN7RxC6JAOa5uhDYRz9sYfDnSVgrro
	Y85Ft9J1wlBw4xaCFqkgrD7IzTUGWuPuuccJSgZ7Z/Kp+LIP87GERREEGb9Ngh0YoaIppJuufg2
	m8uuodUvGs/NN/W1vwDfY3cIJDDHbwzrkYWCvieAqLYpf0/hZSnnrub3xfBb22Cy+b6Ic7dUfd+
	wiGoNVvaZeojSz0i8vTKZWxt70QUzMsDiswfBWdKX8qMDvNcsIeOv4yjXzGzBmKm+/beJSe1nbb
	9m+ZsSsIzih4CeqJ2WLc0BhZhEr5XlWV/7E38hMyOLpatCXuOtMAGGcnWTgAJJ9g+dVONlOUBrd
	rotN9XaPxypKv+iiZ8gqiHkYaM7X74i9kiB6TM54W2QXQJZzmpkRTDzWId2Cb3IbJXBKU947HqE
	kGWNXOURDKS2ocNtw4ufBXYo0=
X-Google-Smtp-Source: AGHT+IEriVp9WPnCCMeA0xSPtdDfDiBryl4QIccfxJUh8Kp+dOD5Q1f8OBkJ3Js0rEyQiQA6cKdX5g==
X-Received: by 2002:a05:6a20:a121:b0:361:3bec:fe28 with SMTP id adf61e73a8af0-366e299c64cmr3030347637.37.1765388962901;
        Wed, 10 Dec 2025 09:49:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 09/10] net-snmp: Update Upstream-status in the net-snmp-5.9.4-kernel-6.7.patch
Date: Wed, 10 Dec 2025 23:18:46 +0530
Message-ID: <20251210174847.2828731-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122575

From: Vijay Anusuri <vanusuri@mvista.com>

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 316770a9f5fa76b5ce6dca8a7ed66775c88271de)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
index 3f978d5f80..9111ed8ae2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
@@ -8,7 +8,7 @@ This breaks the hard-coded assumptions about the Ip line length.
 Add compatibility to parse Linux 6.7 Ip header while keep support
 for previous versions.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----

