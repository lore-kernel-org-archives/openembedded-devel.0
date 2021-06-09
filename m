Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.4387.1623220741458023197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RET7tx8u;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id b11so27440530edy.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0dqRaYa1uqgfhy1J5Q3UY6FRDawnV+ENMqVhYtSYUcw=;
        b=RET7tx8uQbuPKdr6SwSbsy9j0gYRwi/9i4QRMiWJ7F3RHPMKUJsoLLugR+LGlJYUzE
         eyz47csJnp2BD7h2+HtWd+mCtGS62TP4UAwkHE29Y4wg2s+Co2oS7fBSCCI+AO8/bGay
         SkWpdCMDpygYNPuWu3aNZg8zmsoTU2eRzEHNwh2B9YHBqw2JYqVO28htkJEXTPl2igrS
         Ke8/g9b0aVfm2RCSirYMJ6AcIElGLvBQetqRauxp1tOEfxgDdrz+XEP4zoys0GOL0CHq
         7O1WZYPaWsi/ilKKT54GeEQ0Fg+lKbg3mezStdHrOOeiX/HozTgDk/kl6VMX1QV3DU/l
         RAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dqRaYa1uqgfhy1J5Q3UY6FRDawnV+ENMqVhYtSYUcw=;
        b=qgHP0jXzUiD9taXD08Jw3OoR7Bfn4tZ2dNHu+U/9zeQorIAw5TUJFMOXNjFz6XS6Zn
         yoPODcpOiv6NJuTTGAYq/I9ofRiidrsfz2PA2VbxRai4L4P7WvMEGS2rPQZ+T+kg7w83
         vGCQG1rMnoL7iEEuOPkTNZZT8zhw+rcfRpXaPV+QWt1afn5gvDSDaUUjjkHviCvtHtRV
         Bc8N62pMQYugb8sbfJiNwSDFz2kaX7Te9fLy1RKlAuogJOwROo/RjkG5WfD0cSHVHdFB
         YVJqK4qZ1WokiQL5iqENgVyqJM4IHVVpHCaIVTb52V/TMswx2sjOYf2PkV6BacFppaMM
         hLCw==
X-Gm-Message-State: AOAM531hYhPwSn912nRH9JEFp2XxkGR/c8VnpqtLO4scVFPUhEXlbYz/
	XJMf02XGV+yj9aB7sqMXako/z/5ePGCaIQ==
X-Google-Smtp-Source: ABdhPJy20+/U0jqj2+mXtufZgt8snT23RUbz4XwWV9HPVtS+OKrFVGTC7XHhWxmOS84+Lx+DHqMaJQ==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr29800678eds.8.1623220739999;
        Tue, 08 Jun 2021 23:38:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 23/28] yelp-xsl: upgrade 3.36.0 -> 4.02
Date: Wed,  9 Jun 2021 08:38:26 +0200
Message-Id: <20210609063831.3400611-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For a copy of highlight.js they added BSD-3-Clause license

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../yelp/{yelp-xsl_3.36.0.bb => yelp-xsl_40.2.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-xsl_3.36.0.bb => yelp-xsl_40.2.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_40.2.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-xsl_40.2.bb
index 14a885056..99b666760 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_40.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XSL stylesheets for the yelp help browser"
-LICENSE = "LGPLv2.1 & GPLv2"
+LICENSE = "LGPLv2.1 & GPLv2 & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=3e2bad3c5e3990988f9fa1bc5785b147 \
+    file://COPYING;md5=8ca13a5a6972ac1620a1e42a3dacd774 \
     file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
     file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
@@ -10,8 +10,7 @@ inherit gnomebase gettext itstool
 
 DEPENDS += "libxml2"
 
-SRC_URI[archive.md5sum] = "7d71af68fff4a92bcb2b8989f126be6c"
-SRC_URI[archive.sha256sum] = "4fe51c0233b79a4c204c68498d45f09b342c30ed02c4e418506c0e35f0904ec3"
+SRC_URI[archive.sha256sum] = "919c552f846aaec741fe51d5af416b469bcdb25c77effc3b5a15a4b4b7ff814e"
 
 RDEPENDS_${PN}_append_class-target = " libxml2 itstool"
 
-- 
2.31.1

