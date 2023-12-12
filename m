Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093ACC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 20:35:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7216.1702413338792043184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 12:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DR1MhgtA;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso63267785e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 12:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702413337; x=1703018137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wtU3dzSPjUhbf3qTNIpCNi9LVG1mIyJQ4La32B9n/w=;
        b=DR1MhgtAECUJtHLm0/G+EJe0cy0V1yjBAbkTG9gVndGYgqxnyoFmdteYKX7+b99PP2
         eInbBFhv9dP7OIMzKhbOmCMhSHQEEC5lP5B9iJkiY+dNtGenq+NPt2UW/fv7sWbVjefJ
         Lcimq6RG/rtaSwC7Es8hcWxbkr66ai0iHPb1Ectew4CVnHt1Tv814FQvVtN7Fl4oODKX
         UwWXPq62kRVysVGISB7rEPFmjsx+p4il/CcV9d1AhMDjPQpIssoFLQWCZb8xHFu9PLpO
         VdMQNObl9HfmMAIMxin8kBl+IzGNjW6Ozvn1CqHklJCr3hPpleMmlttL0G+G7Hl97RYA
         3s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702413337; x=1703018137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wtU3dzSPjUhbf3qTNIpCNi9LVG1mIyJQ4La32B9n/w=;
        b=rnWo7HiV0yb+pU1lKSUPl+gRKEK2wM9JQH632SoFUbPCP6OkFVEONAgjKEYKMQp0km
         LdcDQCvi0FjKNNLvtBTJ8dGmh2rseKhnsCi8Z7zil1xdh7rfsliHsR49ohxIu+6spnn5
         PAETyba6Sl4GuEVip6MJ//iy1SXlANKin2guaTpWMKUvKJCy/JqQNIErVn1Mgjy0JdYN
         3uZ1uWgDUGi2CkddNbYO1xeQ5oWij3NNxVHH2nrSVL73b7o4GJfGJUShD16o+q1ilZtB
         wjM0O24X2hnEn+Fhnda7scYeSf/yxHaxT97+eDZli9ozZ7SJtmti1DlaKp38PYnSSknp
         XPUg==
X-Gm-Message-State: AOJu0YzFFjo5N+CaXV5F8/JQe3lK5LqllcZxAk1IwLrJ6eus6EN/sCK1
	HuoXvpZ0d7hqxvWlQIdZqY4sDyta3Q7XBA==
X-Google-Smtp-Source: AGHT+IFEVP3gTTy+Kwh4rF5PMtPjfwgf8TC6e4z1/r2fy6OWP7FApz9eUrWhwGFWWidy2El3kU0D+Q==
X-Received: by 2002:a05:600c:319b:b0:40b:5e59:c57f with SMTP id s27-20020a05600c319b00b0040b5e59c57fmr3144532wmp.169.1702413336594;
        Tue, 12 Dec 2023 12:35:36 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0040c490db950sm7554730wmq.47.2023.12.12.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:35:36 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH 4/4] pgpool2: use autotools-brokensep instead of setting B
Date: Tue, 12 Dec 2023 23:35:09 +0300
Message-Id: <20231212203509.902175-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212203509.902175-1-alperyasinak1@gmail.com>
References: <20231212203509.902175-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 20:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107344

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
index efb563b81..5e6e00cae 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728c18f0f54c8
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 
-inherit autotools systemd
+inherit autotools-brokensep systemd
 
 SYSTEMD_SERVICE:${PN} = "pgpool.service"
 
@@ -34,7 +34,7 @@ PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresq
 EXTRA_OECONF += "--disable-static \
 	         --disable-rpath \
 	        "
-B = "${S}"
+
 CFLAGS:append = " -fcommon "
 
 FILES:${PN} += "${datadir}/pgpool-II/ "
-- 
2.25.1


