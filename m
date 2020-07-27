Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.63874.1595878060027592772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=TxtFVVk/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id v4so8855432ljd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HU9JAsNuhDs0OwnbVh83iTF1w+hBct6SB9ot24mU3U8=;
        b=TxtFVVk/Cv8NSXAU9nq2ys4DNTOaAkFxiL0ypmwBykzf33pfmCMPNVhH1zsx8wrJzU
         JAtePI5ziIorHZzqy5+0r6/xD/XhWc9FagVOH1CPfF73kDvveXAaYXBLOxvCPBc8i+H5
         RetmUKH+aRL2BXRDXb+35dvJ9RDwx2toookpPqs/pbDkjmEmCft9a8JGI3g3dRhx7Rzy
         C1iDc0rVyuy8WyjjWSYEFS6Gtfp7ls5KO0cHVr9sZy9CT6bC9GzA3hrFjCMHdm7/y3ua
         UZ88ANgAuZ5ID5l+W/3HNOHXlOc6SVH000nTkiEw3SM6FuPztBlcMlINDUl+R0l/YL03
         iX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HU9JAsNuhDs0OwnbVh83iTF1w+hBct6SB9ot24mU3U8=;
        b=TLjSt863GsqnKiQjiC0vREtNie8AxrNQU+eE/iH0+i77zwUbX+dq55/ILSM61wWOm8
         jdIAy9iXaYZAZWoh+JrMibY4vEXxHiPlofhAfvZ2UTkOhMdVOCjhhx+vXMjZs3mPuaV7
         8aLzCxNb9E4yQSTK96kJcCuOEBmvPeK133U9HVuaXwOa42sA86paa0ppjepd5E3VhwT7
         aYFGx4/flAKA5Femo+B2CBl7vKE0KSuhfFsR1ukmn5u/jbiXGQe/GnR3gGMQL994tdhA
         QXP37LovfdglqgkYnBAmEnQnQ6oo1nb5Co5c1XkgVWMxaTK2aoJD5RdrUl1aZqRt5L4l
         P6hA==
X-Gm-Message-State: AOAM5330rjXKN4jDI2rzY240o5MSMFZMT2CUG32wndsTeDiH79nyHcjb
	cljZV7OMT/Yyy2YzGWJkbwYoqd7w9+Q=
X-Google-Smtp-Source: ABdhPJzcHs7wC4I1kFurz+AP6BUA4YBhz5HU9FFvAEnTgOxQ6iipTiifh5T8mA3QppKd8JRtGyuEBQ==
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr10913465ljj.294.1595878057828;
        Mon, 27 Jul 2020 12:27:37 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u19sm2910311ljk.0.2020.07.27.12.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:27:37 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 2/5] libusbmuxd: update to 2.0.2
Date: Mon, 27 Jul 2020 21:27:19 +0200
Message-Id: <20200727192722.2488841-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
References: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libimobiledevice/{libusbmuxd_git.bb => libusbmuxd_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libusbmuxd_git.bb => libusbmuxd_2.0.2.bb} (89%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb
similarity index 89%
rename from meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
rename to meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb
index 36fc5c858c..343d0bc63f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb
@@ -8,7 +8,7 @@ inherit autotools pkgconfig gitpkgv
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "78df9be5fc8222ed53846cb553de9b5d24c85c6c"
+SRCREV = "ce98c346b7c1dc2a21faea4fd3f32c88e27ca2af"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

