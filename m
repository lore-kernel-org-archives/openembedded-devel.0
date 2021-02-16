Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.2319.1613440706612773772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dv+f+zBA;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id cl8so4772036pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2PODdBf67AL+khBQ/0KY0F66H9VTTF5XFgzthkzQz2U=;
        b=Dv+f+zBAzfVwVNcrbnqVD3le16XOXRSKQx2RX3T8wmiSdRGkr0N6P9hxJ7+WKV/53q
         wjEh1GhjwyzWxEFM2i8E0RP616ZwG2woOpdewsHeRXjQOV/w+41rDDfyj8JTwlRtYXgh
         voci29mxD3kWtJNiRcvsCOBZ+/GCYs0XePUy2XV5C2z2YS3S3XK9RHAP4DdPhEBtTH8i
         bNZkIpX3DYLyZcGU5pcFTPIP8Wli5DxP9REMnj8idAkV7Pr5uCavdsuAkzEBesR80Osg
         yV9o5UWlU+DNRIir2/klmz3TTY+4CXr5dZl9sFmZGHSKQ6zq0I4tXwZjFLz+OzfINC4v
         TGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2PODdBf67AL+khBQ/0KY0F66H9VTTF5XFgzthkzQz2U=;
        b=ixr4GUCfaYiI+VlG5wxVAao+oSh2xnSHrpCODhUSYGu7KENSou6Kj3VaH/A2Gu1fy6
         W/XyhBG56u6z+NUw4zrSrscq3yRmU81qsmkeUyhm09tCDGutCP7251A8AHsMeA0W+HOu
         gPPAY8yeciHabycq5PZSXdH+Moun1qaqy6UJ8YZTM23Qjz7OSSR4i8tMw+ChOZ0fE+Cg
         PjuiiRquXcFLgH/A8LDCXchCS9E11C1BVz2RZQeC3gpHAnL9GdWbQEQIuZRM6xNqj1Cl
         BIWiWc8r1YdCBUTZpkwj1xMpqi90yFv/9C1R808uK24DwKouQm8QeuNPU3IoVIR86tfo
         z+mQ==
X-Gm-Message-State: AOAM531ms3kcvP6QhBhHT+AmJdA28ds1h2SAVEOXM9Z/mFems8zZNah/
	6NRPGtm4o5zFK5jg4//U+cO7fEx8aAshAQ==
X-Google-Smtp-Source: ABdhPJwcHDcbKbXC2YF8MAHMwSG5KaBrmIfHDDhBDrQuFNkbzo4wz4UZPogHpMOSzm4MC260Dkf0bg==
X-Received: by 2002:a17:90b:4c10:: with SMTP id na16mr1701371pjb.49.1613440706076;
        Mon, 15 Feb 2021 17:58:26 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:25 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/11] openldap: upgrade 2.4.56 -> 2.4.57
Date: Mon, 15 Feb 2021 17:58:11 -0800
Message-Id: <9d6e064bb0384a3731e235769d5c78be08d5de42.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Source: meta-openembedded
MR: 108384, 108398, 108412, 108426, 108440, 108454, 108468, 108482, 108496, 108510
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/openldap?id=0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a
ChangeID: 0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a
Description:

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a)
[Maintance update only]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit cef93b7b00e620d90a610112ee574fa60b691cf8)
[Fixes CVE:
CVE-2020-36221
CVE-2020-36222
CVE-2020-36223
CVE-2020-36224
CVE-2020-36225
CVE-2020-36226
CVE-2020-36227
CVE-2020-36228
CVE-2020-36229
CVE-2020-36230

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.56.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index 4c0f179cb0..a282523a3c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5391b559d23a2237bdb21e7a62dae7c3 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
-SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
+SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
+SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1

