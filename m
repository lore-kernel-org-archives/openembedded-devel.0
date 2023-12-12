Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35D6C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 12:57:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.932.1702385869108092380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 04:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mf6qpFlZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so57467405e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702385867; x=1702990667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp5UM7/EWBvnHmnJyy2s6Y8xyVM+L5b3G+M8fgNow2E=;
        b=Mf6qpFlZm4GEl/6DUcaYU3LkEwqEG3kunH8pGF2+nFWOZWrzXDR9zDJS2t4uvPFd5v
         jQUHLS6jLKPLfdgYY9TsY+QFNs4oEmwfHQhmNSHYBHeUBiRGJ+i4TLNKzUKV8CWuIc3p
         PV3AoY2RHvvii3EIiEVzq5wRn8WmaQtg2AisOfATdyEfKNQUj2+3Pq++WaAgW1ri2hMO
         xP+r9nfhI7yuoA2lvonQoEDrRrnUlIF//GFLRfCTq2UdW1gYRp60wmgFNmz2zCTvJIG/
         TcE1Soshx4cMjqBsb14xcFZFXtA7t3o943/edpR6/phL4B5TR77cU0nIsla88KaPtKIm
         m0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702385867; x=1702990667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kp5UM7/EWBvnHmnJyy2s6Y8xyVM+L5b3G+M8fgNow2E=;
        b=IqZJS29jKs3VM74SniIMCQSUJdO1nLgZJ0m+wfOlvNYNWEYg2fUnh4fx56IZTQcIU3
         /THB9PpZc6PQqbP9+AcxqJnOxTCxng8A1muUfnFBwk749o6Q2vv07Aspq/Bz0oa42De3
         ywCUjo59cbJDUKBhEnIsh0x3Bx2b29RDpMYd+R7NHizlldtVF4HIYnRotPptdU5rBKau
         /8rLpxt77RE2ZByIujTcFpYTcVITJy4FtUyHGOD4Z3RhNKSCJS9iZfEh5PePVKH9HBPM
         e3r6ozT3pjDWVkGxHFvvrRcEfdciKvKrmgTENFS8fCTOhwqYAlyDDeIIWkVUghvrw6ZJ
         BNrA==
X-Gm-Message-State: AOJu0YzUdJxYWlZ8OniNaAuqfKf+lnhsnk20fr16UWoOGPRX8epnIhwE
	y9aikmyIicMgI28hzPlm5y15zr7rvzY=
X-Google-Smtp-Source: AGHT+IFYGIO4Z9YXecuvIQM6canpqDZq5w2taWAy49GvoziKxYS3QzprkrFsUQk3zoD5ho305p5zPQ==
X-Received: by 2002:a7b:c7ca:0:b0:40b:5e1b:54ac with SMTP id z10-20020a7bc7ca000000b0040b5e1b54acmr3835138wmk.56.1702385867201;
        Tue, 12 Dec 2023 04:57:47 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b00405c33a9a12sm519681wms.0.2023.12.12.04.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:57:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] rygel: fix build with gtk+3 PACKAGECONFIG disabled
Date: Tue, 12 Dec 2023 13:57:41 +0100
Message-ID: <20231212125742.2494501-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 12:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107332

* fixes:
  rygel-0.42.4/meson.build:1:0: ERROR: Value "false" (of type "string") for combo option "gtk" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".

* possibly changed since:
  https://github.com/GNOME/rygel/commit/7e1819d9e49084c9dc55064a6f21d0f7caa90da6

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
index 9662296399..5212e78333 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[media-export] = ""
 PACKAGECONFIG[gst-launch] = ""
 PACKAGECONFIG[lms] = ""
 PACKAGECONFIG[tracker3] = ""
-PACKAGECONFIG[gtk+3] = ",-Dgtk=false,gtk+3"
+PACKAGECONFIG[gtk+3] = ",-Dgtk=disabled,gtk+3"
 
 RYGEL_PLUGINS = ""
 RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'external', ',external', '', d)}"
-- 
2.43.0


