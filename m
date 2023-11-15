Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20762C47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:37:08 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.8236.1700033824464061529
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgCZjVbd;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5bd33abbb90so4327651a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700033823; x=1700638623; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y21Go7tdxKOu5KFCE1+S3oYlB6/UJH81NMH/Rus/EeA=;
        b=kgCZjVbdgV/tC0hT1QhNL1HuB+a32mqsDnHVg+HyUxh9F7VZ7sq0c2CPjgS3dt0r/B
         igXdBG6H4KJB7zQV/jUleAPRvFU0IwlcKsJkrSmSCi1gNGhH6aK6hK9dZ7eekluCLFHA
         S7a9tSxVbyWHIII6ZoFsMImb6b1ZLTZq4p7AyQvbBgry/kNUc/TEbfm4JPBnN9n9lgbc
         /JK+2Rs3imRqiE6F/vSvoc9TwYIWfTlHyk5pLqzzDlvCjoYZvpJzbnYhzqzREELyvO3o
         nJ1wQ/vGGLwsCHwQC3vWhzIX+guqc++LCT4aAeGlxJqrjCBpLzEho108QrJ7X4etPHc3
         sLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033823; x=1700638623;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y21Go7tdxKOu5KFCE1+S3oYlB6/UJH81NMH/Rus/EeA=;
        b=hPRfN/oVPsUex8MZkHJAmT8zKzuxhWhq20tifrDjC0PuBQwN52+llqOo2OcKUZhDb6
         BTUAWT2z+aEsr9BGAIallQ7ph7URcZZpFRXSZl9STVlXW5wATd9opjTaZaZa5YhKQTmT
         M3H+1WSO7g26t0VGYHlFwLcFfbr98i1FWpoHeP6zL4qx+1rnlIUdp1pKaOohLlb+nOjs
         eC5A8UQ+Zzmnrhh9GEx7dmyGGKn7eaB23kjinR5Pi7HFR8D2FnsGDJi5lw41WX8dnxhJ
         o67ZrINxdyZ71tguzKVXSEJCB/b8WNvTmZXu+vGd9W102EklFOJkmI0nTAw4bYtLSxg4
         YwkQ==
X-Gm-Message-State: AOJu0YzpyiY0EOxZirHUViHcTDDAat8tHS+m4TH5GN125Mc/ejn4OLMq
	D2a3uzKyFMVMEX5bDmncAmyaKMzNULmzaA==
X-Google-Smtp-Source: AGHT+IGwQ7b3SOeFUZN9Mg5zajFNUmuBX9OMwE5f7mSWgAq46WRNtOTBxtvznoqFow8shRtJZExD3Q==
X-Received: by 2002:a05:6a21:78b:b0:180:18f6:ca99 with SMTP id mg11-20020a056a21078b00b0018018f6ca99mr9967793pzb.56.1700033823333;
        Tue, 14 Nov 2023 23:37:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id l23-20020a17090a599700b00274922d4b38sm6312074pji.27.2023.11.14.23.37.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:37:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 23:36:52 -0800
Subject: [PATCH 1/3] gnome-console,gnome-terminal: Depend on vte from core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-remove-vte9-v1-1-720f287a1da3@gmail.com>
References: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
In-Reply-To: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106746

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb     | 2 +-
 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
index 748ea7b5a5..9669e337a8 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     libadwaita \
     libgtop \
     pcre2 \
-    vte9 \
+    vte \
 "
 
 SRC_URI[archive.sha256sum] = "e7462128d2df2324a1d748062c40429cd0504af09e407067b33f3a9d0c59c8e1"
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 014b329b34..594e1c0b22 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
     desktop-file-utils-native \
     gtk+3 \
     gsettings-desktop-schemas \
-    vte9 \
+    vte \
     dconf \
     libhandy \
     libpcre2 \

-- 
2.42.1


