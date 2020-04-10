Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.1145.1586481082151098362
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 18:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ck2Hy2PF;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id kx8so213869pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 18:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iRGptYMSkdSdJS3eaNx4n+YUzsgQY8W8naV0SAavto=;
        b=ck2Hy2PFTMgrnpyx8tR3rxZQvs43hx5Nrhj6euCiH9Ro8uVS/diEYInv6218luwhul
         ol3WoLWHzFwFJrYDIy6vwFqzShbvenLPCtF1Bb9Sin+LsrccJhjntBxDz6lj7BfZEeMz
         aoi87bnTLIhSTsfDXaC1DvEUHVj0CitKQx/DskJN57WgwCGWrDi+cDgsfL1+RJ6VjC67
         +N+9bGHj+w8Yo4pjQDa7qeGkQPCnMzAPJ9YdNUb+XqqQcxGu1x8NB12k8X+gIhNH7P7b
         eS1xsWZ6/OwtO8yG9gx3f7Mf8bKxL8DXwQpvK4Y584m1p+pTVl/GiVZq+PWLFA+rKnQb
         h5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iRGptYMSkdSdJS3eaNx4n+YUzsgQY8W8naV0SAavto=;
        b=jzLpPNrmEk+4CsuJ5aAnSbARbRlQLKG0S3EpC4eh1cHN9VjtYu79Zttc+hOjn+AJH0
         xeWyZZOgEUyrFzM0oHMYhTYzsTCRdFwvUqCL8qT2EBz408DbdLQPYIIQzx55IabfqB+n
         5EkFQoWk3gz6OFTb2qwlEAnMVtuj03e1z7MGj/15JaJX2/NthfygZaMkoQuk/jFM6GM7
         kzFjrtzwDD7Ru8c/PsN31I57Y6yXldGzN6Ro5nkNDn6pFnG6JhkAtrKujNnSBt716Qq0
         7Ntij7Gy0d2dLOd/Ez0GUNwaL/v3Q97cGSJt8J35t6fOBTHiEwYZ9Ua+f5/Icb6Aqu9e
         /YjA==
X-Gm-Message-State: AGi0PuZickruqqCiEPtSAxD5cg6rhxAg79nIrFTvpHBk90+XHO6zzhEq
	W3mDeIDuVlKvqPMYifvGYT/c5aqYthY=
X-Google-Smtp-Source: APiQypJ5Y+o0L9rEljNvel23tCKJQCet4C9beNwtcYq0iKEtc2hEJX0C2k6rDB56Zh2v9Kdd0N4WXQ==
X-Received: by 2002:a17:90a:10c1:: with SMTP id b1mr2577715pje.142.1586481081106;
        Thu, 09 Apr 2020 18:11:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id x25sm293174pgc.63.2020.04.09.18.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 18:11:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector icons generation on mips/armv7a
Date: Thu,  9 Apr 2020 18:11:13 -0700
Message-Id: <20200410011113.1300661-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes errors like

make[3]: *** [Makefile:2395: 24/document-print.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-center.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/media-optical.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel-gray.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel-blue.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gtk-select-color.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel-alpha.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/media-floppy.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-business-card.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/dialog-information.svg] Segmentation fault (core dumped)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
index 838bd374a1..5a58f48ec3 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
@@ -45,6 +45,9 @@ EXTRA_OECONF = "--disable-python \
                 --without-webkit \
                 --without-wmf"
 
+EXTRA_OECONF_append_libc-musl_mipsarch = " --disable-vector-icons"
+EXTRA_OECONF_append_libc-musl_armv7a = " --disable-vector-icons"
+
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
-- 
2.26.0

