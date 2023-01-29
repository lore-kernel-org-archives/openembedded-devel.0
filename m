Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94218C63797
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.25477.1675026042996005470
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HbYI1kr8;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id i9so8574463oif.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D+uecJlv2w95gPcAkZGJIBQy/ByYG8l//+q9WNZ3tA=;
        b=HbYI1kr8vtmRKYL8zLpl8PQB4eDXeujWqeUWyakbRehpfjIyf7PX1MhWozl+fhev1Q
         28r9xqCEbTDuGLxidPD6whkWjHcngWmfK7HLnc5+OwihUhS4ZRV4gEvKrzFoRQL486ZK
         gSJd0itgTi47QcIWd7BP9N3bXdNWq5sTJZUB7iKAqeQV9ykBAfJYYuVuElZLICz9SFye
         CVn1JECaEHgdLfm9rkzTF77Td641b6AB/faU+r1QYDJ+VfaGQttAfafzEi9CI+Si6nFP
         UgZe3EZV6pveUqdY50aONGym/oEt83ZbL93rJGTwqDc/1qSDL6xSoYuA5X99vt8LM+7V
         eksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D+uecJlv2w95gPcAkZGJIBQy/ByYG8l//+q9WNZ3tA=;
        b=uQJYxRxZ4uyEsPw+JazGDExPFEzjkrXZXJiM+RhM8Cpf5rq827Sd+EkARAdQQXiMo1
         rFF5y6TuHoWDE6vL6mL29Men4AbWA9ZPUBWvacuwEBlLmCv2tIPSdDlfTmCl5s6CmCZb
         E1K+cu0BPNXBuZqIWkTPE2e8e3sfZriErWqY8i/QeQI/vbi0RY5uhmJ8E7hIziBIYbpf
         DzzL6Z+kv58VI0cyWqUsucmdOkH8gDJc8vz+d4Y9vPXTDG2pXTSW+A+pZu25dxojvjla
         erru7ot4FTRlXNfOzAgtS6XwPymxlNG+7FSQBr+FkOfRwomOk9nMZm3UaU5G2bt+a0ym
         0Phw==
X-Gm-Message-State: AO0yUKWKOKdQPsFwv5EBCWZBgUWq2FnUplbBIb30oN6LzD+rSFDbyzw/
	NyTvbNLlvlnbvvTfXn9m/R4LWCQSThU=
X-Google-Smtp-Source: AK7set/4AnkRxYx9dRWKsRVivcnG0zWCJFNLC2xzV6Hm5KzhvG3X5JYb4eFS/uFMHxYEnVKoqPjp5g==
X-Received: by 2002:a05:6808:158:b0:378:3756:10a7 with SMTP id h24-20020a056808015800b00378375610a7mr1197584oie.7.1675026043630;
        Sun, 29 Jan 2023 13:00:43 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 02/10] kernel_add_regdb: Change the task order
Date: Sun, 29 Jan 2023 16:00:30 -0500
Message-Id: <ec7608ffb84a5e47e325dd2e0a6f85182d9fe22a.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100836

From: Hermes Zhang <chenhuiz@axis.com>

The kernel_add_regdb should run before do_compile to make it take
effect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/classes/kernel_wireless_regdb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
index 1238172bd4..9ad566c837 100644
--- a/meta-networking/classes/kernel_wireless_regdb.bbclass
+++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
@@ -17,4 +17,4 @@ do_kernel_add_regdb() {
     cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
 }
 do_kernel_add_regdb[dirs] = "${S}"
-addtask kernel_add_regdb before do_build after do_configure
+addtask kernel_add_regdb before do_compile after do_configure
-- 
2.25.1


