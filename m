Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.28947.1612743970857099702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 16:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G68qFYFN;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id gx20so7803624pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjKoSzWTeQmE3Jb0cXwjjvLstx7XAMwBvA0fP6qVQvA=;
        b=G68qFYFNmWuF7bQtKf5fJadfO+0n0x2zZFq1TN09TVmS/3aJ98Zriie9ZXiUiwf8wb
         Ygg+ZVxjfhilTcNUFFMvxmmgNRhm+qgOo0XFLNVHuJ9KqrZrL3TfBITuUpv++qeBSxrd
         e4UN7U2LJey6M8rnPJXyonKdSgCzzn3uCZpLIVhpe4dSnsNuj1vaeDJnRw6E4gzmRdUg
         nHyLhhjvg46gEK+JFHRJ9N21o4VN4ULmx1TqOo0Yc+QUVxgy2t11022zNhRW7Q9Xb1Wg
         xkir4/O7tp9Dhq/hn9ojejPjxXf/fUyfX18SkPZT9GPYzjgFcRsa9julPW6MOEXPevpz
         uE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjKoSzWTeQmE3Jb0cXwjjvLstx7XAMwBvA0fP6qVQvA=;
        b=sbMRKxeo1v3pdr3VBy1+9LZYV65qBN3PxTuwhncHBgMCSNRnPlwo/RrM90NhMKBNjR
         9H3tCw3T/15w6Rq7ZAj4yTVM8kHzNUYAZUxSvMwabYOpuKPSVXMdVO178ANljWxk/gDb
         InjP11R4WrhCiIbiy+CFz16QuGqhrncxH1kDBTlYOe0gKZDrOo2VwrVr0rStqqGwMGPq
         ihonxtg1m9O0bGR1RvtMkpMHiM/6v/FRIceT39xWg9MTlaQ/4K/1pXee2dRbdq7bsDtv
         VSxRnqdjZGhQwdek3ZejkhDleLsj1j4iSr6sGf+uThScYVxY6HFegstk7tADgw7EQ5I3
         APHQ==
X-Gm-Message-State: AOAM532YW3J4FGGWYWvOG3No1boI23cgGsy0bbMV1zU02PDNRsacLMQL
	eBlAdFPgi+cPQDadB8oBTwXcKs5f18tNzA==
X-Google-Smtp-Source: ABdhPJxIklDLPo62i9lhrWQC9Y+1u0eA9oJyeh8Fdc68ZQnINe/W0Y/faYgQxcNJV7d89grGFwZAzQ==
X-Received: by 2002:a17:90a:6c62:: with SMTP id x89mr14656923pjj.124.1612743970054;
        Sun, 07 Feb 2021 16:26:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id iq6sm2703866pjb.6.2021.02.07.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 16:26:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libmcrypt: Run autoreconf steps manually
Date: Sun,  7 Feb 2021 16:26:06 -0800
Message-Id: <20210208002606.1797992-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in re-running the configure generation with autotools 2.70+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index 46e694be4a..2dc4888f37 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -14,4 +14,15 @@ UPSTREAM_CHECK_REGEX = "Libmcrypt/(?P<pver>\d+(\.\d+)+)/"
 
 inherit autotools-brokensep gettext binconfig
 
+do_configure_prepend () {
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/config
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/config
+        aclocal
+        libtoolize --automake --copy --force
+        autoconf
+        autoheader
+        automake -a
+        oe_runconf
+}
+
 CLEANBROKEN = "1"
-- 
2.30.0

