Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19432.1793108991773132969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Qecqe1uO;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so27555405e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108990; x=1793713790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/mLWTc3YiUxs14bJOXcAOAHA3+p1neNKCrXIxKJ+vs=;
        b=Qecqe1uOmb1ebNBrF/7I2j3m/5pF1NC4Wxy0gHq08IA2Pdj3bViIZu7CkZsPQE5nZS
         u+UjkKCsSECgdWvFC3yS4echT6FEFj82kxMsQnb1JqwKxoIk90W4qqELd4gIfuvXwLN5
         //VMZgbk484AF/vLukVIecTgKdPQW+YGsYTUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108990; x=1793713790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/mLWTc3YiUxs14bJOXcAOAHA3+p1neNKCrXIxKJ+vs=;
        b=IUrzIQmggkTTaO2ckit1NKqLZDioVNf+IuXUIYTcbP+fNanHeWFBqBGUduwNpgMMdM
         xWig3PgZeIn996iy1xMioOu1wkGOOhwLvsamRTz6Xr6mQ0R2SIs4sHvc+2WTp28Bu5u+
         vTt85F6kg2h7+hmAVtZ2eomFEnhTqs/hGMz+ogsYdS6hzWMfef6JBr7+v1deu48WiaUo
         VJKu1MEigXfsXYAShbwDpMT2Tf/dP0L3ib9kLXLNFZjBJ1gne6/uxHjFoWx4C/lAYSpR
         8L3UXuWgm6J+hMC8it8ikxPBSilPvx+kmVzUEaRfFQ+npVQk8B89bC6ULld2tXU67MBr
         ncag==
X-Gm-Message-State: AFq9FYLFW+GmzrFdNyU28lpp6ibtJbUcqCQ1Zo7sg8wS+PYVHKHitZP6
	8+bgFEd6IeXLbvJl6ZvWpB2pqolPkjis9S9EtxJPEMfIjK4WVx7Bw2XvcGfyS0JdKhFnzgggZP/
	L7NUZ
X-Gm-Gg: AYBFou2rOa0mzZvQn5J9BfUno8bHawW1ZozZ9KJr+PYgg9I/LFOSK+/wNizrQU5IetI
	yltD0e/UY5ziPbFumVhxgbznP1LIxvcs3FBuBFgQEyy91vbQbEmc3N2FxJ8wP74d6CSGVMpMw07
	eJ9xYwICpBABUeIR+kXaYxq7U3heUGJ65IIlUJlw0xIg5sz7sUaKUKw8UoeRFnXmMWKCMThZ/TV
	GLfOih0HnM2iHiWoY+mymAMcu6tu93QaKBbGLmspxX53bzoxaGL8tqZyoJpgS8GmsYlyA/aaCNg
	NCL0d5jZg4IpYzVDnPOW6yvZMMxMrGSQTDLnYFWheFhabNu6A5MKYDAgJyJ9rEanmGO1NlTLGuG
	kuhzp7WBWy3PlImnTZLY3ik3cqmLqlHu/UXCjmCrASiTLNVksRv7/xZ7lRmC8+RXDfD0Wq+kEP5
	WFpI7KVF6S4K71lgfMcidocrlppzTPMptZkVzuIQxeTF5cLXAnPhaWhnpTGkOSWJG2kOX2aEwPT
	1KDWIAwL+5U7QDYon399u70xovT+3qvHJqMh4PYufsRwtTNkWNDU9McblsB92QLyPENEqEPQa/g
	BBk2vjW412btsMdLRiSXvq3ZgQTFGegtuNzlF8pbq1nCqEerEEOtzkEjqnsWN47gZhX3Bi/bRtw
	ommvx+7Fg3LsKR4TD2d+suJ3bSw==
X-Received: by 2002:a05:600c:c16f:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a35ac8c226mr176111265e9.11.1793108989943;
        Tue, 27 Oct 2026 06:49:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 4/7] nanomsg: Upgrade 1.2.5 -> 1.3.0
Date: Tue, 27 Oct 2026 15:49:40 +0200
Message-ID: <20261027134943.1011404-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027134943.1011404-1-leon.anavi@konsulko.com>
References: <20261027134943.1011404-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131533
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.3.0:

- ipc: Add unix:// scheme, including on Windows, and winpipe:// on
  Windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../nanomsg/{nanomsg_1.2.5.bb => nanomsg_1.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.5.bb => nanomsg_1.3.0.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.3.0.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.3.0.bb
index cfd79487e9..45fba287be 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.3.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master;tag
            file://run-ptest \
           "
 
-SRCREV = "85856cb785ba6dd38c5e9757298a54d1bca55580"
+SRCREV = "73e89d2ca28d11cbd39bb15e8d2e1edeb7eec68a"
 
 inherit cmake pkgconfig ptest
 
-- 
2.47.3

