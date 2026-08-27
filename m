Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D09C61DBE
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28013.1787799224655195363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xpz5i6bk;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2111731b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799224; x=1788404024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sC9L0C+gwdBW1UaMYN3QxeBdoydHf+9wtu9BWcglD4=;
        b=Xpz5i6bkECW71/TLC49dvbL5ZHy/1cJ/TbeDlZGD77lglNxjs85L+Bk+1RCtSJY++t
         fYkk3Q0lgiSoBef+pk6wOXezULVlwNtkcYYWXjDL0gOlw9lEzRzxZaZ0k9y1G9/PboFN
         cBOsE3QmCYXiDrBjyuOKJNK7hoxqrlBvKVeoCK8CtY0Hhvw5z5Cx+edDxEYM7KsHYIst
         w/yTxbb2n/XKSDpSOcn4rWlnJ2zctKpYWckKtmGeBlMhcFOaBvG/xDnJyyjb6B3dJcjM
         MRhGMiuHvMYS9tYgXIVD4Y1D3JCfH/lbL8mo37u6H75zXRjr9+OEwnuq1gw2aGZlIALz
         NcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799224; x=1788404024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sC9L0C+gwdBW1UaMYN3QxeBdoydHf+9wtu9BWcglD4=;
        b=UD5gdXQlTOhmu3RnqQuUzG4zfFkkxkWY4D0rG6OEFPPyVeeEb1oXgSO6vXjbhwwkdB
         PBtksr8UIZVIq0L/EFTbbPp0FQs5nDnl0/bfCPjuu/r3XbQt670Z6Hn0k7POI4e6sv+z
         MKNocbLB1YSkVavQeCQJ8lWBQ/IVjOQYpCPIRTd0x1GvwTdCXGqvdvU0T2si3ut3gqcg
         tW3v9oKiJuodTPWzqKmEL03K7g6jEkaJ/W8FBymMeRJvSQm3NhtBcKcANgDKvA7pb6n2
         QdtH5iTVtAyJ6CXUY02YIUSBIsgLLN9E3KrF/2b7Somgfu2Am9E6wrmJUBNiVvPotP0j
         GAJg==
X-Gm-Message-State: AFuF++kFGjIYcR5lat8ImoDxLNsvZ6R7QtnfSiQjpnGEbe+QKQHwHFzq
	/i4eOMtc2YrwJ2ztFcU4nG1+WHc8fv51gHBbQRGAMqY/gxo4X/Zd2kW0paVCPw==
X-Gm-Gg: AR+sD11gIsLzptIQhucwxaERuhAdDBM55STZE6FhjHgdlyrJEA4O2mk7aMapJS3wyiJ
	b6h8DGa2J0QQ2CKbgoWe/63q82o+XgWY2y6vb7RnPCfS5rp1ouB8S2zGLAAuqK9112TNkHSkWyQ
	/tV6H6eiDQ4PVp5unTZUm/QfiMHzwN7EvIjtTBCL2RRuYhvyUIT11tP4LufPNd+Pdy/9U5gyGYc
	GoT57YBYJSB/hAPFSOKPqrVKst9wUdPNvQpbdOyVpIlUsaEmet12eRCHqb1XSe/bvEkkk6cUl6u
	WBS26gDfNPl7HqGMD/0fuHdxP1dhyqiXvvhisnGgk6cnwkZSJmxz88Z0LknGigsIrIPvJItg94+
	9D5ifl4XiiDRkFmld6w7ERHPhgVUWRotg7B6JZn0byj/R5q7BRHm54Tp3npvEaL/A16xlM/81l0
	4LNMBh4LmyEunjPgeMzXWygRv5cs9cxk6bBKfLOKe1yAtVek7g4hIt7p2uvnNb1At51aF8LnYE6
	AEjRDugbrd1
X-Received: by 2002:a05:6a00:2342:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-85373bb5653mr22159399b3a.7.1787799224012;
        Wed, 26 Aug 2026 19:53:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 5/11] ncmpc: upgrade 0.53 -> 0.54
Date: Thu, 27 Aug 2026 14:53:17 +1200
Message-ID: <20260827025323.1433982-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129525

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/ncmpc/blob/v0.54/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-multimedia/musicpd/{ncmpc_0.53.bb => ncmpc_0.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.53.bb => ncmpc_0.54.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.53.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.54.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.53.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.54.bb
index 0c8f450687..81ded9db1b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.53.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.54.bb
@@ -34,4 +34,4 @@ PACKAGECONFIG[outputs_screen] = "-Doutputs_screen=true,-Doutputs_screen=false"
 PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https"
-SRCREV = "b6b1116709a6981d432cd2455bff4c35e4b96213"
+SRCREV = "55a7653d82eada7e6813dcb1e965969ceeb74dc2"

