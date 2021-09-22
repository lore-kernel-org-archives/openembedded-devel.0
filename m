Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.958.1632338560142681954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvT9mQXz;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id q68so3762774pga.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mFKSPObRhuhcBjPun0qKmzwduCIaeg1Xwvld1P8alOw=;
        b=GvT9mQXzHb08XjpJCtjFeLP3ljPCpIJVsuJweKQ3txzpfSO+Lr9WXD7fwA/63TyEXN
         Hwgo9YsdyfAmq9NrQD5ZHHDadL5x/m7otnSzTEeRye/UdMfmh8VsiSnv0wwg2P7tngv1
         W1xf7TGZcrs/c2SuwYFpzIjGtnwCoKRc0b7/aVI/ixMub6y+1WOmMyy3bYi1T+GdYlGO
         dPBU33XbxBey0pfiznz4zOjBSmTqmYqX9M47hrQ0I82zbLoqeftid1BoxnAZeLjObthQ
         vZxJS833UInQX41HXaNI7Qv8L5NDZLm41ZsBFQ1B/Rcj7CtYZj+Mmi0R4DJOp6fFHSMm
         WpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mFKSPObRhuhcBjPun0qKmzwduCIaeg1Xwvld1P8alOw=;
        b=dUS9I+pOlPZ8TeBDbo/sXzQxAESzbrFhAU5tT8Ov5XDtiJ2+sH/6F6SmRr7Rxo4V4g
         jNmAqgPKlGFA9aaXm9/KAERX6D938Yq4wL5luiHcLu/YdVyn7AFObSSsaL6BN4zdSVzh
         UDQl5SZkijf60tWX+We2829IytaOVUPXJXv4jwVXkMv0OKAN6Fk29WI2tDihPUcha4jr
         jfyGQcVznctu3+Ufd2moYxfBnWvSlEoEKH5Y36Y7VY0rvX3k98cAAtdQjP7MMuthwDBh
         6A7YSOMB1vz8R83YMkbcDnK8uN4mw9p88tHJDfTrnJHsQKP5Ss62PqN43Tlpjd4vHegd
         K9lw==
X-Gm-Message-State: AOAM530EzgFBtmb2/0VP2D9M+OF3+WrpeT+UY5YZ/cfE5BACYBuPxePX
	+H51RyUu6CH4kJM3/N413G+yqyvvaKuQIA==
X-Google-Smtp-Source: ABdhPJwrWBwioOEq5IAUDCFjrBejhkj990n038t42gp23CKomB9VYvzojF77+drpGtq4Mf90s7bopg==
X-Received: by 2002:a63:a112:: with SMTP id b18mr454600pgf.387.1632338559540;
        Wed, 22 Sep 2021 12:22:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 27/39] remmina: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:01 -0700
Message-Id: <20210922192213.3062719-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
  Could NOT find GTK3 (missing: Cairo_FOUND) (Required is at least version
  "3.14.0")

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.4.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.18.bb b/meta-oe/recipes-support/remmina/remmina_1.4.18.bb
index f52378b4bb..5a915c4766 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.18.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.18.bb
@@ -29,7 +29,7 @@ SRCREV = "045862cc7d7dd986b349c68131df2f86b9b1cd9c"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https"
 S = "${WORKDIR}/git"
 
-inherit cmake features_check mime mime-xdg gtk-icon-cache
+inherit cmake features_check mime mime-xdg gtk-icon-cache pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
-- 
2.33.0

