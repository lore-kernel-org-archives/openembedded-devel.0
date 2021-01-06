Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.9407.1609946266453107521
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ifvlg5y2;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id qw4so5414872ejb.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2/Gzv9bmcxPVso/Jja0cQvZwmR6wYfQSlcuZ9JyqoSc=;
        b=Ifvlg5y2Ax40M1YzXGiWmsV0jtccpHOZJd7cfWP+ivUGoVAjuTWVtDkG67EHs8A8gc
         S7eHgDBzvipPtz3XXcesHW7sjJp4334JCyRNOWzjvAVO8J4M9CglhJICoRomvdC0olJp
         CIewq96f4rrkoP9amaR9qiBISQDJ1JvOa1NP3Y9/kGtHXdx/3XL8hQI5AIVPlMAfmx8s
         /Bg27ns5gpqq8+J08syMU0S9pbBFaH/j66A47VWQsOcV3h0DnuVIWG5mJ559DPEX+9gK
         Njg9BQOj9lyzh7PgP2gLONpVaYAbKGA8dDUMOZJ7hKv4LuIyBFHSkxXMRmAUUCiPf7dK
         7rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2/Gzv9bmcxPVso/Jja0cQvZwmR6wYfQSlcuZ9JyqoSc=;
        b=WXyZgtOJ5fgaU05txqv3P3rftWW3KXEYMG8+hlfIQIZ8iwPYoFvxLxfGpCR7Evqj9Q
         OK51zXbvKxV2c4kxPwVRAftAF7KKfWwT2kgx+yA3xCEyoaApTDfZD06wgQeAZDMuhUKr
         vQGv1nmBq3qHKKtRH0NnpJO1eqESSR33NYp6GXtYxyhOKORj8WnaXc7N6mEGOXKFR+78
         iRUm7HCpvo618prsSv6uiOI/qJcCWy6lNWqvQ+my1JZqCjdiBpoabt1cHYY89T1WH9GD
         LSqvzBF7WMWhWmqagd+lA/YK9gTLYRW/lT/gzSN2fuk3QWhFQiZwpp35OpAehmz5tLKH
         49kg==
X-Gm-Message-State: AOAM533a7IBODFQLywGDG4pYJkAk7SUE+Rz7igMDCFaD05KqeFMe1eKf
	5oJhywpzdWcyOxwxiflzHP6S0dOGE/HMvw==
X-Google-Smtp-Source: ABdhPJy540srml9If/LuZZ2uPgiCHw9esigaY4mOMYr7P+vZ5AZOUmlYNGFSNfEtqKC/ywTG0rvm6w==
X-Received: by 2002:a17:906:934c:: with SMTP id p12mr3263538ejw.361.1609946265077;
        Wed, 06 Jan 2021 07:17:45 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:44 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/28] tumbler: upgrade 0.3.1 -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:02 +0100
Message-Id: <20210106151717.1779543-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- Adjust bug report URL
- Translation Updates:
  Estonian, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tumbler/{tumbler_0.3.1.bb => tumbler_4.16.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.3.1.bb => tumbler_4.16.0.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.3.1.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.3.1.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
index c9f2ddc8b..fcc39fd7d 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.3.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgs
 
 inherit xfce gtk-doc
 
-SRC_URI[sha256sum] = "e4a30f3c0656b5b29fcd4a2450293f20f283a95b7fb0754a947c55427784c454"
+SRC_URI[sha256sum] = "9b0b7fed0c64041733d490b1b307297984629d0dd85369749617a8766850af66"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
2.26.2

