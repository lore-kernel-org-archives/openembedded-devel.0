Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9DFC54EBC
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 22:42:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.49398.1672699363077488238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 14:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dMP4JdWG;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id g10so7666433wmo.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 14:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EETl6cH/FyLoLcZmpUH7KV/N/Mp4C+GTpY1p26qTmbs=;
        b=dMP4JdWG7TCRzUwn9l5Wp1791O+w9T/poOgWFlGvUV3y//kr9UGwQkljd3oc2NwKtE
         6h+g+gzN2BcoKsGMkkRDmSeKxElcGOysE4+vt6cPEE/3ifYuFVl47X2uPPWfoTlSH+Ef
         5BCQr9eUAq0TxIlqisLej/jKBWVSy+GPkOYS1C0Ijxeifzq1eTlCBZrf1/qU10K7imBT
         SrKzaYa7h+vlumANFyhvvAmzoHRv2aqwBNcvbeKfi4szceuRp0oFbkIEhcc3BWavw+F8
         vMwfkYp7BK6tC3AAs590wkP/QrY5ASi8vJ5Rl+snSq7vuNfAkacnC97XMAGHvsmCwU10
         JHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EETl6cH/FyLoLcZmpUH7KV/N/Mp4C+GTpY1p26qTmbs=;
        b=KCKPK1k5+Ng1f4DidKshYGiJ4rzDRc9+NGR/BjLQtfE99InXY7I3FCoTaHBTnx3IrX
         s2uGENyFQSqyBt1WeByr5xGaz0TVYbIe2Ik/GQwG4D4j1q4BvBhNikXulXhet4LfWOjA
         ox6PGp4Vsa2cvoIlGu+Th5NlopTGRoCaiixJbNRRvsdgfvJa7gshRQJrHKBYKbbVilXG
         Nxka9B0sCtqMe+3/DmFKAXadLvLLEctyBnAPnVIBOmiP+VO6+9EjnJfyrQr5d6L25sqz
         xeLM9rIwi43Hgea/kHEI/Nz/a5XmhqfAqjoUI24jyb4rtQsZLMUIEPEQqfotoHjqIaYF
         dinA==
X-Gm-Message-State: AFqh2kq7YvZ0EgUB9GbCXQAzlokgNRTkvzCr3k0BFlI/CkhsFUucdgrx
	55PIOSpSG+HR5GQ1nnjTKrxF9kKv87s=
X-Google-Smtp-Source: AMrXdXvYr7b6gbGfzg6/rJgl3IK52A1kAxes3xkr7WUbEvmSkxP6zwT3yACKv3SEA9zXgScy+t/d6Q==
X-Received: by 2002:a05:600c:3ac3:b0:3d1:cfcb:7d19 with SMTP id d3-20020a05600c3ac300b003d1cfcb7d19mr36198634wms.32.1672699361231;
        Mon, 02 Jan 2023 14:42:41 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b00282194eaf7bsm19605859wrq.71.2023.01.02.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:42:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/4] ostree: Switch to fuse3 which is supported in ostree now
Date: Mon,  2 Jan 2023 22:42:32 +0000
Message-Id: <20230102224234.287772-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102224234.287772-1-alex.kiernan@gmail.com>
References: <20230102224234.287772-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 22:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100340

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2022.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
index 0a56ad7c8369..9cc1bd80187c 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
@@ -79,7 +79,7 @@ PACKAGECONFIG[manpages] = "--enable-man, --disable-man, libxslt-native docbook-x
 PACKAGECONFIG[mkinitcpio] = "--with-mkinitcpio, --without-mkinitcpio"
 PACKAGECONFIG[no-http2] = "--disable-http2, --enable-http2"
 PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl, , , glib gnutls"
-PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse"
+PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse3"
 PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux, bubblewrap"
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
 PACKAGECONFIG[soup] = "--with-soup, --without-soup --disable-glibtest, libsoup-2.4"
-- 
2.39.0


