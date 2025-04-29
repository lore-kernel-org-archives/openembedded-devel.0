Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A495C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 12:24:07 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.18405.1745929440396296913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 05:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AoIxhSOc;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so10564250a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745929439; x=1746534239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2onrVflwTecSrmMIpYxQqYnYYrK7wXon17PWq9uIk2U=;
        b=AoIxhSOcjrgRh8dy0Z/5mmeUDqsKf52WBf9U2tZUy1+rTmkEKWpuTnkW6Dh1orDbi5
         Cm7i9HM6mHzrMnfZZDZEHn9N82G4P1g+h/p/jZR+dm2dedBmG9GStXDNKXeeBkEPJXbz
         xPzhoS89m+7773vqcG6yiwZ7K/kvdfT7rDQrBMJZbEic8iewBc6k/i5NTfrB08dHqFkp
         RxrcUMBATTiBdTq+mS60RqnuRZ56ZwQcFp6rCB3b+3Mz1wuvtbJI3VfpUqHby8u+h6UV
         8+tEZU8aA6ayywlZ0daLm/MXBFKY0rLqNrgPo+XA8oygAejqAk81BMYzQgWz0YYe2tlK
         OPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929439; x=1746534239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2onrVflwTecSrmMIpYxQqYnYYrK7wXon17PWq9uIk2U=;
        b=CH34lhvokhbroaMrgh92DIYnf8zUxqZN0UBcvgnw33A6QidZGXw3zVcgxvyVQB0yl7
         KGtxMxiawX6ZN5mAmPZHcZncju9vC33mYn+3qkTr/4vMPaPETSOq9DRDEDEFmumxLCOQ
         GV3er82ZEFRFz+Ran3Ucd+DxEkXycxFRlZdoUZ2AGV0NwiiOIBIxsAURiw2XW/qBW349
         CY/9zCPd9Pg8YCd2IDFXfQnqdRNLZBCgHHoqrcnvs+3hrOJRLVPUDj7XLetPS4bswYBg
         Nh2KdsdGfl9iOKL6BeKjcPMvL62XuAO6ZiIUPmm+NdsfASch2gUxO3YoljbKVgWBOYHW
         KlLA==
X-Gm-Message-State: AOJu0YymkDzFG5tGSJUAaynLqRoA7aEHkq4MkUHyXUcRQCr1ooMJqzuJ
	QPo2zAvzvVW7vVtXPP9TIbz450H31sonvaWchXa7XbZ6zfdj4rN4/ZyDINnT
X-Gm-Gg: ASbGncsisfMTgL6Izq55KC7/LbFg+wl6tz7H4/n3evAjMef415rHZ31Fc7yDK51DTXe
	Eyeddxkn7wJpNqDe7Ge9ytVr+97uKI5l/69AsirqPzs434H948z6mOYmWmDCmIRs0+I7vX7RsV/
	xE0PpGRXhV6Yx7NqKszVWbk5bTjCyPVQq4xaCN231fxykPZ1FZiPzhJms2UctF9PVrWm6fNIpTE
	K1PnjSCACvSWoyH7PF2t4vQPVTgmwwM18SKWaVz0KTqQpJ4+mbuPSycYXtiURxg72PYdl+Tsf1M
	w8kNQwyZrXhB8npsI1TZCgKN6W/xvpUA9hGHKhhIZa7uGg3YdDLhghiO
X-Google-Smtp-Source: AGHT+IGHkwZao1ziVhkr519NrnQkAc5fyct906cG26Wg/xF/+dNuYpn7fOUwoHKnptnVffGmeTHPOw==
X-Received: by 2002:a05:6402:518c:b0:5f4:d46b:c021 with SMTP id 4fb4d7f45d1cf-5f83889e2b2mr3176877a12.34.1745929438440;
        Tue, 29 Apr 2025 05:23:58 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f72ce7ba0csm6767873a12.6.2025.04.29.05.23.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:23:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] keybinder: set correct license
Date: Tue, 29 Apr 2025 14:23:55 +0200
Message-ID: <20250429122356.577431-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 12:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117240

This package uses MIT license, which is very similar to X11, except that
X11 license has an advertisement clause, which is missing from the MIT.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 7960009078..5365db270e 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "keybinder is a library for registering global key bindings, for gtk-based applications."
 HOMEPAGE = "https://github.com/engla/keybinder"
-LICENSE = "X11"
+LICENSE = "MIT"
 SECTION = "devel/lib"
 DEPENDS = "gtk+3 gobject-introspection-native \
            gtk+ \

