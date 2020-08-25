Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.16644.1598370350865385543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 08:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=IlXAdFSM;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.65, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f65.google.com with SMTP id y3so13189531wrl.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSBMCmM3NIJzjDUdAafmNkcxcGJf1HXhGbjlPpnpFbA=;
        b=IlXAdFSMuSpEIl5JAv+oHv9i7PYgEISIC1gTi+dtOZGwsynNZQf3t92gDcYuLhOdS+
         HWdIRQOP5ci++uFRM6HXpF6bBtVFkTY7+c9BRmwVo102UX8a7mnnmqe299vH4r91iWjX
         uPHXHUTMeK0iLzQ2uKx3Jeho0snaivKNpWIM0k4a71ZwZdzh9l23V23En0+Z1OitGA78
         aSZeso4GEWHiz3DMTbF/MIL6AQxiDSkysv4vesjQrCz9fVM1cMFPmM5gJ3+17GtQcPx0
         vU+axHvTl7zNdP+yMHeXHLLo3bjIPxRINslY9yTOxuTnMZO0aUEU2ayjuH7ImNtafM/b
         aqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSBMCmM3NIJzjDUdAafmNkcxcGJf1HXhGbjlPpnpFbA=;
        b=YediOsxE46mtrYjZTdQr25d1DXOQdj26SeNzd+KwbUbQDIpRp8c/lX+TYN9ib0T/Cr
         jdETv313fX0lMXcDecFaDhdAU9b5svw2vFRp1+NSv2fjiyrcM3JXcv4BmK9Ez/m9BX97
         iDHOhWvr1nzACEudaeW6ZwkhTcSZinfeTZWg+FEFFLpLI5MTRTXT+JQC0gtkI4VDmY76
         xcpn42I8TrIot8n2c3Cdufahtr6/mNqhU8tABLIcRHe1QpkI6GlFHTNp4tIYkT4aJoP4
         QlOe54tdWaBGlc5g8nROrPQuFgrmTcgH1gMj2zHiIcdhR6FoPaNnZH89caxBY8s86+Bq
         PqEg==
X-Gm-Message-State: AOAM533Ulpgdc/JW84G5IHhI+4Wa0+NStDsg9WgAQGkmJ4qaunnHJJo1
	el4Wzmylk5FJdv9yWXNxF1GtyH9RjjmFJw==
X-Google-Smtp-Source: ABdhPJz6IfQboBAWcKhmKtSH3plC1IFEH2xxvu5qidJf+u0s0RKZLA6A06iTmpPjjdQqaqyadJunrA==
X-Received: by 2002:adf:ee83:: with SMTP id b3mr10955936wro.163.1598370349034;
        Tue, 25 Aug 2020 08:45:49 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (mob-109-119-218-57.net.vodafone.it. [109.119.218.57])
        by smtp.gmail.com with ESMTPSA id j7sm4347745wrw.35.2020.08.25.08.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 08:45:48 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
Date: Tue, 25 Aug 2020 17:45:24 +0200
Message-Id: <20200825154524.188696-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bitbucket is no longer the official home of eigen, which has moved to
gitlab. Update SRC_URI to download releases from gitlab, fixing:
WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2,
attempting MIRRORS if available

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index f638848d1..9c3d962f4 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
-SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
-SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
+SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
+SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
 
-S = "${WORKDIR}/eigen-eigen-323c052e1731"
+S = "${WORKDIR}/eigen-${PV}"
 
 inherit cmake
 
-- 
2.26.2

