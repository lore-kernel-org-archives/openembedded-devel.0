Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.4677.1592566332558672388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMbqMI2P;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id w7so7362116edt.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FRkuKLQdYvZpkWAEnZFBguwM7Kn/IY1RzBzSYviehrk=;
        b=IMbqMI2PncvBVcOG4wFwumLJQ/NsEg2cmVZgjVcM45tWDIa5IUkHY/JcKWHTpM8orL
         k+pH2uNkgPSmNS9l3y6eJ+JpTvSOYkVKCyK8vMqH7lvLDSAQHIruPt3P/g91SK0417EV
         IGpUlKdWLFUnjDFildSszQdQ0hHEgNSeLngxV58NJPHlmssjIMDjVHEqKs0vX/FnD+kM
         Y3fLhx76FnJt6C5RSN1+PDjUc8qQxf9evMXfxUhxCMplzaR5YW6sfU4FXdunb8FFLl1R
         3rGSfgi58KXr8hvD2tWQQQ+PJfVlkFc/WOWOxtU2y6scb82i2xPbvs6A1mumLLMMRJrS
         c8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRkuKLQdYvZpkWAEnZFBguwM7Kn/IY1RzBzSYviehrk=;
        b=QEMJDpcqVgHbqKvceOSlSpLlM8pS+Z77S3fyG3/YB4M/Pzcf5KrbvqLjmzPKWllUUF
         4PK8tTrh2GDa+ryCTtccgRo5IZ2pcRkFKRAwa/uTtJSasMQM1sRNQVsbXoBE873OzRHQ
         jm7gHbqRnrouDmg+q1lfnKT0u8P+rJdHxYQJphLhM38t2jV6E2rDRZ0Y3ERNqfuHlM05
         0grqGXeJcY+Smjlw+D7ngXDNBAordOfiMXuvzjTQsa7RBH+r2mWGMx9+6CaF1Z1zaA1e
         4et3wDGaD6TbLUmRu6VyJwRcJA4vqBFPxSz/fOC+YweBLmHmk2e402xuQoWRyYuDbCWs
         UKpg==
X-Gm-Message-State: AOAM533KFMagmrYoUIKApY2jzcWt/6PFH+xF1PJ2tTtYYm7guX429jXR
	6B/CalFQMkPHEcSsiw1ogOdNriWjHnk=
X-Google-Smtp-Source: ABdhPJx9IhRkf9CA7Es6StshH7Z0Rlp47RxMJU43A0diF5dybU1OM6VdmXLhfiOEzR6QjfF+tzxKIw==
X-Received: by 2002:a05:6402:1b01:: with SMTP id by1mr2808494edb.20.1592566330795;
        Fri, 19 Jun 2020 04:32:10 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:10 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/10] libdvdcss: upgrade 1.3.0 -> 1.4.2
Date: Fri, 19 Jun 2020 13:31:53 +0200
Message-Id: <20200619113201.2811033-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum was changed by FSF address change

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../vlc/{libdvdcss_1.3.0.bb => libdvdcss_1.4.2.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.3.0.bb => libdvdcss_1.4.2.bb} (50%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
similarity index 50%
rename from meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
index 79e64aebd..fe06699ab 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
@@ -1,6 +1,7 @@
+SUMMARY = "libdvdcss is a simple library for accessing DVDs like block devices"
 DESCRIPTION = "libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"
 
@@ -8,5 +9,5 @@ inherit autotools
 
 EXTRA_OECONF = " --disable-doc "
 
-SRC_URI[md5sum] = "7f0fdb3ff91d638f5e45ed7536f7eb67"
-SRC_URI[sha256sum] = "7c414acd520c4e4dd7267952f72d738ff50321a7869af4d75c65aefad44f1395"
+SRC_URI[md5sum] = "7b74f2e142b13c9de6dc8d807ab912d4"
+SRC_URI[sha256sum] = "78c2ed77ec9c0d8fbed7bf7d3abc82068b8864be494cfad165821377ff3f2575"
-- 
2.26.2

