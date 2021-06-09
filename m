Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.4355.1623220743987185251
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=evb+R9Ld;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id k7so36600002ejv.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G8OAVSMrexFWXTJnaIYoCO/85HtTDqfMFgNZm84MO1A=;
        b=evb+R9LdUCCGHfp774GmrT3hSsH7S1wIMQ59PcuySRbqFjX61G38MK1qVr09FwRsIa
         bGApeI10N1X645rtMJSdUZK6yEUxtcQAierZJ1L0LmxO51IwIKUYTrttk6QxmWx9oKRp
         mi8ZVJqUTRaBZ9x3daCWtoB9fTKDxgBKM/+r8KoSfiBufpSdd38562zKO5X8QQMzNPu+
         v1R/3aFy85Z79vVlQZEXqV7YpBO7g3BP5tbExuH9EyTdvXQUkjLDskPW1oEZ7P6g4wk7
         3g1tYYNG+FQFa2fw4b3wu88ttPLDLVUPq3XjeMowG7D8q1RLlhtA1Yb37Vfjviub4Zua
         B+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8OAVSMrexFWXTJnaIYoCO/85HtTDqfMFgNZm84MO1A=;
        b=rw3sM/0+EHc7Kc0U14bPH2PCfMR/uJIzrx4oH03zP/TNkdbcwGdHPc0qVZ8Z/xtE2V
         Sz8Ws3OTHE2dEl4RwdsDQO20LsdVllth+y6RLGEU6M3e+53bv39yfqNFivAWcNlev/a2
         jAlAR1O9gpIEDNPv4NIx5ldwY8kL/7JBBoIoYQ83z3KyMfXzW3pCfZzbiokyAFIB4FB8
         C8NLjwmArKeeSErF4yGO4gBsRxUWrpr2Sp0fxLCYW5v7OkFDK6p60auWX7B5UOyhaMa8
         k4KrOgE8E04YjqyFFRcWp9xW2gy7UaZQIuCDjf5kgKbSNNbsMumwhv9ecOo6OTV5o0ox
         Z+Pw==
X-Gm-Message-State: AOAM530tZOG+MWxSWxrz9T+yzv+R5v6w+9JO1AsPdnfYdi+X3EXO7u7Z
	myn7V+t0FOE1wrnhFaUmgK4U5/z/RkinbA==
X-Google-Smtp-Source: ABdhPJw0FIBiXJM2MXRRuADrXUK+EfwNFP5tohySAgSAO1CHdSUQbkqrRObzUVKGMEn1F2dN+x+CGA==
X-Received: by 2002:a17:906:a293:: with SMTP id i19mr26211034ejz.311.1623220742547;
        Tue, 08 Jun 2021 23:39:02 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.39.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:39:02 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 26/28] gthumb: inherit required features from colord
Date: Wed,  9 Jun 2021 08:38:29 +0200
Message-Id: <20210609063831.3400611-26-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
index 94cac89a9..93b2f4768 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
@@ -22,7 +22,10 @@ DEPENDS = " \
     libsecret \
 "
 
-inherit gnomebase gnome-help gsettings itstool mime-xdg
+inherit gnomebase gnome-help gsettings itstool mime-xdg features_check
+
+# for colord
+REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "dab73f77cc2963ebe90112972c301441d228af3003cfef3f8b7300a6d5d3c212"
 
-- 
2.31.1

