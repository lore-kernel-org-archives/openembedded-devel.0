Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.25513.1613351626035963754
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fp8QOdJj;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id o63so3329875pgo.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=STi1Jzkvs17ooydCRLcEpWTRafYcFWmqrYsTrP1fCK0=;
        b=Fp8QOdJjpjzg0f5oJll10FCGj4BphB4n6RSp8TI2gjzuXwgQeq1GyimxJtwgbRBk0d
         2KCuhwfaaUc/dNlMzHhyB0DoFVMm2nMT5J8LCA1KWgY2KSZRrYPzIMBj/aO4FLDM4zWt
         rTrnrCNr7zSx9mkgOj6Mlw+7ATMGOftcSU9hh4mXAEWaeQLkOEpew509ikkRjDVKKup2
         aK1vR5znydFrq1NM6jcrU86Xn9jHtjWetrrj2yKGxeVGveZ+EvXj8I19WHT8ffj2XU9H
         A0I9EmTNCaKpjVarbxmOwWu2q7SNVv+pOrgB16xl1cFoiZPe88l9yrzlwIEFhqjzrH5U
         Ix8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=STi1Jzkvs17ooydCRLcEpWTRafYcFWmqrYsTrP1fCK0=;
        b=pByKhCw/+50cYBNPuVrZoxxE/GVQoHUiUAFeqYDXoWzNM8dQvEa6KCyBsHgWrAMa/s
         faTjH8MUq0JbGzJsaPids3C+pomjMJMyFW0T8X2dYauxM0Dc0w3IPZ86eoIMWJ+3Al5O
         Yc5hLeYAOpzoMceBEhTtMT69VD8a7pSXIU2x0RtVl7UkIMnU4o0RRKeBy6n+ItnsYQwR
         UINgbn2+GQE0yZU2A/coMpnh2EIu2EdJvhrOJV4uz7mbZX5qkfXk0+fWgdQXPtQXwdWH
         vQlZmmwKkgerz84Fe7agnxTPEbehufZUQ5aU5E4ylV7yifAxQEX/gb1AUmo8UKSGHmfq
         rpnA==
X-Gm-Message-State: AOAM533Obi3c4BhmjPICgnUw8IEw0DZIzgJFyrEFJ3riWeB/JVCQj6f9
	syBaJoxLOID58fw3mzr2Qwg2bdobLzsSPA==
X-Google-Smtp-Source: ABdhPJxlQn6Qyaxg61QDE/G4iwYsZ7oUb44SUWUiPjKNFtTp+Xa5zvF/IdnCVCoGpMBPMVvHLzPzHQ==
X-Received: by 2002:a65:6246:: with SMTP id q6mr13158095pgv.6.1613351625463;
        Sun, 14 Feb 2021 17:13:45 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:45 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 14/15] libplist: Inherit python3targetconfig
Date: Sun, 14 Feb 2021 17:13:28 -0800
Message-Id: <a0c26ca2b4c5e18a22b8d6f3c952fb00caf2bd34.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Fixes

configure: error:
  Could not link test program to Python. Maybe the main Python library has been
  installed in some non-standard library path. If so, pass it to configure,
  via the LIBS environment variable.
  Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit be7d2286bfe80835e8e014114aaf587e2930c683)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
index 408fa8ac0e..6ef5b4f432 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python3"
 
-inherit autotools pkgconfig python3native
+inherit autotools pkgconfig python3native python3targetconfig
 
 SRCREV = "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https"
-- 
2.17.1

