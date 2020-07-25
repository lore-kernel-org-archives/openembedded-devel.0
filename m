Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.7484.1595673298050950700
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=I6aLIDDt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id h22so12435065lji.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HU9JAsNuhDs0OwnbVh83iTF1w+hBct6SB9ot24mU3U8=;
        b=I6aLIDDt9kDB5vt6BQGIZ5dtMojEUhV1XdCD6BYHvx/nfZgbiHNBnOUWDS8iBUDY0v
         eb68J+euSSsMvk3gkRBGayr0NZ1FQM2pTjmG6/lyezMHeUKLtHM7PurEQv+Nw8UAsFsd
         6r++IUtW/PhrXqWzbC4OYTOo1vnkHkuH+XNK3lD9oMwMyoPlFrnG3u+ahEzGjAwKtXw7
         9zk/FMsqJ4ttOIkP2yXmnMsQF4XBk8olqKUwhvWP+01XFHH6U0jQBWKlrSClVvs2JPCo
         /UO3MmeNC80LZKo0FpgrCAxi4YmC+DhjkQln5l7rqQWU+WgZv4rYnHbJQJzyoOgnVqdW
         Ceug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HU9JAsNuhDs0OwnbVh83iTF1w+hBct6SB9ot24mU3U8=;
        b=JE4+zenWcs6VYM5xFXJBXciYU+it4NAfNeaaWPhxjOHNyZrfry4Zy2rDcgL+qgt0Uh
         P1vaNOJnhKKdOSxGDuaKRlji25/C0OWAGeW3OcGL6lkmAXmvBOLbY6bV0HebgfQ1r53I
         j+sQJS9Xil3oWDhSnGm9OUUsnPyXGHrFTYboNgakcQXqnKXJKHSfXAH9CmIGZHytBcN+
         la6ExHdyPQXyedgxtQrQRYdTLEVAMA6o3RoVUt07PU/LcpmCI1cUYtrgECcqmlZ745em
         hhh2cR2DBAFnp2ytc0/qttnkhniF7MwJPCiRr7M7L7IsBOAgX6HmQR6vwzz2G+KTuZ7s
         8NWQ==
X-Gm-Message-State: AOAM533APvh+4+kBHLvWQKaJRFILsPm5vnS6Z/jUBmYHsQ6jXWprt9U4
	juaq/zBL2rFApCpReTIKgsMxOgKw45w=
X-Google-Smtp-Source: ABdhPJyAje3UU8xshh81SGSjkFEs/QeKiYtRwv0b4dQWWI0YNloHJlWhrBLFlHsJQE88FVQEmiCFDA==
X-Received: by 2002:a2e:a373:: with SMTP id i19mr6000077ljn.206.1595673295846;
        Sat, 25 Jul 2020 03:34:55 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b18sm1325859lfp.36.2020.07.25.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:34:55 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 2/4] libusbmuxd: update to 2.0.2
Date: Sat, 25 Jul 2020 12:34:45 +0200
Message-Id: <20200725103447.2109015-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
References: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
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

