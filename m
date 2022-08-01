Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AACEC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 09:08:57 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.22789.1659344931582094110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h4AMGYj1;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id uj29so5999200ejc.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=kxzAjpdFMzjVsg0mEbOcKde+4l92Im8pGqgvaopEkNI=;
        b=h4AMGYj1BKlPbk7bZViVt3OGje795DD7wEcktLK66yMgIqX7aguucOr7WxCS3o8JRr
         A3DZx3VfBk1MaoK5BCRdgOCvgwXozelhmTAS87tgVvRH2YC2+ktZ1+z1LNWYbGMw73Pq
         Gc1r59tZ8grQ4IO6ayGKvYNVXR5eaEKa4elf6jENTdnlb+4Yz1/OaL185I9ORLAlQLs+
         IlJd80JRG+IG4j1q4Xp4wVbQYC/ZKgOP8xvAVth+eAIPioooxKxdCH9MDqwxgBmvdCZi
         8/b2EbJncjCrlj/Q9LLAoTd3oABu585D67Yc1RBdB5vm6wMCb6woQygFSzDFtMK/h22Z
         1wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=kxzAjpdFMzjVsg0mEbOcKde+4l92Im8pGqgvaopEkNI=;
        b=v+v2eJhn7N9nCbY1dJFitmlSyr5tx3QDyW1PHSumLf9pSEqMSiPiiUx3Lw74547hy6
         34VBPIBz/gt7jAuy0QrORA7aoIc3fbUYfWSvMldIgAGSXpyBJiLaoQGasC58nOnsoHfz
         CyzJzXJ8ek6ZJKeINKj96+SIlf6B1g7boDE2zsLPT0CViIz/6CzLDnZ5+1KMe5HrJsmb
         8tzRNaorB0IuXJkQrzoxK85gI72JEr0qJ/GTxTEcHuIPDmJDf11vkXkBStWj/NU9l8wl
         OD0Y4dqO7nv0MZs+PlunvUmU6Vx+5ca+N8n102OX/6woyGcuj1fZB2JaRhOmcAUtmfYy
         OLsg==
X-Gm-Message-State: ACgBeo16fIOG/C4KqOOtqghdVi5xEjXfXz50wludsGK9TxIHlT6B7l9S
	NPO/rz38zNdap2+kpbYB34IiXsfCHWs=
X-Google-Smtp-Source: 
 AA6agR72qeWeMs0NQDdXffx7jDTvD8+laiEpne80EunEqMhFGdMUDJK6teogaQhEF9uHwQOF/BcScg==
X-Received: by 2002:a17:907:6ea3:b0:730:942a:2a38 with SMTP id
 sh35-20020a1709076ea300b00730942a2a38mr1126285ejc.113.1659344929788;
        Mon, 01 Aug 2022 02:08:49 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a056402328400b0043d18a875d1sm5335067eda.79.2022.08.01.02.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 02:08:49 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] ntpsec: Add UPSTREAM_CHECK_URI
Date: Mon,  1 Aug 2022 10:08:02 +0100
Message-Id: <20220801090801.19929-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 09:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98072

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index 3efac7d98383..cd8b396f192c 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -20,6 +20,8 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "f2684835116c80b8f21782a5959a805ba3c44e3a681dd6c17c7cb00cc242c27a"
 
+UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
+
 inherit pkgconfig python3-dir python3targetconfig systemd update-alternatives update-rc.d useradd waf features_check
 
 # RDEPENDS on gnuplot with this restriction
-- 
2.35.1


