Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725AEC61DA4
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44969.1674653491218567072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gt9FCAu7;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id t14-20020a4ad0ae000000b004f51f61de9fso3133566oor.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ptq2l3T+IhvlX6dsOTQ1lgihZZB1EPjGc0O15UTTTSM=;
        b=gt9FCAu7mkSMr8sLrwGk89/GMHVmDoN/AyjeIuz0xxnu1OY2yqjUFS2/fVz6aVViJp
         JBpgFlxqdiam4Azmes35qIhdL6tLChXxkOq3j6fahLZ/p1V1WAHIXPebjZ01rqGhVZW4
         SP1FVCG1ZwANqmk9TT6/iKz1UAYfwAcBRPX+PYFgU0ZjVP/WMGt19al21ZLp2GcSeMgh
         OM9OUZ/2v8DfOUF4YHeXpEzik0IYEYq1SO4GDld8D+KHM47HkVKtWKKTk5qHYTWmARKO
         /uzdkBUkck0/oCl+PFOyNRtvYk+P8D4aoI8fRo+LjwROArqvOt+6P7I4z6QNEwSjrWTB
         tyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ptq2l3T+IhvlX6dsOTQ1lgihZZB1EPjGc0O15UTTTSM=;
        b=Ae6dTZM0uDvBHwkeiZvbI7+tjFS1qEybH0k/uZlXkSwP1hcyknazdJJPSB9FOL/xlR
         pIQEiuFXWahenKeVnrWzyN4jNjfytODtJUTpmsmtiQtFRA6pPTLRs62l/Nxs+OeTmF5c
         /y9HSDXZkEl9tLYi5W3kmJI43+KVfCiR8eRilag6UTk71dyfEqd1eruEvyLtZDhqvf2Z
         +oV4YEwaMv9YYhO4Cfk+dSTEF3IdxsmP6q9w+qHiau3mNFL49Oe3I4LWb3zHWUKwDkPs
         1qgHTn4w9No4gRNtZT9zXPr2mcQ8ann1sdfsw+dKdI4zUGXSWcbHY/4hF3DTV4MHKCT7
         o2kw==
X-Gm-Message-State: AO0yUKUnbPVAAwgaWwop9dw/mB/I5wFj5Vp8ft00csqF+MmymouXnCmJ
	Uz+SSAE+graXnwCWZOFwdAm/8dpDfsY=
X-Google-Smtp-Source: AK7set/Rjis0GH4z1/AtYNZfRLP/sV8yK27OEBK5r6CsVpXgLXcMqmRnUcgQ4AKEAdLuzfpmSEXw2w==
X-Received: by 2002:a4a:dd01:0:b0:511:f4e8:bb36 with SMTP id m1-20020a4add01000000b00511f4e8bb36mr457814oou.2.1674653490412;
        Wed, 25 Jan 2023 05:31:30 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 04/41] gnome-text-editor: Add missing libpcre build time depenedency
Date: Wed, 25 Jan 2023 08:30:46 -0500
Message-Id: <1a977efd266254b64adcd0ce4ea0a3fe698da246.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100739

From: Khem Raj <raj.khem@gmail.com>

libpcre is needed. glib-2.0 now uses libpcre2 instead of libpcre which
was indirectly satisfying this

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b08c4ab7c8efb7ccf9f4c6b6f44194212752959a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
index 1446b151c5..763384b7ea 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
@@ -10,6 +10,7 @@ DEPENDS = " \
     gtk4 \
     gtksourceview5 \
     enchant2 \
+    libpcre \
 "
 
 GTKIC_VERSION = "4"
-- 
2.25.1


