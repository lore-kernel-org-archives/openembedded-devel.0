Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.9673.1597214242660734424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f1egFRfj;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id u10so647966plr.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IMdcJhgCAgrD4jVtK6thAoqZ+yY2FFZOD2KzEJDuIyE=;
        b=f1egFRfjhFIQcKiNC3iSpuIc0l4cGOYBzUZY5ejObDaFduP+Zau+AXDkyRfBfNnNRk
         /BtYli/i3Q938u8IIjhWQpQxYTNks+BrhaH3GbLsuB0JB6obp5NqViDtmSWbU6qGZjwD
         dsfBjyxLUNvsAMluy2ypxCzbWPB6VJJtcjZrCkyZzvVP3M2hLlS2s/tGKtIHRjDaDFXC
         UA3e6wV+ZqJ3pzCmtOdOnENqs84Aip9JwnS4IIuPydNNoq+xWRatz3ZzWWXODyTEd/7A
         p0k+hMBpQ+iNUbCuB8ajwiiVrMCCohigE1RttfpFPwVfOlP3lN9VHV/RYH01p52ULrB0
         xkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IMdcJhgCAgrD4jVtK6thAoqZ+yY2FFZOD2KzEJDuIyE=;
        b=hMpyhitj/qj0tMWfAHevTKPb78DMz9hmhzJp3wzBITmy/plZg1GZ9VkHcQbJT06D4T
         R9s817hNO++jlFJ6pMC8Riz2HYoe2dMVkvi+uJdrrl2AlU+/bJd1c15QSfMCiBIyBAIX
         LSqDknra9nh7nSKayok3ynmfsWddkZD+K7dlxinx5obUQz9sw/dP4owILgD6wPBM5v6+
         x4SHUOHOETCQnNhFQgyvnVczMBBRRxDQAjwn+FAtv3EiNQ0grfFWZhEOjOehUcth7kgB
         GDA/kLVALdTHo+s0pLJbvGyIA9MctO7goYqfZj44aHDHl24k58X2ALVa30LdGeVj/NlK
         aB1g==
X-Gm-Message-State: AOAM5330f7J3ItG2ORoSk6b4/ClrlDDc2a6/z5V++lS4m6/5SPjmi/Im
	Nxe1ysiX3wnch/Fmma+cRZTjGsozf9M=
X-Google-Smtp-Source: ABdhPJwgAoKSJxRJGak8VCtMx9gGpK3mK1NLUbd+rjcor/PW1Dx58gHetlcZlveS8RhDINjF+3v9Ww==
X-Received: by 2002:a17:90a:1749:: with SMTP id 9mr4787111pjm.127.1597214241817;
        Tue, 11 Aug 2020 23:37:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][ 8/9] xfsprogs: Upgrade to 5.7.0
Date: Tue, 11 Aug 2020 23:37:10 -0700
Message-Id: <20200812063711.2758315-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Added SPDX tags [1]

Drop readline option its no longer needed

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/LICENSES/GPL-2.0?id=c7498b6911d03f2bd7f74e9f9862d8d5fbd5b5da

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.7.0.bb}    | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.7.0.bb} (87%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.7.0.bb
similarity index 87%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.7.0.bb
index 433ce47739..9efcc56174 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038 \
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
@@ -12,9 +12,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
-SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
-
+SRC_URI[sha256sum] = "8f2348a68a686a3f4491dda5d62dd32d885fbc52d32875edd41e2c296e7b4f35"
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
@@ -41,9 +39,8 @@ EXTRA_OECONF = "--enable-gettext=no \
 DISABLE_STATIC = ""
 EXTRA_AUTORECONF += "-I ${S}/m4 --exclude=autoheader"
 
-PACKAGECONFIG ??= "readline blkid"
+PACKAGECONFIG ??= "blkid"
 
-PACKAGECONFIG[readline] = "--enable-readline=yes,--enable-readline=no,readline"
 PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
 
 export DEBUG="-DNDEBUG"
-- 
2.28.0

