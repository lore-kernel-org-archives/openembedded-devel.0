Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C12C369B8
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.12851.1744471830886411514
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eigbzk2U;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so2400505a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471830; x=1745076630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BmY7ANLFHPBWO/GJIA/Ad7GrRxjIj2Rp2AiKxbvdww=;
        b=Eigbzk2UDJkqxkfvaf/yiHv6WgoJfLwA+/ud0i5U2AXMZXMtMBNpNKaWBOQY60fe8F
         E3cRacnYWfQY7i9kFIwYYlZ1wnMPyn96Bunkmgnrev3E62+rXtPQb2l/9YjFDrSeasmU
         TH8URO0JGODoapC/9GSaGDjTZPEeHb37YC9NOG+DtFgAcmXXjEH/PLotasOdkiMiTGXo
         eYEy1Fs7hd/hI5iQq19HHtSSQAzxKUsMf4pKvAY1mque92aD1vnX52E6m6B5690WqJq9
         Totdjxr1eJVYYF2j2NUlF3rCgkh5EzPF++AgLb2Mnt6r025tHtt5U0pgWmWAinV9LcYg
         q2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471830; x=1745076630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BmY7ANLFHPBWO/GJIA/Ad7GrRxjIj2Rp2AiKxbvdww=;
        b=N6uJt24TiWLWHvsoNAX+0LDl1agLA5uMFL0EgAtMQT8zAylX3IWnpvji9fW0tRY1Q9
         oalW2fsHI8jNVUKurup3NxjTB+rEW9IdHtjI7lDWYU47KicbAD1GfOarGZGCxyGOBApb
         ZCCVHVtv8UWSs+LKQ4Vg8pfD7IiGIt49d76ak2o3/GSBEucPbId9PR/JTCiPQdfGH2j8
         jfdwzbpLPsCzynz/XJVsH9jiobJI1/7PIkFHJYiy9r60iSg22OBS95fsOvvP/Ynz9kM3
         uMEU2Z65DoZDg7sYOxQh+toN0U1aWiqbHjUxGwV4mc9qcXdzvGxrlrz7kZmT8mC6zQUe
         kHPg==
X-Gm-Message-State: AOJu0YyzlrtduUH4n4KmCmbNEEDzXUky2BqhC0I+TOXHEZTcNxCBuBNl
	ZQIEzDFfjJYNbN/UENi6XQUMrX9LfyioCFoTmmZJvWiZZUujyk1OutlcOWlY
X-Gm-Gg: ASbGnct+nsu7i54avSqgusAyWvWd8Km7LepRYoGUGd9TW2UBzm2HbXaWb1MlLOd7Byn
	RZ4y+OBPWH5+2E9Dhr/eeugrl5XpRQlfAKAKLnZqtKcp38yd/sIlE4XzA0vtYFWa70WqbzegN7u
	6DhdkGMuc8gkK2R/+0Eq6NvWgJBmQHwavmAIQ/krX59TtUo75Qk7wQKPvgc1LibrCfRl8hDdP1R
	dTiCwEbEQpTC4sZfvtkSHNRqZbaWXt9+te4cg/QAlCzz9Fs73CFhITKzykt+XGWQ2yaLPOAaMSP
	0KWPywN193dZV0xD/aqC+baMy/hLlP3H
X-Google-Smtp-Source: AGHT+IHDty0WtLpjW1rBL8pjDJkhgm79DvYlyU8qRacEuIj1IUkpWtTDUifdGtm7L0JjWDQgC5lrFw==
X-Received: by 2002:a17:90b:4d0a:b0:305:5f55:899 with SMTP id 98e67ed59e1d1-30823670acdmr9306683a91.11.1744471829810;
        Sat, 12 Apr 2025 08:30:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] meta-oe-image-ptest-all: Do not include PTESTS_PROBLEMS_META_OE
Date: Sat, 12 Apr 2025 08:30:18 -0700
Message-ID: <20250412153022.2343322-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116816

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
index da942e8bee..e8e1750b0e 100644
--- a/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-oe.inc
 
 # Include the full set of ptests
-PTESTS_META_OE = "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE} ${PTESTS_PROBLEMS_META_OE}"
+PTESTS_META_OE = "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-oe-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_OE').split()])}"

