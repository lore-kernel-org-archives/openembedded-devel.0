Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.553.1621121952490840762
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AKX5sXx3;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b17so2680342ede.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5gXHvIK/clre8RRa27fHgGCfm4Fi+mp702cwJi0GM1Y=;
        b=AKX5sXx3w+BQ41PA6DHjmOBsAFPHJzzRbRZbjNM1Hav1SPIAAzuNR4w4MsRwp2SEXy
         Yq1IVqlklKcsgihdGxCSvPddB7M4Uvrm8PGtOnloP8xYUGxsNl8nAMgcfw7CpIDigf60
         gcT5L7jiyWe+iw20RxfVksID0yvVLGKeydSzyDyftgO0oFx/NWX02tAgC0orZykwRO89
         rdtYRlzWU/pFUO8VX/awdH7ubB7RY5HPn3UmGsrcn4ElkPvrRSjHHSPTQCChPwzAGzOf
         +A96y1UYCf6/qFeBOMN+XPtUBGFtlUDa/4Mlq3O116ha28qmb2yb+ugIGS6igC9gAZhU
         LVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5gXHvIK/clre8RRa27fHgGCfm4Fi+mp702cwJi0GM1Y=;
        b=GQV5ZhO3gZjAUOUj30pR9BO+XmxTkCyzLekgsxTypSVi8acYDUqQXzNVBQbvfyQWjA
         slPJrfqQIt2XD5NKdi72QbAZ/qVtRyQeJNZuFETBnfGCrZf1bVQugpqhtHncFH8UB0BQ
         vTG2JC7XbCTdQf5iPKuhiEgzbYFs3ZGH1AQLTWXMhmUHrxScOFDwTxAO7XO7FfpZpMnT
         oTFJSd7irk4+evsvkaBgUj4kWRSmUmwq+401UeHcqPVwMNFJhrzUjMw5yNtZBJV9Cx1n
         3YKlvCoU3wWwSeM0l70lP2XltEzHfInkBqRRPvOnWFlNKLgs8O5O1olJDNiIOgdz7eoL
         9Esg==
X-Gm-Message-State: AOAM531r7hivmT1hF4ZdJNKzFucEv9PrT61LoCvexMsJzllTenfxikJN
	dfLj8xI/DZCYZ2BunFst1SMQ3+Yvg/0=
X-Google-Smtp-Source: ABdhPJwtdUoJSHLko0Ot9mRdRWI3uvpGJBUMxy3q0ErQpuSWPpDFe0n/aD8VeRcV9eQFXtNIaCCFAQ==
X-Received: by 2002:aa7:cf06:: with SMTP id a6mr62957629edy.340.1621121950886;
        Sat, 15 May 2021 16:39:10 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:10 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/20] gedit: upgrade 3.36.2 -> 40.1
Date: Sun, 16 May 2021 01:38:40 +0200
Message-Id: <20210515233853.583490-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gedit/{gedit_3.36.2.bb => gedit_40.1.bb}           | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_3.36.2.bb => gedit_40.1.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
index b20f20449..471a7f632 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
@@ -18,10 +18,16 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg python3targetconfig
 
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "438217bbbcf92a17c4f259b4a5426b03"
-SRC_URI[archive.sha256sum] = "6887554643c5b1b3862ac364d97b7b50224bff95e6758aeaa08f4a482b554197"
+SRC_URI[archive.sha256sum] = "55e394a82cb65678b1ab49526cf5bd43f00d8fba21476a4849051a8e137d3691"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.31.1

