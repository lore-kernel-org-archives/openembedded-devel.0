Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.1010.1629567347357700620
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iFLuq4c1;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id y23so12425706pgi.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eF2hsPiW5AFCZgJEKDscwjsbO83CuZPTWeOCxyTA32Q=;
        b=iFLuq4c1/ugOZmeQapzWCPhqYG39e5BZQgaLWEsplJ1jQpCxb1+K0L2mswJM2o8McN
         g0FysXHzoFZ/sagfOdcFBR55bxRPxSDSweXylVrQETAlltGjaWGKKQQkp4jDPbHCKSJ3
         ZY7raw1JWfLWm/4NB0tJrJdWKk+34E9jqNuko85n+MWer9We1cFNHX4BM0d31GnI4h9X
         JR9NIPFnDOrPLob9vZOOEazXUFHtnG/Z5hiMA8d4thqH4WWULO7NRQANROszWK4ceAWF
         0AMVOtU9IsiZ79/FN4iMmkb758lC0nPVZ9EQjMze/a5QCc0phrYSvTV3vS4fKiktf/Qa
         XcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF2hsPiW5AFCZgJEKDscwjsbO83CuZPTWeOCxyTA32Q=;
        b=I+bYzUQxK7ll6RoZ8tRvcW2Odxq2vVLXwU8aTQayY9Q3DcIKksRJaH6yp/MDZunsQh
         FdfQD0+MsUaODaiRO/3fIe4y9PgUKodHaDLiglZbwixed2644iK5p47aN4mlrEmtJBFn
         0N/Pp3/Szbsb3WA2EjxQVeJ4MyUnplodPtkefldfgG5aHzMRis7aAzOwxEFZGUPus4PR
         5C1n/hJ4hWrs5sRoU02ZRs58TvX9ek9yqf0jUDjddh49t0vSZvDPcrCJ+JQyriPJ+Mhj
         zdk/Eu8S7vwk9CeZxPjlxzVYchWzCaQibSlahhCppdyhHCyD3KixJCMdTu+5+PG6XCYA
         zFWA==
X-Gm-Message-State: AOAM5312faAOTAUXZ7XZNRTGlZz3iUootkiZ1ELzVpAn2OQT96x/S7No
	03lMVvUsTeSEGyJbQNE/FBLVSTZRbtk=
X-Google-Smtp-Source: ABdhPJzc3UGLX1vs63Unt3eQySF0gwrmt4514AGuKHKiY6mfppsx4qUPncxGx0LWxrXHpLchNXoKOA==
X-Received: by 2002:a65:67d5:: with SMTP id b21mr23658614pgs.315.1629567346867;
        Sat, 21 Aug 2021 10:35:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:46 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/7] bigbuckbunny-1080p: fix sample video URL
Date: Sat, 21 Aug 2021 10:35:36 -0700
Message-Id: <9737d50f92c6a58a83ba639e561af15f29efa265.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace a link that's now broken.

The original download link on blender.org still works
(https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi)
but is still extremely slow.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 223243d649b623db398d2f39f067b4c72b54e710)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index 70eb6e4be7..c651d8113d 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
-SRC_URI = "http://themazzone.com/big_buck_bunny_1080p_surround.avi"
+SRC_URI = "https://www.mediaspip.net/IMG/avi/big_buck_bunny_1080p_surround.avi"
 SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
 SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c20c06ea"
 
-- 
2.25.1

