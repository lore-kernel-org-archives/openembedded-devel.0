Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4B9C636D6
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 02:36:28 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.74610.1675737384708761733
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 18:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UgZbCjnf;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id j1so7692615pjd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 18:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxrCbo4d1Dyhzq4ukHgNP3HCjd6t0cScUzh5WqMNKno=;
        b=UgZbCjnfCB4VCHNWNScivBHDAJON2XTheB3vejkMCJ4g4szUI4Szx2uNCrAeOa7ui/
         r8FHlIMNa96fI2ZH4dAhb3bRjq5ndT7EGJGqBPH7XnjtYbMbJghlCtZ060Tq4MTwQiUe
         8tEp57RRjKP/2nRxVXUl4lF2bMjuIDk/81LrXsk9xQvCMKXA/VwG3KKRquZ7IEcK5LuQ
         f9rgJ5DdZvX+IERCt2sD1oFdHSWycaxqqgdVLIqoO1HKQvZwKK4H4UPTBj1KF2WAIIcu
         0VYgOmbV6BwW2mNBWEWHwo0bghs+klue8RK5KPgSbLsH39RcFSrOYTAMBi9CQPn0hule
         XHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxrCbo4d1Dyhzq4ukHgNP3HCjd6t0cScUzh5WqMNKno=;
        b=2MzUV4mssT/zvULXov5slrEeegZuYvBv6cdf4MmJQdGXizQd6TpqmKLk4ozQu9xKjR
         t5L6uo07e+nAObEV0KKFawvYPXnjIJ/yFTECOkSzBPp6ACp7hhIZCt9HOr9bhUhYfr9d
         Qp1qTIZJOo9Nqg4ocjySu4OS9I1yeREHFopwL3LOvgW98yPKCK4kRIb0euhLERmYGUg1
         k7BvdFnKT0eDgWv0355uAAhmK9n0IudggSYi5m1YtqM1kDLIxSD6pxtiU4nHzBsmhOBJ
         D+H8JXPrJHpiUZ+MpaxVbhqUSvx6YNmQX9qB4pAmhlfCdw4hojePqqG7BNdHEnJ8qMEQ
         248A==
X-Gm-Message-State: AO0yUKX5586ZFBG/Vw9HJP5WyGu+kWtJ4A+eLP3F+wNYdbslDS5VY/ho
	950asoSuxST3R9gNO2PBXdEEeG0CesI=
X-Google-Smtp-Source: AK7set/VQfkRvD5e8TC4pMcj92UuXK2757yPBobFeJYi+mLxSTm++TJDrOQRmWwBvKBqPCmcqlo/XQ==
X-Received: by 2002:a17:903:120e:b0:193:1fc5:f611 with SMTP id l14-20020a170903120e00b001931fc5f611mr1249656plh.38.1675737383893;
        Mon, 06 Feb 2023 18:36:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b001931c37da2dsm7554959plt.20.2023.02.06.18.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:36:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] cups-filters: Upgrade to 1.28.17 release
Date: Mon,  6 Feb 2023 18:36:20 -0800
Message-Id: <20230207023620.2243785-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207023620.2243785-1-raj.khem@gmail.com>
References: <20230207023620.2243785-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 02:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100950

- Switch to github release artifact downloads
- Add missing dependency on libexif
- Merge .inc into .bb as there are no other users of it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb     | 4 ----
 .../cups/{cups-filters.inc => cups-filters_1.28.17.bb}    | 8 +++++---
 2 files changed, 5 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
 rename meta-oe/recipes-printing/cups/{cups-filters.inc => cups-filters_1.28.17.bb} (87%)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb b/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
deleted file mode 100644
index 9a0a23671b..0000000000
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include cups-filters.inc
-
-SRC_URI += "file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch"
-SRC_URI[sha256sum] = "472418f1a1e12c9ad91b01caa020eb668626776d85de9da488be38e6663102ca"
diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
similarity index 87%
rename from meta-oe/recipes-printing/cups/cups-filters.inc
rename to meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
index f0f915e946..685135ec7e 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
@@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d77679ce6a2cc4d873d4ebbf2a401e6"
 
 SECTION = "console/utils"
 
-DEPENDS = "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms ghostscript poppler qpdf libpng"
+DEPENDS = "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms ghostscript poppler qpdf libpng libexif"
 DEPENDS:class-native = "poppler-native glib-2.0-native dbus-native pkgconfig-native gettext-native libpng-native"
 
-SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz"
+SRC_URI = "${GITHUB_BASE_URI}/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch"
+SRC_URI[sha256sum] = "270a3752a960368aa99d431fb5d34f4039b2ac943c576d840612d1d8185c9bb9"
 
-inherit autotools-brokensep gettext pkgconfig
+inherit autotools-brokensep gettext pkgconfig github-releases
 
 EXTRA_OECONF += " --enable-ghostscript --disable-ldap \
                        --with-pdftops=hybrid --enable-imagefilters \
-- 
2.39.1


