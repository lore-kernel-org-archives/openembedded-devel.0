Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.1795.1596011011995386696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=wpBuHJaz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id q4so24119899lji.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jI/k5vuCvzMqt/8Fp6DmHDCrwylP3aLKW5/d3Y5Dq2c=;
        b=wpBuHJaz2a60xrzRAUHdlTLQFYVyVoqKndQy204ndfKjl9r9tfTi1hap7zCHLup49D
         S9hW6PxLSdvgShEfuuAij3871+ASu5+gbzN0IzyQFns916qU0IIQR5LtTnD3GnUyHKSj
         rq8JR5i64DvuGfkrUZXi0QfEo0Sc8uK+5jpCc4qXuUUexfyMWXHK4zs1kJiNk8Gjcg2H
         zvMyIqReUFiLVIFksor4TLkV6C7BO+8SZtS5mkP4+cIIUbbICnpELaMVwNKoJjaL4Q7Q
         gFp9OlNf+dPtBaPK65p0NoFsbeslN9to5O/L9XqjFd2vSZsc7xrJF2/fwchK532JJfnv
         Y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jI/k5vuCvzMqt/8Fp6DmHDCrwylP3aLKW5/d3Y5Dq2c=;
        b=R1MtRtPzNg5I4gseDH6NYlsTnOOizQaA8vNRL13g3+/i6BsXhrpcF/OT1uCEL9Cyn2
         dM/J9ZHHxSnxh124W3lj2h3ton9mStT8ytYjnx2pxfMtM1y2tfAjiHeU/vYJy4DDg1Xq
         AI7o3fSpaYGd5x4u+j6d/Ug75p7L8VabKbclUBVvk0agmiK3bCTD32HE+n61feOxWnfk
         Yaa7z3TzKGj9ydxYIYaWC6HdCiDGY1oh7WoHBoDeyylA0gokvQOWdqLw40KXywUfOXeb
         jfYRl16qjHg0S5fKX4i7vxALINjmL5w+LbHSG2XPNkKXqjoWc8Q1ItrCKoCk6YrU9mG/
         ZxmA==
X-Gm-Message-State: AOAM530pbsoP2XZu0J/iJJkHGOSjNHbVhprcEQmwq0SubVSQNLxrT9Qq
	qvEpGu0EM/IXITPRDnq/tW1uuriAJEU=
X-Google-Smtp-Source: ABdhPJzFP8aug3RKNpZlWdeb5ptPoJXKfulEz0+hfMB6oIH/qUkZTV6YaAYAZmdchgUqmZanUhEy6g==
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr13515482ljk.427.1596011009995;
        Wed, 29 Jul 2020 01:23:29 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id m20sm352419lfb.72.2020.07.29.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:23:29 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 2/2] libyui-ncurses: update to 2.55.0
Date: Wed, 29 Jul 2020 10:23:24 +0200
Message-Id: <20200729082324.2710436-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729082324.2710436-1-open.source@oleksandr-kravchuk.com>
References: <20200729082324.2710436-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libyui-ncurses_2.52.0.bb => libyui-ncurses_2.55.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_2.52.0.bb => libyui-ncurses_2.55.0.bb} (96%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
similarity index 96%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
index 1a376a469..d23ec3fae 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-SRCREV = "d5b64b6291b6f292871ad5c6df25c4f6896f7d50"
+SRCREV = "e89fcc53c27c3a3bf559d43190289c3ce4f335b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

