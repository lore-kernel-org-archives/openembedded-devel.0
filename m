Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.16645.1608945658993761648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Xtb5S3xi;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id x20so12209800lfe.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mGiCMwaatqGJunCpEh3OEOFFhquyAzzOjn0Mn5Cbl0=;
        b=Xtb5S3xiAYG7jjjGxKNdy+UafXLtvEnyPCVaAZ1dvHHVw1St3+s82RAFvnvOK5kalG
         nwVko/rx7byAh+fjRc0opswS+kPnwKUO1Pb/6ZxGnMk8EyJyyRbJgJFdjhkwwlDjCk9H
         yoeBtzyo2Q8M0qLWN/oiwR20dJYWzd2OGrFF75VmmP05kOAiGqB40XU1D7rUoPvShtyX
         ZukVBRgQwWDrbaJq9i1tLzRZiTnbF4p8KphtSppH8YGLdJqulnAcSwKQts5eMLLoIAPO
         jeVZR2TeBEl0Ih4a9VF4VPoT6Eh8RrtLyQz5mOrAGNVFe8osnJMSimcopxYsBxXpCYkZ
         E+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mGiCMwaatqGJunCpEh3OEOFFhquyAzzOjn0Mn5Cbl0=;
        b=XIhJC++KCmYGkzKIjva3av6mAIx9DVVNeVjvkdz0saDHqyriINX7Q1W+SzzYsKtfW6
         i9QpCR9RcIXcIlv/ky/356T43SpiX62ItGhbglO9zqeFzd6/WOzeymIbsk/ume3pbiRd
         86ZJr6Yn1ZKnexHu+v4IjbF2CKnT4Q5kxnuJYXSMoKCVzVO7wUONE508nutATn48z6ZY
         MmrCXDgAlDsLwe8mO322zfQehrQFnv5h3yB8hSpUeSVGhfN/Tfl7uabqpXU7nGYUYQUu
         5mEDaqHzH+B6a7PyXhtAyAcsJKuM2DezRGR2nGTKPjDRmt3hkCMAa5L12AT9TQMPmFZl
         odtg==
X-Gm-Message-State: AOAM532fha0Znp/iptrJJRcEXXcfhejs6RblTYM3/u8Z8wyX5v+iqUJo
	VyfF3LteQ327W2SF+lEGH6IO4yoXzvxGSA==
X-Google-Smtp-Source: ABdhPJxdDd5gcMRnJHC+aOW+hECdHyoL14S/jsUUtPdiJ21IAGoQvtuW93pz+Od1lUqnDpeJo7Dakg==
X-Received: by 2002:a2e:8709:: with SMTP id m9mr18212710lji.307.1608945656494;
        Fri, 25 Dec 2020 17:20:56 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.20.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:20:55 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/7] imlib2: add image manipulation libray from englightenment project
Date: Sat, 26 Dec 2020 04:20:48 +0300
Message-Id: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restore and update old imlib2 recipe from meta-efl.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/imlib2/imlib2_git.bb

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
new file mode 100644
index 000000000000..b44b03ce8e78
--- /dev/null
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
+
+HOMEPAGE = "https://sourceforge.net/projects/enlightenment/"
+SECTION = "libs"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+
+DEPENDS = "freetype "
+PROVIDES = "virtual/imlib2"
+PV = "1.7.1"
+SRCREV = "v1.7.1"
+
+inherit autotools pkgconfig lib_package
+
+AUTO_LIBNAME_PKGS = ""
+
+SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https"
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+X11_DEPS = "virtual/libx11 libxext libice"
+PACKAGECONFIG[x11] = "--with-x,--without-x,${X11_DEPS}"
+
+PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
+PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
+PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
+
+PACKAGES =+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
+FILES_${PN}-data = "${datadir}"
+FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
+FILES_imlib2-filters = "${libdir}/imlib2/filters/*.so"
-- 
2.29.2

