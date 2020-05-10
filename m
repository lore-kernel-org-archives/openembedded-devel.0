Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.13005.1589110145754167495
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2020 04:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMTqjKCy;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id y3so7243437wrt.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2020 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NuPwoM5ROZX7ByVChl1AgXhrQS3CI1VvwLail5NYckg=;
        b=qMTqjKCyE5iz24e0eTjIIZDN9Z4a2Y8g6PkngKwEJe5DO9xCNw3iVXWyYMCq/JP3BO
         0p0cStbRywqNl7Xdrn3w+Vil8nejAf1yP+ROU2Xf8lTPcP98tNdb+jRz+AvQa7IC35JB
         jOr9jJezcEy31q6Ic8TYv0q0vLEtEt9b1YbbsqgaNsQSzU3OWWN9U+w7YAb0f2r0hQHR
         ExTpyzVWlBCqaGCMi8vB2ZrHqb/zbCtMwCWjWMeo1yN+8YCkz+u3XI+K5y5CzgFTsJea
         euanKmuTiiviQ2qKaKcinsob3jM6Kli1VE8/uCT2rwAFFZqG6ktDDhWdGas7GNdOp2At
         euRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NuPwoM5ROZX7ByVChl1AgXhrQS3CI1VvwLail5NYckg=;
        b=t4/Fe7KgUcRfRBPVeLxTKzJEIhWOmnq+3A3DZ18CQHd35XrAIg0pZ1YY6A2+mORtC0
         u/wyTL6c2BDlIxAAJvUTvJw/hj8ZD84HpQLfqF6I/Um7Jl1CSiJUJFGKbD1/hTJYa/jn
         UWhNEM6Lzc0fTgFldvKnd1h+wf7rYjPepv0MaDuqxkSd4vxmK7yFkWkvMHhgVAGADg/J
         BxIh8bWX5sfLjTP2s1lbnlb27ef5CfbL/BdlVWC5EeO3jm+eGyhr2BKDvKKcPGTA9iwo
         2yYZv+GLmoJNLTyaOly/MvUvewdO/WE7qTAHih590/uWObgeGxlByE0jkpkmJBYdCgmR
         UdHA==
X-Gm-Message-State: AGi0PuaQFTW5fwE6Y2VCnfkLVzEzxO5Zju44liznl15Azw/5PCFnad7e
	KUh3Bm3ZVZozHsAW4D6dZVvT/ikQ
X-Google-Smtp-Source: APiQypKuDWdBsT5xK47COjifHpOYPUAkM3TVcShC33Wdjlwuz1B/QRXykA9KRW+ae2uPrHeskcng5w==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr12920291wrv.250.1589110144142;
        Sun, 10 May 2020 04:29:04 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F085F042F904D54ECAC10E7.dip0.t-ipconnect.de. [2003:f0:7f08:5f04:2f90:4d54:ecac:10e7])
        by smtp.gmail.com with ESMTPSA id k5sm11733319wrx.16.2020.05.10.04.29.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 04:29:03 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] xfconf: upgrade 4.14.1 -> 4.14.2
Date: Sun, 10 May 2020 13:28:48 +0200
Message-Id: <20200510112851.31218-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200510112851.31218-1-schnitzeltony@gmail.com>
References: <20200510112851.31218-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.2
========================
This is a maintenance release of xfconf for Xfce 4.14

Use 'gsettings' as a common channel name for the GSetting backend
Bug #14789 Fix GSettings backend assertion error, when probed but not
used.
Bug #15960: Add some missing xfconf_shutdown() in xfconf-query
Bug #15951: Fix 'xfconf_get_error_quark' introspecting warning
Translation updates: gl, hr, zh_CN, sl, sq, be, da, el, es, hu, zh_TW,
he.

Although the GSetting backend is fixed with this release, it is still
disabled by default on Xfce 4.14 branch, to maintain the same installed
files. It can be enabled with --enable-gsettings-backend compile time
tunable and used by setting GSETTINGS_BACKEND=xfconf.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfconf/{xfconf_4.14.1.bb => xfconf_4.14.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.1.bb => xfconf_4.14.2.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
index 8da96a420..893a32f42 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "cb51a59e2a89d05232f825ad8c74a7c0"
-SRC_URI[sha256sum] = "b893e0a329aee00902fec2f0509f56916c9dcc7844e1b1f9e3c7399458290d59"
+SRC_URI[md5sum] = "769b74d354aa65e0013edc6823b78e48"
+SRC_URI[sha256sum] = "1e7086cc5a63219e375c95a1dfd10ad7098c2586f55ac209e66aef61b969f255"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.21.1

