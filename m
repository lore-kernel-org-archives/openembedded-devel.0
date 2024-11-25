Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076FED58D5B
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:54:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.20344.1732546463086333206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPjF2qrz;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eebae6f013so44888137b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546462; x=1733151262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUwXtKSNWZkCbRhLWOm8zHn1stmH0orVahYU2nFem94=;
        b=mPjF2qrzhmKa3/Ox2LhwExjCXq/Wm/nbdQ8Pz8Qzs63TeItPPXNkqBx/oHPfeZa3fg
         QQFY8p+gcW8q9ANG1K/jE5OMy7nhNDRPiWsXieght1duvWNjACF5KQ3vCfp4mOGIeo0j
         w2zUISIFk9Tzo9gDcfj1aPqCthgQemr489jVu8ynkX3LfKkhUOPhTpUACQyH7zoWvLq4
         uTKyYwhUICn4dZd6lR8CoY/EIfQ0OCd0Zps8QOpQu7KAnH/jgxca54jiNQ8nKS0Kl9ek
         +i95Ctys3+/7bLEr13Dz7pLActhkdrA/o8L+zOVzcaSIa8E6f1eLM5cM0RMjcLaIsotn
         QsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546462; x=1733151262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUwXtKSNWZkCbRhLWOm8zHn1stmH0orVahYU2nFem94=;
        b=CvHQIGYXcNs4UX238FiYD0CGpdtWuWjP8D7q31ZkJRki/JUpDACBJfD6eHMR4al2eg
         YTu8ayPYtzmmbg8FzZY+6l+xEq33S2zsPwBURSJPKn9em3mKMRkCtOI3cYTGkESPx/Pl
         E2oeokGknipBQA9nBMxTXSJ8cxgSAk8FjXoPuf4ahBF274Znxyx/u2LIw2huWFmA6U9E
         Fe52F2yxztVT8EgYPrrp8L7YrXZTO8qPwdMirzAlOXGXicU60W7ja2dTtqD1tOD/5zSN
         tZtYA/PzjlYnd2J5JLKk2DA1CoTXCVWMSln6EZh6gxH1gSgltq+sAivLsQaTpZ1IuM2g
         ZNJA==
X-Gm-Message-State: AOJu0YxIYQzZLrfE3dGBSOioUb4qkFd8FvkaiiqPf7luyCYH0z/0VDd3
	5lafE8iCuNGar4Zid9wDpM2s7TrHz7QOEugWIK1Go+zEgQTVrXxX3s7sxwqV
X-Gm-Gg: ASbGncugIOXgR28DW51EjWOLdacQ96RECuQRqj4szcwGt91ND6mgn2g6Q65Cjbw1glN
	BcZhxEJJuSkRAsImQepJLiSPtJse8dg6Aw4mKvyJUci8I+7AuDpY8L1Q5Z2hSlTI2SYvOHeOVT3
	FrElgOeWApa5Hxp3PVAGAHPO6UfpsnoJH27SfYBhQLMPW+w4iSKMNkxhEYGkGIjLbmRRRCpxYtV
	YGmigYlDOnnrE1JZT3eX4oWuxeb7RvJjSPn7HHbejLRnLDlH9+mC2Fj
X-Google-Smtp-Source: AGHT+IH6qKB5r4tABCjw740SfgxDlW5VP+YUFxs5ZtHB5Vx7tm5PcDvV+y2HNQ6mumT1Zx5SOrYnlw==
X-Received: by 2002:a05:690c:4448:b0:6db:de34:8049 with SMTP id 00721157ae682-6eee08a3237mr121410997b3.16.1732546461805;
        Mon, 25 Nov 2024 06:54:21 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:54:21 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/7] libxfce4util: Upgrade 4.19.2 -> 4.19.3
Date: Mon, 25 Nov 2024 09:53:04 -0500
Message-ID: <20241125145307.5479-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125145307.5479-1-schonm@gmail.com>
References: <20241125145307.5479-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114041

Changelog: https://gitlab.xfce.org/xfce/libxfce4util/-/tags/libxfce4util-4.19.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{libxfce4util_4.19.2.bb => libxfce4util_4.19.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.19.2.bb => libxfce4util_4.19.3.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.2.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.3.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.2.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.3.bb
index b54501cac..364384d9f 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.2.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.3.bb
@@ -6,4 +6,4 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection vala
 
-SRC_URI[sha256sum] = "d4c7eb021d1c9408190bcfb92c7ce26f51e994674ac3c3b8a119270c1e900ac4"
+SRC_URI[sha256sum] = "f047937f753466b7ff74ad3809c817b11db44498dd90497de7e1584ee48502c6"
-- 
2.43.0


