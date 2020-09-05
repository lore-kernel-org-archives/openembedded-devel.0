Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.3141.1599324981070246700
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AnBlTFLP;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id s2so4449015pjr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O4rS0PL4rwu/BHNURNQ0bY2SG/H0Xd2cM6ijbuJv9Cg=;
        b=AnBlTFLPnj/hDYlunw3GCWu3LDr4E67SM4GS4tjQQqSvkWNtltc/2p+fbM45+cV/gC
         aE93UBkxEu0/XQkifBHjuEN9QQB5gyovZ/HHSn0fIaPhp0HvsnWdJhAqEyVkrNN+ywCh
         fhJFlWy5nk9SAXAHSJeEblLCvKpZSTgbj/yEA1QNJkutHll9GQDHBl7XCJR1HTv0+oNA
         m/+mDPvB8W3+IcQkVz9M3p2Q1jjeOx26EY5nyyQA34pN5S0FAJiaCWJqKlIxszeXsSlt
         yP+4Cp7csa6VVzoyV9xvEuY2RlJooDZWRNISfihJt17f+N8HxV8QvHh4mysEmP3znrHA
         ZEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O4rS0PL4rwu/BHNURNQ0bY2SG/H0Xd2cM6ijbuJv9Cg=;
        b=nwVfhmCW4Jz77YJtq1BtD1k9XV8DkiSJlhk2QNY0gvVLCeLXade+5ivYB27dayE0O2
         hS8taGgMwXRs4JmA/qZPSA1tChbgMxFBrYVA7e08o4qMeaUmY5K0mCo01vXt5u2eROTz
         ueB86uKxwYTXW5P5HsFS3FtSkE66pQMz97NqVV1ws2yi3Bxp8cMN+/teFhmr/r3HCm3M
         bSlF02KMg9iXCYCiWkJaauQHIkn/hck/WEi8VACHkH1I2wO2drMyHcv4qE2atjOKEW4r
         Leg0DI3pneTORjmepD3rBd6zbskLFnCPdV2q0lxl3JNF/J5JciOZH8aEF9h3XQeGyFTg
         C+Uw==
X-Gm-Message-State: AOAM533MfBx0mES0wtZquP+cRl2MfIW7QKSfZgLwqQhEJXQy6LQnlmHV
	hzdDOvvn63d9eiAZYxch6A+OLD4YpIE=
X-Google-Smtp-Source: ABdhPJy1vBcxY9mzSzh0a5DXVTK/thbP8PubfRaNzptbQHwTPU37qjHh09TPs6QxJJwXFOqV107trg==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr13384920ple.167.1599324980476;
        Sat, 05 Sep 2020 09:56:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/20] vlc: fix loop initial declarations are only allowed in C99 mode
Date: Sat,  5 Sep 2020 09:55:59 -0700
Message-Id: <eec787e19bca513726f9fdcb8a0275101a00c93a.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

build issue seen on CentOS7 and Aarch64 machine

Fixes:
../../vlc-3.0.9.2/src/misc/fourcc_gen.c:75:5: error: ‘for’ loop initial declarations are only allowed in C99 mode
|      for (size_t i = 0; i < n; i++)
|      ^
| ../../vlc-3.0.9.2/src/misc/fourcc_gen.c:75:5: note: use option -std=c99 or -std=gnu99 to compile your code

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
index f6c7a606d5..b1aa82cc89 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
@@ -30,7 +30,7 @@ inherit autotools features_check gettext pkgconfig mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-export BUILDCC = "${BUILD_CC}"
+export BUILDCC = "${BUILD_CC} -std=c99"
 EXTRA_OECONF = "\
     --enable-run-as-root \
     --enable-xvideo \
-- 
2.17.1

