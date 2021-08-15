Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.11426.1629036415829220988
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=csCbckb8;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id j12-20020a17090aeb0c00b00179530520b3so7874616pjz.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eF2hsPiW5AFCZgJEKDscwjsbO83CuZPTWeOCxyTA32Q=;
        b=csCbckb8przoHttwwNx+JBn0wlRi1EhVY+PVPuHddXy3qfubFeqdrpjA36CZmnDRnf
         dcO59BA+IFInt44vX4T833DeNM3epE0TygRdxrHMBLOuQZrFomtllFu8jM0kKEYtt9UA
         suSBR9jK6n4mFcdf5qywI1aIIeznKwEyY48haEe6NImarmhLwXiNAepFUpq8zogrZvmR
         Z9yMwLBHAvN/xG+wFi3cHF8eR+UnWavGWiuAIcWY4BGMUs1SlDYFwGzAR1Fy6EHtrmV/
         /5HFSzsrsazG8KylhdNEWeFRGQwVj9OzRrNO4RcYpDD0ATNgkrQ1jtJDkz71Wt40Cztq
         C0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF2hsPiW5AFCZgJEKDscwjsbO83CuZPTWeOCxyTA32Q=;
        b=gbQjncTsoMRqMCAeJ1r7TbcugiWrMftfyMZ4V4lkLrpflsSJQ3Q+XJQlkeKGrvZL2O
         BaDKt/b+aeysrsbmrta0Jp+MPqnhQ1bHPHUB0doNxS23Toqo5YmYB7OJE1T5Io8ollqT
         v+1IOlmgqpsBI7QkJBdbNqMoHNLzUmCdkeZ/a3DxsYCd20dZUKdcwM49MZRkguCHIUXU
         y0tJ1uhHVbJbVPiQiCye4bKS5JuIDm75gNVG+sm7aiBn72nhHnZvMc2H4XzybYmDZW1+
         g91FN/9Rg8EHu9QocxEV11fa1qI0GIyI04Gi/XR+AWxoJerKp/OW1rmLWK5R1JkaFhRd
         93/A==
X-Gm-Message-State: AOAM532Ypr4OsbyPbBzrfqw85aOMBa/8+HQo5EYcTkBx3jxXOuVOyC4u
	2eYEGBo09ZaqFMhcPDdKXKMPbmEFC43J4Q==
X-Google-Smtp-Source: ABdhPJzK9U4Vc1peFwv1Cx18zYMG2oT3JhwXL7NckCgSkzoGIRyXZznWCqU3rJnnZ0QPifJFcOv/JA==
X-Received: by 2002:a05:6a00:1784:b0:3e1:388:9ff9 with SMTP id s4-20020a056a00178400b003e103889ff9mr11146780pfg.40.1629036415287;
        Sun, 15 Aug 2021 07:06:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 17/18] bigbuckbunny-1080p: fix sample video URL
Date: Sun, 15 Aug 2021 07:06:29 -0700
Message-Id: <b2c8972406a263fac9e8b8f3a41251b6d451ef10.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
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

