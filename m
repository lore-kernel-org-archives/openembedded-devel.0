Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.5659.1621325519968911135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gTvsZOt2;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id j14so7389016wrq.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Srlrl8SFe/E4D6LogioGA+kPcAoyokbGb0uYAMo6QTI=;
        b=gTvsZOt2dsxYkowxMciwCmyUwKYBvcIas/6P+EoHbwPpXjWRz7xUkT6nyf5WkkTsxZ
         rV5N+hFBEbfy9zkf6bh60KqBEZjIWjF89UR4fPCntkPKmg595SUfWbtsm5W2tt+gxELI
         oaaL2cYlPgF0DDsBpUj2MwZxD8hKe3lvPf/bMVtTTiR7I/L0JsH4SQcydkM4dWLojlnK
         wyNzc4HCpMX3zdwzEqOWadAVIy4rvF5HtmsuB+9uclFrExEKv0PGoNM3/KAJgivz2Fs+
         W5MSbst0AIvz6DJb8CWKjRMNw5/A2pJcmryZPH6G/PRpPugzPUZwY+Q4SkFsDlOlsUtk
         33Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Srlrl8SFe/E4D6LogioGA+kPcAoyokbGb0uYAMo6QTI=;
        b=WtYNjPq6HsMuKNWuJiM6YnBPuM1HMoCdH4mrRB3E6PnBxnT074q88IEuOXQKAYrUpx
         pCwQdP9Ebca8wEywAQ/UFz4PPvlggCfeUXrc32664ocjQNUEOSs2W6TEs+t8mCB1XHQZ
         M6Jg524C4B+K9NSlWIeeXkumTdrcWgN51ZDdJpCz0bPvYofsZ0LfAhqqJkUYMay38IY5
         rrkuvT51Gg43vkqvUZpJO+d02ecVwxV0Fq7S2uEG1D+Q+aWNKp+cMBgYAUqQSSA/a1r1
         go3aebBiy1GLeeGRSmPlcY0qc9Cs3D/ZbLXQLiVogm3wke3T4T9pKdaIR5A5EeAXc0wD
         g+gQ==
X-Gm-Message-State: AOAM531aiQLJ5vEVnNmnsjLl7tOA+lDRfRkMm6rZ1wiPH16A6fKBHT3L
	+AFdFHKTspGVeMXQWxKPyH3R0ziY7H8=
X-Google-Smtp-Source: ABdhPJwKlse3BlM133RSPtgeF3qhCqfb3CBP3wL4v6jalWlBLVtryYSx+fXCMPRKi/4nXiH67gWh7g==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr5099259wrw.371.1621325518580;
        Tue, 18 May 2021 01:11:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f0ec830b81d2d73abc7bc58.dip0.t-ipconnect.de. [2003:f0:7f0e:c830:b81d:2d73:abc7:bc58])
        by smtp.gmail.com with ESMTPSA id v18sm24505319wro.18.2021.05.18.01.11.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 01:11:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] network-manager-applet: upgrade 1.18.0 -> 1.22.0
Date: Tue, 18 May 2021 10:11:46 +0200
Message-Id: <20210518081147.1291254-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518081147.1291254-1-schnitzeltony@gmail.com>
References: <20210518081147.1291254-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...anager-applet_1.18.0.bb => network-manager-applet_1.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.18.0.bb => network-manager-applet_1.22.0.bb} (89%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
similarity index 89%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
index bc3e66ca2..936f76123 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
@@ -9,7 +9,7 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "ddbb400ace804b59cc513611ce9701f7ef3f00de151dbbfb96284c8c1ef2b18b"
+SRC_URI[archive.sha256sum] = "c70d80b48d40a9cb99ec967cc4389f67e7f0301528a69d481572041331a646be"
 
 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON = "-Dappindicator=no"
-- 
2.31.1

