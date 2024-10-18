Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FA9D3E1B8
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.30078.1729278805882992948
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U9kw9TnI;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6db20e22c85so22275487b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278805; x=1729883605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/0or86bAbtIaNqGNMWmzrNJmnLFaGBR/AvE5Y1bovw=;
        b=U9kw9TnIgPWe1ffBqWlvhUqhStVFTB/A1Ad3vatZto3I44SH8Mmc3OOHIORlBSjyiU
         3FfR2rdGhiyjMVLpw/kjqifcvxMMi8DOKIqaJv4hKm3an2cPZzI1JL9IceJ8AozF7Z/n
         GyizbmTAUmGMT4nEBga0GxNaNVY/7Ko2NKfDPBgfFDW5qkBvBGWFgg/sVe3j2HlEl0mZ
         HOhZqzDoW0xMmPXVZpZtGdunucyHUUBG9rSGQfgG0bCOHp3p1UXhh+gx+vhC1VI3gAFS
         b+kTyIcGmJaVKhqJgbbqLoOeixUFqrzRT1sMeuU9FmcGidMMjXxBs85kxHOUDK4VedW0
         PkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278805; x=1729883605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/0or86bAbtIaNqGNMWmzrNJmnLFaGBR/AvE5Y1bovw=;
        b=Gs2N40RNkyrp1FJp1HC5k88gMWn7sbV3aYgYfg1u4bSBgb0zt9BuqFlWpijSVxLJtl
         wDmgi5gamqnRj1If7eu+IwxJtsGVuP3Dq2zv6iFxyR9IfbH97Qcigq8Ff9jBmEsLFfnA
         yRA1mqqK2Data4R5b5+mHVhChwNjWBtFx/QNQpuRT1YCnEHUyGpj7mikryo8BHRohbvt
         MM47lHUrhEh/7eBRQWTnjq6rKwAaafLEZhX9UaC2e9mnuN7p4ruxIKaZsm+K9mI00tQY
         Ccaa07TgAwogc7kb8M20WiqkdMOgV69Q0Dvw7nyNdAYQyIfJ4RmI6r/T+yeLi2re0QG8
         8uow==
X-Gm-Message-State: AOJu0Yy6ghMFaqVZ0i3HyAC1vO5d0jzeYIOrUxjH9/2ewSFU7FL13qHs
	TfzGPip/VKcWI+8yWBGuhAFU3FeCVScy+IbEr/kZKqjFM5hsRgL7KB98qw==
X-Google-Smtp-Source: AGHT+IFX3+IErrvOAw3gCjHNaNNIoVkRv5bhyAFYcO/cfVO7+OQdWq37ggILouBRYe7cGJBiUZBmFQ==
X-Received: by 2002:a05:690c:60c5:b0:6e2:1570:2d3d with SMTP id 00721157ae682-6e5bf5398cdmr41436897b3.0.1729278804421;
        Fri, 18 Oct 2024 12:13:24 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:24 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 21/68] python3-flask-mail: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:08 -0400
Message-ID: <20241018191101.25184-22-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113008

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index 1aca3a161..66f3936cd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -4,7 +4,6 @@ HOMEPAGE = " https://github.com/rduplain/flask-email"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
 
-SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
 SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
 
 PYPI_PACKAGE = "Flask-Mail"
-- 
2.43.0


