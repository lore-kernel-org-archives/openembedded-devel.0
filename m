Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6734C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 17:53:19 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.13404.1700157192077944981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 09:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N4G+sHC6;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9f282203d06so163808066b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700157190; x=1700761990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YLbrrh+nhszfsazCPSzHgL/7T6FdE0GMIudAtmnFEGc=;
        b=N4G+sHC604u604XaenWmC7CqgNf9UcXEUim+/q0BAdyJiaYkR6G4TAUnyfvWffqheg
         fZqPGziR7FQIpNG7clFvLrXaE08h6JV5ro95EfKLed8BJWj2QMxLnTmDsSKmWtEDdF/6
         JvSQLClC+D4Rc3EGqG47EYbB09TpcaFaQnrwZN272UGAcpuZcbBo9Tr48Va8l35CoQkp
         fnpv5GmdWq5rdJhoSvM4e5F9qx1U8wFcg6OBZBq/6C+z1QW2VRx7cE03pNa61EfgDSkO
         Pm3Qs6ebBySz4gxKpmYfWdY5Peq5xR3NKExwjRKRH9og7pMtPNvdfBZDvh4rCVAUY3/N
         3MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700157190; x=1700761990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLbrrh+nhszfsazCPSzHgL/7T6FdE0GMIudAtmnFEGc=;
        b=T85h8FYLGaeupkilvzXqS8rnU6O/1/85SRmnuz9TRs7LHzAYLImg2ZZO4vlnASORbv
         stiC53CNhKxBLK7Iu3xxHsqG+PQ+PuHuqLrKIR+xPl59WbbejC36bx/kb/OABYsSgoXW
         3onPNiJIWrWqQZfIweEUHnDPWoNPNKEarXM125h0TCmjg9ITKsCU/QtVV8k6jFoFa0GF
         ibW2bl7qXXAk1iK2PdUBEBy1j4irgSjbZJyU5P/dFaj61BDP3keBG7aiXuFczsQ3/sgN
         JYw+VAE8LzZxKgEM2sG+8AK5RwVy75rNd7QcWHouz7xUQP9BDU68Z+OVtuX5K5XLwvKg
         G9iQ==
X-Gm-Message-State: AOJu0Ywt+KjR8U7hegZtWYtIb932f0hcW52Ti0HfzCRLC9fl3gTULi6+
	l06pDZElxsYEHrcXvFKWm5lpHC27wkk=
X-Google-Smtp-Source: AGHT+IHLivGjtzzPjt2pVHDVAdJp+c7F46RRapegHWrUgwYy6WI6iHCyjPxw8pjZgffxwf8pTm5LOw==
X-Received: by 2002:a17:906:c9c7:b0:9e6:b485:cb06 with SMTP id hk7-20020a170906c9c700b009e6b485cb06mr2580988ejb.16.1700157189906;
        Thu, 16 Nov 2023 09:53:09 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qy5yuypv0vsveh.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:7720:7419:1b40:3cf9])
        by smtp.gmail.com with ESMTPSA id xd8-20020a170907078800b009e7bdb0d5besm8189555ejb.30.2023.11.16.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:53:09 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: chown in systemd service with ':' iso '.'
Date: Thu, 16 Nov 2023 18:53:06 +0100
Message-Id: <20231116175306.3902-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106822

There was a warning in the systemd journaling about it.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata/netdata.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
index ca13f7287..f4911f3b6 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
@@ -7,7 +7,7 @@ After=network.target
 [Service]
 Type=simple
 ExecStartPre=/bin/mkdir -p /var/log/netdata
-ExecStartPre=/bin/chown -R netdata.netdata /var/log/netdata
+ExecStartPre=/bin/chown -R netdata:netdata /var/log/netdata
 ExecStart=/usr/sbin/netdata -D -u netdata
 
 
-- 
2.34.1


