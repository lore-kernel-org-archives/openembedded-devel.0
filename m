Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.736.1589402906610811410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2020 13:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1JzqOXx;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id y9so283702plk.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2020 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=skUVW71eqjzKyUBNUPMY/ryWWxDvHBVOqFz0/Y5awfY=;
        b=a1JzqOXxYFjxh/HsNCCjQZ39rQIpFvcld5HN+JqK2lf8PXG34gz5qDoVx6ItK995+V
         zeCISCWrC2RN0KtInsyHWuC7acLr1o8ARPcOjfKyXKnkB1mxhjxrJIUPH4MLaLqxUpvf
         An31Z1aGIgLBoFB8eAJOJrSUorgIrPB/hEUv3/Q8nm9pRy9gJNYGMBDHd36rrtWShoLi
         hvQgCuYDEWzMHlnncTREZ1JqlkrhXIqQ73f1BMUUPdZ90u1FuXuOAjKO+n2hDNQ7fyhk
         lDErlhKF0lZgx+ki7qp+YN5MYjZHOIw8AJ4IkcsvMt4/yR7Wys8oPxe+PCIAhCDy4npA
         Oxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=skUVW71eqjzKyUBNUPMY/ryWWxDvHBVOqFz0/Y5awfY=;
        b=XlLyvJPRNaK1t23o6NFCqljyOmpCiv6oSsPzSDH8yXEN3MuueF0erJ1HegG4rLepQE
         mz9H1qJlHIPSa1TgDM/ZKYUuD5VktIjhnizKToCJoXjOFzqnsTZLT5//K5rV4s/8nujb
         4n/t0KNd3FtIvB5/+DBT84KesYrcTjHC8tZrpr7Ii5j89ZyUEDeBibYFA/9rjAt3qcaI
         LkSei9DGcGeKqDEY/x9g6H4/t2gjejkOninqVF97uZy76sK4f195AQyjIeX85Q/Y3uYW
         KBXjNpR+VqltceyNYmyU78PpMxmd14JSjC2o4Xo4Yo6yB6thaajN/QCwNaAF79mRjgVW
         Vpew==
X-Gm-Message-State: AGi0Puax89wab2wNiqPphSBNH+q1fmLs3DkFa5FuUcXjZigWV55TKZcT
	T4w0FuHBhOidiHcCE76OtEyYEeejobI=
X-Google-Smtp-Source: APiQypL6btjL+W3469KgOV10oBtCt/JYrldRbn9nj6cMMmHdci4yEgv2O9KZPJq36ikR+cNQYujmdA==
X-Received: by 2002:a17:90b:198e:: with SMTP id mv14mr36434141pjb.69.1589402905593;
        Wed, 13 May 2020 13:48:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id s77sm396996pfc.95.2020.05.13.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:48:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gtkwave: Disable mime update during install
Date: Wed, 13 May 2020 13:48:22 -0700
Message-Id: <20200513204822.2126142-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its not cross compile safe, and there is a post install step via mime
bbclass which should take care of it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
index 6c06c30aaf..6c22f0e044 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += "tk-lib"
 inherit features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc"
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc --disable-mime-update"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.26.2

