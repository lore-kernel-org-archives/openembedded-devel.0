Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.4350.1623220737306956515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d4G6T9GB;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r11so27367615edt.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bH0lCqabIEVKFOjeRWpg1xILNpEF6th7q0s/OJc+Nh0=;
        b=d4G6T9GBLiOqvJUAbhzeQeMaNWwvGc/1Wmo7jWRfVPelHHviiWFVeXSQgtJ5d+l+WN
         ywHjUNKu+Oc2wGkLCoVKhsPOBvQbspz+9oPH5fDncJvGIjw/lt1WudFIBRnC5fjqCO2F
         +szB+XOGC/MMfzL7cB2DZCx1JlDVSaJ8nVliKIGv2AOv4LofzFWU9UiUpM64neXj5avx
         SBturhktGuJUhXR4fR735u1NHCfQ3cYnS8kmaZxqrBR0mvfPDrAliSH6B1ukEvctphxF
         jtaHmjKKdKB8SZmfbt1IDDpO5BuwE8bTAR7vK4bVzY0VgjBQRadpFdicrFUZcGxDqrb4
         X9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bH0lCqabIEVKFOjeRWpg1xILNpEF6th7q0s/OJc+Nh0=;
        b=JPmAkbrRhr5/q0m0v+/HyfgTmh0gP2nmx5KvaHEXEUc17FX/WSKHM0NVgpI9VjhBnJ
         qm/6aDsSjb7dtXAxrgQq0j5xotGnN0suxSWvWxlGQOxPkegXua7AXLa/nt0btS+2qktf
         hQHcdyv3HKDBUFgX1slLFZTXos9tZAb6IrKcZcvQ0RTrILvCUqTRzLp3f7gDqp0bqy6Y
         t6dh7BwgsKZEPnIlh4xR2Mll413VVm++hxRTBBkZtbhoZ6vlbXmPABKJ+ul1+P1VmYK3
         zkri14z15EF2fpUeXpVB8mV/Y5NXIMYCxEZVo2cMvWGT7VjYonCHSHDTISffo+hqN1dd
         9kHA==
X-Gm-Message-State: AOAM531TeafTBJEjxqTb/JbPVbCsbylSPioZ5MVvKHiIR99/MnxzcBbk
	Q2Eg+kdw6vtFRdI5JTzQECbZuigrk/piFw==
X-Google-Smtp-Source: ABdhPJzx4eJIoINQtupwhKPIPIpl8bf8Rhkv+6iwcQ3Iuc2wllHcC1r32+v3QIa5ccnyekrNmssHGQ==
X-Received: by 2002:a05:6402:27c9:: with SMTP id c9mr29586841ede.371.1623220735840;
        Tue, 08 Jun 2021 23:38:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/28] libmediaart 0.7.0: remove
Date: Wed,  9 Jun 2021 08:38:21 +0200
Message-Id: <20210609063831.3400611-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* we have libmediaart-2.0
* nothing depends on the version introduced 2014

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb           | 1 -
 .../recipes-support/libmediaart/libmediaart_0.7.0.bb        | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 73b852a4a..b9f90d2c7 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -100,7 +100,6 @@ RDEPENDS_packagegroup-meta-multimedia-mkv = "\
 RDEPENDS_packagegroup-meta-multimedia-support = "\
     crossguid \
     libmediaart-2.0 \
-    libmediaart \
     gst-instruments \
     libsrtp \
     srt \
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
deleted file mode 100644
index ae95d4f69..000000000
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libmediaart.inc
-
-SRC_URI[archive.md5sum] = "1a44933d4cd0064e3c76d8d0ddacddc9"
-SRC_URI[archive.sha256sum] = "3a9dffcad862aed7c0921579b93080d694b8a66f3676bfee8037867f653a1cd3"
-
-EXTRA_OECONF_append = " --disable-gtk-doc"
-- 
2.31.1

