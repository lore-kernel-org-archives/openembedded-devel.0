Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.50111.1622498448358168181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 15:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuYteS8X;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c12so9880007pfl.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hl9oLhMlSY1ezfCx8DmLV8iassOm21hpkAuAJhzo7G8=;
        b=YuYteS8X2BnPhxQrfw2QP0ckaQRYDAcNAjbcA4419tRAY65Ugo04K0ob32fT8bveH5
         tfQYDrSyHzfqjSV2rXsc0WzIc3Yh2yt4yv91a+R7CFnbfFYWIQqB+HeAGq1otrhUbnYb
         xwYwdb1TTF16+ZUh0s179hnEtFiIyQdFTjx/+UZlh34b2LHAM4vK4FXziybINdMzNLZP
         rTv82GNA+zzgoUxm5ri0r+sGtSOU0O8lNMiaYpkkHhGELRJ2G45Xy+rFrRSOZFWATVjd
         Wlkwz0hPWn0/9YbuMDpVoqLJjdL7oNejwyd2ewCujgL7L/Kq23cBgyrW4rzl817Ucbgv
         M5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hl9oLhMlSY1ezfCx8DmLV8iassOm21hpkAuAJhzo7G8=;
        b=KLPcK054fCHGkYptxp71t8Witu5ZMhtTfIJ3UGv+xDmUXZxawBdqTEZHXH772yWM9q
         ETHqO/t4v2mSmnTtZ7p/aACDInWcP4zoGPL565xcxGt3PFUgSmd9oG1F/sLKVDCMPXT9
         f1HEtLCKh4zBEcsL8G4cuJAH5ACRxloqIEke6D7pU1xY4xjdnkHd6RPs2RNPAiZ7Q00s
         aLVxt5qyoIRV1LndDa2NHVItScSXy+sRqX8UKJJ9xrZiXLKN0q9CwsKJHGvg/sw+zUMF
         DQGcSAb0jrTZANNY6Z0sXd9ewmefAMKQpCXfQBc4YHQakGDzMV1HJ5wizrAl6+bqMIyL
         aZlw==
X-Gm-Message-State: AOAM533oX+QsstnnDMj/+3LpEt5/mTruwQNdJZAqO29CL6ADuw75P6xh
	/7jlvJNsctVLq9Kp2N24iAxFpt5f8Gyyww==
X-Google-Smtp-Source: ABdhPJxLjkjD2NftYbSw4xDOtuPv8rsB5rlx5MwxYewNHlzSPOnpLxvBr49ymcsL8yRqGSYAwM0zEw==
X-Received: by 2002:a63:489:: with SMTP id 131mr1194410pge.411.1622498447429;
        Mon, 31 May 2021 15:00:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id d12sm2839170pfo.113.2021.05.31.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 15:00:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mpich: Upgrade to 3.4.2
Date: Mon, 31 May 2021 15:00:44 -0700
Message-Id: <20210531220044.2590652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly link with libgcc for __addtf3, __multf3 etc 128bit builtins
on x86_64 as they are not available with compiler-rt and when using
compiler-rt the link would fail

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/mpich/{mpich_3.4.1.bb => mpich_3.4.2.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_3.4.1.bb => mpich_3.4.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
rename to meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
index 77e080c8b8..0ee02d685c 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8836939804ef6d492bcee7d54abafd6477d2beca247157d92688654d13779727"
+SRC_URI[sha256sum] = "5c19bea8b84e8d74cca5f047e82b147ff3fba096144270e3911ad623d6c587bf"
 
 RDEPENDS_${PN} += "bash perl libxml2"
 
@@ -31,6 +31,8 @@ PACKAGECONFIG += " \
 "
 PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
 
+LDFLAGS_append_x86-64 = " -lgcc"
+
 inherit autotools gettext pkgconfig
 
 do_configure() {
-- 
2.31.1

