Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3730.1625562821744171997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D37BbAY+;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id nd37so33058349ejc.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R26hldOKK4/PazIkApcI0g9YOW6MtEDc2z7Mx0z7oK0=;
        b=D37BbAY+zJoczhTQMIyJmhqrxVTDVlkWSg0+59zNwsFMVjEuszgMtpAi/Xo/85vhn5
         5kBuCboDplRT44V+Wh8vuJfzHKSs4XYoLSBrWkbxwpk6f4yrSFCkjsPxFC/DXYHE6q0q
         sFCFxd66VEyZviwRHWGCoaXRa+agwhEfFZ3/NUXUJCQY2ZV75uqzOHZFoqiaxih2BnSn
         ofXMtkPtyCR39+a43/jEHRyayaVzGsXKPew0I0WqBTITZna4FyL/Se3ecllS9BjQvLlE
         KxMgJ8xkUcSMiCXKRtA9K7EM4yNDTNshGHJVJE4ymuMqFwMuV5GbiedTmI9ex+c1XvnN
         E+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R26hldOKK4/PazIkApcI0g9YOW6MtEDc2z7Mx0z7oK0=;
        b=mPvDx/9AQaQs/0nYrZXHHyP8BhfKo1FA3LPBrMo1a/rMga14YjhOmt/0uYwk6AhKGM
         HNJBtzcAF8IV8OJFeDoaBVU7IFVuM08p2YtcwFMA6WZRD2/FJ8p8IgfgoZ4nlBEPrgb7
         E2QojDID2ecOgkAAbURCj9pWWLO4uHh4rtNYqbOYwVJk6N/AGAN32kVsdEoGLM89P7JP
         6i8KZWDWhgD8ZzXwytQfw80j+8byDQdb9sMT88jUzeNMwq0B0sBXKdlRSVXF/o63yPAl
         jgvbrTHvadLwHaPvne+iQCfLu6RxZJs3MYhwWeGR5dxD0ZRNHyZ9Gb5E+sKEBZI/Rkhg
         b/kw==
X-Gm-Message-State: AOAM532e6Is7LOXFggdAR/AqnOLSwVWkvEQREhVAgo4WLASLGk50cJ05
	bfyPBHqYbGIIXmHkSw7Z20ERhyItWro=
X-Google-Smtp-Source: ABdhPJwvghObtG+D99aQSL6vTjubNt8ipG9V+siqdZU1r9I7y5xcM3wZR5oB3X0ucqdWRTLkTqyd4g==
X-Received: by 2002:a17:906:aac6:: with SMTP id kt6mr10901853ejb.508.1625562820085;
        Tue, 06 Jul 2021 02:13:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/9] poppler: upgrade 21.06.1 -> 21.07.0
Date: Tue,  6 Jul 2021 11:13:25 +0200
Message-Id: <20210706091327.1513939-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.07.0
core:
 * JBIG2Stream: Do not consider a size-0 to be an error. Issue #535
 * PSOutputDev: fix off-by-one error for image masking in L1/L2 output. Issue #1088
 * CairoOutputDev: Fix memory leak on broken files
 * Minor code improvements
build system:
 * set C standard to 11 without extensions

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.06.1.bb => poppler_21.07.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.06.1.bb => poppler_21.07.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.06.1.bb b/meta-oe/recipes-support/poppler/poppler_21.07.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.06.1.bb
rename to meta-oe/recipes-support/poppler/poppler_21.07.0.bb
index 6b6a2a133..975ab1d70 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.06.1.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.07.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "86b09e5a02de40081a3916ef8711c5128eaf4b1fc59d5f87d0ec66f04f595db4"
+SRC_URI[sha256sum] = "e26ab29f68065de4d6562f0a3e2b5435a83ca92be573b99a1c81998fa286a4d4"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.31.1

