Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.1226.1597271984131243222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EcQVOMdV;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id t10so4031515ejs.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yd2ToUwswRAkEOojsXJTH/KqNm9pf60JZQrEZYQxxG4=;
        b=EcQVOMdVsPD7NjuoZ4eS1Y+ERtQGLvwHnjkz60w/VH3xJngIfsV3fNdRyD9SPz7IWL
         eqvNX5KE9mE3LKOMDpLQifKuVq11z/bI81PCXi0f1jVJvJ+bxKVkstvFR3dJ9hYpNA3H
         as788JqereiBqYWrR8WXprZptFMhD3BwGxl53m8ncZa2pTIVfNANadHwHdyVlyEAZfpV
         0sOlNdfMEv7KOHapLwywoWGkD1DVi1YaZjutNShLssZkc9smT5NKxmfg41yXpktTwRGy
         5at2ei1bUqr3Mp5504UuCLdpYYdvka0JOlRBSwuai/DN8Cfll2ARU6+0LUcu6V7jKzG9
         HX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yd2ToUwswRAkEOojsXJTH/KqNm9pf60JZQrEZYQxxG4=;
        b=BV2osLq9yMNwPF0EwS5t193AaH6I4tkNFoeJizbl2iMCtFdl5e2y8t1lWAdM1wUvLf
         E2iVFpaWjhmRBfnbHRK6kRh+HAhJCWvJFwUlaWyZjisWFMeEKpNyiDxNVO6OJi3QIB9V
         akemjIw+ClNxT0+cv+4mMbrnr3WnO3wnhLVxMKAUV9+FKKUo39dze6MSaDyXgIzwmcLL
         Y3i0wlPEUDlTd/UUF+2CFW3D3bumOmZDbolAWMDbyR3cI9uAZGp+nSY1IgrD619AVK4Y
         KxpgBqMfxXAhLJ9KN33Tk4TDLFvyaMGfc5K1gajvV2klf6doC/Y036pCf55Fj37RNuMX
         5ZvA==
X-Gm-Message-State: AOAM5333usU+s+oK5yLDGudRrGeeR5LyMRYMqVgf+L+FqWTD2SdDu9Mb
	jTlQ82+wa6aNRCtD8lwJ4az7kUYv
X-Google-Smtp-Source: ABdhPJwtOW0cePKjQOQPf+VAcVTBVJpg+3vRdmy4wXXKZgvMeS6Lkk49SO9V9BwOqGBtvixX+mrdDw==
X-Received: by 2002:a17:906:d187:: with SMTP id c7mr2115245ejz.196.1597271982354;
        Wed, 12 Aug 2020 15:39:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/8] xfwm4: upgrade 4.14.4 -> 4.14.5
Date: Thu, 13 Aug 2020 00:39:27 +0200
Message-Id: <20200812223933.1119785-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.5
========================
- Fix an error leak in compositor (xfce/xfwm4#351)
- Fix compositor selection atom misuse

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.14.4.bb => xfwm4_4.14.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.4.bb => xfwm4_4.14.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.4.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.4.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
index d68e00864..f8febe804 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.4.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
@@ -9,7 +9,7 @@ inherit xfce update-alternatives features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[sha256sum] = "b2a4e6acc3e6eb5503f247f2664c2b1a25240050d75ca93299955aa6b5e62a7e"
+SRC_URI[sha256sum] = "d7a7c63fa42ec6d7cb3caab130d6f496be5bd7689b775d20e8786b7f3e282930"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.26.2

