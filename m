Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFABD40CE0
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.30732.1730839897434168483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHXfTRD0;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so4884007276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839896; x=1731444696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD/JZt4B0DfqdDQpjMNtxthYlEJy51wxZANIJYNTT6w=;
        b=NHXfTRD0O7niBcQnQMCAhG71QQ9uy66mBkH/Uhn75PlzQkK8VHONcXCKfXxM268w1j
         6Qi9VpzyV6Lg04V+vYYfHeUGM/Tm/AdchURwxOrsw6TYOe4r3LLGSa2RqSuEDBBlWKxY
         uXoL9CZgRcXSwp3mHrBBmtnxIfyrrBTTM1R12vh1375p5h8Hf/Vs5d01pnb82U+Tnk7a
         0bUN0v3gfc+77FkL47ebmRPGhojm1qViP7kZZWf/8XemrjTdAPBZwYZ5cJmTnpXgPY++
         49SCoFc64W1iCras1+ORaImeSWFYj0SQ+LuOCQSWQ7BF492x9RvnV6iKEr8+xO5nozb8
         HWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839896; x=1731444696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VD/JZt4B0DfqdDQpjMNtxthYlEJy51wxZANIJYNTT6w=;
        b=F8naZJcBcQ2vKFB57midYl8lgFsyIpGuzsa8XncdTfIt1spNi2/ApRkhQ0SWUCERON
         OnlgoE5ydcfu6E+K9keKxDJRLoatxSJe6JBJrEbyX4uYqfkN66fk8HberH5xiF9iZzyG
         NYEYJ7f7h8NIDZirrHKYTu//Dp+u6IEANB3AH/U4Zck8vpy5RGBEZA+LbckPFWgJkbPP
         H7ReiDy9l7Z7q+NinmIy8CLEeVRHk4QsqHI8R+ic+vli4Ot1tO/WRjOzzoGNHa3SEjEC
         MXevJ5jaMxFy+/2DmQR7lXjHANgwKiRiXBeN7f7KgJoAH1s+TeFV41/BsXd0kparPRqG
         lOvQ==
X-Gm-Message-State: AOJu0YyFxAnWgWxaKt1R+82xP/haCnyrU+GbHuM4HqeDwN4NGc67HG/s
	F1/45eNz/vG3tJ247YFSNUoXCt8xpLY08/WLT/5s1eCvmbYdbYqpVLaPYbzF
X-Google-Smtp-Source: AGHT+IGz1c92eqsthZKMC9gVXwbtn63y0TvPdvtIrPhm8KKkTJzqSwriNQH/Ub9heBaJqYFys/v1sA==
X-Received: by 2002:a05:690c:6f85:b0:6e2:f61e:8c9 with SMTP id 00721157ae682-6e9d8b00765mr383739347b3.30.1730839896172;
        Tue, 05 Nov 2024 12:51:36 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:51:35 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 142/161] openct: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:48 -0500
Message-ID: <20241105204707.4155-142-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113658

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index bcff90c86..73cf9d077 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -21,7 +21,6 @@ SRC_URI = " \
     file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
 "
 
-SRC_URI[md5sum] = "a1da3358ab798f1cb9232f1dbababc21"
 SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d181a68"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/opensc/files/openct/"
-- 
2.43.0


