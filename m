Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF45D6EC1E
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:46:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.116418.1732891585362804564
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RBwOK8Os;
 spf=pass (domain: konsulko.com, ip: 209.85.167.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2013029e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732891583; x=1733496383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRjuA0gNkJjQ1WdcfflEKEvIn9ZQzNmrw/SG/g09epA=;
        b=RBwOK8OsMw8WlX55j9owpYmt/TXhddFre4pd34HIIS5EobpbP2ukBE3XKcuV3pVEtm
         yv0UWHpYe3WT/F1ySKjaSVBPt+a6CND/onEv92dAcw+CsaWVuT9YsK84e2N7M+WMeHKt
         s84iGxTHN9zGRlXGSwA1UrxNo1Hv3LiZTurpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891583; x=1733496383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRjuA0gNkJjQ1WdcfflEKEvIn9ZQzNmrw/SG/g09epA=;
        b=Wqsq+fsWkb1z7U0oq55gC0eAichUF11bdueazu8lx88kLYxgR+inLI/ZGI32hfwbjF
         vSRmZcQjZ82piqrAaKNJn0b6ObiYaM8OorHaupEy9uprWPIMuEF3d3dR8s9D1oNBpUYj
         ASkNJgLLtlNjxkJFhWIhPU25tNAEKskDT3dDQbKzAArcaVFds7H7mjjDgt+oT8guWbHx
         YXkid+niR7HVRrD0aoIe4y79rxb0pGuM3Wwbgr1zhrfmK5MJFf3nNODzZwVxNU9OBuHR
         PmD2XVO7tJ5k5mJuQxE8BlL/ScZleyMwzM072+cUqV83mg9ei69hFUnQI/TuHp8lGMZY
         ferA==
X-Gm-Message-State: AOJu0YxrK3t6u9LdD25cskzq8TBjBAJh8dw1K460r+WOKZlP7v5Uvhbs
	sJirFPjifGFcbXPfmZNr8DXlYdFf9nqBzfA+AYr4WXUlQzkHAn944O4jdGnUQwxW7jts9OQGDyt
	6
X-Gm-Gg: ASbGnctrjbk0w5Q/I4lwL74vC2/XNoTAMwyetyZXyA7nHXaVpFsi77UXQNi+DJ+gJXw
	BHXDvp9KU3ONYQkRPQdVVJ4zYgtDbYJI9WYdb4zzv5ATVKVvKRxMJtuBg9TVj93xxMr+yL8CGMi
	fwilw/xv0T1yqWGQlazxbNipF+A3LhyLAcsXg6GtzZckAIfRbp6B4AcODjHWaY78EmKADCtwa+A
	W4VIgRatcA76/p9rqUvF2P/F9ccyssSAVRWVw3RtLEWoQ1RAATu2YAgNqXPSOlE
X-Google-Smtp-Source: AGHT+IHsKQekYr4MzFuxNLOYqP0J6i3yFeY0pXUyBMjUDq7OPieVJW0J7FXM8ivDvhwfFF4rtiE2wA==
X-Received: by 2002:a05:6512:e87:b0:53d:e8f5:f9d4 with SMTP id 2adb3069b0e04-53df0108f5fmr6313024e87.36.1732891583243;
        Fri, 29 Nov 2024 06:46:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b87cb290sm622832a12.12.2024.11.29.06.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:46:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-stevedore: Upgrade 5.3.0 -> 5.4.0
Date: Fri, 29 Nov 2024 16:46:16 +0200
Message-Id: <20241129144619.780319-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129144619.780319-1-leon.anavi@konsulko.com>
References: <20241129144619.780319-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 14:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114115

Upgrade to version 5.4.0:

- Add note about requirements lower bounds
- Remove Python 3.8 support
- Run pyupgrade to clean up Python 2 syntaxes
- Declare Python 3.12 support
- Update master for stable/2024.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_5.3.0.bb => python3-stevedore_5.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.3.0.bb => python3-stevedore_5.4.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.3.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.4.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.4.0.bb
index 7c9c3ebbf8..07e0778aa7 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9a64265f4060312828151c204efbe9b7a9852a0d9228756344dbc7e4023e375a"
+SRC_URI[sha256sum] = "79e92235ecb828fe952b6b8b0c6c87863248631922c8e8e0fa5b17b232c4514d"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.39.5


