Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25580C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.400.1636825574640689212
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lYLDxGjr;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g19so11231438pfb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tS9p0dsUTW+ioplCTeX1Zyqqmn77ALljeCznV16Qvco=;
        b=lYLDxGjrJOzmZvewonMcsZmsJH8zXZDSe3WeVfP4FZynoAG/Xk30tDt8htbAfaAuTL
         6aif1zwXv2+A9IgPC82CmPd5/G211jHT7WgDjCYodLtHsfLTDyKKyTSu4CJwBYYXdwdL
         D5WnArL9OMdy/rHRN7p4ttz6U/RjMvGypcFK9FgdDk+XtVV/P0aP/n5pCRIfkOtATuCr
         2unl+fTINfLyzVshmFwL6v0TiEnY0tpw2hEZI93hTClhgbRTn4fTpNtigXkq81nHgEk8
         1bQ2V5XP3rDG0oO0MuvAtOmWzDZvTPx1XpcovisIBoX90iYuke9ezjZF4Cmq88NanIEx
         R7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tS9p0dsUTW+ioplCTeX1Zyqqmn77ALljeCznV16Qvco=;
        b=YMkVfdWjJZYa7Bl6AtxB37CJ5f+bWauBm+fqUEnsTEBYcPhdeRmEvP7DSqHH/kqlna
         gAB0nrKs5V8Z8nyrr17W0dok2+BmigydsPOe9DO0TlY50qT1CpjHeqVXMGB6nD0wb7qa
         TudRxspbk4zzpZmNMeodx9Qrqnq/SFqx5ZSmaoA0f/c1RFGKlmSvvmig3c+cqLXomaA0
         xTYUtLB76vwMfbfGuYt384SiJkis19aryU6xqZJ9gljx4UxRDPjs+Lk5cqs8RlAK/T7r
         PZqBCRJwhwDjDp95K127cZtWqVj8Mt4FsjaLdgGf3p5QtJTIXTEld6tVaZGuKizlz5hw
         Z2iw==
X-Gm-Message-State: AOAM531y58u96tmh+2FqdwOTQCxicLiknw1EImocUxifjt8A4JARPPCX
	2RINZKcGHCy/Gb5et/Rcl2UcHcVQnHE=
X-Google-Smtp-Source: 
 ABdhPJwDsNJY0luyPqR/9iUJkpkMI81dgKeDrjFbCDg4FTiwseaMxJ78GuB2ora2+Irq1YKb3UK5rw==
X-Received: by 2002:a65:6803:: with SMTP id l3mr14766089pgt.376.1636825574043;
        Sat, 13 Nov 2021 09:46:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 8/9] gedit: introspection is not valid meson
 option
Date: Sat, 13 Nov 2021 09:46:05 -0800
Message-Id: <20211113174606.2044137-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93937

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
index 035f5d1a83..5a9c499764 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
@@ -27,7 +27,7 @@ SRC_URI[archive.sha256sum] = "55e394a82cb65678b1ab49526cf5bd43f00d8fba21476a4849
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.33.1


