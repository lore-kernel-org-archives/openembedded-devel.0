Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.4683.1592566337237267947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SG8RkkHW;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id mb16so9840571ejb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rnDFC04gjMMFBs0FztNPfAW54VkKXHLY8VL4eb/nLT0=;
        b=SG8RkkHWpVEsLHpdvf65WganlAaiTj/QRYSrS3otO1fqVnuooIhmD1Wze+7TRG4T/v
         vhcoCb4xbCi1S5bZJTiFVmbp+2oINMBSXq9xUhYbGJlksn0jrZWFs/blb0uwQrB8IVVl
         QvEovga61qvN9+A/T7sWper0lwkfTOMtsN+FrDyo6BlycM0wy+/DsYuoKLTQkDM09BOu
         pk58dBsaApyNQ3LnPsgRf3bTnUDEMqxw4r8+z3XSx3BLxi8PuwEqnwynxzj+RxjVpvI1
         lrVdc6jdsZb7lmRAfHh2sXv2h2CzAcLnjFByWUy7XJR3E+VNJfe+t4awv/4Yk7y4Q5AI
         Q9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnDFC04gjMMFBs0FztNPfAW54VkKXHLY8VL4eb/nLT0=;
        b=J+3cIdcID1BD6i8ijwQ8fUZznpYONz8FymNOARF0TL+lLyfzf6XN23YRODB+QLRX8V
         mAJrS3/7m2sE5SVikxN8VndZ86yjqI5TfQeXpqQnhUNt41jkOSHt1eQLdi9Qr6Y8NNKY
         kfYKnKw+C3fYvHG+FKWK5dvyThGha5kHX236DKfPBrkxlXitnWOpRpB7R60+4bajOuZi
         YyMM3GN2wQg7gTZ8J0LLqRI7WmO+Bv3Bh2tZ41o5zyNuM9/Z1ddnPOmIU91qUNjLMq+T
         PV/cqPnU7/JQOz0fG4UMQK7BRKG0Sq1tF103mYz/DTJkGdNgK8D7FL8JawEdEiIr4zjs
         18dw==
X-Gm-Message-State: AOAM532+xzSoVkVoPdRIarpZFEQsh5LKp/ry5jHdXbYSLvpVMB0u9QCF
	sgcxDByO7YUt/fyXnkDpU7Ty/VFTqGM=
X-Google-Smtp-Source: ABdhPJx2xXWVsPdzeSBYv2XIYKDHzC7qLSBBvOMpNZxXVp6jE7TT8rg9ZDQnfBXDGZr/FaHll4+oMg==
X-Received: by 2002:a17:907:33ce:: with SMTP id zk14mr3188795ejb.2.1592566335166;
        Fri, 19 Jun 2020 04:32:15 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:14 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/10] evince: upgrade 3.36.3 -> 3.36.5
Date: Fri, 19 Jun 2020 13:31:58 +0200
Message-Id: <20200619113201.2811033-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================
Evince    3.36.5
================

Translations:

  * Matej UrbanÄiÄ (Slovenian)

================
Evince    3.36.4
================

* pdf: Rever "support 'de facto' tooltip feature" (#1414)
  Reopens issues #1409 and #1410.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evince/{evince_3.36.3.bb => evince_3.36.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.36.3.bb => evince_3.36.5.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb b/meta-gnome/recipes-gnome/evince/evince_3.36.5.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.36.5.bb
index 29e01cc23..a82e44b02 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.36.5.bb
@@ -20,8 +20,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext mime-xdg gtk-doc
 
-SRC_URI[archive.md5sum] = "9762dabdde37a804072bccbfd311d357"
-SRC_URI[archive.sha256sum] = "af2ebdf7f74e6580c4f1a12bdfe26b9ff90374d7acae061de0666d64012a9db2"
+SRC_URI[archive.md5sum] = "5d68c81a3d4c5d27754b97405451f04e"
+SRC_URI[archive.sha256sum] = "6f0dd6e30639eb620f201a6ae40f21c4b78c030f0d6437f9e309f7240195e97c"
 SRC_URI += " \
     file://0001-Add-format-attribute-to-_synctex_malloc.patch \
     file://0002-add-a-formatting-attribute-check.patch \
-- 
2.26.2

