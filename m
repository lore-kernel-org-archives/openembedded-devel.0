Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07847D35E31
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.27849.1730831913169162606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EuIweTjl;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so5109947276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831912; x=1731436712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O0WQLKjGJ+cuXjzuNCeGW0sasKikX97Efan1TMTrAw=;
        b=EuIweTjlKl5/+238t58bBgkZ/NIn2YhZRv4iP7qwnsVyCHWvGUrhdaRIItu9Vrvngj
         M8dGr6W09Q/MbrbNMJVCPFGeGbafI0vlVoqZE9ZaSEV7TXDrPK+YbwrvQ2gWf1QWtUH/
         55FtIwN9qQVe5svaGXffqkNbJpdXQJZPYa0R/P2YYUeHSCHarerrQv8/7fXqcb4ENB2j
         raReXvhDeY1bwRvxyAVdptVOS5T/80GuNMzm3y2p9pjW5HSKrMFpCvd02PZEZ+xAmE3a
         m02xNopn+jgqryS1UInjEodAcSPJ2M9zE4EjDmrxRaaUVWs2eaujkpmiGQ3YiWRUTnLA
         jSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831912; x=1731436712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O0WQLKjGJ+cuXjzuNCeGW0sasKikX97Efan1TMTrAw=;
        b=APoUfKvnEfTXgvvO3XzI8vMoLlNIcCJlSOMEE3bXfq1uxccu/vkDeB0zFP8V5hZZk2
         oY6f2FTTQffTbBxFTqB9lEvVzOGyytIyKG6TL3dszWqs/hNV8ylUz1OFUbMko2vGLRPj
         2N1vEXuNMxNsSrAEdy/7i01N65eh2Vhrv2CWxudQ/6Zum8ABatXPVqiRdW10TqCk+0B/
         Tgkh7igB9dmvANZPM9A+U+o2Gb7FKG4IBxfFP6O0VolkUrbM46oLi9n1RrN/cgiNVT1P
         G7PrUzku8fI3w6IlzbT2a9c6EnvIRZQDBUBtzuxt5CwQlBQPI0AiSPQLBDHbc5B5IQb4
         PVvQ==
X-Gm-Message-State: AOJu0YydtYssrKWfcBgjnJiL/HvhQwJw3Q2MCqivBYds7sAU3fnqtJo5
	pGVXX33DunsQ9wMCf6hW5/qLD4QK2wCuTn48RFbAAsutY9W11FyYNY6+DXid
X-Google-Smtp-Source: AGHT+IGJQOJGNfKcmTv1xMYfBeI/rbJ2iYNGOieXIhqo9uBoEEnOKQN0xPsVpeCOA/j511D9qw7QzQ==
X-Received: by 2002:a05:690c:4513:b0:6ea:3075:1fb5 with SMTP id 00721157ae682-6ea525205e0mr214638517b3.33.1730831911811;
        Tue, 05 Nov 2024 10:38:31 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:31 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 039/161] cfengine: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:15 -0500
Message-ID: <20241105183658.34982-41-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113554

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
index 6fa5d2743..490f735fc 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
@@ -22,7 +22,6 @@ SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-commu
            file://0001-Fixed-with-libxml2-no-case-in-configure.ac.patch \
            file://set-path-of-default-config-file.patch \
            "
-#SRC_URI[md5sum] = "5318e40702bc66a3ece44ec4ad77712b"
 SRC_URI[sha256sum] = "911778ddb0a4e03a3ddfc8fc0f033136e1551849ea2dcbdb3f0f14359dfe3126"
 
 inherit autotools-brokensep systemd
-- 
2.43.0


