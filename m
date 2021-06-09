Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.4430.1623220729051203611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=igIpArP9;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id h24so36704824ejy.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jC0rFIBa6UkaDim7N9Zz5uklNeAaOnoCm/nVfOk9RsQ=;
        b=igIpArP91ovUKeJXV2pZZawfoOOazDU7R8og/nIz6Sph0wdt7siQnEhTcCIpP8Hsc9
         TC2abx5nx7GmUr6Au618/cKMotne9f56ra1onHCVT06tTEta7bv2SK+EChb8rXnSGZY2
         MRw/l8jed5FQc280ttHSbA3RgI9N5y3I1tvYuMX9vcAy8ga+5Emk7IeZRsb2v6J2UzvX
         h9eLruLHYkyiEGT4v/M/H4ELXedrPhSvdsNKYKaDkmYoGWriPUnzV4GxFPCg/jHvBDSE
         f0HMbk2S0wfxm1GGMkwdt/sT2DnTT3CXjVT8r93eiPhxrJG4wYTy0uy3puSBCgMNGmMZ
         NVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jC0rFIBa6UkaDim7N9Zz5uklNeAaOnoCm/nVfOk9RsQ=;
        b=j2S53syDOfe7GiWaXeKKW8ztNE2M+SJXfJOwAONv9E9qFeNHl1LjZjQ3HypiMQNkGR
         FGcnkJjIJ7tsl26M+dnNMQErJ9s6wH7oq61dCVlORSFZaQjVO+25dlU0HBAX+fgftWxu
         WtEPIlIMtQg0XB107DOc1ClagZPtOawkome0wu85yS8VNUOD2WrNKv9Lb6cmHsRIBEoc
         fBMrzq0FuLkvCIBW0YwVQcrAdR0iwyAMbTE7avOdIxKozjx54mvsuBakq4pz1ntWkGty
         xqSGWJAE4gMrman2stRPioiCemVfc+X7qER9hlA86i0Hmv0sXXPPijtdeV5nFSc7dIvv
         hYwQ==
X-Gm-Message-State: AOAM532XgDgCxMwXnmtb9IzGIEicF9uYX04tJUldFnBJGQ+kIdQLfrAU
	1x2XbfFufGVBsCKdoDeyu5OU1f0FdmL9Bg==
X-Google-Smtp-Source: ABdhPJz3AkUEx5ZVX45BlyTcsAIQs0T6heUMJuKixVk1EeVvhEftjDD4UWdYZ9Ekx8B+ytL85KRZHA==
X-Received: by 2002:a17:906:c293:: with SMTP id r19mr20286601ejz.252.1623220727562;
        Tue, 08 Jun 2021 23:38:47 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:47 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/28] gmime: upgrade 3.2.6 -> 3.2.7
Date: Wed,  9 Jun 2021 08:38:10 +0200
Message-Id: <20210609063831.3400611-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Added some configure logic to auto-detect the system shift-jis charset alias. (issue #81)
* Fixed tests/Makefile.am to exit with a non-negative value (issue #82)
* Fixed logic to skip expired or revoked gpg subkeys when looking for the correct subkey to
  use for signing or encrypting. (issue #88)
* Fixed a regression introduced into 3.2.6 as part of the header parsder rewrite that lost
  the ability to warn about invalid headers for non-toplevel MIME parts. (issue #89)
* Fixed S/MIME to always set GPGME_KEYLIST_MODE_VALIDATE when looking up certificates
  as this is needed in order to correctly populate the GMimeCertificates (issue #90)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h             | 1 +
 .../recipes-gnome/gmime/{gmime_3.2.6.bb => gmime_3.2.7.bb}   | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/gmime/{gmime_3.2.6.bb => gmime_3.2.7.bb} (72%)

diff --git a/meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h b/meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h
index 714cb5aa9..a899ce0ad 100644
--- a/meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h
+++ b/meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h
@@ -3,3 +3,4 @@
 #define ICONV_ISO_INT_FORMAT "iso-%u-%u"
 #define ICONV_ISO_STR_FORMAT "iso-%u-%s"
 #define ICONV_10646 "iso-10646"
+#define ICONV_SHIFT_JIS "shift-jis"
diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
similarity index 72%
rename from meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
rename to meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
index 4ae13e7ef..e70b74789 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
@@ -2,15 +2,14 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DESCRIPTION = "Runtime libraries for parsing and creating MIME mail"
 SECTION = "libs"
+
 DEPENDS = "glib-2.0 zlib"
 
 inherit gnomebase gobject-introspection
 
 SRC_URI += "file://iconv-detect.h \
             file://nodolt.patch"
-
-SRC_URI[archive.md5sum] = "656548dc431004d1ebf95e5d0bb4b9c8"
-SRC_URI[archive.sha256sum] = "abff194c7c4802fba2e233890d09dde8bf7170c3ad5e13000601c8d5b3c44717"
+SRC_URI[archive.sha256sum] = "2aea96647a468ba2160a64e17c6dc6afe674ed9ac86070624a3f584c10737d44"
 
 export ac_cv_have_iconv_detect_h="yes"
 
-- 
2.31.1

