Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.30937.1612755843683260778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 19:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TbvezI1I;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id e12so7093941pls.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 19:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7z8adPAx52XhNrVzHeY//gLAdOAbJLmWbm51k+0F7Gg=;
        b=TbvezI1IPz0JWRcqaqD7tnIxq3IEZG8jeo6ifMsmRcSVOgxYOxPQ+lsH8rgZHFhGjX
         w5pK21AYoiUR6tgDybnenxxAkW9uQ6A0my4sNQhMRckSpueZFjQ/zbFaJP9jYTxFOb/L
         JBcj9h+ySRF5lqvRHLH8J4I/RVjmsC1kkcQbW+qbwk06a0Vu3Q6aLYUewvCDxVABW82s
         QRpA1WwtVIxAAdIFv+hYDvnfqlRx2lsxOxVuIlCZ36HsuO/23Ogq2BLQb38A/LxRlGAw
         F8iwEeN7yCyqrAy3EDOjweJn+4jse29nOsURETI4jalZgzBT1RUuNYeTocpe7zYHt6Am
         fU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7z8adPAx52XhNrVzHeY//gLAdOAbJLmWbm51k+0F7Gg=;
        b=qdOQaqo5/7AIsI8RQ4Rc4taaev9At5BwpfFHUnqzbVqX/vTiREynad0kpIjdf/6t2P
         73g6dU9Z+NIEmy0STQHsjcW4+2jHHi1sYxlFK1+vt5cPBWio50sneRygh/S8fWSUGOdN
         euOujwM6iHIjffqC/l+BanbkVHPHiTrJYZYQ1wqHKf70rFMIQlh986hs3owgUKO6/HzJ
         /FbgYHGcayznRemu4WR6ufgkscJeFfl0YV2EKYEGASESsRRO/MMGqQA6XY0ID9Ksf+xn
         ybBZyBjiGWfv52scnXaP7wSxU2mXfm8RpgoaHQmj7CPdpOl6/exhXum/4bOY3n1cuHUT
         nMwQ==
X-Gm-Message-State: AOAM53342QxPS2inkI2ekgOoBwoR7gQMPWzII/qu1akNjKOEAarvmDB8
	DeoITalsxMA95OaWq5VstfiJXu2m1T6SuA==
X-Google-Smtp-Source: ABdhPJzVvja1ZAlBFAwRGS0k994W6PezDHpcfVYbiUlDsH+rTihmsEuDiqNLPwlol3J6l/X2AYj0oA==
X-Received: by 2002:a17:902:47:b029:de:c58e:8257 with SMTP id 65-20020a1709020047b02900dec58e8257mr14714747pla.61.1612755842893;
        Sun, 07 Feb 2021 19:44:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id j9sm13878757pjn.32.2021.02.07.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 19:44:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] openldap: Fix build with autoconf 2.70+
Date: Sun,  7 Feb 2021 19:44:00 -0800
Message-Id: <20210208034400.3252225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New autoconf is stricter about aux files therefore bring them from
libtool native as they can not go missing anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.57.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index a282523a3c..7c04600670 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -151,11 +151,13 @@ CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\' -fPIC"
 LDFLAGS_append = " -pthread"
 
 do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
     rm -f ${S}/libtool
     aclocal
     libtoolize --force --copy
     gnu-configize
+    cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
+    cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/missing ${S}/build
+    cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/compile ${S}/build
     autoconf
     oe_runconf
 }
-- 
2.30.0

