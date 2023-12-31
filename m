Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7116C47073
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.219030.1704025431118004142
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9Zqo02x;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5559bb6b29dso2659493a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025429; x=1704630229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgsQ/bk6k9WQXHGFeLPh8tvbJeSBKlBhE7UJqEqkCTU=;
        b=T9Zqo02xxZD1wtIDIQinLqlFqTKiUK9MzHBNxABktsEhwi184rTa4NsazHIiqL2ywE
         ZD3J/hmv3MKP6JapqICFEPDymU7LGjSdZPwnNupD6Tf0HhlJ0k98wR4H8Zp2CgOBq6Lw
         mWm2mqQfJeB68KDNrWuHg5aw0mwqegeJdRDgrcAs82SarPHgRUtiBQuHlVUp1ABuOIFz
         0l8MIWguiCEOpcBJlsx6ncL90EajVCJVifPbOgVWYfTmC/CDhE6//uN7ozmy8o49b6ij
         DrB3+CS7CFXduGAEpteOCIwTiQzfr5iQKe8PzG42FANPBFBk2tjt6rowgJm0hhbA+8Dk
         xqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025429; x=1704630229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgsQ/bk6k9WQXHGFeLPh8tvbJeSBKlBhE7UJqEqkCTU=;
        b=ESN5MsPECdx2sADIAUiMR3mbtiGxaHZLDDQUWNTAQSN2jnR+YJVilTVTcwPzHI9re/
         wub8b++vpxQLuac8xJdEhUD1a1ehVPFLXwfPaV7mF9w+0vYbEOKKLbw1gRnPuiUmmkfx
         xsvbdZOxchL+fxl+NdjLBY/st0hI19CyLxSKwUv74W3dzycpqCmpOT9HLcsZEXDfassQ
         anT03SkBE/M4OifWnJliNhHXY9GVxxxfiXvv+LtHA5Ylt4G29q68pd+jlUj/RGrK1z+g
         EtWGQomWyJZVDkOdKC/FqBJPfcFGppFAqL9JaPmRzCI0iP1qQpJTVNywhCx+b7cx0Cuv
         FTSw==
X-Gm-Message-State: AOJu0Yxa7asCZosDSblBjONwRrhkf+bCFYwu9DJ/7zF24uCZo9Tr4fvb
	kDoXj93GKgqwuLYqJZ7dmAE15vb+L8U=
X-Google-Smtp-Source: AGHT+IHCTANFayESChhlsL56NEzhRWxpAmGywDcbs3/8Qd7ZMpo4XCQ6dsdFeaAJHlIx2l8djzZaVw==
X-Received: by 2002:aa7:c050:0:b0:553:5c7e:8c5c with SMTP id k16-20020aa7c050000000b005535c7e8c5cmr8292512edo.21.1704025429596;
        Sun, 31 Dec 2023 04:23:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/23] hplip: provide setuptools for the distutils copy
Date: Sun, 31 Dec 2023 13:23:29 +0100
Message-Id: <20231231122329.405225-23-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107974

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index ed9f28e07..be420b483 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Drop-using-register-storage-classifier.patch"
 SRC_URI[sha256sum] = "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1366624"
 
-DEPENDS += "cups python3 libusb1"
+DEPENDS += "cups python3 libusb1 python3-setuptools-native"
 
 inherit autotools-brokensep python3-dir python3native python3targetconfig pkgconfig systemd
 
-- 
2.39.2


