Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.590.1621121951484576599
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JkHBvkxz;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id v5so2611933edc.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uCcNBLQuJThqVa9BP+gxBnkRrAGZyv/UpWN4dlGfHFM=;
        b=JkHBvkxziCVmF3HwdAaiR6j+eiwjgClOjwnlXg6lfZKIPoypxYp7OycPlG1PYC3qz8
         UtanTI7IAPxMrKvaIY8IGcoVyqreZmB9CGbhFUGqliE4UxDYx/roq+3tYJz6VcPteEy4
         CjBau+HLsbi3YOfMYcO8CgEaqkpOMPkbwPahHXwAcimPXWPzbqxuxUMUSqTL/wwodhtH
         eRfuHkZkclb/WBrXyi89kYlR1JvXnFiBrUfVXeCHe77QcoHeNpzSWgW2g3BrZZL/9o6h
         0efA79WGgoNVg0+rJjai42rBEPR+fWq4ORGhCdj+HBaThfWRXk5dE9UlZ0C+Dl8YRuef
         K5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCcNBLQuJThqVa9BP+gxBnkRrAGZyv/UpWN4dlGfHFM=;
        b=SbghBOz1bVzwtpi0uPWeNmDZR4nhJXuPEWXQva4NKePkEKaDNcuylBt1PZGwCmgGgV
         sT5y2KIBX6xraLSvNtYL/bP2Yuvy5pooJwTgImB7O4WyLXEHA7uN34R6H/8L4J2fUL3L
         f/3DfjlmmI4JxEgIcnxFMqU0geLtI53Nkfj2LFIiZjh6DZ6sI4zkfaYtBMWlCZynmLWp
         cwie9Yt/FZ/8tv6OJdoxI0FEyQHsL8VUXhCJ1KjlpZ2mGpfy9RvAY0jKgnQEiuqHz0mz
         +gWzfV4FeZf9DFKuCLCsy9fGSYFWWt9Q4m58L2Pe7VfwRVCvd9UtzRPorXYZcrCsf7aP
         avVQ==
X-Gm-Message-State: AOAM530+x3btE4ZqNkHtctUygeSb4QRKjcgjsa/JDNMNErqSeXXEmI+N
	X+FNwt4MskhQRUaULPCu6OoqHHenfwY=
X-Google-Smtp-Source: ABdhPJwkMQq9vmDNylgQm0TQ1hu9bdMb5x5/vu6GCOWJZYLIGP6SRb3+q9dwQ5bFmLbJXC3gNQLNJQ==
X-Received: by 2002:aa7:c7d3:: with SMTP id o19mr48717791eds.142.1621121950139;
        Sat, 15 May 2021 16:39:10 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:09 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/20] tepl: upgrade 4.4.0 -> 6.00.0
Date: Sun, 16 May 2021 01:38:39 +0200
Message-Id: <20210515233853.583490-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tepl/{tepl_4.4.0.bb => tepl_6.00.0.bb}      | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/tepl/{tepl_4.4.0.bb => tepl_6.00.0.bb} (26%)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
similarity index 26%
rename from meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb
rename to meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
index 4120c6260..dd0242f4c 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tepl library eases the development of GtkSourceView-based projects"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+LICENSE = "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-3.0-or-later.txt;md5=c51d3eef3be114124d11349ca0d7e117"
 
 DEPENDS = " \
     glib-2.0-native \
@@ -11,7 +11,14 @@ DEPENDS = " \
     uchardet \
 "
 
-inherit gnomebase gobject-introspection gettext
+GNOMEBASEBUILDCLASS = "meson"
 
-SRC_URI[archive.md5sum] = "013ee8aae178f75cc74e05fac70786b3"
-SRC_URI[archive.sha256sum] = "e6f6673a8a27e8f280725db8fbacec79b20676ae0558755239d15a9808faa256"
+inherit gnomebase gobject-introspection gettext features_check
+
+SRC_URI[archive.sha256sum] = "a86397a895dca9c0de7a5ccb063bda8f7ef691cccb950ce2cfdee367903e7a63"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.31.1

