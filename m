Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.25330.1605712100340823404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TnoPUMmq;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id ei22so1250129pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NlTcFensCEU2+8GwwxOvOd5Ca1ReK3MZeKjSyALAdJE=;
        b=TnoPUMmqlZndDfJNCLrKHuN1lFKezZ7i8Sx/4o9l3KXHHmYqh5IJ55B+YBK+dywBm7
         dp28vZ+maCdwNxw1GAGwd/E05OdGEVznVe03FZfsI7al4+kasitIQn6D3KkL0WsE1z/9
         FkFbk7K35a2UCKqOVFWI966o/7PY3chE5/6P3k5tqLSKCtLjEOA2yNhREFCfk7d+Cfrj
         sHvDvGDp3Uv7kiF4qR0jRyaRyPmDQJpAMq3lDk2MRuuE788m/gDaMT0beV7cJZMadaYe
         2QhL7+1j1/xGzcjLiMqEBTWAfEBpIHbodRSctGFVkZ+k1K+gxIkhDE2t4J4tK96tF3yz
         +yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NlTcFensCEU2+8GwwxOvOd5Ca1ReK3MZeKjSyALAdJE=;
        b=qvp5zvGqKT9hIYagZmlGTlShM6/7Zb8bbmhgSZ2+F/ALTBuxXGWX7N7suoluE4UAuM
         tCAFFiJQRCx71JXOFZP30i7wvTE/JrhG9RBlAG9+VXTSmYYtghLFUBbz4VPgDnOhCvva
         QlATTculSqnC5jBiMLDWlbsavXxyZ7c7rcjdvcSOnAzvIvU11kxPuu5cl8g7/nG4cfxV
         5B0JWR10Sbp4oTQ1tF2xER+JdqY9FkcgoGNbFEv/wmOgAsLnZMQnl+Om87e1/9qC1iBy
         WfJyFXax+Iq7GI6rllU6PlJ6kWffkiFvGYdNLJo7JuGWuW2e6cayJQRHubeqA8UwlhN2
         eYmg==
X-Gm-Message-State: AOAM530vapfNBp2yu2VFksrYxCyG/XAXGdw41GLNP0FfOzugAwHwpfDx
	CLFivWdkI3ZGmkX9cdANUckZVERG1Ec=
X-Google-Smtp-Source: ABdhPJzMJungokLknoeDCgmuzHpmXUggyB7seJaYsGJm2PPmDuLrCau6D5LwJIpaM+mgZmPz3P5l4Q==
X-Received: by 2002:a17:90a:7e0f:: with SMTP id i15mr362647pjl.93.1605712099785;
        Wed, 18 Nov 2020 07:08:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/17] remmina: use git fetcher
Date: Wed, 18 Nov 2020 07:07:56 -0800
Message-Id: <b69a8990671e60908f9079b0751290fd16fb7776.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Martin Jansa <martin.jansa@gmail.com>

* fixes QA recently backported to dunfell:
  WARNING: remmina-1.3.6-r0 do_package_qa: QA Issue: remmina: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index 5b663489f8e..1c2f270e328 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -9,12 +9,11 @@ DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium li
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
+SRCREV = "cc391370d8b4c07597617e0a771a9732f0802411"
+SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https \
 "
-SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
-SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
 
-S = "${WORKDIR}/Remmina-v${PV}"
+S = "${WORKDIR}/git"
 
 inherit cmake features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.17.1

