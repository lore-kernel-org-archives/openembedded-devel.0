Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE791C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 15:47:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.58627.1680277649014955079
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 08:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gC8PGNRS;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso8663365pjc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680277648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2jFMBE6Tzlqj2chkRJZhoHiojsV58Z5t28vSJ8Lp/4=;
        b=gC8PGNRSjA8InVzC5MFNCqB22BbHazTKWIvXgTOiz4w84CsAqwjD6vb7ozEFeiqO8q
         ONP2q0hSr2rlH5yriDBIT/iRqdNdDCxha79mFGuMA/sUVz6AdYRx0PSFnwx+O5V/L4AM
         CSDv3dRFPifLaG1SFmX5Blrk9Mv6/l5M0SLBhiU2JaW11bSGvnU+5D3FOHUa5grGyWWB
         ys33OI95m+IxlfNuQPAkvG5oU3q7b+HU98MD5f7Uw/9nXSWCx1VSJ54/nzHOn78gbtvr
         B8+SYnm5Yl6nOWRrkGt8lBMg98q/bPswGKg0VC80RsLX7CwLq7T9soSgda9WczG0l3BW
         5dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2jFMBE6Tzlqj2chkRJZhoHiojsV58Z5t28vSJ8Lp/4=;
        b=Mo2wVZUQrN+3lXB9hEos25MCZ93GgUqFW/nEt485uxxEntpztbMfDt+rnCxesNE+1U
         q97rznTa97b30TlZcxVFGNebpZWbeJOtvrLE6TB9KXky5/z/tm7mB2eKzHJ/15UjOiRw
         g/iGCDfdvjCMXFKQnDp9wMi0XixmGSN26DX/IhOPsI+PefWGOuuAuoLTJmFjUiEBdnC+
         rEPkSmIkmHePAWnjSvDzxMiBs1U+ZY5+k322NGbXytkLkZXE/HL6sl4HW6ECSWKcI8O5
         hrB4sUuAggkYwRfUdvHsHZ6Lc3z0EksoHjnhbe1zPYsBglKDEHUyK9lGRu7vOyIsB4hh
         DZqA==
X-Gm-Message-State: AAQBX9fWKTvMYt94Jx4E4iuB1NaUa19NJeXd3YALJt0h1CJtvUbwNl/R
	NX4eIjxnF8ZsmQ1+zMQrO9vsy+oQ24EUWw==
X-Google-Smtp-Source: AKy350YN1prz7e9DQQXtVfh6EGhI7gzq12cWJqR/UUiQeErTtvyYqoO3OEwfoFQXV3b1tatIbe/1yQ==
X-Received: by 2002:a17:90b:4d12:b0:23d:c49:3875 with SMTP id mw18-20020a17090b4d1200b0023d0c493875mr32671944pjb.33.1680277648157;
        Fri, 31 Mar 2023 08:47:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id u18-20020a17090adb5200b00233d6547000sm1624567pjx.54.2023.03.31.08.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:47:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] gmime: Update to 3.2.13
Date: Fri, 31 Mar 2023 08:47:23 -0700
Message-Id: <20230331154724.1302078-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331154724.1302078-1-raj.khem@gmail.com>
References: <20230331154724.1302078-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 15:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101860

- Drop nodolt.patch patch its applied upstream
- Enable largefile and set ac_cv_sys_file_offset_bits=64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-gnome/gmime/gmime/nodolt.patch         | 10 ----------
 .../gmime/{gmime_3.2.7.bb => gmime_3.2.13.bb}          | 10 +++++++---
 2 files changed, 7 insertions(+), 13 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gmime/gmime/nodolt.patch
 rename meta-oe/recipes-gnome/gmime/{gmime_3.2.7.bb => gmime_3.2.13.bb} (56%)

diff --git a/meta-oe/recipes-gnome/gmime/gmime/nodolt.patch b/meta-oe/recipes-gnome/gmime/gmime/nodolt.patch
deleted file mode 100644
index 1f9bdd3041..0000000000
--- a/meta-oe/recipes-gnome/gmime/gmime/nodolt.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/configure.ac
-+++ b/configure.ac
-@@ -150,7 +150,6 @@ AC_EXEEXT
- AC_PROG_LIBTOOL
- dnl when using libtool 2.x create libtool early, because it's used in configure
- m4_ifdef([LT_OUTPUT], [LT_OUTPUT])
--DOLT
- 
- dnl Checks for header files.
- AC_CHECK_HEADERS(sys/mman.h)
diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
similarity index 56%
rename from meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
rename to meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
index 2677f5c615..c4738b25bc 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
@@ -7,11 +7,15 @@ DEPENDS = "glib-2.0 zlib"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI += "file://iconv-detect.h \
-            file://nodolt.patch"
-SRC_URI[archive.sha256sum] = "2aea96647a468ba2160a64e17c6dc6afe674ed9ac86070624a3f584c10737d44"
+SRC_URI = "https://github.com/jstedfast/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+    file://iconv-detect.h \
+"
+SRC_URI[sha256sum] = "2e10a54d4821daf8b16c019ad5d567e0fb8e766f8ffe5fec3d4c6a37373d6406"
+
+EXTRA_OECONF += "--enable-largefile"
 
 export ac_cv_have_iconv_detect_h="yes"
+export ac_cv_sys_file_offset_bits="64"
 
 do_configure:append () {
     cp ${WORKDIR}/iconv-detect.h ${S}
-- 
2.40.0


