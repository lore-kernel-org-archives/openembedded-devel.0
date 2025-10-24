Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00052CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.26.1761328670930856565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RZI0vAul;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4711825a02bso19573965e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328669; x=1761933469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIZ9IGVqHdxtiK6T+XRUi5CZaaDheOz5DTba6ywKzoc=;
        b=RZI0vAul+C6OENZnVClb+/Yn/RPgvXDxUHAtecH8fXhsqMk3OI1edS4ePs3jVsB1zq
         BNrm0Q79uliLTphOAldtvIOWRY9OZWFDFJRIWAIZurQK5rwYh4/tMet4qmaZlLrkZ1wM
         3/wBkLlcL+w7oRgDfS214nFvjIYEgqojMr2y0rfixKg8hfS6u3Q/vAJK40vU+b/KMmUb
         K5sEwIuevPb8usiPkTq8D/D41/6LZKzfbZ6hNne7bEsCOiY8vLi1hQxbTjMvPG4S0y9a
         lvIud0GdcbFysu6v3qxlwPohxfh9BNl4XBlLsDDaghWwFHfTEt2iTPn+v18zBPbP0h90
         mUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328669; x=1761933469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIZ9IGVqHdxtiK6T+XRUi5CZaaDheOz5DTba6ywKzoc=;
        b=YXdbWxNhb6fzraMYzBSTAkMprHV4F2iFKLUE82xVdGHszAyx2q4KHmVoo7KGIDECFK
         WIkeqdPVHx8fwnttSpSUznv5zZnziUivpV9+CKhUDOGYno/6XmIVxHFysf7eRgSpXhop
         ieBMwcklc+Qoy8RAQkMVT/Wp5pbeJ6E2zyfxl8gRnU3b5w+0e3Cf/7nBT7rhmRUpnDkE
         DIz+hVoYvuL1BFE5fkx2J6ZfbGpc9L3iagQB4z0UqvUOAM+qxdzrdWyQJ6GCztlDB9KZ
         /HPI1RoKRBplYOFysy9vzwFqZdyOsVWqVclF1Nr4RFop5qJ4vhz4XsJhjFaPAv7Nl9nT
         VDOQ==
X-Gm-Message-State: AOJu0YwY8ELwOnjovDhdDz65AgqQ1ePD7cF4tmI65RacwaQfr9ck2ror
	ctmwrhywaGpsNS3VDjwlcBc2mX9MSjtsEVoLfM1FXaQf1SDEEUe28CvSU9kzlA==
X-Gm-Gg: ASbGnctCa5BRmm5FGKxO9uUFVoXscoADsa4f4pKsoyoC5OmNN6JY6vBa6PDePBD+6D+
	9uOB3tbZa3kzZud0jSaxIqNdKQU+QkOFsR0gI8uCaH4fcMIy9dQnTbJJNOx2gbRyCdNZZ61QQSl
	0KoNBGgdKq1vku6B72E3DQCRQdsp1fJ1j3gCQyCg8WW3GKzUDVDDQc6tDU+narO1hrAg0a1uuEP
	gqUVbfL4QYkjAPbVEObRM5hJou4BNU1NNudofcbgFaD07A6AB2BMk3VAFwsMJok8b7AQoaZe+2i
	onMICARQZbmmVwx+FKla5EGCVUd/ejQqaHphGkJfVf3mQPScJckB5iNacW+QQdBuuepbC2R321x
	7DIsCpKz3Bmous//60ypvKT2ywJiUoIG5FCP7sb5fD45mGwnijEuyOqpN7VmDOCWId2s1B7YLYA
	==
X-Google-Smtp-Source: AGHT+IHpzFxcsyMheSsynNR8+Ssaf6c8fD8VC2CcAkXuufbU3qVGe/VYXnbYttzCwqVTh5+grmS2lA==
X-Received: by 2002:a05:600c:350b:b0:46e:19f8:88d8 with SMTP id 5b1f17b1804b1-4711791cd8fmr281711585e9.34.1761328669095;
        Fri, 24 Oct 2025 10:57:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 01/11] libcrypt-openssl-guess-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:37 +0200
Message-ID: <20251024175747.704498-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120959

Add missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc         | 2 +-
 .../recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index fc4a21be72..5f700e50d8 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_PERL = "\
     libauthen-sasl-perl \
     libcapture-tiny-perl \
+    libcrypt-openssl-guess-perl \
     libcrypt-openssl-random-perl \
     libcgi-perl \
     libdigest-hmac-perl \
@@ -30,7 +31,6 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
-    libcrypt-openssl-guess-perl \
     libcrypt-openssl-rsa-perl \
     libdata-hexdump-perl \
     libdbd-sqlite-perl \
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index 09c145e7cd..59d66a93cf 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -34,4 +34,5 @@ PROVIDES += "libcrypt-openssl-guess"
 
 RDEPENDS:${PN}-ptest += "\
     perl-module-test-more \
+    perl-module-english \
 "

