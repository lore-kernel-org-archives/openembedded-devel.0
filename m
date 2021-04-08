Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.258.1617899811058677046
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uOJI3U21;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so2871009otr.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XrVic7ZCG7vJRqzuWhNP2QTZMr5WGwKhrANDgpHUH+Q=;
        b=uOJI3U21i/ZghBqZ8/uu2QMrnMVbVRSfVeOgJeq4uWUXY6+IunITI3FNU/yAArECy2
         TDRI09FAWZqS1dq8lCp6KAN38fA2S1LJpgvhAy92vaNqtZiaMASZebRBvSv8dv2EOBPu
         z4vX4lPrWC/AXZPouyC6JMtaxWyTy6ir1UBAiRCLTmY+FN/5mdT6VLQgU9Dj34fSJ0sy
         kwA8gQEuVu5zd68CdQcFzxE2qValz5ueOoCUjrgxTvVgbbb1aSXaUqI9iElJ6yMtSRVu
         WfK2a7Hjz2NvUYiwR4wg017Akaa3PBfjumUK6eIWHk6AWF+1/23/pxVsDgvWxW8r+5kt
         qIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XrVic7ZCG7vJRqzuWhNP2QTZMr5WGwKhrANDgpHUH+Q=;
        b=RHWufw8Kn0Pr4SWNEPWn5DhWvQYT+MI/KbXF12NQh2NQGJM13bV8TjEriV4VtC5/r1
         gFTpx4tzvXSmooQtLv4l982aUu2Eg3hZX2+icpjZU3+JUZT+Xl3wx33oD4zKVyTYfhiW
         R522sjkhjkfIN3rVTcRvXhXolN3Haiyg41RKejt+S1UgyEVPkI9OE909aOSl8qNZm3VC
         xifXUtHkJjd7d4u2SR4n6BM8YCCJcbGaSWFeTrnX2ufrrImkztl/PXa78Q0K1UZuBSy8
         fmerg8pZV73p/N163kd+PusGo4TVtgXfkA0AGeCLfDsPMot7SEztThMBpqutEmXhDEgG
         JMxA==
X-Gm-Message-State: AOAM5320uRA6T2xsO1biMsGwupPqzEotiMGNICZBNsRtArF0ev33vzAO
	CXAUoK1NdddoI4p+oAQJbaoy35HUgwc=
X-Google-Smtp-Source: ABdhPJwRfrpO2i2jIOXWNKV7wzmnKbQ1xkpqdhE8ahidrs1Ct1iioDceSe5wqF37uSwSMWodeMEk9Q==
X-Received: by 2002:a9d:6241:: with SMTP id i1mr2273437otk.13.1617899810264;
        Thu, 08 Apr 2021 09:36:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:50 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 40/64] python3-contextlib2: Upgrade 0.6.0 -> 0.6.0.post1
Date: Thu,  8 Apr 2021 09:35:47 -0700
Message-Id: <0421b1e98c619f97e5cf40f6beed3d23823f92e0.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.6.0.post1:

- Correctly update NEWS.rst for the 0.6.0 release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 37ce67f575400003cb9f85bc9882633fc6ff5ba2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...contextlib2_0.6.0.bb => python3-contextlib2_0.6.0.post1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-contextlib2_0.6.0.bb => python3-contextlib2_0.6.0.post1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
index 6074efa73e6..2eac0ad2704 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
 
-SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
-SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
+SRC_URI[sha256sum] = "01f490098c18b19d2bd5bb5dc445b2054d2fa97f09a4280ba2c5f3c394c8162e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

